Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84B03A334C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhFJSkm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhFJSkl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:41 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1DE11C061574;
        Thu, 10 Jun 2021 11:38:45 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 708B29200C0; Thu, 10 Jun 2021 20:38:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6DE549200B4;
        Thu, 10 Jun 2021 20:38:44 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:44 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] serial: core, 8250: Add a hook for extra port property
 reporting
In-Reply-To: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105190414160.29169@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a hook for `uart_report_port' to let serial ports report extra 
properties beyond `irq' and `base_baud'.  Use it with the 8250 backend 
to report extra baud rates supported above the base rate for ports with 
the UPF_MAGIC_MULTIPLIER property, so that people have a way to find out 
that they are supported with their system, e.g.:

Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200 [+230400, 460800]) is a 16550A
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [uart8250] disabled
printk: bootconsole [uart8250] disabled
serial8250.0: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200 [+230400, 460800]) is a 16550A
serial8250.0: ttyS2 at MMIO 0x1f000900 (irq = 20, base_baud = 230400) is a 16550A

Otherwise there is no clear way to figure this out.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 drivers/tty/serial/8250/8250_core.c |   10 ++++++++++
 drivers/tty/serial/serial_core.c    |   11 +++++++++--
 include/linux/serial_core.h         |    3 +++
 3 files changed, 22 insertions(+), 2 deletions(-)

linux-serial-core-baud-extra.diff
Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_core.c
===================================================================
--- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_core.c
+++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_core.c
@@ -952,6 +952,13 @@ static struct uart_8250_port *serial8250
 	return NULL;
 }
 
+static void serial8250_report_magic(struct uart_port *port,
+				    char *report_buf, size_t report_size)
+{
+	snprintf(report_buf, report_size,
+		 " [+%d, %d]", port->uartclk / 8, port->uartclk / 4);
+}
+
 static void serial_8250_overrun_backoff_work(struct work_struct *work)
 {
 	struct uart_8250_port *up =
@@ -1048,6 +1055,9 @@ int serial8250_register_8250_port(struct
 			}
 		}
 
+		if (up->port.flags & UPF_MAGIC_MULTIPLIER)
+			uart->port.report_extra = serial8250_report_magic;
+
 		serial8250_set_defaults(uart);
 
 		/* Possibly override default I/O functions.  */
Index: linux-malta-cbus-uart/drivers/tty/serial/serial_core.c
===================================================================
--- linux-malta-cbus-uart.orig/drivers/tty/serial/serial_core.c
+++ linux-malta-cbus-uart/drivers/tty/serial/serial_core.c
@@ -2309,6 +2309,7 @@ int uart_resume_port(struct uart_driver
 static inline void
 uart_report_port(struct uart_driver *drv, struct uart_port *port)
 {
+	char report_extra[64];
 	char address[64];
 
 	switch (port->iotype) {
@@ -2333,11 +2334,17 @@ uart_report_port(struct uart_driver *drv
 		break;
 	}
 
-	pr_info("%s%s%s at %s (irq = %d, base_baud = %d) is a %s\n",
+	if (port->report_extra)
+		port->report_extra(port, report_extra, sizeof(report_extra));
+	else
+		report_extra[0] = '\0';
+
+	pr_info("%s%s%s at %s (irq = %d, base_baud = %d%s) is a %s\n",
 	       port->dev ? dev_name(port->dev) : "",
 	       port->dev ? ": " : "",
 	       port->name,
-	       address, port->irq, port->uartclk / 16, uart_type(port));
+	       address, port->irq, port->uartclk / 16, report_extra,
+	       uart_type(port));
 }
 
 static void
Index: linux-malta-cbus-uart/include/linux/serial_core.h
===================================================================
--- linux-malta-cbus-uart.orig/include/linux/serial_core.h
+++ linux-malta-cbus-uart/include/linux/serial_core.h
@@ -135,6 +135,9 @@ struct uart_port {
 						struct serial_rs485 *rs485);
 	int			(*iso7816_config)(struct uart_port *,
 						  struct serial_iso7816 *iso7816);
+	void			(*report_extra)(struct uart_port *port,
+						char *report_buf,
+						size_t report_size);
 	unsigned int		irq;			/* irq number */
 	unsigned long		irqflags;		/* irq flags  */
 	unsigned int		uartclk;		/* base uart clock */
