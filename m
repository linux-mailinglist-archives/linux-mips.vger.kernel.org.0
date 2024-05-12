Return-Path: <linux-mips+bounces-3246-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8E8C364C
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 14:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DAC11C2084A
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9241200C1;
	Sun, 12 May 2024 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="fGOVXJsV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KGki0cL+"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA44208AD;
	Sun, 12 May 2024 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715515324; cv=none; b=PiXffzaiOYhqewnOQHdj5ohAW9pvjU5P67ntQpFTsnTt35ZPsccdNsP2qpjztUa8M/pOp+SBu82+veBCHwNo7auuLyxwJEncxEUEd/i8pI9ZALo86TXmLKB0QIhmy095HUqvtBfBt8Kpfd87INOq7f/Rbjnsv87WE7Viy1U0uA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715515324; c=relaxed/simple;
	bh=n5ThBvxo95Dm5VsXGKGbCA1ajrYqeiZ1N6AZ3lqghBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IZ9dqdy27JOyhrscjaMARgQSlhkACH7tOpivqtptP2ZtA/fPca6/I16ooI/U6OhIxGm3K/6dQIKnDEQFmN9PM0mXnvHKDas8N+dN28BGW4OKAMKOfMxDwQl8vzScFrphFsvXy3uCyTXHl98G21ACvGwn+3GdA9mSItXo+CDHstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=fGOVXJsV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KGki0cL+; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 649351C000A9;
	Sun, 12 May 2024 08:02:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 12 May 2024 08:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715515321; x=1715601721; bh=o7
	yVc6dNJUBYu3C6ojiShWgqG0PukKvTRdIshWb7K1c=; b=fGOVXJsVB/dK0Syrd/
	OG0vxnAa/HI/Tpz/9uw/0F7zfwJCB8dkN0rwdn7OK4O3CRDpJf26NIiMRYZ5bp5N
	2GnUUfBwfEb4ZTcC+eSv03MIi3RTyrxfYpYnRU0FcST7ftL3/Z+cCHaqUTZ1xUrD
	4BidEUb4OtJsHiQDxdB/LvY5IiEBBdFJ4UcorB4owGRvVAeJFTo/je0ogDvSi1xE
	6PquUm2BzFc3y77Mi8YauLL/0IePnHoLD+tUdbVqVVZL+oh/cYNlOGXUK5WG8Ot7
	wLPYUehS+4/znkXguP+M/73WsXtUpPa69c0gYP6SWtcyNlz6EcG8FAeDdrPEAY0c
	fZOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715515321; x=1715601721; bh=o7yVc6dNJUBYu
	3C6ojiShWgqG0PukKvTRdIshWb7K1c=; b=KGki0cL+MRy04g45yGjMCd6OIDw+2
	1advTNkNvR8wVWQuDpxLmgA0rVT541DlNnQdOxi4l2IqhhqcXz+rXwut0MsQMFeJ
	eHETRrbB7NGG4dR0gkrq4Tz5OzSAWJv17SzSYw7kEM6A3oA0/RjzYucGD3AG7MJ0
	ed7uh2AID285R0CAeIj4QJ3m1wvvEy+ksnBaAezndrL5JRv7r5jz0tqkpSfbZW+t
	aP9fUnZbvgO5bfkS4agFJi9nna3Wmh/I4hJzk6z7Adma9NQP1kEjk6zVd4Ut/UqT
	KxTPKhMi58Md97PMgQINjLWNE7mu9b6DS6JP6ByaO6h6sp7gaGrxuinzA==
X-ME-Sender: <xms:uK9AZhRCDckSyXaLqbI6yUu85LdF3LWj-eKalTP0nDAHtpotki1jiw>
    <xme:uK9AZqw2aQ7ar5wHfavoktD4nMJBys_U0iJ3a5HGa8myi9x4bWqD4DdC1AMy3_S6_
    4QImuBC4wX3eyt7jQE>
X-ME-Received: <xmr:uK9AZm0n2y-pF3i5W83ztEIfvSGXbi8gOIQAzubx1JuqEWAqEMDmIv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegvddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepffetueegkedtgfejveeuvdfghfegtddvgfehudeghfegheetuedu
    heduveejtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:uK9AZpAjG2lWZOzZoDbql6CueSmnIvnKg7qww5xg20PUzFtKyuVQow>
    <xmx:uK9AZqhIhQc4s1kZ-7t87UaPaLZQWPk5P_tu0ca7oxbk8mRIhM3kfg>
    <xmx:uK9AZtp7zR5egiY_aily-FIh-VEKbF_ZwTbG1rLz8-TyEaw0frN2Hw>
    <xmx:uK9AZlgpWWaWCykFWfPbQbjZyXFa1ojqXMZPqEbht0EVhXYMMmTo3A>
    <xmx:ua9AZujDfbNeHcgAHJL6_hS87-ikTVsKvXoUzLByXKBvRKJIVQrA9mw6>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 May 2024 08:01:59 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 12 May 2024 13:01:50 +0100
Subject: [PATCH] clocksource: Add node counter timer driver for
 MIPS/Loongson64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-loongson_nodecnt-v1-1-2157b92ef8f8@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAK2vQGYC/x3MQQqAIBBA0avErBNMtKirRETpVAMxExoRRHdPW
 r7F/w8kjIQJuuKBiBclEs6oygL8NvGKikI2GG2sdpVRuwivSXhkCej5VLrRdmnq2beuhZwdERe
 6/2U/vO8HGTkLwGIAAAA=
To: Huacai Chen <chenhuacai@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6296;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=n5ThBvxo95Dm5VsXGKGbCA1ajrYqeiZ1N6AZ3lqghBA=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjSH9ds9b0xYHfPunmfCyQCrGJmMvcUJQmLfi0s67uVtP
 rFa1HBTRykLgxgHg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzkii0jQ/uxKdniNWm6aY5e
 FR8q/h9xufo91zTHe9aDI9kxUQ5HJzAyrK7R3tARrSPr94mrfGvC6r/yQYXZjzbzie48xncpQFG
 SAQA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Node counter is a timer presents on many Loongson-3 series CPUs.
It is maintained on every node in system. To avoid synchronisation
complexity we only access the copy from first node in system.

It also has many ways to be accessed, on latest Loongson-3 CPU with
IOCSR instruction support it should be accessed with a IOCSR request,
while on earlier Loongson-3 CPUs it is attached to a 32 bits MMIO bus.
For QEMU's Loongson-3 virt system it is mapped to a 64 bit MMIO location.

On some rare case the counter is disabled by firmware or not present
on chip, so we need to perform a lightweight test to ensure it is
running before actually use it.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS                                      |   1 +
 arch/mips/include/asm/mach-loongson64/loongson.h |   3 +
 arch/mips/loongson64/time.c                      |   1 +
 drivers/clocksource/Kconfig                      |   8 ++
 drivers/clocksource/loongson-nodecnt.c           | 112 +++++++++++++++++++++++
 5 files changed, 125 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c675fc296b19..b36bff5b9803 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15117,6 +15117,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/include/asm/mach-loongson64/
 F:	arch/mips/loongson64/
+F:	drivers/clocksource/loongson-nodecnt.c
 F:	drivers/irqchip/irq-loongson*
 F:	drivers/platform/mips/cpu_hwmon.c
 
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index f7c3ab6d724e..d07f4be06595 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -56,6 +56,9 @@ extern void *loongson_fdt_blob;
 extern void mach_irq_dispatch(unsigned int pending);
 extern int mach_i8259_irq(void);
 
+/* Time functions */
+extern int __init nodecnt_clocksource_init(void);
+
 /* We need this in some places... */
 #define delay() ({		\
 	int x;				\
diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
index f6d2c1e30570..95d4110c1ee6 100644
--- a/arch/mips/loongson64/time.c
+++ b/arch/mips/loongson64/time.c
@@ -41,6 +41,7 @@ void __init plat_time_init(void)
 	/* setup mips r4k timer */
 	mips_hpt_frequency = cpu_clock_freq / 2;
 
+	nodecnt_clocksource_init();
 #ifdef CONFIG_RS780_HPET
 	setup_hpet_timer();
 #endif
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 34faa0320ece..1c068f604333 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -743,4 +743,12 @@ config EP93XX_TIMER
 	  Enables support for the Cirrus Logic timer block
 	  EP93XX.
 
+config LOONGSON_NODECNT
+	bool "Loongson Node Conunter timer driver"
+	default y if MIPS && MACH_LOONGSON64
+	depends on (MIPS && MACH_LOONGSON64) || COMPILE_TEST
+	depends on GENERIC_SCHED_CLOCK
+	help
+	  Enables support for the Loongson Node Counter timer.
+
 endmenu
diff --git a/drivers/clocksource/loongson-nodecnt.c b/drivers/clocksource/loongson-nodecnt.c
new file mode 100644
index 000000000000..3cea4045ce75
--- /dev/null
+++ b/drivers/clocksource/loongson-nodecnt.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright (C) 2024, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson-3 Node Counter clocksource
+ */
+
+#include <linux/clocksource.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/sched_clock.h>
+
+#include <loongson.h>
+#include <loongson_regs.h>
+
+#define NODECNT_REGBASE		0x3ff00408
+
+static void __iomem *nodecnt_reg;
+static u64 (*nodecnt_read_fn)(void);
+
+static u64 notrace nodecnt_read_2x32(void)
+{
+	unsigned int hi, hi2, lo;
+
+	do {
+		hi = readl_relaxed(nodecnt_reg + 4);
+		lo = readl_relaxed(nodecnt_reg);
+		hi2 = readl_relaxed(nodecnt_reg + 4);
+	} while (hi2 != hi);
+
+	return (((u64) hi) << 32) + lo;
+}
+
+static u64 notrace nodecnt_read_64(void)
+{
+	return readq_relaxed(nodecnt_reg);
+}
+
+static u64 notrace nodecnt_read_csr(void)
+{
+	return csr_readq(LOONGSON_CSR_NODECNT);
+}
+
+static u64 nodecnt_clocksource_read(struct clocksource *cs)
+{
+	return nodecnt_read_fn();
+}
+
+static struct clocksource nodecnt_clocksource = {
+	.name	= "nodecnt",
+	.read	= nodecnt_clocksource_read,
+	.mask	= CLOCKSOURCE_MASK(64),
+	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
+};
+
+int __init nodecnt_clocksource_init(void)
+{
+	int err;
+	uint64_t delta;
+
+	if (!cpu_clock_freq)
+		return -ENODEV;
+
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_NODECNT) {
+		nodecnt_read_fn = nodecnt_read_csr;
+	} else if (loongson_sysconf.bridgetype == VIRTUAL) {
+		nodecnt_reg = ioremap(NODECNT_REGBASE, 8);
+		if (!nodecnt_reg)
+			return -ENOMEM;
+		nodecnt_read_fn = nodecnt_read_64;
+	} else {
+		switch (boot_cpu_data.processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) {
+		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0:
+		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_1:
+		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_0:
+		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_1:
+			break;
+		default:
+			return -ENODEV;
+		}
+		nodecnt_reg = ioremap(NODECNT_REGBASE, 8);
+		if (!nodecnt_reg)
+			return -ENOMEM;
+		nodecnt_read_fn = nodecnt_read_2x32;
+	}
+
+	/* Test if nodecnt is usable */
+	delta = nodecnt_read_fn();
+	udelay(10);
+	delta = nodecnt_read_fn() - delta;
+
+	if (!delta) {
+		pr_info("nodecnt: clocksource unusable\n");
+		err = -ENODEV;
+		goto out;
+	}
+
+	err = clocksource_register_hz(&nodecnt_clocksource, cpu_clock_freq);
+	if (err) {
+		pr_err("nodecnt: clocksource register failed\n");
+		goto out;
+	}
+
+	/* It fits for sched_clock if we don't suffer from cross node access */
+	if (loongson_sysconf.bridgetype == VIRTUAL || loongson_sysconf.nr_nodes <= 1)
+		sched_clock_register(nodecnt_read_fn, 64, cpu_clock_freq);
+
+out:
+	if (nodecnt_reg)
+		iounmap(nodecnt_reg);
+	return err;
+}

---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240512-loongson_nodecnt-0704f76bc959

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


