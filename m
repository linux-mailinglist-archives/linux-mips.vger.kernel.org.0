Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3A16FF139
	for <lists+linux-mips@lfdr.de>; Thu, 11 May 2023 14:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbjEKMMh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 May 2023 08:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237989AbjEKMMJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 May 2023 08:12:09 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B57135A6;
        Thu, 11 May 2023 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683807098; x=1715343098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+XoqypIz+Deovt64m1wNFOg0XsypWCDERjZNrtQnhT4=;
  b=L79Ugjk+A+pCiFqA+vM4ea9fKChTAY6B4CFYCFeRF80uyjd57WJs9K0P
   pAJXKZRybxJEeXz0i1m+OiDezptnY8q23CZna/Wg6SEYh/Z93hAahYPkD
   mBPjewwZDS/oHMAzBw6GnYzMaQ82IAU4+GAKztyyL105y2fv3Lto65znF
   6WVBPrhXs5VVYLUIeNIbT8PMr3WtpwpG4f8C1t9GsT47YmkEKWzvbwm0w
   iV7Ng/7SuhmJoQ+xijNmKzrYAtlre5zOr1dY326ldqPQHV46byzHdklGA
   EEnjHdB5HwVWZmY5IHszUDJbjMmaS7idwpF9tPS6FHarPAAuWFurT+IaS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330839319"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="330839319"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 05:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="843921365"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="843921365"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 05:11:19 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Niklas Schnelle <schnelle@linux.ibm.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 4/6] serial: 8250: RT288x/Au1xxx code away from core
Date:   Thu, 11 May 2023 15:10:27 +0300
Message-Id: <20230511121029.13128-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511121029.13128-1-ilpo.jarvinen@linux.intel.com>
References: <20230511121029.13128-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A non-trivial amount of RT288x/Au1xxx code is encapsulated into
ifdeffery in 8250_port / 8250_early and some if UPIO_AU blocks.
Create a separate file from them.

Also handle errors properly in the cases where RT288x/Au1xxx code is
not configured.

It seems that 0x1000 mapsize is likely overkill but I've kept it the
same as previously (the value was shrunk to that value in commit
b2b13cdfd05e ("SERIAL 8250: Fixes for Alchemy UARTs.")). Seemingly, the
driver only needs to access register at 0x28 for the divisor latch.

The Kconfig side is a bit tricky. As SERIAL_8250_RT288X is bool it can
only be =y. It is possible to have SERIAL_8250=m + SERIAL_8250_RT288X=y
which required altering when 8250/ is included or the rt288x would not
be built.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/mips/alchemy/common/platform.c   |  10 +-
 drivers/tty/serial/8250/8250_early.c  |  21 ----
 drivers/tty/serial/8250/8250_of.c     |   4 +-
 drivers/tty/serial/8250/8250_port.c   |  78 --------------
 drivers/tty/serial/8250/8250_rt288x.c | 142 ++++++++++++++++++++++++++
 drivers/tty/serial/8250/Makefile      |   1 +
 drivers/tty/serial/Makefile           |   2 +-
 include/linux/serial_8250.h           |   8 +-
 8 files changed, 161 insertions(+), 105 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_rt288x.c

diff --git a/arch/mips/alchemy/common/platform.c b/arch/mips/alchemy/common/platform.c
index b8f3397c59c9..d4ab34b3b404 100644
--- a/arch/mips/alchemy/common/platform.c
+++ b/arch/mips/alchemy/common/platform.c
@@ -51,9 +51,9 @@ static void alchemy_8250_pm(struct uart_port *port, unsigned int state,
 #define PORT(_base, _irq)					\
 	{							\
 		.mapbase	= _base,			\
+		.mapsize	= 0x1000,			\
 		.irq		= _irq,				\
 		.regshift	= 2,				\
-		.iotype		= UPIO_AU,			\
 		.flags		= UPF_SKIP_TEST | UPF_IOREMAP | \
 				  UPF_FIXED_TYPE,		\
 		.type		= PORT_16550A,			\
@@ -124,8 +124,14 @@ static void __init alchemy_setup_uarts(int ctype)
 	au1xx0_uart_device.dev.platform_data = ports;
 
 	/* Fill up uartclk. */
-	for (s = 0; s < c; s++)
+	for (s = 0; s < c; s++) {
 		ports[s].uartclk = uartclk;
+		if (au_platform_setup(&ports[s]) < 0) {
+			kfree(ports);
+			printk(KERN_INFO "Alchemy: missing support for UARTs\n");
+			return;
+		}
+	}
 	if (platform_device_register(&au1xx0_uart_device))
 		printk(KERN_INFO "Alchemy: failed to register UARTs\n");
 }
diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index 0ebde0ab8167..4299a8bd83d9 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -36,7 +36,6 @@
 
 static unsigned int serial8250_early_in(struct uart_port *port, int offset)
 {
-	int reg_offset = offset;
 	offset <<= port->regshift;
 
 	switch (port->iotype) {
@@ -50,8 +49,6 @@ static unsigned int serial8250_early_in(struct uart_port *port, int offset)
 		return ioread32be(port->membase + offset);
 	case UPIO_PORT:
 		return inb(port->iobase + offset);
-	case UPIO_AU:
-		return port->serial_in(port, reg_offset);
 	default:
 		return 0;
 	}
@@ -59,7 +56,6 @@ static unsigned int serial8250_early_in(struct uart_port *port, int offset)
 
 static void serial8250_early_out(struct uart_port *port, int offset, int value)
 {
-	int reg_offset = offset;
 	offset <<= port->regshift;
 
 	switch (port->iotype) {
@@ -78,9 +74,6 @@ static void serial8250_early_out(struct uart_port *port, int offset, int value)
 	case UPIO_PORT:
 		outb(value, port->iobase + offset);
 		break;
-	case UPIO_AU:
-		port->serial_out(port, reg_offset, value);
-		break;
 	}
 }
 
@@ -199,17 +192,3 @@ OF_EARLYCON_DECLARE(omap8250, "ti,omap3-uart", early_omap8250_setup);
 OF_EARLYCON_DECLARE(omap8250, "ti,omap4-uart", early_omap8250_setup);
 
 #endif
-
-#ifdef CONFIG_SERIAL_8250_RT288X
-
-static int __init early_au_setup(struct earlycon_device *dev, const char *opt)
-{
-	dev->port.serial_in = au_serial_in;
-	dev->port.serial_out = au_serial_out;
-	dev->port.iotype = UPIO_AU;
-	dev->con->write = early_serial8250_write;
-	return 0;
-}
-OF_EARLYCON_DECLARE(palmchip, "ralink,rt2880-uart", early_au_setup);
-
-#endif
diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 1b461fba15a3..c9f6bd7a7038 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -171,7 +171,9 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	switch (type) {
 	case PORT_RT2880:
-		port->iotype = UPIO_AU;
+		ret = rt288x_setup(port);
+		if (ret)
+			goto err_unprepare;
 		break;
 	}
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 344bd447639b..0cef9bfd0471 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -341,66 +341,6 @@ static void default_serial_dl_write(struct uart_8250_port *up, u32 value)
 	serial_out(up, UART_DLM, value >> 8 & 0xff);
 }
 
-#ifdef CONFIG_SERIAL_8250_RT288X
-
-#define UART_REG_UNMAPPED	-1
-
-/* Au1x00/RT288x UART hardware has a weird register layout */
-static const s8 au_io_in_map[8] = {
-	[UART_RX]	= 0,
-	[UART_IER]	= 2,
-	[UART_IIR]	= 3,
-	[UART_LCR]	= 5,
-	[UART_MCR]	= 6,
-	[UART_LSR]	= 7,
-	[UART_MSR]	= 8,
-	[UART_SCR]	= UART_REG_UNMAPPED,
-};
-
-static const s8 au_io_out_map[8] = {
-	[UART_TX]	= 1,
-	[UART_IER]	= 2,
-	[UART_FCR]	= 4,
-	[UART_LCR]	= 5,
-	[UART_MCR]	= 6,
-	[UART_LSR]	= UART_REG_UNMAPPED,
-	[UART_MSR]	= UART_REG_UNMAPPED,
-	[UART_SCR]	= UART_REG_UNMAPPED,
-};
-
-unsigned int au_serial_in(struct uart_port *p, int offset)
-{
-	if (offset >= ARRAY_SIZE(au_io_in_map))
-		return UINT_MAX;
-	offset = au_io_in_map[offset];
-	if (offset == UART_REG_UNMAPPED)
-		return UINT_MAX;
-	return __raw_readl(p->membase + (offset << p->regshift));
-}
-
-void au_serial_out(struct uart_port *p, int offset, int value)
-{
-	if (offset >= ARRAY_SIZE(au_io_out_map))
-		return;
-	offset = au_io_out_map[offset];
-	if (offset == UART_REG_UNMAPPED)
-		return;
-	__raw_writel(value, p->membase + (offset << p->regshift));
-}
-
-/* Au1x00 haven't got a standard divisor latch */
-static u32 au_serial_dl_read(struct uart_8250_port *up)
-{
-	return __raw_readl(up->port.membase + 0x28);
-}
-
-static void au_serial_dl_write(struct uart_8250_port *up, u32 value)
-{
-	__raw_writel(value, up->port.membase + 0x28);
-}
-
-#endif
-
 static unsigned int hub6_serial_in(struct uart_port *p, int offset)
 {
 	offset = offset << p->regshift;
@@ -510,15 +450,6 @@ static void set_io_from_upio(struct uart_port *p)
 		p->serial_out = mem32be_serial_out;
 		break;
 
-#ifdef CONFIG_SERIAL_8250_RT288X
-	case UPIO_AU:
-		p->serial_in = au_serial_in;
-		p->serial_out = au_serial_out;
-		up->dl_read = au_serial_dl_read;
-		up->dl_write = au_serial_dl_write;
-		break;
-#endif
-
 	default:
 		p->serial_in = io_serial_in;
 		p->serial_out = io_serial_out;
@@ -2968,11 +2899,6 @@ static unsigned int serial8250_port_size(struct uart_8250_port *pt)
 {
 	if (pt->port.mapsize)
 		return pt->port.mapsize;
-	if (pt->port.iotype == UPIO_AU) {
-		if (pt->port.type == PORT_RT2880)
-			return 0x100;
-		return 0x1000;
-	}
 	if (is_omap1_8250(pt))
 		return 0x16 << pt->port.regshift;
 
@@ -3222,10 +3148,6 @@ static void serial8250_config_port(struct uart_port *port, int flags)
 	if (flags & UART_CONFIG_TYPE)
 		autoconfig(up);
 
-	/* if access method is AU, it is a 16550 with a quirk */
-	if (port->type == PORT_16550A && port->iotype == UPIO_AU)
-		up->bugs |= UART_BUG_NOMSR;
-
 	/* HW bugs may trigger IRQ while IIR == NO_INT */
 	if (port->type == PORT_TEGRA)
 		up->bugs |= UART_BUG_NOMSR;
diff --git a/drivers/tty/serial/8250/8250_rt288x.c b/drivers/tty/serial/8250/8250_rt288x.c
new file mode 100644
index 000000000000..51b1cf5476dd
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_rt288x.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RT288x/Au1xxx driver
+ */
+
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/console.h>
+#include <linux/serial.h>
+#include <linux/serial_8250.h>
+
+#include "8250.h"
+
+#define UART_REG_UNMAPPED	-1
+
+/* Au1x00/RT288x UART hardware has a weird register layout */
+static const s8 au_io_in_map[8] = {
+	[UART_RX]	= 0,
+	[UART_IER]	= 2,
+	[UART_IIR]	= 3,
+	[UART_LCR]	= 5,
+	[UART_MCR]	= 6,
+	[UART_LSR]	= 7,
+	[UART_MSR]	= 8,
+	[UART_SCR]	= UART_REG_UNMAPPED,
+};
+
+static const s8 au_io_out_map[8] = {
+	[UART_TX]	= 1,
+	[UART_IER]	= 2,
+	[UART_FCR]	= 4,
+	[UART_LCR]	= 5,
+	[UART_MCR]	= 6,
+	[UART_LSR]	= UART_REG_UNMAPPED,
+	[UART_MSR]	= UART_REG_UNMAPPED,
+	[UART_SCR]	= UART_REG_UNMAPPED,
+};
+
+static unsigned int au_serial_in(struct uart_port *p, int offset)
+{
+	if (offset >= ARRAY_SIZE(au_io_in_map))
+		return UINT_MAX;
+	offset = au_io_in_map[offset];
+	if (offset == UART_REG_UNMAPPED)
+		return UINT_MAX;
+	return __raw_readl(p->membase + (offset << p->regshift));
+}
+
+static void au_serial_out(struct uart_port *p, int offset, int value)
+{
+	if (offset >= ARRAY_SIZE(au_io_out_map))
+		return;
+	offset = au_io_out_map[offset];
+	if (offset == UART_REG_UNMAPPED)
+		return;
+	__raw_writel(value, p->membase + (offset << p->regshift));
+}
+
+/* Au1x00 haven't got a standard divisor latch */
+static u32 au_serial_dl_read(struct uart_8250_port *up)
+{
+	return __raw_readl(up->port.membase + 0x28);
+}
+
+static void au_serial_dl_write(struct uart_8250_port *up, u32 value)
+{
+	__raw_writel(value, up->port.membase + 0x28);
+}
+
+int au_platform_setup(struct plat_serial8250_port *p)
+{
+	p->iotype = UPIO_AU;
+
+	p->serial_in = au_serial_in;
+	p->serial_out = au_serial_out;
+	p->dl_read = au_serial_dl_read;
+	p->dl_write = au_serial_dl_write;
+
+	p->mapsize = 0x1000;
+
+	p->bugs |= UART_BUG_NOMSR;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(au_platform_setup);
+
+int rt288x_setup(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->iotype = UPIO_AU;
+
+	p->serial_in = au_serial_in;
+	p->serial_out = au_serial_out;
+	up->dl_read = au_serial_dl_read;
+	up->dl_write = au_serial_dl_write;
+
+	p->mapsize = 0x100;
+
+	up->bugs |= UART_BUG_NOMSR;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rt288x_setup);
+
+#ifdef CONFIG_SERIAL_8250_CONSOLE
+static void au_putc(struct uart_port *port, unsigned char c)
+{
+	unsigned int status;
+
+	au_serial_out(port, UART_TX, c);
+
+	for (;;) {
+		status = au_serial_in(port, UART_LSR);
+		if (uart_lsr_tx_empty(status))
+			break;
+		cpu_relax();
+	}
+}
+
+static void au_early_serial8250_write(struct console *console,
+				      const char *s, unsigned int count)
+{
+	struct earlycon_device *device = console->data;
+	struct uart_port *port = &device->port;
+
+	uart_console_write(port, s, count, au_putc);
+}
+
+static int __init early_au_setup(struct earlycon_device *dev, const char *opt)
+{
+	rt288x_setup(&dev->port);
+	dev->con->write = au_early_serial8250_write;
+
+	return 0;
+}
+OF_EARLYCON_DECLARE(palmchip, "ralink,rt2880-uart", early_au_setup);
+#endif
+
+MODULE_DESCRIPTION("RT288x/Au1xxx UART driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 4fc2fc1f41b6..628b75be312e 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_SERIAL_8250_DW)		+= 8250_dw.o
 obj-$(CONFIG_SERIAL_8250_EM)		+= 8250_em.o
 obj-$(CONFIG_SERIAL_8250_IOC3)		+= 8250_ioc3.o
 obj-$(CONFIG_SERIAL_8250_OMAP)		+= 8250_omap.o
+obj-$(CONFIG_SERIAL_8250_RT288X)	+= 8250_rt288x.o
 obj-$(CONFIG_SERIAL_8250_LPC18XX)	+= 8250_lpc18xx.o
 obj-$(CONFIG_SERIAL_8250_MT6577)	+= 8250_mtk.o
 obj-$(CONFIG_SERIAL_8250_UNIPHIER)	+= 8250_uniphier.o
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index cd9afd9e3018..531ec3a19dae 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -21,7 +21,7 @@ obj-$(CONFIG_SERIAL_SUNSAB) += sunsab.o
 obj-$(CONFIG_SERIAL_21285) += 21285.o
 
 # Now bring in any enabled 8250/16450/16550 type drivers.
-obj-$(CONFIG_SERIAL_8250) += 8250/
+obj-y += 8250/
 
 obj-$(CONFIG_SERIAL_AMBA_PL010) += amba-pl010.o
 obj-$(CONFIG_SERIAL_AMBA_PL011) += amba-pl011.o
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 42fc8f64f48e..eb44420b39ec 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -7,6 +7,7 @@
 #ifndef _LINUX_SERIAL_8250_H
 #define _LINUX_SERIAL_8250_H
 
+#include <linux/errno.h>
 #include <linux/serial_core.h>
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
@@ -211,8 +212,11 @@ void serial8250_set_isa_configurator(void (*v)(int port, struct uart_port *up,
 					       u32 *capabilities));
 
 #ifdef CONFIG_SERIAL_8250_RT288X
-unsigned int au_serial_in(struct uart_port *p, int offset);
-void au_serial_out(struct uart_port *p, int offset, int value);
+int rt288x_setup(struct uart_port *p);
+int au_platform_setup(struct plat_serial8250_port *p);
+#else
+static inline int rt288x_setup(struct uart_port *p) { return -ENODEV; }
+static inline int au_platform_setup(struct plat_serial8250_port *p) { return -ENODEV; }
 #endif
 
 #endif
-- 
2.30.2

