Return-Path: <linux-mips+bounces-3134-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4948BE752
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3AE1F21831
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EECC16ABD5;
	Tue,  7 May 2024 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Pw4ZbWsN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MfR7q9PK"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD492168AF8;
	Tue,  7 May 2024 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715095338; cv=none; b=uLLHZnEGIYsKV5pBDBMoIDo76YAt03lz0o2w5Tpi6h16BUyF/o0W7coTmHiCzL50hs/COGomjWqkrTzidxmw0YEF/Tc15Ftr/iZkjcpu4ZuVHWKhav5+7uqoDICVbeoja3SIJ8FHqPkcZ30rxB5kfWRhCY9kPii8SvPtdcqC/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715095338; c=relaxed/simple;
	bh=pQz0w1yBfPHUBv/v0nbOyM9aMVNE+JcqduRqxVhK+yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSIPxuPPT9qENnEGefleu9rAwGU/wp/6psvvSJoyBfh+uh2OJoTQUp7OvFAJ9S+qd6IyK+hLdIIXrjEV0ClCG8w+BY15B8SSpu9iJAkOTJCcIY8Vb03LZE0emIHNeveVDVQX5PS6hnuzQDiZqTC/dn303CxHCu1y+tYJa3v8QoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Pw4ZbWsN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MfR7q9PK; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id E623C180013F;
	Tue,  7 May 2024 11:22:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 07 May 2024 11:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715095335;
	 x=1715181735; bh=3D0GaVF05UsiobMGqr5NYu1yNUERD1Uibyz1tRmG9fM=; b=
	Pw4ZbWsN/RUod8jQLaOL2WJEEMdQba8MbGhrUKPtnQbZtx04SKiJDdR5tJykk9bz
	+DUId1bJxG1RJ6xa82TX0dLJc+FbB1a3tZG4g7cfeIkBJe0FWUqyDWcxXdDEX6uH
	bSwz/zrM5gLY/CUbKX10SNWjbNJObCpdRx0Z+tGKwXohfOqww/nrUGBcW++Iexug
	uxRMWtqjiLzYi5fUm5xBXcDBZkKo03lI581lER7F5+NoEH4KMvRwbCJELmFxiqFv
	zwfIPvSLgdLU72Jqouxpmln3P8LAXd39JaVu94E7qTrKmv98ZA8bLyf7IFwWHBgR
	wVvt8T9g1hALJOmy6COVEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715095335; x=
	1715181735; bh=3D0GaVF05UsiobMGqr5NYu1yNUERD1Uibyz1tRmG9fM=; b=M
	fR7q9PKO26AnH9L4CgQLtPo6e8M4TqPOAUFH3anG7GTblZALqimK/FofhuQeUvE9
	DPmNokjWTX+yz6LiUHmXLCQvQhSfTWLFbkjBaFECtwRdYm+j8gY60Pr9R1Lv2OlU
	V/QRRi2clCwSEgGzi10atPdIyuFP3z+8RpTooF96quDhgT6JCJHYskYFWVCdX20G
	v92TIKjDJVsNLjMorwsykgzFs3NPFl0VUUyq0Dg/ZO2CkmHfndcr4Gompo0EDTYl
	ZH1UGwmypCWXgKAYn67LWEj4l1l+6fO0X6JhPL/4DTxnlgg8Kb+geWKFTCEL+LsQ
	9Z1ldv6U6sqxRw+ALNcDA==
X-ME-Sender: <xms:J0c6ZhNB5Z4crQc-Ak--CB_3r8Dg6NYIO0qDJwCfdvx-Ksvdl8C8fw>
    <xme:J0c6Zj_jjV-3tXRLmKQQmyG2QXnoNYeoxTI_wQb66CZMooMFyw_CTEbtNRsjhmzKQ
    1ivHWAZQRXlZ6zns8M>
X-ME-Received: <xmr:J0c6ZgS0CEFpaiaajdy2-MjgpGea57epJPoZ1UihesgGCS1CR8OQC_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepiefgleeivefgieejhfdvhfdvieeiudehvdevfeetveetieek
    tdfffedufffhgeehnecuffhomhgrihhnpehslhgvvghpvghrrdhssgenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:J0c6ZtupAzN8AN5gEeZHf6yx2vUCUWU3fl38JqQ_ZIcA80OSVyOVjA>
    <xmx:J0c6ZpfYUb-H8chJJbSMmKBymfmV2-em5wBM0CDlK46tL_G-fHsivA>
    <xmx:J0c6Zp1-ixz35OaJMPLl2nMtMXoLG059NKJTRKSVUihYepj7tMZPLw>
    <xmx:J0c6Zl-If8x4GqC7cRaqGDFeunii7vNfIaqDCbtCB64paTnsIhj9gA>
    <xmx:J0c6ZiHkNMcmJS-0jwGNeLaYZfOLuiNSsRVtGM8NBLMzyRe_Q-feVMc8>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 11:22:14 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 16:22:01 +0100
Subject: [PATCH 3/3] MIPS: Loongson64: Implement PM suspend for LEFI
 firmware
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-loongson64-suspend-v1-3-534d92a4e09a@flygoat.com>
References: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
In-Reply-To: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4701;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=pQz0w1yBfPHUBv/v0nbOyM9aMVNE+JcqduRqxVhK+yQ=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjQrd8VJbZHfa7xbO1M4Zy16/EJD0fPswri0fG3zug37P
 h4Vtq/oKGVhEONgkBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgInI9zP84cn/Ezpxy+q9R47n
 9/zQDLJPDGxd4RoY2Vt+z7b2kVXmZIa/0hN2nbq1675885YLf+OT50Rn2ITHdMUkcHc33TN/a+X
 GBAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Implement PM suspend for LEFI firmware.
Entering STR (Suspend to RAM) is as simple as save our context
then go to a firmware vector.
Wake is a little bit treaky as we need to setup some CP0 status
first, which can be done with smp_slave_setup.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/Makefile  |  2 +-
 arch/mips/loongson64/pm.c      | 88 +++++++++---------------------------------
 arch/mips/loongson64/sleeper.S | 17 ++++++++
 3 files changed, 36 insertions(+), 71 deletions(-)

diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index e806280bbb85..cbba30dfddf5 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o dma.o \
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_NUMA)	+= numa.o
 obj-$(CONFIG_RS780_HPET) += hpet.o
-obj-$(CONFIG_SUSPEND) += pm.o
+obj-$(CONFIG_SUSPEND) += pm.o sleeper.o
 obj-$(CONFIG_PCI_QUIRKS) += vbios_quirk.o
 obj-$(CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION) += cpucfg-emul.o
 obj-$(CONFIG_SYSFS) += boardinfo.o
diff --git a/arch/mips/loongson64/pm.c b/arch/mips/loongson64/pm.c
index 7c8556f09781..5f0604af8f13 100644
--- a/arch/mips/loongson64/pm.c
+++ b/arch/mips/loongson64/pm.c
@@ -6,98 +6,46 @@
  *  Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 #include <linux/suspend.h>
-#include <linux/interrupt.h>
 #include <linux/pm.h>
 
-#include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
 #include <loongson.h>
 
-static unsigned int __maybe_unused cached_master_mask;	/* i8259A */
-static unsigned int __maybe_unused cached_slave_mask;
-static unsigned int __maybe_unused cached_bonito_irq_mask; /* bonito */
+asmlinkage void loongson_lefi_sleep(unsigned long sleep_addr);
 
-void arch_suspend_disable_irqs(void)
+static int lefi_pm_enter(suspend_state_t state)
 {
-	/* disable all mips events */
-	local_irq_disable();
-
-#ifdef CONFIG_I8259
-	/* disable all events of i8259A */
-	cached_slave_mask = inb(PIC_SLAVE_IMR);
-	cached_master_mask = inb(PIC_MASTER_IMR);
-
-	outb(0xff, PIC_SLAVE_IMR);
-	inb(PIC_SLAVE_IMR);
-	outb(0xff, PIC_MASTER_IMR);
-	inb(PIC_MASTER_IMR);
-#endif
-	/* disable all events of bonito */
-	cached_bonito_irq_mask = LOONGSON_INTEN;
-	LOONGSON_INTENCLR = 0xffff;
-	(void)LOONGSON_INTENCLR;
-}
-
-void arch_suspend_enable_irqs(void)
-{
-	/* enable all mips events */
-	local_irq_enable();
-#ifdef CONFIG_I8259
-	/* only enable the cached events of i8259A */
-	outb(cached_slave_mask, PIC_SLAVE_IMR);
-	outb(cached_master_mask, PIC_MASTER_IMR);
-#endif
-	/* enable all cached events of bonito */
-	LOONGSON_INTENSET = cached_bonito_irq_mask;
-	(void)LOONGSON_INTENSET;
-}
-
-/*
- * Setup the board-specific events for waking up loongson from wait mode
- */
-void __weak setup_wakeup_events(void)
-{
-}
-
-void __weak mach_suspend(void)
-{
-}
-
-void __weak mach_resume(void)
-{
-}
-
-static int loongson_pm_enter(suspend_state_t state)
-{
-	mach_suspend();
-
-	mach_resume();
-
-	return 0;
+	switch (state) {
+	case PM_SUSPEND_MEM:
+		pm_set_suspend_via_firmware();
+		loongson_lefi_sleep(loongson_sysconf.suspend_addr);
+		pm_set_resume_via_firmware();
+		return 0;
+	default:
+		return -EINVAL;
+	}
 }
 
-static int loongson_pm_valid_state(suspend_state_t state)
+static int lefi_pm_valid_state(suspend_state_t state)
 {
 	switch (state) {
-	case PM_SUSPEND_ON:
-	case PM_SUSPEND_STANDBY:
 	case PM_SUSPEND_MEM:
-		return 1;
-
+		return !!loongson_sysconf.suspend_addr;
 	default:
 		return 0;
 	}
 }
 
-static const struct platform_suspend_ops loongson_pm_ops = {
-	.valid	= loongson_pm_valid_state,
-	.enter	= loongson_pm_enter,
+static const struct platform_suspend_ops lefi_pm_ops = {
+	.valid	= lefi_pm_valid_state,
+	.enter	= lefi_pm_enter,
 };
 
 static int __init loongson_pm_init(void)
 {
-	suspend_set_ops(&loongson_pm_ops);
+	if (loongson_sysconf.fw_interface == LOONGSON_LEFI)
+		suspend_set_ops(&lefi_pm_ops);
 
 	return 0;
 }
diff --git a/arch/mips/loongson64/sleeper.S b/arch/mips/loongson64/sleeper.S
new file mode 100644
index 000000000000..04874b9bf430
--- /dev/null
+++ b/arch/mips/loongson64/sleeper.S
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2024, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson EFI firmware sleeper routine
+ */
+
+#include <asm/asm.h>
+#include <asm/pm.h>
+
+#include <kernel-entry-init.h>
+
+LEAF(loongson_lefi_sleep)
+	SUSPEND_SAVE
+	jalr    a0
+    smp_slave_setup
+	RESUME_RESTORE_REGS_RETURN
+END(loongson_lefi_sleep)

-- 
2.34.1


