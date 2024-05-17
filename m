Return-Path: <linux-mips+bounces-3290-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB598C8AA3
	for <lists+linux-mips@lfdr.de>; Fri, 17 May 2024 19:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA7951F24EE4
	for <lists+linux-mips@lfdr.de>; Fri, 17 May 2024 17:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF1713DB83;
	Fri, 17 May 2024 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="PmaZ43dh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QGa+i0S7"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7512F5A3;
	Fri, 17 May 2024 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715966000; cv=none; b=FdEmR56Dvo4PHRZd2swZZKZnfqp5JWR933QwNxAuX6SmFl+tjB3Mv99/vcuWGvhdjqmERRF32wBUqp2wq49BIRpHQa1wj/xPQlut2+96QyF0L2PzpwZi+rjLFK2pyPruNBMTMKeLCBt97ItPlqREOF5aVr/B12+i/rZmlGehIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715966000; c=relaxed/simple;
	bh=eRIcU31KqTg7XP1KK5CO/h4djKFMTvtSgXQZ/wf9Lv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WvAJhoNMeIea0FL0C0CVWF90m8opWFysIEpNgDO8EChhHRkoIl9JUTxlHbuqEIYMPsEIqzof1ynKQYraJrbiKgQmRc5ye35S0waBYCbGFww/WTM8/QYh255Ip2bDONqLYB+WTOfxZ+4eaZJc9PJSfsgGLvXXBsX5VOutyuOYiHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=PmaZ43dh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QGa+i0S7; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5B39D11400BC;
	Fri, 17 May 2024 13:13:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 17 May 2024 13:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715965997; x=1716052397; bh=S0
	ae6Op1KMk+gXKqxzXaZSqYv4HS7YhFYfRFLWzD9J8=; b=PmaZ43dhtnvfCtzkSM
	r6q/uGQdCWFHh+s1EK2KbDSAtrjdDbgmTl3FalqC3MsIYX4NqtsALOZrg+rb5Z8y
	NIGU1i/tGbD4kz4w73XOJURABwxQbJ7yF6PdusPGO4vwzyPqBXpvuZrMtFxGaSFc
	q5jGjjFCW28oEyXYyZWCmeCTLFZDSnRxbbOeW7HnPNZejRP67sUncdVtnxz8g5eh
	2PXF887bDDWynYFbgUF6m+btYzZ9Uoyo5q0Q65nFSPfwr0GeIN96rQwBQ81+/JxB
	2DhLUGQ6wE6RGIfVmk73EVKNaxT9jyFTbrZ7VIwDlL3bNxB8qmQK/OxO2VeYYW56
	YyBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715965997; x=1716052397; bh=S0ae6Op1KMk+g
	XKqxzXaZSqYv4HS7YhFYfRFLWzD9J8=; b=QGa+i0S73G9uwbsIXg+zNNY6uqlE3
	V8Zs0VXuFLWYcItFF+YQ5p29PYBx62lgKzxAThIzRL1ZW/rYDnC5Fu5c1h8v1MJd
	5klN9/X2/cjkVVcP+MC5nkgFx7Ph9M6lU6JgAaTRuWFpIN7ub6ulq/wkTafRXDMQ
	l4kH5FS35DFQmB6FGvKOd/cHfkYc0FKgwzNuBYE+yho0SBfaWNNpbxcPT8oMs9Rr
	kJeVHl34EFUqUa/cATi2sDwebPi1B34zjDTAtkVqr690cHX3p00wbGeFJ22Od+uz
	Q4rKr+adcSb/+yHwelKb2qrTPkmzQmLgJeG3HbEMwpzcnZDNonIjaD/xA==
X-ME-Sender: <xms:LJBHZm58HMVu6Y1m4dseDL1ti5ImkNunBlKuioHA1Xi3yJBNAkpfAA>
    <xme:LJBHZv7qSeZzOdOA2kp4hdbreTRPTZevu4SnFjJ-zDbKH3pil5wOnQ-blO6z-6uUF
    8oDcjiH_Jh0xzDa5XY>
X-ME-Received: <xmr:LJBHZleaIVTDI57XdkyngadisSeckaJGdLgjOyZG6sD1QrM7Dz7imhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehgedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhephfffgeejgfejieeugffgudegvdekffevgeeuteetgeejveeiteei
    vedvffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:LJBHZjJNEAJXG8QK2g1En8s9cUP1Av5fN05LfB4RWR8w0XA8C-CG8w>
    <xmx:LJBHZqKOp0js6tgUQnWPXjQG5iLcbYFMa9-TFCQt3XQIgFohw3RD2w>
    <xmx:LJBHZkzju_Mr1FljI0TqPvNuDhp8DNkDX24AoKgfiT3BMBQvkagrBg>
    <xmx:LJBHZuKg43l5uX5CvqVzWzNZVN-vRfNFXP75US4TAiBKR207gCo9SQ>
    <xmx:LZBHZrowHLrcAm8XGnJI7pGj2bOqtqvPefu47m9Y88OUu-ONWhHnQATe>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 May 2024 13:13:15 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 17 May 2024 18:13:10 +0100
Subject: [PATCH v2] clocksource: Add node counter timer driver for
 MIPS/Loongson64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
X-B4-Tracking: v=1; b=H4sIACWQR2YC/32NQQqDMBBFryKzbkoSTKNd9R5FisZJDNiMJBIq4
 t2beoAu34P//g4Jo8cE92qHiNknT6GAvFRgpj44ZH4sDJLLmish2UwUXKLwCjSiCSvjmtdW3wb
 TqhbKbIlo/edMPrvCk08rxe18yOJn/8SyYIJJofTQSrSNbR523hz169XQG7rjOL6A9kI3sgAAA
 A==
To: Huacai Chen <chenhuacai@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6427;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=eRIcU31KqTg7XP1KK5CO/h4djKFMTvtSgXQZ/wf9Lv0=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT3CdpvmcocTwXOYvNKd82UZYqW+mw8c32e3v3/J32Op
 137qOjUUcrCIMbBICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABMRC2VkmFXCr6+4QpDv4GSx
 Y+4b786Uc9qh92T5PYFZTPXpiRGXPzD8s/dJ1l9y3XqOsM7jlMcSZXzfY3VYmqKO3Hl2t/yE4VU
 WdgA=
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
Changes in v2:
- Fix build failure when it's not enabled.
- Link to v1: https://lore.kernel.org/r/20240512-loongson_nodecnt-v1-1-2157b92ef8f8@flygoat.com
---
 MAINTAINERS                                      |   1 +
 arch/mips/include/asm/mach-loongson64/loongson.h |   3 +
 arch/mips/loongson64/time.c                      |   3 +
 drivers/clocksource/Kconfig                      |   8 ++
 drivers/clocksource/loongson-nodecnt.c           | 112 +++++++++++++++++++++++
 5 files changed, 127 insertions(+)

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
index f6d2c1e30570..6e0603a6d713 100644
--- a/arch/mips/loongson64/time.c
+++ b/arch/mips/loongson64/time.c
@@ -44,4 +44,7 @@ void __init plat_time_init(void)
 #ifdef CONFIG_RS780_HPET
 	setup_hpet_timer();
 #endif
+#ifdef CONFIG_LOONGSON_NODECNT
+	nodecnt_clocksource_init();
+#endif
 }
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


