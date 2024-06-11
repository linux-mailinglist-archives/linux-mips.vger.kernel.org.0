Return-Path: <linux-mips+bounces-3567-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C220903A27
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87DD41C22C8C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6269D17BB07;
	Tue, 11 Jun 2024 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FclkEEvJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5E17B4FE;
	Tue, 11 Jun 2024 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105540; cv=none; b=W6OZikJPa3N3Qu1dSgpq862FXJ9ZU+CX9zE6ET3G+ePhzjrQIHpf5MpolDl6QV8LR8BP2FQ6mZ0TCEVTyo27O0CsqWffyn4WDmazqL3YQHbSLD59CBGaL6QDhEJU2hsuJsG4frfg/Fv6UNb0DoJeWs/VzYiqlfQj/EaIlOFtmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105540; c=relaxed/simple;
	bh=96fjUGXbzrw3k5xl5NUqCMW2L7GOt6QRlWz3M6YrZiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e19cVVheS/6VCwbj/pH5Hh1ESXLanO/9m4/fjNvKUl7AWeUS8TShgvqbGKJXrhWcF5NBfWq4/ODUDQk8acix7FPbxqq/fBiG09/ZfnSXUB8rNOExnCsUWoe39uT82Tc9yqZLxzTbPJlb+yw/qKGiW+rEMRiyWlELBRTGFCmE0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FclkEEvJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4217990f8baso29010725e9.2;
        Tue, 11 Jun 2024 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105537; x=1718710337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6B1NQaDMHjP+qp3yd7SriWtlaqA+mWbOie0xS43jhQU=;
        b=FclkEEvJ2Av9jKTjs83SlJZ/fm2TCvoYNvAnfzeM5/vAt3orE2QYF3N65s83KSRL/l
         seNhaLGqcmQfuoVShVMaKNPBGb9MljzNLc4TFZi/IfwLPiBsQkoOHLHRX34Cm8oR757R
         sSet/LDfPe4QkEfekLuiL09WE/PS8bF5lPrZzoQg/NZ9s/xy1rUYj8apSDQirVNgQ4Ax
         rxbH4lzZ5rqV90oxgfNGz+OW0RgGcllqsETsu4TvLgM9TEYYcgK5QOTTqlVj9UecuLie
         AdyrZYp/4QHAS/z/SECh4DxI9PubxFp83s/9NtCzI09KCVIUBG44jCseA62ghC/Dm65l
         baEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105537; x=1718710337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B1NQaDMHjP+qp3yd7SriWtlaqA+mWbOie0xS43jhQU=;
        b=rnICC+nuz66GsdZc1Bthl0g6ojQKS8uvbqlpu4wTrbOAIODEYmeR4OYNHfeTa5BP9j
         +6Pq95eIgfPQyqoRMHHiABvfTt+WunpFwgNbF5ko/TPIgF+M5gic6GJXumrTy1hYVN/r
         wDDHJcfOhxdmrRdYLBNHffdRZNv1pb43jfLpJtY0P4Mzu8hhC69o35hLu6G59mmHHq2g
         GIvBTVQDBpIGUPzxQOo6H2owsxYAWHik7bg4mw1Hm7d7DpzMNnu8NjKzWeqSttw0YDuK
         8e4rIkIr6k/NnVxNw1GM6dWtH0wRAMn7esThCTH7UdnxnuQ1giLeEArF7UfPCSUwvcth
         HcBw==
X-Forwarded-Encrypted: i=1; AJvYcCVa7VBQh2b0EeaVly9QY7bhA7eNr+8YVVyulD7DL1nVTOFSgWUg7ZdL3zsM64+Ho1XjyM0cvBWQ3c4t3dnFU0RU818uxHAfm7nisNi8FeIb/z3E8QLHrRtmZpL3nOdH97w2jh8l6IPiHfB65AMCVLseZdBD0k/dDG3gi3vkvuThpipPGow=
X-Gm-Message-State: AOJu0YzSpFyCQ0XFkWjeKCKQLUEQMAcWzNF1j0Wh5LuZzOUrkYvfduWx
	wXxafgH6bLA70gLTpPvPa8wiASV67adBJ+ZPaxiQh4i+/Xrg2Y0U
X-Google-Smtp-Source: AGHT+IGyMiLtimJxjO1eIM08Ovj4/mMb4wqZrpQO4GJumeaDPqHKcjxArBKjSPVsIMmq0YyI5EVFEg==
X-Received: by 2002:a05:600c:350f:b0:422:1163:4488 with SMTP id 5b1f17b1804b1-42211635440mr36385425e9.25.1718105536600;
        Tue, 11 Jun 2024 04:32:16 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4227467990csm2473505e9.1.2024.06.11.04.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:32:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/5] mips: bmips: rework and cache CBR addr handling
Date: Tue, 11 Jun 2024 13:32:05 +0200
Message-ID: <20240611113209.8142-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113209.8142-1-ansuelsmth@gmail.com>
References: <20240611113209.8142-1-ansuelsmth@gmail.com>
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

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/bcm47xx/prom.c      | 3 +++
 arch/mips/bcm63xx/prom.c      | 3 +++
 arch/mips/bmips/dma.c         | 2 +-
 arch/mips/bmips/setup.c       | 4 +++-
 arch/mips/include/asm/bmips.h | 1 +
 arch/mips/kernel/smp-bmips.c  | 6 ++++--
 6 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 58fb7c2dc3b8..10bdd3e366ae 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -33,6 +33,7 @@
 #include <linux/ssb/ssb_regs.h>
 #include <linux/smp.h>
 #include <asm/bootinfo.h>
+#include <asm/bmips.h>
 #include <bcm47xx.h>
 #include <bcm47xx_board.h>
 #include "bcm47xx_private.h"
@@ -110,6 +111,8 @@ static __init void prom_init_mem(void)
 
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


