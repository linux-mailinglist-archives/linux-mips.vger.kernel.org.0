Return-Path: <linux-mips+bounces-3774-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1285C910CE3
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F021C237DD
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924161B47C7;
	Thu, 20 Jun 2024 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNIsZI6f"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78621B151A;
	Thu, 20 Jun 2024 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900762; cv=none; b=tcXrf8WoRkiCtxpw3LSdUW5Zfi3TIN9jp4g1KyH1fyDY02ApY2uvffvOv0kMJwcsa1qz6eRGIuSjp3Jh2842uM8hS47RPXXH4A7nD/8DS+jOZyPgovtj9x9ZujzeZ3YEYZXHz3A/jPCZwIGwT00/nmXzWvP/UFyTybZHP1i6bPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900762; c=relaxed/simple;
	bh=MviNpR3aK5Gz1QquXDWunj9d8vTGrQ+axuC9Ulxt1JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYH6fXkVu5/9Pm3TgCInBZzUA0pkSi5dlGviSybmlYPUry4ejCGUKBbSG/JAK89RwiMKS0wapNW+boO1z19GzLF7/okALHbrqJ4sTetHNME8qHX0E41HbylXl5etiitgkQKgC4oRdstKb7nxIIrBMVHEWLcaJqemoO/X+gPkxG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNIsZI6f; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-364c9ec17d1so504005f8f.0;
        Thu, 20 Jun 2024 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900759; x=1719505559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoTnvQmuBao+3YXJl2nlRcQGv0kKohL+uyfhgWDzW9Y=;
        b=SNIsZI6f5SQcacHV+tP7llN21moMkcaRrsM9lruG2W7wfcPXf+8fbRs/wiUNpo3etu
         mQa32E6Iolpg3+d+Av+VoyDwqvcHIz/4phfnFClahZM1S3GZeMDJf91l/1mBqFQ7bqqP
         GomyYIY5gsyISP0IDh46p14JMJjiE4T6llURa8ZEfoxLN/B8d3tXeAQjfOzhwoBuCx1h
         nBz64KC9wJyaYSOhZsQyYSTvPZOxXaSLDyY0Ue07XhDWVaelgJN6KxErUO4LSDQa9A5z
         pXynDkM99iIG0gtLTjsMUY0HGltsrEV0qM61YuIBrH5Tpq0cz9Ed+W9sHWsv0NLMy3O9
         tnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900759; x=1719505559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoTnvQmuBao+3YXJl2nlRcQGv0kKohL+uyfhgWDzW9Y=;
        b=Y0IVyCpHiqz+IQZkwhsmFYTDMCnpiU3TcLX/GLaTK68MapwWpNboIJFIIRUs/hBsG3
         tzp3i1cBulsQTimvokGUwix/61N98KdtX+Pvt2TSqjS8B1Ko05LJcVrxbXp6X4SYToVf
         k/x67Zkjzoj6TLS1GNWhTD/OQ/1d6YsNBqWKRXVRv7OCNnsQlb2woKLYxkYFsQf9+xBo
         gFMtjzEaGroHyz5wR20oKcAkoNAdbjeXEYoKiKrdGKzOkgvMuySf8IgMF6pTiDX3DguU
         xLnz7CnGUdu6nt/j4ocAvcrczuFe37RAiTxq24mbkTLOoLwc/Dq0EBtUaPkcbXIVFlT8
         7dkw==
X-Forwarded-Encrypted: i=1; AJvYcCV8M7te+22JGzRQAxsqaNp1Q9+uXTHdjwNZOal19gJCO2zzmWcS/IPYwyOgFV+FQlgZfm7JRI2sbRffZYgHIZzd/1dPjMqV1sQ1q9Bah3HZgQAbG6JpT+VC9434OQl2SoWn4mQ8CcyjaJ4bJ3Hbt0lvH77wFR4A3sQN8WpZL5M1m5Xb3Ek=
X-Gm-Message-State: AOJu0Yw6crIsDGy8NPcKVr0tsSHSx6IjBfpvkZicHrsQWhk4hKBxJs4E
	MIcTmheIB/oxlbcA6ROMk+PtDi0jUmbFvTVMNyFRuxwBF/gIYURQ
X-Google-Smtp-Source: AGHT+IEk6hoF1ip0n2JwxrBn3fu3YwWvxNCUfLMQlradgJUyxNbflhltr9n5cc5U1mQcPwUfFQjQkw==
X-Received: by 2002:a5d:6783:0:b0:35f:22ac:410d with SMTP id ffacd0b85a97d-3631989a785mr4442208f8f.56.1718900758806;
        Thu, 20 Jun 2024 09:25:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-362c7c2dffdsm6277480f8f.35.2024.06.20.09.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:25:58 -0700 (PDT)
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
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] mips: bmips: rework and cache CBR addr handling
Date: Thu, 20 Jun 2024 17:26:42 +0200
Message-ID: <20240620152649.994-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620152649.994-1-ansuelsmth@gmail.com>
References: <20240620152649.994-1-ansuelsmth@gmail.com>
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

bmips_cbr_addr is defined in setup.c for each arch to keep compatibility
with legacy brcm47xx/brcm63xx and generic BMIPS target.

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/bcm47xx/prom.c      | 3 +++
 arch/mips/bcm47xx/setup.c     | 4 ++++
 arch/mips/bcm63xx/prom.c      | 3 +++
 arch/mips/bcm63xx/setup.c     | 4 ++++
 arch/mips/bmips/dma.c         | 2 +-
 arch/mips/bmips/setup.c       | 7 ++++++-
 arch/mips/include/asm/bmips.h | 1 +
 arch/mips/kernel/smp-bmips.c  | 4 ++--
 8 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 58fb7c2dc3b8..66e3ee2b04e6 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -32,6 +32,7 @@
 #include <linux/ssb/ssb_driver_chipcommon.h>
 #include <linux/ssb/ssb_regs.h>
 #include <linux/smp.h>
+#include <asm/bmips.h>
 #include <asm/bootinfo.h>
 #include <bcm47xx.h>
 #include <bcm47xx_board.h>
@@ -110,6 +111,8 @@ static __init void prom_init_mem(void)
 
 void __init prom_init(void)
 {
+	/* Cache CBR addr before CPU/DMA setup */
+	bmips_cbr_addr = BMIPS_GET_CBR();
 	prom_init_mem();
 	setup_8250_early_printk_port(CKSEG1ADDR(BCM47XX_SERIAL_ADDR), 0, 0);
 }
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 94bf839576c1..2f1ee0560aba 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -37,6 +37,7 @@
 #include <linux/ssb/ssb.h>
 #include <linux/ssb/ssb_embedded.h>
 #include <linux/bcma/bcma_soc.h>
+#include <asm/bmips.h>
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/prom.h>
@@ -45,6 +46,9 @@
 #include <bcm47xx.h>
 #include <bcm47xx_board.h>
 
+/* CBR addr doesn't change and we can cache it */
+void __iomem *bmips_cbr_addr __read_mostly;
+
 union bcm47xx_bus bcm47xx_bus;
 EXPORT_SYMBOL(bcm47xx_bus);
 
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
diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index c13ddb544a23..16ea8945ae3a 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -12,6 +12,7 @@
 #include <linux/memblock.h>
 #include <linux/ioport.h>
 #include <linux/pm.h>
+#include <asm/bmips.h>
 #include <asm/bootinfo.h>
 #include <asm/time.h>
 #include <asm/reboot.h>
@@ -22,6 +23,9 @@
 #include <bcm63xx_io.h>
 #include <bcm63xx_gpio.h>
 
+/* CBR addr doesn't change and we can cache it */
+void __iomem *bmips_cbr_addr __read_mostly;
+
 void bcm63xx_machine_halt(void)
 {
 	pr_info("System halted\n");
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
index 66a8ba19c287..6dd166c3d643 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -34,6 +34,9 @@
 #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
 #define BCM6328_TP1_DISABLED	BIT(9)
 
+/* CBR addr doesn't change and we can cache it */
+void __iomem *bmips_cbr_addr __read_mostly;
+
 extern bool bmips_rac_flush_disable;
 
 static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
@@ -111,7 +114,7 @@ static void bcm6358_quirks(void)
 	 * because the bootloader is not initializing it properly.
 	 */
 	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
-				  !!BMIPS_GET_CBR();
+				  !!bmips_cbr_addr;
 }
 
 static void bcm6368_quirks(void)
@@ -144,6 +147,8 @@ static void __init bmips_init_cfe(void)
 
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
2.45.1


