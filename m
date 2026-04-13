Return-Path: <linux-mips+bounces-14119-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN6iCiZr3GmcQgkAu9opvQ
	(envelope-from <linux-mips+bounces-14119-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 06:03:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE833E7164
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 06:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AE8D30065CF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 04:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD94937E302;
	Mon, 13 Apr 2026 04:03:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DBC37C0F6;
	Mon, 13 Apr 2026 04:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053016; cv=none; b=jlAuX5qZwyS3e9kfpSRcM17UWgYUQCC3DNFw6AKHj/rEGDpKFQqxKDBs0VoDKqsYedtQ+2zDLl9zyyssN3bbkwh0x2YMC68DxtxNcnxMgaEUVOPKwtG2vAmJWzwbk/WqswkMvfJrAlbUOQDOdVnJ6ReNgcOz9anRG3Twe0KOFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053016; c=relaxed/simple;
	bh=WOxUD4nn+As0mwWscRFgNuNoXxXbO7aP/pit8ilqE08=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EQo81+a1ju1kMl00GXx4amtIKSblxaAnJXv3asCRqM4ZEsiWsXfdOnF0hH8KI3az5GRIdxx8TRYkDNhm3SZqy8WnykZvtbakqvnR+IhwWO6R+4mgMsadyUOkFqJqsBThjEQVbj/AsHLROFF7WShHNCHhoEFkU4aTI6gKH+CuMrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7B1CD92009E; Mon, 13 Apr 2026 06:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 74AA092009D;
	Mon, 13 Apr 2026 05:03:23 +0100 (BST)
Date: Mon, 13 Apr 2026 05:03:23 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] MIPS: SiByte: Convert to use a platform device
In-Reply-To: <alpine.DEB.2.21.2604130453400.29980@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2604130458350.29980@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604130453400.29980@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14119-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,orcam.me.uk:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCE833E7164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prevent a crash from happening as the first serial port is initialised:

  pata-swarm: PATA interface at GenBus slot 4
  workingset: timestamp_bits=62 max_order=18 bucket_order=0
  Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
  CPU 1 Unable to handle kernel paging request at virtual address 0000000000000208, epc == ffffffff8067f8f8, ra == ffffffff80666330
  Oops[#1]:
  CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-dirty #27 NONE 
  $ 0   : 0000000000000000 0000000014001fe0 0000000000000020 ffffffff80666130
  $ 4   : 0000000000000000 a800000100e6f118 ffffffff8112cbc0 0000000000000000
  $ 8   : 0000000000000002 0000000000000000 0000000000000000 0000000001a80000
  $12   : 0000000000000000 ffffffff809fd488 000000004ddf14dd ffffffff00000000
  $16   : a800000100e6f000 0000000000000000 ffffffff8112c1d0 a800000100e6f000
  $20   : 0000000000000000 00000000000004d0 0000000000000004 ffffffff8112c1d0
  $24   : 0000000000000001 0000000000000003                                  
  $28   : a80000010007c000 a80000010007fcb0 00000000000000ef ffffffff80666330
  Hi    : fffffffffffffdb9
  Lo    : 0000000000000035
  epc   : ffffffff8067f8f8 __dev_fwnode+0x0/0x8
  ra    : ffffffff80666330 serial_base_ctrl_add+0xb8/0x180
  Status: 14001fe3	KX SX UX KERNEL EXL IE 
  Cause : 80800008 (ExcCode 02)
  BadVA : 0000000000000208
  PrId  : 03040102 (SiByte SB1)
  Process swapper/0 (pid: 1, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
  Stack : 0000000000000000 ffffffff80cd5178 ffffffff80cd0000 ffffffff8112c1c8
          0000000000000260 ffffffff806655c4 a800000100275bc0 ffffffff8064ac88
          004000408112c000 0000000000000002 0000000000000000 ffffffff801965d0
          a800000100786ba0 ffffffff80cd5178 a800000100786ba0 0000000000000004
          a800000100275bc0 0000000000000000 0000000000000000 ffffffff80cd5178
          0000000000000000 ffffffff8112c1c8 0000000000000260 00000000000004d0
          0000000000000004 ffffffff80bf0000 00000000000000ef ffffffff80d171dc
          ffffffff80d17120 ffffffff80d25658 0000000000000000 ffffffff80d50000
          ffffffff80d2f928 ffffffff80d50000 ffffffff80d25698 ffffffff80cfcecc
          00ffffff80b84428 0000000000000000 0000000000000006 0000000000000006
          ...
  Call Trace:
  [<ffffffff8067f8f8>] __dev_fwnode+0x0/0x8
  [<ffffffff80666330>] serial_base_ctrl_add+0xb8/0x180
  [<ffffffff806655c4>] serial_core_register_port+0x174/0x8e0
  [<ffffffff80d171dc>] sbd_init+0xbc/0xf4
  [<ffffffff80cfcecc>] do_one_initcall+0x64/0x150
  [<ffffffff80cfd284>] kernel_init_freeable+0x25c/0x30c
  [<ffffffff809ff6e4>] kernel_init+0x24/0x118
  [<ffffffff80112d20>] ret_from_kernel_thread+0x14/0x1c
  
  Code: 67bd0010  03e00008  2402ffea <03e00008> dc820208  67bdffa0  ffbe0050  ffb70048  ffb60040 
  
  ---[ end trace 0000000000000000 ]---

-- where a pointer is dereferenced that has been derived from a null
pointer to the port's parent device.

Since no device is available with legacy probing and it's not anymore a
preferable way to discover devices anyway, switch the driver to using a
platform device and use it as the port's parent device.

Use platform_driver_probe() because SB1250 DUART devices are embedded 
onchip the SoC and therefore not that straightforward to remove.

An unfortunate consequence of the switch to a platform device is we now 
hand the console over from the bootconsole much later in the bootstrap. 
The CFE console handler appears good enough though to work so late and 
in particular with interrupts enabled.

Conversely only starting the console port so late lets the reset code
fully utilise our delay handlers, so switch from udelay() to fsleep()
for transmitter draining so as to avoid busy-waiting for an excessive
amount of time.

Since there is one way only remaining to reach sbd_init_port() now, drop 
the port initialisation marker as no longer needed and go through the 
channel resets unconditionally.

Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10
---
Changes from v1:

- Remove a stray `i' variable from sbd_probe().
---
 arch/mips/sibyte/swarm/platform.c |   97 +++++++++++++++++++++++--
 drivers/tty/serial/sb1250-duart.c |  147 +++++++++++++-------------------------
 2 files changed, 145 insertions(+), 99 deletions(-)

linux-serial-sb1250-duart-platform.diff
Index: linux-macro/arch/mips/sibyte/swarm/platform.c
===================================================================
--- linux-macro.orig/arch/mips/sibyte/swarm/platform.c
+++ linux-macro/arch/mips/sibyte/swarm/platform.c
@@ -8,7 +8,13 @@
 
 #include <asm/sibyte/board.h>
 #include <asm/sibyte/sb1250_genbus.h>
+#if defined(CONFIG_SIBYTE_BCM1x80)
+#include <asm/sibyte/bcm1480_regs.h>
+#include <asm/sibyte/bcm1480_int.h>
+#else
 #include <asm/sibyte/sb1250_regs.h>
+#include <asm/sibyte/sb1250_int.h>
+#endif
 
 #if defined(CONFIG_SIBYTE_SWARM) || defined(CONFIG_SIBYTE_LITTLESUR)
 
@@ -85,6 +91,82 @@ device_initcall(swarm_pata_init);
 
 #endif /* defined(CONFIG_SIBYTE_SWARM) || defined(CONFIG_SIBYTE_LITTLESUR) */
 
+#if defined(CONFIG_SIBYTE_BCM1x80)
+static struct resource sb1250_duart_resources[][2] = {
+	{
+		{
+			.name = "sb1250-duart0",
+			.flags = IORESOURCE_MEM,
+			.start = A_BCM1480_DUART0,
+			.end = (A_BCM1480_DUART0 +
+				4 * BCM1480_DUART_CHANREG_SPACING - 1),
+		},
+		{
+			.name = "sb1250-duart0",
+			.flags = IORESOURCE_IRQ,
+			.start = K_BCM1480_INT_UART_0,
+			.end = K_BCM1480_INT_UART_1,
+		},
+	},
+	{
+		{
+			.name = "sb1250-duart1",
+			.flags = IORESOURCE_MEM,
+			.start = A_BCM1480_DUART1,
+			.end = (A_BCM1480_DUART1 +
+				4 * BCM1480_DUART_CHANREG_SPACING - 1),
+		},
+		{
+			.name = "sb1250-duart1",
+			.flags = IORESOURCE_IRQ,
+			.start = K_BCM1480_INT_UART_2,
+			.end = K_BCM1480_INT_UART_3,
+		},
+	},
+};
+#else /* !defined(CONFIG_SIBYTE_BCM1x80) */
+static struct resource sb1250_duart_resources[][2] = {
+	{
+		{
+			.name = "sb1250-duart0",
+			.flags = IORESOURCE_MEM,
+			.start = A_DUART,
+			.end = A_DUART + 4 * DUART_CHANREG_SPACING - 1,
+		},
+		{
+			.name = "sb1250-duart0",
+			.flags = IORESOURCE_IRQ,
+			.start = K_INT_UART_0,
+			.end = K_INT_UART_1,
+		},
+	},
+};
+#endif /* !defined(CONFIG_SIBYTE_BCM1x80) */
+
+static struct platform_device sb1250_duart_device[] = {
+	{
+		.name = "sb1250-duart",
+		.id = 0,
+		.resource = sb1250_duart_resources[0],
+		.num_resources = ARRAY_SIZE(sb1250_duart_resources[0]),
+	},
+#if defined(CONFIG_SIBYTE_BCM1x80)
+	{
+		.name = "sb1250-duart",
+		.id = 1,
+		.resource = sb1250_duart_resources[1],
+		.num_resources = ARRAY_SIZE(sb1250_duart_resources[1]),
+	},
+#endif
+};
+
+static struct platform_device *sb1250_duart_devices[] __initdata = {
+	&sb1250_duart_device[0],
+#if defined(CONFIG_SIBYTE_BCM1x80)
+	&sb1250_duart_device[1],
+#endif
+};
+
 #define sb1250_dev_struct(num) \
 	static struct resource sb1250_res##num = {		\
 		.name = "SB1250 MAC " __stringify(num),		\
@@ -113,28 +195,31 @@ static struct platform_device *sb1250_de
 
 static int __init sb1250_device_init(void)
 {
-	int ret;
+	int ret1, ret2;
+
+	ret1 = platform_add_devices(sb1250_duart_devices,
+				    ARRAY_SIZE(sb1250_duart_devices));
 
 	/* Set the number of available units based on the SOC type.  */
 	switch (soc_type) {
 	case K_SYS_SOC_TYPE_BCM1250:
 	case K_SYS_SOC_TYPE_BCM1250_ALT:
-		ret = platform_add_devices(sb1250_devs, 3);
+		ret2 = platform_add_devices(sb1250_devs, 3);
 		break;
 	case K_SYS_SOC_TYPE_BCM1120:
 	case K_SYS_SOC_TYPE_BCM1125:
 	case K_SYS_SOC_TYPE_BCM1125H:
 	case K_SYS_SOC_TYPE_BCM1250_ALT2:	/* Hybrid */
-		ret = platform_add_devices(sb1250_devs, 2);
+		ret2 = platform_add_devices(sb1250_devs, 2);
 		break;
 	case K_SYS_SOC_TYPE_BCM1x55:
 	case K_SYS_SOC_TYPE_BCM1x80:
-		ret = platform_add_devices(sb1250_devs, 4);
+		ret2 = platform_add_devices(sb1250_devs, 4);
 		break;
 	default:
-		ret = -ENODEV;
+		ret2 = 0;
 		break;
 	}
-	return ret;
+	return ret1 ? ret1 : ret2;
 }
 device_initcall(sb1250_device_init);
Index: linux-macro/drivers/tty/serial/sb1250-duart.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/sb1250-duart.c
+++ linux-macro/drivers/tty/serial/sb1250-duart.c
@@ -3,7 +3,7 @@
  *	Support for the asynchronous serial interface (DUART) included
  *	in the BCM1250 and derived System-On-a-Chip (SOC) devices.
  *
- *	Copyright (c) 2007  Maciej W. Rozycki
+ *	Copyright (c) 2007, 2026  Maciej W. Rozycki
  *
  *	Derived from drivers/char/sb1250_duart.c for which the following
  *	copyright applies:
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/major.h>
+#include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/spinlock.h>
@@ -45,10 +46,6 @@
 #include <asm/sibyte/bcm1480_regs.h>
 #include <asm/sibyte/bcm1480_int.h>
 
-#define SBD_CHANREGS(line)	A_BCM1480_DUART_CHANREG((line), 0)
-#define SBD_CTRLREGS(line)	A_BCM1480_DUART_CTRLREG((line), 0)
-#define SBD_INT(line)		(K_BCM1480_INT_UART_0 + (line))
-
 #define DUART_CHANREG_SPACING	BCM1480_DUART_CHANREG_SPACING
 
 #define R_DUART_IMRREG(line)	R_BCM1480_DUART_IMRREG(line)
@@ -59,10 +56,6 @@
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_int.h>
 
-#define SBD_CHANREGS(line)	A_DUART_CHANREG((line), 0)
-#define SBD_CTRLREGS(line)	A_DUART_CTRLREG(0)
-#define SBD_INT(line)		(K_INT_UART_0 + (line))
-
 #else
 #error invalid SB1250 UART configuration
 
@@ -85,7 +78,6 @@ struct sbd_port {
 	struct uart_port	port;
 	unsigned char __iomem	*memctrl;
 	int			tx_stopped;
-	int			initialised;
 };
 
 /*
@@ -100,6 +92,7 @@ struct sbd_duart {
 #define to_sport(uport) container_of(uport, struct sbd_port, port)
 
 static struct sbd_duart sbd_duarts[DUART_MAX_CHIP];
+static struct uart_driver sbd_reg;
 
 
 /*
@@ -514,8 +507,6 @@ static void sbd_init_port(struct sbd_por
 {
 	struct uart_port *uport = &sport->port;
 
-	if (sport->initialised)
-		return;
 	/*
 	 * Contrary to documentation, which says that the transmitter
 	 * empty bit is set when "there are no characters to send and
@@ -537,7 +528,7 @@ static void sbd_init_port(struct sbd_por
 	 * a standard CFE firmware compilation.
 	 */
 	sbd_line_drain(sport);
-	udelay(100);
+	fsleep(100);
 
 	/* There is no DUART reset feature, so just set some sane defaults.  */
 	write_sbdchn(sport, R_DUART_CMD, V_DUART_MISC_CMD_RESET_TX);
@@ -554,8 +545,6 @@ static void sbd_init_port(struct sbd_por
 
 	/* Re-enable transmission for the initial PROM-based console.  */
 	write_sbdchn(sport, R_DUART_CMD, M_DUART_TX_EN);
-
-	sport->initialised = 1;
 }
 
 static void sbd_set_termios(struct uart_port *uport, struct ktermios *termios,
@@ -794,50 +783,54 @@ static const struct uart_ops sbd_ops = {
 };
 
 /* Initialize SB1250 DUART port structures.  */
-static void __init sbd_probe_duarts(void)
+static int __init sbd_probe(struct platform_device *pdev)
 {
-	static int probed;
+	struct resource *mem_resource, *irq_resource;
 	int chip, side;
-	int max_lines, line;
 
-	if (probed)
-		return;
+	mem_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	irq_resource = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!mem_resource || !irq_resource)
+		return -ENODEV;
 
-	/* Set the number of available units based on the SOC type.  */
-	switch (soc_type) {
-	case K_SYS_SOC_TYPE_BCM1x55:
-	case K_SYS_SOC_TYPE_BCM1x80:
-		max_lines = 4;
-		break;
-	default:
-		/* Assume at least two serial ports at the normal address.  */
-		max_lines = 2;
-		break;
-	}
+	chip = pdev->id;
+	sbd_duarts[chip].mapctrl = mem_resource->start +
+				   DUART_CHANREG_SPACING * 3;
+	for (side = 0; side < DUART_MAX_SIDE; side++) {
+		struct sbd_port *sport = &sbd_duarts[chip].sport[side];
+		struct uart_port *uport = &sport->port;
 
-	probed = 1;
+		sport->duart	= &sbd_duarts[chip];
 
-	for (chip = 0, line = 0; chip < DUART_MAX_CHIP && line < max_lines;
-	     chip++) {
-		sbd_duarts[chip].mapctrl = SBD_CTRLREGS(line);
+		uport->dev	= &pdev->dev;
+		uport->irq	= irq_resource->start + side;
+		uport->uartclk	= 100000000 / 20 * 16;
+		uport->fifosize	= 16;
+		uport->iotype	= UPIO_MEM;
+		uport->flags	= UPF_BOOT_AUTOCONF;
+		uport->ops	= &sbd_ops;
+		uport->line	= chip * DUART_MAX_SIDE + side;
+		uport->mapbase	= mem_resource->start +
+				  DUART_CHANREG_SPACING * (side + 1);
+		uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SB1250_DUART_CONSOLE);
+		if (uart_add_one_port(&sbd_reg, uport))
+			uport->dev = NULL;
+	}
 
-		for (side = 0; side < DUART_MAX_SIDE && line < max_lines;
-		     side++, line++) {
-			struct sbd_port *sport = &sbd_duarts[chip].sport[side];
-			struct uart_port *uport = &sport->port;
+	return 0;
+}
 
-			sport->duart	= &sbd_duarts[chip];
+static void __exit sbd_remove(struct platform_device *pdev)
+{
+	int chip, side;
 
-			uport->irq	= SBD_INT(line);
-			uport->uartclk	= 100000000 / 20 * 16;
-			uport->fifosize	= 16;
-			uport->iotype	= UPIO_MEM;
-			uport->flags	= UPF_BOOT_AUTOCONF;
-			uport->ops	= &sbd_ops;
-			uport->line	= line;
-			uport->mapbase	= SBD_CHANREGS(line);
-			uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SB1250_DUART_CONSOLE);
-		}
+	chip = pdev->id;
+	for (side = DUART_MAX_SIDE - 1; side >= 0; side--) {
+		struct sbd_port *sport = &sbd_duarts[chip].sport[side];
+		struct uart_port *uport = &sport->port;
+
+		if (uport->dev)
+			uart_remove_one_port(&sbd_reg, uport);
 	}
 }
 
@@ -895,23 +888,14 @@ static int __init sbd_console_setup(stru
 	int bits = 8;
 	int parity = 'n';
 	int flow = 'n';
-	int ret;
 
 	if (!sport->duart)
 		return -ENXIO;
-
-	ret = sbd_map_port(uport);
-	if (ret)
-		return ret;
-
-	sbd_init_port(sport);
-
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 	return uart_set_options(uport, co, baud, parity, bits, flow);
 }
 
-static struct uart_driver sbd_reg;
 static struct console sbd_console = {
 	.name	= "duart",
 	.write	= sbd_console_write,
@@ -922,16 +906,6 @@ static struct console sbd_console = {
 	.data	= &sbd_reg
 };
 
-static int __init sbd_serial_console_init(void)
-{
-	sbd_probe_duarts();
-	register_console(&sbd_console);
-
-	return 0;
-}
-
-console_initcall(sbd_serial_console_init);
-
 #define SERIAL_SB1250_DUART_CONSOLE	&sbd_console
 #else
 #define SERIAL_SB1250_DUART_CONSOLE	NULL
@@ -948,43 +922,30 @@ static struct uart_driver sbd_reg = {
 	.cons		= SERIAL_SB1250_DUART_CONSOLE,
 };
 
+static struct platform_driver sbd_driver = {
+	.remove = __exit_p(sbd_remove),
+	.driver = { .name = "sb1250-duart" },
+};
+
 /* Set up the driver and register it.  */
 static int __init sbd_init(void)
 {
-	int i, ret;
-
-	sbd_probe_duarts();
+	int ret;
 
 	ret = uart_register_driver(&sbd_reg);
 	if (ret)
 		return ret;
+	ret = platform_driver_probe(&sbd_driver, sbd_probe);
+	if (ret)
+		uart_unregister_driver(&sbd_reg);
 
-	for (i = 0; i < DUART_MAX_CHIP * DUART_MAX_SIDE; i++) {
-		struct sbd_duart *duart = &sbd_duarts[i / DUART_MAX_SIDE];
-		struct sbd_port *sport = &duart->sport[i % DUART_MAX_SIDE];
-		struct uart_port *uport = &sport->port;
-
-		if (sport->duart)
-			uart_add_one_port(&sbd_reg, uport);
-	}
-
-	return 0;
+	return ret;
 }
 
 /* Unload the driver.  Unregister stuff, get ready to go away.  */
 static void __exit sbd_exit(void)
 {
-	int i;
-
-	for (i = DUART_MAX_CHIP * DUART_MAX_SIDE - 1; i >= 0; i--) {
-		struct sbd_duart *duart = &sbd_duarts[i / DUART_MAX_SIDE];
-		struct sbd_port *sport = &duart->sport[i % DUART_MAX_SIDE];
-		struct uart_port *uport = &sport->port;
-
-		if (sport->duart)
-			uart_remove_one_port(&sbd_reg, uport);
-	}
-
+	platform_driver_unregister(&sbd_driver);
 	uart_unregister_driver(&sbd_reg);
 }
 

