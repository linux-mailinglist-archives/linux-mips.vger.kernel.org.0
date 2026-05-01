Return-Path: <linux-mips+bounces-14424-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLvqAw009Wm4JQIAu9opvQ
	(envelope-from <linux-mips+bounces-14424-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:15:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A18084B0366
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9992630055AE
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2026 23:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F7737F016;
	Fri,  1 May 2026 23:15:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEB923BD17;
	Fri,  1 May 2026 23:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677318; cv=none; b=jxMAM5D2LXmRcHbViVVWu4CWpK3YEyoW4vjOcg69VJntmH6bXs29Y7+wXri4FtHqGBNT7DwI2GQE6TbEGwX1NDzkUbPvdus7IxRU4X9GjyPlPOgkKQ1cvGVm1ZVEkQgvN51Q61yCnBzYtsMxRzamdPf/zY8q8cgvqR+HOqpt/90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677318; c=relaxed/simple;
	bh=7iz5o5dihvTmBsipC1P7UQCpeaI8k4tBg2lOJLaJoGQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=INg4uTD+V0SPbrgneT9WY5oWRTXD8LvhmbeZW7sNKJrdYkn2PJjzkLCsLZbABSPnXJGF68aZJ3h05IsOtGF89KnXhhsALuSaAI1ioB6Sih9zVbTM+WtadWu5EvSSJV+GjvQFsb5DIeBciLE6kiIofYXwXtv6hwIDw8eWtGOZfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8379B92009D; Sat,  2 May 2026 01:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7D6E492009C;
	Sat,  2 May 2026 00:15:14 +0100 (BST)
Date: Sat, 2 May 2026 00:15:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v2 08/10] serial: zs: Convert to use a platform device
In-Reply-To: <alpine.DEB.2.21.2604302336260.38805@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605012100520.11074@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604302336260.38805@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A18084B0366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14424-lists,linux-mips=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6]

Prevent a crash from happening as the first serial port is initialised:

  Console: switching to mono frame buffer device 160x64
  fb0: PMAG-AA frame buffer device at tc0
  DECstation Z85C30 serial driver version 0.10
  CPU 0 Unable to handle kernel paging request at virtual address 0000002c, epc == 803ab00c, ra == 803aafe0
  Oops[#1]:
  CPU: 0 PID: 1 Comm: swapper Not tainted 6.4.0-rc3-00031-g84a9582fd203-dirty #57
  $ 0   : 00000000 10012c00 803aaeb0 00000000
  $ 4   : 80e12f60 80e12f50 80e12f58 81000030
  $ 8   : 00000000 805ff37c 00000000 33433538
  $12   : 65732030 00000006 80c2915d 6c616972
  $16   : 80e12f00 807b7630 00000000 00000000
  $20   : 00000004 00000348 000001a0 807623b8
  $24   : 00000018 00000000                  
  $28   : 80c24000 80c25d60 8078b148 803aafe0
  Hi    : 00000000
  Lo    : 00000000
  epc   : 803ab00c serial_base_ctrl_add+0x78/0xf4
  ra    : 803aafe0 serial_base_ctrl_add+0x4c/0xf4
  Status: 10012c03	KERNEL EXL IE 
  Cause : 00000008 (ExcCode 02)
  BadVA : 0000002c
  PrId  : 00000440 (R4400SC)
  Modules linked in:
  Process swapper (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
  Stack : 80760000 00000cc0 00400044 00400040 803aa02c 80d61ab8 00000000 807b7630
          80760000 807623b8 807b7628 803aa644 80386998 00000000 80e17780 80220f68
          80e17780 80d61ab8 80c17d80 80e17780 80e17780 8063c798 80e17780 80383fa0
          00000010 80e17780 00000000 80386998 807a0000 00000000 00400040 8038f848
          807623b8 80d61ab8 00000004 80e17780 00000000 803a68e4 80c25e2c 803bb884
          ...
  Call Trace:
  [<803ab00c>] serial_base_ctrl_add+0x78/0xf4
  [<803aa644>] serial_core_register_port+0x174/0x69c
  [<8077e9ac>] zs_init+0xc8/0xfc
  [<800404d4>] do_one_initcall+0x40/0x2ac
  [<8076cecc>] kernel_init_freeable+0x1e4/0x270
  [<80605bec>] kernel_init+0x20/0x108
  [<800431e8>] ret_from_kernel_thread+0x14/0x1c
  
  Code: 2442aeb0  ae120024  ae0200d0 <8c67002c> 50e00001  8c670000  3c06806e  3c05806e  afb30010 
  
  ---[ end trace 0000000000000000 ]---

(report at the offending commit) -- where a pointer is dereferenced that 
has been derived from a null pointer to the port's parent device.

Since no device is available with legacy probing and it's not anymore a
preferable way to discover devices anyway, switch the driver to using a
platform device and use it as the port's parent device.  Update resource
handling accordingly and only request the actual span of addresses used
within the slot, which will have had its resource already requested by
generic platform device code.

Use platform_driver_probe() not just because SCC devices are fixed with 
solder on board and not straightforward to remove, but foremost because 
the associated TTY's major device number is the same as used by the dz 
driver and the first driver to claim it will prevent the other one from 
using it.  Either one DZ device or some SCC devices will be present in a 
given system but never both at a time, and therefore we want the major 
device number to be claimed by the first driver to actually successfully 
bind to its device and platform_driver_probe() is a way to fulfil that.

An unfortunate consequence of the switch to a platform device is we now
hand the console over from the bootconsole much later in the bootstrap.
The firmware console handler appears good enough though to work so late
and in particular with interrupts enabled.

Since there is one way only remaining to reach zs_reset() now, remove 
the port initialisation marker as no longer needed and go through the 
channel reset unconditionally.

Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10
---
No change from v1 (6/8),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604110034160.29980@angie.orcam.me.uk/>.
---
 arch/mips/dec/platform.c |   60 ++++++++++++++-
 drivers/tty/serial/zs.c  |  184 +++++++++++++++++------------------------------
 drivers/tty/serial/zs.h  |    1 
 3 files changed, 125 insertions(+), 120 deletions(-)

linux-serial-zs-platform.diff
Index: linux-macro/arch/mips/dec/platform.c
===================================================================
--- linux-macro.orig/arch/mips/dec/platform.c
+++ linux-macro/arch/mips/dec/platform.c
@@ -13,6 +13,7 @@
 #include <asm/bootinfo.h>
 
 #include <asm/dec/interrupts.h>
+#include <asm/dec/ioasic_addrs.h>
 #include <asm/dec/kn01.h>
 #include <asm/dec/kn02.h>
 #include <asm/dec/system.h>
@@ -53,10 +54,37 @@ static struct platform_device *dec_dz_de
 	&dec_dz_device,
 };
 
+static struct resource dec_zs_resources[][2] = {
+	{
+		{ .name = "scc0", .flags = IORESOURCE_MEM, },
+		{ .name = "scc0", .flags = IORESOURCE_IRQ, },
+	},
+	{
+		{ .name = "scc1", .flags = IORESOURCE_MEM, },
+		{ .name = "scc1", .flags = IORESOURCE_IRQ, },
+	},
+};
+
+static struct platform_device dec_zs_device[] = {
+	{
+		.name = "zs",
+		.id = 0,
+		.resource = dec_zs_resources[0],
+		.num_resources = ARRAY_SIZE(dec_zs_resources[0]),
+	},
+	{
+		.name = "zs",
+		.id = 1,
+		.resource = dec_zs_resources[1],
+		.num_resources = ARRAY_SIZE(dec_zs_resources[1]),
+	},
+};
+
 static int __init dec_add_devices(void)
 {
-	int ret1, ret2;
-	int num_dz;
+	struct platform_device *dec_zs_devices[ARRAY_SIZE(dec_zs_device)];
+	int ret1, ret2, ret3;
+	int num_dz, num_zs;
 	int irq, i;
 
 	dec_rtc_resources[0].start = RTC_PORT(0);
@@ -84,10 +112,36 @@ static int __init dec_add_devices(void)
 	}
 	num_dz = i;
 
+	i = 0;
+	irq = dec_interrupt[DEC_IRQ_SCC0];
+	if (irq >= 0) {
+		resource_size_t base = dec_kn_slot_base + IOASIC_SCC0;
+
+		dec_zs_device[i].resource[0].start = base;
+		dec_zs_device[i].resource[0].end = base + dec_kn_slot_size - 1;
+		dec_zs_device[i].resource[1].start = irq;
+		dec_zs_device[i].resource[1].end = irq;
+		dec_zs_devices[i] = &dec_zs_device[i];
+		i++;
+	}
+	irq = dec_interrupt[DEC_IRQ_SCC1];
+	if (irq >= 0) {
+		resource_size_t base = dec_kn_slot_base + IOASIC_SCC1;
+
+		dec_zs_device[i].resource[0].start = base;
+		dec_zs_device[i].resource[0].end = base + dec_kn_slot_size - 1;
+		dec_zs_device[i].resource[1].start = irq;
+		dec_zs_device[i].resource[1].end = irq;
+		dec_zs_devices[i] = &dec_zs_device[i];
+		i++;
+	}
+	num_zs = i;
+
 	ret1 = platform_device_register(&dec_rtc_device);
 	ret2 = IS_ENABLED(CONFIG_32BIT) ?
 	       platform_add_devices(dec_dz_devices, num_dz) : 0;
-	return ret1 ? ret1 : ret2;
+	ret3 = platform_add_devices(dec_zs_devices, num_zs);
+	return ret1 ? ret1 : ret2 ? ret2 : ret3;
 }
 
 device_initcall(dec_add_devices);
Index: linux-macro/drivers/tty/serial/zs.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/zs.c
+++ linux-macro/drivers/tty/serial/zs.c
@@ -56,6 +56,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/major.h>
+#include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/spinlock.h>
@@ -66,10 +67,6 @@
 
 #include <linux/atomic.h>
 
-#include <asm/dec/interrupts.h>
-#include <asm/dec/ioasic_addrs.h>
-#include <asm/dec/system.h>
-
 #include "zs.h"
 
 
@@ -79,7 +76,7 @@ MODULE_LICENSE("GPL");
 
 
 static char zs_name[] __initdata = "DECstation Z85C30 serial driver version ";
-static char zs_version[] __initdata = "0.10";
+static char zs_version[] __initdata = "0.11";
 
 /*
  * It would be nice to dynamically allocate everything that
@@ -98,12 +95,8 @@ static char zs_version[] __initdata = "0
 
 #define to_zport(uport) container_of(uport, struct zs_port, port)
 
-struct zs_parms {
-	resource_size_t scc[ZS_NUM_SCCS];
-	int irq[ZS_NUM_SCCS];
-};
-
 static struct zs_scc zs_sccs[ZS_NUM_SCCS];
+static struct uart_driver zs_reg;
 
 /*
  * Set parameters in WR5, WR12, WR13 such as not to interfere
@@ -839,16 +832,15 @@ static void zs_reset(struct zs_port *zpo
 
 	spin_lock_irqsave(&scc->zlock, flags);
 	irq = !irqs_disabled_flags(flags);
-	if (!zport->initialised) {
-		/* Reset the pointer first, just in case...  */
-		read_zsreg(zport, R0);
-		/* And let the current transmission finish.  */
-		zs_line_drain(zport, irq);
-		write_zsreg(zport, R9, zport == zport_a ? CHRA : CHRB);
-		udelay(10);
-		write_zsreg(zport, R9, 0);
-		zport->initialised = 1;
-	}
+
+	/* Reset the pointer first, just in case...  */
+	read_zsreg(zport, R0);
+	/* And let the current transmission finish.  */
+	zs_line_drain(zport, irq);
+	write_zsreg(zport, R9, zport == zport_a ? CHRA : CHRB);
+	udelay(10);
+	write_zsreg(zport, R9, 0);
+
 	load_zsregs(zport, zport->regs, irq);
 	spin_unlock_irqrestore(&scc->zlock, flags);
 }
@@ -1055,63 +1047,62 @@ static const struct uart_ops zs_ops = {
 /*
  * Initialize Z85C30 port structures.
  */
-static int __init zs_probe_sccs(void)
+static int __init zs_probe(struct platform_device *pdev)
 {
-	static int probed;
-	struct zs_parms zs_parms;
-	int chip, side, irq;
-	int n_chips = 0;
+	struct resource *mem_resource, *irq_resource;
+	int chip, side;
 	int i;
 
-	if (probed)
-		return 0;
-
-	irq = dec_interrupt[DEC_IRQ_SCC0];
-	if (irq >= 0) {
-		zs_parms.scc[n_chips] = IOASIC_SCC0;
-		zs_parms.irq[n_chips] = dec_interrupt[DEC_IRQ_SCC0];
-		n_chips++;
-	}
-	irq = dec_interrupt[DEC_IRQ_SCC1];
-	if (irq >= 0) {
-		zs_parms.scc[n_chips] = IOASIC_SCC1;
-		zs_parms.irq[n_chips] = dec_interrupt[DEC_IRQ_SCC1];
-		n_chips++;
-	}
-	if (!n_chips)
-		return -ENXIO;
+	mem_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	irq_resource = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!mem_resource || !irq_resource)
+		return -ENODEV;
 
-	probed = 1;
+	chip = pdev->id;
+	spin_lock_init(&zs_sccs[chip].zlock);
+	for (side = 0; side < ZS_NUM_CHAN; side++) {
+		struct zs_port *zport = &zs_sccs[chip].zport[side];
+		struct uart_port *uport = &zport->port;
 
-	for (chip = 0; chip < n_chips; chip++) {
-		spin_lock_init(&zs_sccs[chip].zlock);
-		for (side = 0; side < ZS_NUM_CHAN; side++) {
-			struct zs_port *zport = &zs_sccs[chip].zport[side];
-			struct uart_port *uport = &zport->port;
+		zport->scc	= &zs_sccs[chip];
+		zport->clk_mode	= 16;
 
-			zport->scc	= &zs_sccs[chip];
-			zport->clk_mode	= 16;
+		uport->dev	= &pdev->dev;
+		uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_ZS_CONSOLE);
+		uport->irq	= irq_resource->start;
+		uport->uartclk	= ZS_CLOCK;
+		uport->fifosize	= 1;
+		uport->iotype	= UPIO_MEM;
+		uport->flags	= UPF_BOOT_AUTOCONF;
+		uport->ops	= &zs_ops;
+		uport->line	= chip * ZS_NUM_CHAN + side;
+		uport->mapbase	= mem_resource->start +
+				  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
 
-			uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_ZS_CONSOLE);
-			uport->irq	= zs_parms.irq[chip];
-			uport->uartclk	= ZS_CLOCK;
-			uport->fifosize	= 1;
-			uport->iotype	= UPIO_MEM;
-			uport->flags	= UPF_BOOT_AUTOCONF;
-			uport->ops	= &zs_ops;
-			uport->line	= chip * ZS_NUM_CHAN + side;
-			uport->mapbase	= dec_kn_slot_base +
-					  zs_parms.scc[chip] +
-					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
+		for (i = 0; i < ZS_NUM_REGS; i++)
+			zport->regs[i] = zs_init_regs[i];
 
-			for (i = 0; i < ZS_NUM_REGS; i++)
-				zport->regs[i] = zs_init_regs[i];
-		}
+		if (uart_add_one_port(&zs_reg, uport))
+			uport->dev = NULL;
 	}
 
 	return 0;
 }
 
+static void __exit zs_remove(struct platform_device *pdev)
+{
+	int chip, side;
+
+	chip = pdev->id;
+	for (side = ZS_NUM_CHAN - 1; side >= 0; side--) {
+		struct zs_port *zport = &zs_sccs[chip].zport[side];
+		struct uart_port *uport = &zport->port;
+
+		if (uport->dev)
+			uart_remove_one_port(&zs_reg, uport);
+	}
+}
+
 
 #ifdef CONFIG_SERIAL_ZS_CONSOLE
 static void zs_console_putchar(struct uart_port *uport, unsigned char ch)
@@ -1192,20 +1183,14 @@ static int __init zs_console_setup(struc
 	int bits = 8;
 	int parity = 'n';
 	int flow = 'n';
-	int ret;
-
-	ret = zs_map_port(uport);
-	if (ret)
-		return ret;
-
-	zs_reset(zport);
 
+	if (!zport->scc)
+		return -ENODEV;
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 	return uart_set_options(uport, co, baud, parity, bits, flow);
 }
 
-static struct uart_driver zs_reg;
 static struct console zs_console = {
 	.name	= "ttyS",
 	.write	= zs_console_write,
@@ -1216,23 +1201,6 @@ static struct console zs_console = {
 	.data	= &zs_reg,
 };
 
-/*
- *	Register console.
- */
-static int __init zs_serial_console_init(void)
-{
-	int ret;
-
-	ret = zs_probe_sccs();
-	if (ret)
-		return ret;
-	register_console(&zs_console);
-
-	return 0;
-}
-
-console_initcall(zs_serial_console_init);
-
 #define SERIAL_ZS_CONSOLE	&zs_console
 #else
 #define SERIAL_ZS_CONSOLE	NULL
@@ -1248,47 +1216,31 @@ static struct uart_driver zs_reg = {
 	.cons			= SERIAL_ZS_CONSOLE,
 };
 
+static struct platform_driver zs_driver = {
+	.remove = __exit_p(zs_remove),
+	.driver = { .name = "zs" },
+};
+
 /* zs_init inits the driver. */
 static int __init zs_init(void)
 {
-	int i, ret;
+	int ret;
 
 	pr_info("%s%s\n", zs_name, zs_version);
 
-	/* Find out how many Z85C30 SCCs we have.  */
-	ret = zs_probe_sccs();
-	if (ret)
-		return ret;
-
 	ret = uart_register_driver(&zs_reg);
 	if (ret)
 		return ret;
+	ret = platform_driver_probe(&zs_driver, zs_probe);
+	if (ret)
+		uart_unregister_driver(&zs_reg);
 
-	for (i = 0; i < ZS_NUM_SCCS * ZS_NUM_CHAN; i++) {
-		struct zs_scc *scc = &zs_sccs[i / ZS_NUM_CHAN];
-		struct zs_port *zport = &scc->zport[i % ZS_NUM_CHAN];
-		struct uart_port *uport = &zport->port;
-
-		if (zport->scc)
-			uart_add_one_port(&zs_reg, uport);
-	}
-
-	return 0;
+	return ret;
 }
 
 static void __exit zs_exit(void)
 {
-	int i;
-
-	for (i = ZS_NUM_SCCS * ZS_NUM_CHAN - 1; i >= 0; i--) {
-		struct zs_scc *scc = &zs_sccs[i / ZS_NUM_CHAN];
-		struct zs_port *zport = &scc->zport[i % ZS_NUM_CHAN];
-		struct uart_port *uport = &zport->port;
-
-		if (zport->scc)
-			uart_remove_one_port(&zs_reg, uport);
-	}
-
+	platform_driver_unregister(&zs_driver);
 	uart_unregister_driver(&zs_reg);
 }
 
Index: linux-macro/drivers/tty/serial/zs.h
===================================================================
--- linux-macro.orig/drivers/tty/serial/zs.h
+++ linux-macro/drivers/tty/serial/zs.h
@@ -22,7 +22,6 @@
 struct zs_port {
 	struct zs_scc	*scc;			/* Containing SCC.  */
 	struct uart_port port;			/* Underlying UART.  */
-	int		initialised;		/* For the console port.  */
 
 	int		clk_mode;		/* May be 1, 16, 32, or 64.  */
 

