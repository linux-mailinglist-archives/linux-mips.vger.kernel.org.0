Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF33A21F1C8
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 14:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgGNMsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 08:48:16 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32992 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgGNMsP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 08:48:15 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 4D24F8030809;
        Tue, 14 Jul 2020 12:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qVqk18cJToeC; Tue, 14 Jul 2020 15:48:11 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/4] serial: 8250: Add 8250 port clock update method
Date:   Tue, 14 Jul 2020 15:48:04 +0300
Message-ID: <20200714124808.21493-2-Sergey.Semin@baikalelectronics.ru>
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

---

Changelog v4:
- Export serial8250_update_uartclk() symbol for GPL modules only.

Changelog v7:
- Wake the device up on the serial port divider update.
---
 drivers/tty/serial/8250/8250_port.c | 40 +++++++++++++++++++++++++++++
 include/linux/serial_8250.h         |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 4d83c85a7389..7bfa0f7d9d60 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2628,6 +2628,46 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
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
+	serial8250_rpm_get(up);
+	spin_lock_irqsave(&port->lock, flags);
+
+	uart_update_timeout(port, termios->c_cflag, baud);
+
+	serial8250_set_divisor(port, baud, quot, frac);
+	serial_port_out(port, UART_LCR, up->lcr);
+	serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+	serial8250_rpm_put(up);
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

