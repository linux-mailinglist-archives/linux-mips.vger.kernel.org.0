Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF01B1E29D8
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 20:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388933AbgEZSNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 14:13:04 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59390 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbgEZSMz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 14:12:55 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DFE86803086E;
        Tue, 26 May 2020 18:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Czus1mFyA-9O; Tue, 26 May 2020 21:12:51 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/3] serial: 8250: Add 8250 port clock update method
Date:   Tue, 26 May 2020 21:12:24 +0300
Message-ID: <20200526181227.1889-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526181227.1889-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526181227.1889-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some platforms can be designed in a way so the UART port reference clock
might be asynchronously changed at some point. In Baikal-T1 SoC this may
happen due to the reference clock being shared between two UART ports, on
the Allwinner SoC the reference clock is derived from the CPU clock, so
any CPU frequency change should get to be known/reflected by/in the UART
controller as well. But it's not enough to just update the
uart_port->uartclk field of the corresponding UART port, the 8250
controller reference clock divisor should be altered so to preserve
current baud rate setting. All of these things is done in a coherent
way by calling the serial8250_update_uartclk() method provided in this
patch. Though note that it isn't supposed to be called from within the
UART port callbacks because the locks using to the protect the UART port
data are already taken in there.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---

Changelog v4:
- Export serial8250_update_uartclk() symbol for GPL modules only.
---
 drivers/tty/serial/8250/8250_port.c | 38 +++++++++++++++++++++++++++++
 include/linux/serial_8250.h         |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 4d83c85a7389..5596868c8832 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2628,6 +2628,44 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
 				  (port->uartclk + tolerance) / 16);
 }
 
+/*
+ * Note in order to avoid the tty port mutex deadlock don't use the next method
+ * within the uart port callbacks. Primarily it's supposed to be utilized to
+ * handle a sudden reference clock rate change.
+ */
+void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	unsigned int baud, quot, frac = 0;
+	struct ktermios *termios;
+	unsigned long flags;
+
+	mutex_lock(&port->state->port.mutex);
+
+	if (port->uartclk == uartclk)
+		goto out_lock;
+
+	port->uartclk = uartclk;
+	termios = &port->state->port.tty->termios;
+
+	baud = serial8250_get_baud_rate(port, termios, NULL);
+	quot = serial8250_get_divisor(port, baud, &frac);
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	uart_update_timeout(port, termios->c_cflag, baud);
+
+	serial8250_set_divisor(port, baud, quot, frac);
+	serial_port_out(port, UART_LCR, up->lcr);
+	serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
+out_lock:
+	mutex_unlock(&port->state->port.mutex);
+}
+EXPORT_SYMBOL_GPL(serial8250_update_uartclk);
+
 void
 serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
 			  struct ktermios *old)
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 6545f8cfc8fa..2b70f736b091 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -155,6 +155,8 @@ extern int early_serial_setup(struct uart_port *port);
 
 extern int early_serial8250_setup(struct earlycon_device *device,
 					 const char *options);
+extern void serial8250_update_uartclk(struct uart_port *port,
+				      unsigned int uartclk);
 extern void serial8250_do_set_termios(struct uart_port *port,
 		struct ktermios *termios, struct ktermios *old);
 extern void serial8250_do_set_ldisc(struct uart_port *port,
-- 
2.26.2

