Return-Path: <linux-mips+bounces-3179-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC038C0297
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07B3AB21DBA
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B262575A;
	Wed,  8 May 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTBzu9FC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F01095A;
	Wed,  8 May 2024 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188062; cv=none; b=E8elsQfI9oy1zLA0U8hBZUVROCkONJ/DtAo4M1KQj8Cta117rFwwlCEFRLqNeFWFgHQd3rexCaPl56PAaeMVa6as3mI9NTjo6QUFyuiw9M4YG8wbwOOIIyNs8FxT4pK8nXzJPW4W33I1ddwJsHf8FQoRrzCV/Pv6kSAlvkj+kPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188062; c=relaxed/simple;
	bh=RT8p3uFckkui+p7FFp8Hb2ZN6oMPg87akgldE74Rzpc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iC26QL4710bcvDFD5WNGtyh+7/H8e9dshIec/uuDg9VhqgqUyxbY8dboh3j3czd3QSwntfNkNxdNaXjo966IeNqfRbFKbr3vwlkWT0xh2jdWBA9ocsKKmLHgsNA31Tk34N73gx1l8F53GaZJRDVkBRazstYh+CI1e4LfZfHca6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTBzu9FC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b7a26326eso33278595e9.3;
        Wed, 08 May 2024 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715188059; x=1715792859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8wJith1dOaln4BQF3p/J9UrFdwNlAWTgu+nGSZR/0o=;
        b=HTBzu9FC6IMkH3oL92k0SSayo5Dja909DVtP4k8HgpCOPcTyLvAdhf18Ke0zOUxsMc
         dnBIvtz+28SsmWcYvvGZ5NCLNaynt0WzXd7ukMZt/tnRUWH83MQxldn6sznP9j1XtsE9
         gjdFJb6FqlnAB0BiC8AME0+RI4V7PoyuwuP1sbu90lsxICcJ7vCoD5LTP6gV9+FYFCgF
         4AMuvEgHTmnL/1pX42CouKoQV5VUvjTpR6GHkF7o7+Z3zhzmqfjarKtD92gRb9K3fKgM
         TYE2BHCbTM/n0DxYqD+ZpBJTX865ow7pWuljRO0qr3Xtsa6Sp7qrhj3DmFXriHJuOy91
         OApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188059; x=1715792859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8wJith1dOaln4BQF3p/J9UrFdwNlAWTgu+nGSZR/0o=;
        b=fidZUUNwUfnMwbDkfOxYGjvoS9yEF9wXgx8aoVFOs93UOfbJChbztUcViC2A+cojO/
         M6jX0SZnhoOPQfpUPRMPkQvFmO6kxztBQ3tew4hD0Y97ERFDSXF19/U1N0jx1pybjxFJ
         yngnV/lC/TvxNg8mel0Aq51bQE3xOrSaoEfaIjE7iHzHvr7bfSmUaO3ARdSzzZkOVa77
         nwMOpt7e+8CB3Jngn1IjZIWlgB3UhbLBMQNTnn1/3WPKp69my+9aySDLkbwaSsfKnlU8
         6hvMV1MKrcZWbZIdJsj1bWbyS753rJAaf6xQnv81j61D4/CxNCEGM9LES+3a46kxbPQ7
         ty3w==
X-Forwarded-Encrypted: i=1; AJvYcCVrw/mnFo2e52icCH6xIrF+yQIICBbEeE+rQxIWxfbhRS1DuVgWtT5YGXawbOQY4OUiMeHc+g+4erZVg4P31yTm4KZkQ7N7YqbkyBAHubfTNMYclxNs2FoJHaN4omDL1VFbga9CN1TnsS1gCYF/xY+wPXC6E11id/McyFn/zYK3s9gwLU8=
X-Gm-Message-State: AOJu0Yw6LVABbu1Tkp0XyyFvdLeUmRWLFGjWOIx3jfOTpBhXOVX30b3l
	z2/CslZqjCnY1diGafyKZ4mO1NCLU/XOLpzTn0u2sxGK7sGUdOyg
X-Google-Smtp-Source: AGHT+IFJX6NclTfHeWuVSCL3/kwvnpAU26gW/QlBubFB9i1n7nhP0MWkzwmc6xsSbIW3BWQJy4HDmQ==
X-Received: by 2002:a05:600c:4f46:b0:41b:fea6:6526 with SMTP id 5b1f17b1804b1-41f72592ec8mr23692265e9.33.1715188058847;
        Wed, 08 May 2024 10:07:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id fk12-20020a05600c0ccc00b0041c130520fbsm2921555wmb.46.2024.05.08.10.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:07:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] mips: bmips: rework and cache CBR addr handling
Date: Wed,  8 May 2024 19:07:17 +0200
Message-ID: <20240508170721.3023-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508170721.3023-1-ansuelsmth@gmail.com>
References: <20240508170721.3023-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the handling of the CBR address and cache it. This address
doesn't change and can be cached instead of reading the register every
time.

This is in preparation of permitting to tweak the CBR address in DT with
broken SoC or bootloader.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/bmips/dma.c         | 2 +-
 arch/mips/bmips/setup.c       | 6 +++++-
 arch/mips/include/asm/bmips.h | 1 +
 arch/mips/kernel/smp-bmips.c  | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index 3779e7855bd7..2bc9c0d4402f 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -9,7 +9,7 @@ bool bmips_rac_flush_disable;
 
 void arch_sync_dma_for_cpu_all(void)
 {
-	void __iomem *cbr = BMIPS_GET_CBR();
+	void __iomem *cbr = bmips_cbr_addr;
 	u32 cfg;
 
 	if (boot_cpu_type() != CPU_BMIPS3300 &&
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 66a8ba19c287..5e024399222f 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -34,6 +34,8 @@
 #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
 #define BCM6328_TP1_DISABLED	BIT(9)
 
+/* CBR addr doesn't change and we can cache it */
+void __iomem *bmips_cbr_addr __ro_after_init  __read_mostly;
 extern bool bmips_rac_flush_disable;
 
 static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
@@ -111,7 +113,7 @@ static void bcm6358_quirks(void)
 	 * because the bootloader is not initializing it properly.
 	 */
 	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
-				  !!BMIPS_GET_CBR();
+				  !!bmips_cbr_addr;
 }
 
 static void bcm6368_quirks(void)
@@ -144,6 +146,8 @@ static void __init bmips_init_cfe(void)
 
 void __init prom_init(void)
 {
+	/* Cache CBR addr before CPU/DMA setup */
+	bmips_cbr_addr = BMIPS_GET_CBR();
 	bmips_init_cfe();
 	bmips_cpu_setup();
 	register_bmips_smp_ops();
diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
index 581a6a3c66e4..3a1cdfddb987 100644
--- a/arch/mips/include/asm/bmips.h
+++ b/arch/mips/include/asm/bmips.h
@@ -81,6 +81,7 @@ extern char bmips_smp_movevec[];
 extern char bmips_smp_int_vec[];
 extern char bmips_smp_int_vec_end[];
 
+extern void __iomem *bmips_cbr_addr;
 extern int bmips_smp_enabled;
 extern int bmips_cpu_offset;
 extern cpumask_t bmips_booted_mask;
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index b3dbf9ecb0d6..a4f84667a901 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -518,7 +518,7 @@ static void bmips_set_reset_vec(int cpu, u32 val)
 		info.val = val;
 		bmips_set_reset_vec_remote(&info);
 	} else {
-		void __iomem *cbr = BMIPS_GET_CBR();
+		void __iomem *cbr = bmips_cbr_addr;
 
 		if (cpu == 0)
 			__raw_writel(val, cbr + BMIPS_RELO_VECTOR_CONTROL_0);
@@ -591,7 +591,7 @@ asmlinkage void __weak plat_wired_tlb_setup(void)
 
 void bmips_cpu_setup(void)
 {
-	void __iomem __maybe_unused *cbr = BMIPS_GET_CBR();
+	void __iomem __maybe_unused *cbr = bmips_cbr_addr;
 	u32 __maybe_unused cfg;
 
 	switch (current_cpu_type()) {
-- 
2.43.0


