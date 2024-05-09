Return-Path: <linux-mips+bounces-3192-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5C8C17DB
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 22:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48587281716
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 20:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FAE82863;
	Thu,  9 May 2024 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iN0RV7e5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDC8C2ED;
	Thu,  9 May 2024 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287687; cv=none; b=ZiJ1zy5I6DPsU0ib6oz6j7CxGBKXcA3OMFgEsm4BsZbmP+s5SgMzYcIloKjj7g6ep5AcX7Zi+r1C8HNDJv9IMsji8/WfE6GoEeDcS4MHb/bUYkOOtTni4mrLF+2pYbYFh2tvbGf6p5qeIEyxZd43IFmLygQVKYlbuvjen/+CyDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287687; c=relaxed/simple;
	bh=vQIPlrTrRnLpM6x+w14ADrk6az4enL0MrGaCSnYLqd4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXiF0Hb40OLW9dRo+hl3sthyn+ThiT5PqwWvne/bUhFpW9syI7xZSATJBSebuyUb9bwB745AE2Z93fBLUQToR3YmsY/X3Fo1jALvzvs88NKLuRbQ8+/6vkRIgl/yEZhz5oR2USTW02OR689xiKJHUcuLQpco7KTrgfJZ/Imn4bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iN0RV7e5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34d99ec52e1so981964f8f.3;
        Thu, 09 May 2024 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715287684; x=1715892484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PK7mYtGWOHevMp+CBtKJdAcOpEiOGHp+pJMYfAc9rY=;
        b=iN0RV7e5/CFs3i1h0s869FWgTDh8AkejmZVAPaxLRuTkBz+kSvJOKYPXDY6lSgSP53
         Q7+Fa6RvtalMn6DJkyphkGb0sbYhjKHfedtDK8qmCH8AsYNqzvAo053O71sz6gDU//iG
         hENp5SH/8MPP9B93zWP8QHh4dern461yQG87JdlRN3jbsciokJtLWzAc123jgJePjs7p
         Ri+vr2oPZxiqNYVlNikUsnkhyC+MdA6yqrDKdKprggP0r0mW0Q+3TeGhSrBf/isaZ0/U
         FdF53DWiHat8jLnPWi2XrtLVj7ifsjOlHkVfOd1MwK9UhoMx51rF66FvNh8HIN/l9358
         4ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287684; x=1715892484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PK7mYtGWOHevMp+CBtKJdAcOpEiOGHp+pJMYfAc9rY=;
        b=JJchOmr5KRkWoW5xQXX1nM1LYHhYVqmQT7XGRvXupXeh9C808DSDKHoF+SWBMlVynG
         UgATa2wpJgQ9jW3OJfD+Rstaqpx0/Vv4LfCAu6QN90Wvqb/N3Wt63n1APgwedqZX37kM
         kmhMjjOBNtM5JIE1eTkAbrAZllNQuAAp1vZKwRTKPk1FGSZmjYmqo+tSO+Byk0pBrLGW
         jdNulRgJB3wf3uc1hQpY6T4YG/OJQg5BBjb8iJu/HLEDZNZZ29DQd46JIsMuAbhkMcU0
         /8XxdtqZcVdFtRirvJ3SmwK0Z1KmPeivRmFMfvvO6tiFZOZrnRf32XeS6ELMGXfeAaQZ
         HCUw==
X-Forwarded-Encrypted: i=1; AJvYcCWRwcsNZR45m6I7Fd/nR2Etut2A/a8/+P/I/n0QYYOIEXHucX9aZrNUUO5PFJQrHJRFNFVIr6tlPDPbjrxtuivGmGD3F3ven1nfl+7VmwuIXF3LPbzUVnQoloevZVJbG2YRDE26UE+JPQXsZlMByKx7fxDqvWwdlRfDM7VdxYp8Sjkwri4=
X-Gm-Message-State: AOJu0Ywmg2qwA1+1+nZD6Or/e1EA4AXLA4achKe6i1Tm8ct4TrQwKBxF
	vyAK77LNu3HAhc0be6eeR4uA9KN6Xdlwhgv3sQ4VwQ0uSHTRJovJ
X-Google-Smtp-Source: AGHT+IHKSVLUS+ATMcV2WT6xi4pKL1NyEP4IySua1hAMswHa3/tjnkDKXP35PaZUsnyKs6dIFLb7kQ==
X-Received: by 2002:adf:fa0f:0:b0:34d:1b8c:1afb with SMTP id ffacd0b85a97d-3504a736b48mr385345f8f.24.1715287683718;
        Thu, 09 May 2024 13:48:03 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf08sm2588185f8f.96.2024.05.09.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:48:03 -0700 (PDT)
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
Subject: [PATCH v4 1/4] mips: bmips: rework and cache CBR addr handling
Date: Thu,  9 May 2024 22:47:45 +0200
Message-ID: <20240509204750.1538-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509204750.1538-1-ansuelsmth@gmail.com>
References: <20240509204750.1538-1-ansuelsmth@gmail.com>
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

bmips_cbr_addr is defined in smp-bmips.c to keep compatibility with
legacy brcm47xx/brcm63xx and generic BMIPS target.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/bcm47xx/prom.c      | 2 ++
 arch/mips/bcm63xx/prom.c      | 3 +++
 arch/mips/bmips/dma.c         | 2 +-
 arch/mips/bmips/setup.c       | 4 +++-
 arch/mips/include/asm/bmips.h | 1 +
 arch/mips/kernel/smp-bmips.c  | 6 ++++--
 6 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 99a1ba5394e0..49fe4c535161 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -109,6 +109,8 @@ static __init void prom_init_mem(void)
 
 void __init prom_init(void)
 {
+	/* Cache CBR addr before CPU/DMA setup */
+	bmips_cbr_addr = BMIPS_GET_CBR();
 	prom_init_mem();
 	setup_8250_early_printk_port(CKSEG1ADDR(BCM47XX_SERIAL_ADDR), 0, 0);
 }
diff --git a/arch/mips/bcm63xx/prom.c b/arch/mips/bcm63xx/prom.c
index c3a2ea62c5c3..f21dd168171a 100644
--- a/arch/mips/bcm63xx/prom.c
+++ b/arch/mips/bcm63xx/prom.c
@@ -22,6 +22,9 @@ void __init prom_init(void)
 {
 	u32 reg, mask;
 
+	/* Cache CBR addr before CPU/DMA setup */
+	bmips_cbr_addr = BMIPS_GET_CBR();
+
 	bcm63xx_cpu_init();
 
 	/* stop any running watchdog */
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
index 66a8ba19c287..dba789ec75b3 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -111,7 +111,7 @@ static void bcm6358_quirks(void)
 	 * because the bootloader is not initializing it properly.
 	 */
 	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
-				  !!BMIPS_GET_CBR();
+				  !!bmips_cbr_addr;
 }
 
 static void bcm6368_quirks(void)
@@ -144,6 +144,8 @@ static void __init bmips_init_cfe(void)
 
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
index b3dbf9ecb0d6..555a5b449ca8 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -46,6 +46,8 @@ int bmips_smp_enabled = 1;
 int bmips_cpu_offset;
 cpumask_t bmips_booted_mask;
 unsigned long bmips_tp1_irqs = IE_IRQ1;
+/* CBR addr doesn't change and we can cache it */
+void __iomem *bmips_cbr_addr __read_mostly;
 
 #define RESET_FROM_KSEG0		0x80080800
 #define RESET_FROM_KSEG1		0xa0080800
@@ -518,7 +520,7 @@ static void bmips_set_reset_vec(int cpu, u32 val)
 		info.val = val;
 		bmips_set_reset_vec_remote(&info);
 	} else {
-		void __iomem *cbr = BMIPS_GET_CBR();
+		void __iomem *cbr = bmips_cbr_addr;
 
 		if (cpu == 0)
 			__raw_writel(val, cbr + BMIPS_RELO_VECTOR_CONTROL_0);
@@ -591,7 +593,7 @@ asmlinkage void __weak plat_wired_tlb_setup(void)
 
 void bmips_cpu_setup(void)
 {
-	void __iomem __maybe_unused *cbr = BMIPS_GET_CBR();
+	void __iomem __maybe_unused *cbr = bmips_cbr_addr;
 	u32 __maybe_unused cfg;
 
 	switch (current_cpu_type()) {
-- 
2.43.0


