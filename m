Return-Path: <linux-mips+bounces-9922-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A0B11F75
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jul 2025 15:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1543C7A5B16
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jul 2025 13:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABAB1E8337;
	Fri, 25 Jul 2025 13:40:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112D8635D
	for <linux-mips@vger.kernel.org>; Fri, 25 Jul 2025 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753450826; cv=none; b=QPwvZJzk5enaBBOi56Dbtmnnl3UhgDKMn3O4eyRMPDqJIMF3yJMxulEv+LUOxnMuAiu9OE1gosV8sRV1emucVlP/hJH2t3yuPPkubaBJMca9Cc4wy7ZvtdzGMTZeO2PHVv1K67grm5piiIm/CLGjcF+CVURKIuJodlj91VQK5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753450826; c=relaxed/simple;
	bh=RGdpSmgxHFF6xYZE0XScte35A7YmK5X2mPyAytSGyCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=azCi1I2w9DvFstLbgRVWwMV/PZ9gkNL65JZ6lLscCJB54Tx2IulC/fv9Qgje6g+rnlTd2i/CMNxqtYqpwtDMLKs9GqjcQ69SjLOwY7tcBKepFt7r0vw2N6D7fopM98S8HKzBg22xOwUF7QH8v7oqGDV5ufkT+bZJwL9IkVGGMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A294021A50;
	Fri, 25 Jul 2025 13:40:19 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8755713A8D;
	Fri, 25 Jul 2025 13:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zueVIEOJg2hdQwAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Fri, 25 Jul 2025 13:40:19 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2] tty: serial: ip22zilog: Use platform device for probing
Date: Fri, 25 Jul 2025 15:40:17 +0200
Message-ID: <20250725134018.136113-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

After commit 84a9582fd203 ("serial: core: Start managing serial controllers
to enable runtime PM") serial drivers need to provide a device in
struct uart_port.dev otherwise an oops happens. To fix this issue
for ip22zilog driver switch driver to a platform driver and setup
the serial device in sgi-ip22 code.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
v2: removed copy&pasted useless code form sgi_zilog_devinit()
v1: https://lore.kernel.org/all/20250723115823.76341-1-tsbogend@alpha.franken.de/

 arch/mips/sgi-ip22/ip22-platform.c |  32 +++
 drivers/tty/serial/ip22zilog.c     | 360 ++++++++++++-----------------
 2 files changed, 179 insertions(+), 213 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip22-platform.c b/arch/mips/sgi-ip22/ip22-platform.c
index 0b2002e02a47..3a53690b4b33 100644
--- a/arch/mips/sgi-ip22/ip22-platform.c
+++ b/arch/mips/sgi-ip22/ip22-platform.c
@@ -221,3 +221,35 @@ static int __init sgi_ds1286_devinit(void)
 }
 
 device_initcall(sgi_ds1286_devinit);
+
+#define SGI_ZILOG_BASE	(HPC3_CHIP0_BASE + \
+			 offsetof(struct hpc3_regs, pbus_extregs[6]) + \
+			 offsetof(struct sgioc_regs, uart))
+
+static struct resource sgi_zilog_resources[] = {
+	{
+		.start	= SGI_ZILOG_BASE,
+		.end	= SGI_ZILOG_BASE + 15,
+		.flags	= IORESOURCE_MEM
+	},
+	{
+		.start	= SGI_SERIAL_IRQ,
+		.end	= SGI_SERIAL_IRQ,
+		.flags	= IORESOURCE_IRQ
+	}
+};
+
+static struct platform_device zilog_device = {
+	.name		= "ip22zilog",
+	.id		= 0,
+	.num_resources	= ARRAY_SIZE(sgi_zilog_resources),
+	.resource	= sgi_zilog_resources,
+};
+
+
+static int __init sgi_zilog_devinit(void)
+{
+	return platform_device_register(&zilog_device);
+}
+
+device_initcall(sgi_zilog_devinit);
diff --git a/drivers/tty/serial/ip22zilog.c b/drivers/tty/serial/ip22zilog.c
index c2cae50f06f3..6e19c6713849 100644
--- a/drivers/tty/serial/ip22zilog.c
+++ b/drivers/tty/serial/ip22zilog.c
@@ -30,6 +30,7 @@
 #include <linux/console.h>
 #include <linux/spinlock.h>
 #include <linux/init.h>
+#include <linux/platform_device.h>
 
 #include <linux/io.h>
 #include <asm/irq.h>
@@ -50,8 +51,9 @@
 #define ZSDELAY_LONG()		udelay(20)
 #define ZS_WSYNC(channel)	do { } while (0)
 
-#define NUM_IP22ZILOG		1
-#define NUM_CHANNELS		(NUM_IP22ZILOG * 2)
+#define NUM_CHANNELS		2
+#define CHANNEL_B		0
+#define CHANNEL_A		1
 
 #define ZS_CLOCK		3672000	/* Zilog input clock rate. */
 #define ZS_CLOCK_DIVISOR	16      /* Divisor this driver uses. */
@@ -62,9 +64,6 @@
 struct uart_ip22zilog_port {
 	struct uart_port		port;
 
-	/* IRQ servicing chain.  */
-	struct uart_ip22zilog_port	*next;
-
 	/* Current values of Zilog write registers.  */
 	unsigned char			curregs[NUM_ZSREGS];
 
@@ -72,7 +71,6 @@ struct uart_ip22zilog_port {
 #define IP22ZILOG_FLAG_IS_CONS		0x00000004
 #define IP22ZILOG_FLAG_IS_KGDB		0x00000008
 #define IP22ZILOG_FLAG_MODEM_STATUS	0x00000010
-#define IP22ZILOG_FLAG_IS_CHANNEL_A	0x00000020
 #define IP22ZILOG_FLAG_REGS_HELD	0x00000040
 #define IP22ZILOG_FLAG_TX_STOPPED	0x00000080
 #define IP22ZILOG_FLAG_TX_ACTIVE	0x00000100
@@ -84,6 +82,8 @@ struct uart_ip22zilog_port {
 	unsigned char			prev_status;
 };
 
+static struct uart_ip22zilog_port ip22zilog_port_table[NUM_CHANNELS];
+
 #define ZILOG_CHANNEL_FROM_PORT(PORT)	((struct zilog_channel *)((PORT)->membase))
 #define UART_ZILOG(PORT)		((struct uart_ip22zilog_port *)(PORT))
 #define IP22ZILOG_GET_CURR_REG(PORT, REGNUM)		\
@@ -93,7 +93,6 @@ struct uart_ip22zilog_port {
 #define ZS_IS_CONS(UP)	((UP)->flags & IP22ZILOG_FLAG_IS_CONS)
 #define ZS_IS_KGDB(UP)	((UP)->flags & IP22ZILOG_FLAG_IS_KGDB)
 #define ZS_WANTS_MODEM_STATUS(UP)	((UP)->flags & IP22ZILOG_FLAG_MODEM_STATUS)
-#define ZS_IS_CHANNEL_A(UP)	((UP)->flags & IP22ZILOG_FLAG_IS_CHANNEL_A)
 #define ZS_REGS_HELD(UP)	((UP)->flags & IP22ZILOG_FLAG_REGS_HELD)
 #define ZS_TX_STOPPED(UP)	((UP)->flags & IP22ZILOG_FLAG_TX_STOPPED)
 #define ZS_TX_ACTIVE(UP)	((UP)->flags & IP22ZILOG_FLAG_TX_ACTIVE)
@@ -423,60 +422,57 @@ static void ip22zilog_transmit_chars(struct uart_ip22zilog_port *up,
 
 static irqreturn_t ip22zilog_interrupt(int irq, void *dev_id)
 {
-	struct uart_ip22zilog_port *up = dev_id;
+	struct uart_ip22zilog_port *up;
+	struct zilog_channel *channel;
+	unsigned char r3;
+	bool push = false;
 
-	while (up) {
-		struct zilog_channel *channel
-			= ZILOG_CHANNEL_FROM_PORT(&up->port);
-		unsigned char r3;
-		bool push = false;
+	up = &ip22zilog_port_table[CHANNEL_A];
+	channel = ZILOG_CHANNEL_FROM_PORT(&up->port);
 
-		uart_port_lock(&up->port);
-		r3 = read_zsreg(channel, R3);
+	uart_port_lock(&up->port);
+	r3 = read_zsreg(channel, R3);
 
-		/* Channel A */
-		if (r3 & (CHAEXT | CHATxIP | CHARxIP)) {
-			writeb(RES_H_IUS, &channel->control);
-			ZSDELAY();
-			ZS_WSYNC(channel);
+	/* Channel A */
+	if (r3 & (CHAEXT | CHATxIP | CHARxIP)) {
+		writeb(RES_H_IUS, &channel->control);
+		ZSDELAY();
+		ZS_WSYNC(channel);
 
-			if (r3 & CHARxIP)
-				push = ip22zilog_receive_chars(up, channel);
-			if (r3 & CHAEXT)
-				ip22zilog_status_handle(up, channel);
-			if (r3 & CHATxIP)
-				ip22zilog_transmit_chars(up, channel);
-		}
-		uart_port_unlock(&up->port);
-
-		if (push)
-			tty_flip_buffer_push(&up->port.state->port);
-
-		/* Channel B */
-		up = up->next;
-		channel = ZILOG_CHANNEL_FROM_PORT(&up->port);
-		push = false;
-
-		uart_port_lock(&up->port);
-		if (r3 & (CHBEXT | CHBTxIP | CHBRxIP)) {
-			writeb(RES_H_IUS, &channel->control);
-			ZSDELAY();
-			ZS_WSYNC(channel);
-
-			if (r3 & CHBRxIP)
-				push = ip22zilog_receive_chars(up, channel);
-			if (r3 & CHBEXT)
-				ip22zilog_status_handle(up, channel);
-			if (r3 & CHBTxIP)
-				ip22zilog_transmit_chars(up, channel);
-		}
-		uart_port_unlock(&up->port);
-
-		if (push)
-			tty_flip_buffer_push(&up->port.state->port);
-
-		up = up->next;
+		if (r3 & CHARxIP)
+			push = ip22zilog_receive_chars(up, channel);
+		if (r3 & CHAEXT)
+			ip22zilog_status_handle(up, channel);
+		if (r3 & CHATxIP)
+			ip22zilog_transmit_chars(up, channel);
 	}
+	uart_port_unlock(&up->port);
+
+	if (push)
+		tty_flip_buffer_push(&up->port.state->port);
+
+	/* Channel B */
+	up = &ip22zilog_port_table[CHANNEL_B];
+	channel = ZILOG_CHANNEL_FROM_PORT(&up->port);
+	push = false;
+
+	uart_port_lock(&up->port);
+	if (r3 & (CHBEXT | CHBTxIP | CHBRxIP)) {
+		writeb(RES_H_IUS, &channel->control);
+		ZSDELAY();
+		ZS_WSYNC(channel);
+
+		if (r3 & CHBRxIP)
+			push = ip22zilog_receive_chars(up, channel);
+		if (r3 & CHBEXT)
+			ip22zilog_status_handle(up, channel);
+		if (r3 & CHBTxIP)
+			ip22zilog_transmit_chars(up, channel);
+	}
+	uart_port_unlock(&up->port);
+
+	if (push)
+		tty_flip_buffer_push(&up->port.state->port);
 
 	return IRQ_HANDLED;
 }
@@ -692,16 +688,16 @@ static void __ip22zilog_reset(struct uart_ip22zilog_port *up)
 		udelay(100);
 	}
 
-	if (!ZS_IS_CHANNEL_A(up)) {
-		up++;
-		channel = ZILOG_CHANNEL_FROM_PORT(&up->port);
-	}
+	up = &ip22zilog_port_table[CHANNEL_A];
+	channel = ZILOG_CHANNEL_FROM_PORT(&up->port);
+
 	write_zsreg(channel, R9, FHWRES);
 	ZSDELAY_LONG();
 	(void) read_zsreg(channel, R0);
 
 	up->flags |= IP22ZILOG_FLAG_RESET_DONE;
-	up->next->flags |= IP22ZILOG_FLAG_RESET_DONE;
+	up = &ip22zilog_port_table[CHANNEL_B];
+	up->flags |= IP22ZILOG_FLAG_RESET_DONE;
 }
 
 static void __ip22zilog_startup(struct uart_ip22zilog_port *up)
@@ -942,47 +938,6 @@ static const struct uart_ops ip22zilog_pops = {
 	.verify_port	=	ip22zilog_verify_port,
 };
 
-static struct uart_ip22zilog_port *ip22zilog_port_table;
-static struct zilog_layout **ip22zilog_chip_regs;
-
-static struct uart_ip22zilog_port *ip22zilog_irq_chain;
-static int zilog_irq = -1;
-
-static void * __init alloc_one_table(unsigned long size)
-{
-	return kzalloc(size, GFP_KERNEL);
-}
-
-static void __init ip22zilog_alloc_tables(void)
-{
-	ip22zilog_port_table = (struct uart_ip22zilog_port *)
-		alloc_one_table(NUM_CHANNELS * sizeof(struct uart_ip22zilog_port));
-	ip22zilog_chip_regs = (struct zilog_layout **)
-		alloc_one_table(NUM_IP22ZILOG * sizeof(struct zilog_layout *));
-
-	if (ip22zilog_port_table == NULL || ip22zilog_chip_regs == NULL) {
-		panic("IP22-Zilog: Cannot allocate IP22-Zilog tables.");
-	}
-}
-
-/* Get the address of the registers for IP22-Zilog instance CHIP.  */
-static struct zilog_layout * __init get_zs(int chip)
-{
-	unsigned long base;
-
-	if (chip < 0 || chip >= NUM_IP22ZILOG) {
-		panic("IP22-Zilog: Illegal chip number %d in get_zs.", chip);
-	}
-
-	/* Not probe-able, hard code it. */
-	base = (unsigned long) &sgioc->uart;
-
-	zilog_irq = SGI_SERIAL_IRQ;
-	request_mem_region(base, 8, "IP22-Zilog");
-
-	return (struct zilog_layout *) base;
-}
-
 #define ZS_PUT_CHAR_MAX_DELAY	2000	/* 10 ms */
 
 #ifdef CONFIG_SERIAL_IP22_ZILOG_CONSOLE
@@ -1070,144 +1025,123 @@ static struct uart_driver ip22zilog_reg = {
 #endif
 };
 
-static void __init ip22zilog_prepare(void)
+static void __init ip22zilog_prepare(struct uart_ip22zilog_port *up)
 {
 	unsigned char sysrq_on = IS_ENABLED(CONFIG_SERIAL_IP22_ZILOG_CONSOLE);
-	struct uart_ip22zilog_port *up;
-	struct zilog_layout *rp;
-	int channel, chip;
+	int brg;
 
-	/*
-	 * Temporary fix.
-	 */
-	for (channel = 0; channel < NUM_CHANNELS; channel++)
-		spin_lock_init(&ip22zilog_port_table[channel].port.lock);
+	spin_lock_init(&up->port.lock);
 
-	ip22zilog_irq_chain = &ip22zilog_port_table[NUM_CHANNELS - 1];
-        up = &ip22zilog_port_table[0];
-	for (channel = NUM_CHANNELS - 1 ; channel > 0; channel--)
-		up[channel].next = &up[channel - 1];
-	up[channel].next = NULL;
+	up->port.iotype = UPIO_MEM;
+	up->port.uartclk = ZS_CLOCK;
+	up->port.fifosize = 1;
+	up->port.has_sysrq = sysrq_on;
+	up->port.ops = &ip22zilog_pops;
+	up->port.type = PORT_IP22ZILOG;
 
-	for (chip = 0; chip < NUM_IP22ZILOG; chip++) {
-		if (!ip22zilog_chip_regs[chip]) {
-			ip22zilog_chip_regs[chip] = rp = get_zs(chip);
-
-			up[(chip * 2) + 0].port.membase = (char *) &rp->channelB;
-			up[(chip * 2) + 1].port.membase = (char *) &rp->channelA;
-
-			/* In theory mapbase is the physical address ...  */
-			up[(chip * 2) + 0].port.mapbase =
-				(unsigned long) ioremap((unsigned long) &rp->channelB, 8);
-			up[(chip * 2) + 1].port.mapbase =
-				(unsigned long) ioremap((unsigned long) &rp->channelA, 8);
-		}
-
-		/* Channel A */
-		up[(chip * 2) + 0].port.iotype = UPIO_MEM;
-		up[(chip * 2) + 0].port.irq = zilog_irq;
-		up[(chip * 2) + 0].port.uartclk = ZS_CLOCK;
-		up[(chip * 2) + 0].port.fifosize = 1;
-		up[(chip * 2) + 0].port.has_sysrq = sysrq_on;
-		up[(chip * 2) + 0].port.ops = &ip22zilog_pops;
-		up[(chip * 2) + 0].port.type = PORT_IP22ZILOG;
-		up[(chip * 2) + 0].port.flags = 0;
-		up[(chip * 2) + 0].port.line = (chip * 2) + 0;
-		up[(chip * 2) + 0].flags = 0;
-
-		/* Channel B */
-		up[(chip * 2) + 1].port.iotype = UPIO_MEM;
-		up[(chip * 2) + 1].port.irq = zilog_irq;
-		up[(chip * 2) + 1].port.uartclk = ZS_CLOCK;
-		up[(chip * 2) + 1].port.fifosize = 1;
-		up[(chip * 2) + 1].port.has_sysrq = sysrq_on;
-		up[(chip * 2) + 1].port.ops = &ip22zilog_pops;
-		up[(chip * 2) + 1].port.type = PORT_IP22ZILOG;
-		up[(chip * 2) + 1].port.line = (chip * 2) + 1;
-		up[(chip * 2) + 1].flags |= IP22ZILOG_FLAG_IS_CHANNEL_A;
-	}
-
-	for (channel = 0; channel < NUM_CHANNELS; channel++) {
-		struct uart_ip22zilog_port *up = &ip22zilog_port_table[channel];
-		int brg;
-
-		/* Normal serial TTY. */
-		up->parity_mask = 0xff;
-		up->curregs[R1] = EXT_INT_ENAB | INT_ALL_Rx | TxINT_ENAB;
-		up->curregs[R4] = PAR_EVEN | X16CLK | SB1;
-		up->curregs[R3] = RxENAB | Rx8;
-		up->curregs[R5] = TxENAB | Tx8;
-		up->curregs[R9] = NV | MIE;
-		up->curregs[R10] = NRZ;
-		up->curregs[R11] = TCBR | RCBR;
-		brg = BPS_TO_BRG(9600, ZS_CLOCK / ZS_CLOCK_DIVISOR);
-		up->curregs[R12] = (brg & 0xff);
-		up->curregs[R13] = (brg >> 8) & 0xff;
-		up->curregs[R14] = BRENAB;
-	}
+	/* Normal serial TTY. */
+	up->parity_mask = 0xff;
+	up->curregs[R1] = EXT_INT_ENAB | INT_ALL_Rx | TxINT_ENAB;
+	up->curregs[R4] = PAR_EVEN | X16CLK | SB1;
+	up->curregs[R3] = RxENAB | Rx8;
+	up->curregs[R5] = TxENAB | Tx8;
+	up->curregs[R9] = NV | MIE;
+	up->curregs[R10] = NRZ;
+	up->curregs[R11] = TCBR | RCBR;
+	brg = BPS_TO_BRG(9600, ZS_CLOCK / ZS_CLOCK_DIVISOR);
+	up->curregs[R12] = (brg & 0xff);
+	up->curregs[R13] = (brg >> 8) & 0xff;
+	up->curregs[R14] = BRENAB;
 }
 
-static int __init ip22zilog_ports_init(void)
+static int ip22zilog_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct uart_ip22zilog_port *up;
+	char __iomem *membase;
+	struct resource *res;
+	int irq;
+	int i;
 
-	printk(KERN_INFO "Serial: IP22 Zilog driver (%d chips).\n", NUM_IP22ZILOG);
+	up = &ip22zilog_port_table[CHANNEL_B];
+	if (up->port.dev)
+		return -ENOSPC;
 
-	ip22zilog_prepare();
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
-	if (request_irq(zilog_irq, ip22zilog_interrupt, 0,
-			"IP22-Zilog", ip22zilog_irq_chain)) {
+	membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(membase))
+		return PTR_ERR(membase);
+
+	ip22zilog_prepare(up);
+
+	up->port.mapbase = res->start + offsetof(struct zilog_layout, channelB);
+	up->port.membase = membase + offsetof(struct zilog_layout, channelB);
+	up->port.line = 0;
+	up->port.dev = &pdev->dev;
+	up->port.irq = irq;
+
+	up = &ip22zilog_port_table[CHANNEL_A];
+	ip22zilog_prepare(up);
+
+	up->port.mapbase = res->start + offsetof(struct zilog_layout, channelA);
+	up->port.membase = membase + offsetof(struct zilog_layout, channelA);
+	up->port.line = 1;
+	up->port.dev = &pdev->dev;
+	up->port.irq = irq;
+
+	if (request_irq(irq, ip22zilog_interrupt, 0,
+			"IP22-Zilog", NULL)) {
 		panic("IP22-Zilog: Unable to register zs interrupt handler.\n");
 	}
 
-	ret = uart_register_driver(&ip22zilog_reg);
-	if (ret == 0) {
-		int i;
-
-		for (i = 0; i < NUM_CHANNELS; i++) {
-			struct uart_ip22zilog_port *up = &ip22zilog_port_table[i];
-
-			uart_add_one_port(&ip22zilog_reg, &up->port);
-		}
-	}
-
-	return ret;
-}
-
-static int __init ip22zilog_init(void)
-{
-	/* IP22 Zilog setup is hard coded, no probing to do.  */
-	ip22zilog_alloc_tables();
-	ip22zilog_ports_init();
+	for (i = 0; i < NUM_CHANNELS; i++)
+		uart_add_one_port(&ip22zilog_reg,
+				  &ip22zilog_port_table[i].port);
 
 	return 0;
 }
 
-static void __exit ip22zilog_exit(void)
+static void ip22zilog_remove(struct platform_device *pdev)
 {
 	int i;
-	struct uart_ip22zilog_port *up;
 
 	for (i = 0; i < NUM_CHANNELS; i++) {
-		up = &ip22zilog_port_table[i];
-
-		uart_remove_one_port(&ip22zilog_reg, &up->port);
+		uart_remove_one_port(&ip22zilog_reg,
+				     &ip22zilog_port_table[i].port);
+		ip22zilog_port_table[i].port.dev = NULL;
 	}
+}
 
-	/* Free IO mem */
-	up = &ip22zilog_port_table[0];
-	for (i = 0; i < NUM_IP22ZILOG; i++) {
-		if (up[(i * 2) + 0].port.mapbase) {
-		   iounmap((void*)up[(i * 2) + 0].port.mapbase);
-		   up[(i * 2) + 0].port.mapbase = 0;
-		}
-		if (up[(i * 2) + 1].port.mapbase) {
-			iounmap((void*)up[(i * 2) + 1].port.mapbase);
-			up[(i * 2) + 1].port.mapbase = 0;
-		}
+static struct platform_driver ip22zilog_driver = {
+	.probe	= ip22zilog_probe,
+	.remove	= ip22zilog_remove,
+	.driver	= {
+		.name = "ip22zilog"
 	}
+};
 
+static int __init ip22zilog_init(void)
+{
+	int ret;
+
+	ret = uart_register_driver(&ip22zilog_reg);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&ip22zilog_driver);
+	if (ret)
+		uart_unregister_driver(&ip22zilog_reg);
+
+	return ret;
+
+}
+
+static void __exit ip22zilog_exit(void)
+{
 	uart_unregister_driver(&ip22zilog_reg);
+	platform_driver_unregister(&ip22zilog_driver);
 }
 
 module_init(ip22zilog_init);
-- 
2.43.0


