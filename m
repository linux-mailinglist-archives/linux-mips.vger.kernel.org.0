Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C812021F1D1
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 14:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgGNMs3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 08:48:29 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33090 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgGNMsR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 08:48:17 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 5B664803086A;
        Tue, 14 Jul 2020 12:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Jl6RnvX9c4Xj; Tue, 14 Jul 2020 15:48:13 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 4/4] serial: 8250_dw: Fix common clocks usage race condition
Date:   Tue, 14 Jul 2020 15:48:07 +0300
Message-ID: <20200714124808.21493-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200714124808.21493-1-Sergey.Semin@baikalelectronics.ru>
References: <20200714124808.21493-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The race condition may happen if the UART reference clock is shared with
some other device (on Baikal-T1 SoC it's another DW UART port). In this
case if that device changes the clock rate while serial console is using
it the DW 8250 UART port might not only end up with an invalid uartclk
value saved, but may also experience a distorted output data since
baud-clock could have been changed. In order to fix this lets at least
try to adjust the 8250 port setting like UART clock rate in case if the
reference clock rate change is discovered. The driver will call the new
method to update 8250 UART port clock rate settings. It's done by means of
the clock event notifier registered at the port startup and unregistered
in the shutdown callback method.

Note 1. In order to avoid deadlocks we had to execute the UART port update
method in a dedicated deferred work. This is due to (in my opinion
redundant) the clock update implemented in the dw8250_set_termios()
method.
Note 2. Before the ref clock is manually changed by the custom
set_termios() function we swap the port uartclk value with new rate
adjusted to be suitable for the requested baud. It is necessary in
order to effectively disable a functionality of the ref clock events
handler for the current UART port, since uartclk update will be done
a bit further in the generic serial8250_do_set_termios() function.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Move exclusive ref clock lock/unlock precudures to the 8250 port
  startup/shutdown methods.
- The changelog message has also been slightly modified due to the
  alteration.
- Remove Alexey' SoB tag.
- Cc someone from ARM who might be concerned regarding this change.
- Cc someone from Clocks Framework to get their comments on this patch.

Changelog v3:
- Refactor the original patch to adjust the UART port divisor instead of
  requesting an exclusive ref clock utilization.

Changelog v5:
- Refactor dw8250_clk_work_cb() function cheking the clk_get_rate()
  return value for being erroneous and exit if it is.
- Don't update p->uartclk on the port startup. It will be updated later in
  the same procedure at the set_termios() function being invoked by the
  serial_core anyway.
---
 drivers/tty/serial/8250/8250_dw.c | 103 +++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index c1511f9244bb..87f450b7c177 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,8 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
+#include <linux/notifier.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
@@ -43,6 +45,8 @@ struct dw8250_data {
 	int			msr_mask_off;
 	struct clk		*clk;
 	struct clk		*pclk;
+	struct notifier_block	clk_notifier;
+	struct work_struct	clk_work;
 	struct reset_control	*rst;
 
 	unsigned int		skip_autocfg:1;
@@ -54,6 +58,16 @@ static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
 	return container_of(data, struct dw8250_data, data);
 }
 
+static inline struct dw8250_data *clk_to_dw8250_data(struct notifier_block *nb)
+{
+	return container_of(nb, struct dw8250_data, clk_notifier);
+}
+
+static inline struct dw8250_data *work_to_dw8250_data(struct work_struct *work)
+{
+	return container_of(work, struct dw8250_data, clk_work);
+}
+
 static inline int dw8250_modify_msr(struct uart_port *p, int offset, int value)
 {
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
@@ -260,6 +274,46 @@ static int dw8250_handle_irq(struct uart_port *p)
 	return 0;
 }
 
+static void dw8250_clk_work_cb(struct work_struct *work)
+{
+	struct dw8250_data *d = work_to_dw8250_data(work);
+	struct uart_8250_port *up;
+	unsigned long rate;
+
+	rate = clk_get_rate(d->clk);
+	if (rate <= 0)
+		return;
+
+	up = serial8250_get_port(d->data.line);
+
+	serial8250_update_uartclk(&up->port, rate);
+}
+
+static int dw8250_clk_notifier_cb(struct notifier_block *nb,
+				  unsigned long event, void *data)
+{
+	struct dw8250_data *d = clk_to_dw8250_data(nb);
+
+	/*
+	 * We have no choice but to defer the uartclk update due to two
+	 * deadlocks. First one is caused by a recursive mutex lock which
+	 * happens when clk_set_rate() is called from dw8250_set_termios().
+	 * Second deadlock is more tricky and is caused by an inverted order of
+	 * the clk and tty-port mutexes lock. It happens if clock rate change
+	 * is requested asynchronously while set_termios() is executed between
+	 * tty-port mutex lock and clk_set_rate() function invocation and
+	 * vise-versa. Anyway if we didn't have the reference clock alteration
+	 * in the dw8250_set_termios() method we wouldn't have needed this
+	 * deferred event handling complication.
+	 */
+	if (event == POST_RATE_CHANGE) {
+		queue_work(system_unbound_wq, &d->clk_work);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static void
 dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
@@ -283,9 +337,16 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	clk_disable_unprepare(d->clk);
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
+		/*
+		 * Premilinary set the uartclk to the new clock rate so the
+		 * clock update event handler caused by the clk_set_rate()
+		 * calling wouldn't actually update the UART divisor since
+		 * we about to do this anyway.
+		 */
+		swap(p->uartclk, rate);
 		ret = clk_set_rate(d->clk, newrate);
-		if (!ret)
-			p->uartclk = rate;
+		if (ret)
+			swap(p->uartclk, rate);
 	}
 	clk_prepare_enable(d->clk);
 
@@ -312,6 +373,39 @@ static void dw8250_set_ldisc(struct uart_port *p, struct ktermios *termios)
 	serial8250_do_set_ldisc(p, termios);
 }
 
+static int dw8250_startup(struct uart_port *p)
+{
+	struct dw8250_data *d = to_dw8250_data(p->private_data);
+	int ret;
+
+	/*
+	 * Some platforms may provide a reference clock shared between several
+	 * devices. In this case before using the serial port first we have to
+	 * make sure that any clock state change is known to the UART port at
+	 * least post factum.
+	 */
+	if (d->clk) {
+		ret = clk_notifier_register(d->clk, &d->clk_notifier);
+		if (ret)
+			dev_warn(p->dev, "Failed to set the clock notifier\n");
+	}
+
+	return serial8250_do_startup(p);
+}
+
+static void dw8250_shutdown(struct uart_port *p)
+{
+	struct dw8250_data *d = to_dw8250_data(p->private_data);
+
+	serial8250_do_shutdown(p);
+
+	if (d->clk) {
+		clk_notifier_unregister(d->clk, &d->clk_notifier);
+
+		flush_work(&d->clk_work);
+	}
+}
+
 /*
  * dw8250_fallback_dma_filter will prevent the UART from getting just any free
  * channel on platforms that have DMA engines, but don't have any channels
@@ -407,6 +501,8 @@ static int dw8250_probe(struct platform_device *pdev)
 	p->serial_out	= dw8250_serial_out;
 	p->set_ldisc	= dw8250_set_ldisc;
 	p->set_termios	= dw8250_set_termios;
+	p->startup	= dw8250_startup;
+	p->shutdown	= dw8250_shutdown;
 
 	p->membase = devm_ioremap(dev, regs->start, resource_size(regs));
 	if (!p->membase)
@@ -468,6 +564,9 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return PTR_ERR(data->clk);
 
+	INIT_WORK(&data->clk_work, dw8250_clk_work_cb);
+	data->clk_notifier.notifier_call = dw8250_clk_notifier_cb;
+
 	err = clk_prepare_enable(data->clk);
 	if (err)
 		dev_warn(dev, "could not enable optional baudclk: %d\n", err);
-- 
2.26.2

