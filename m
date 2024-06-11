Return-Path: <linux-mips+bounces-3573-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66794903A79
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8A9281747
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6FC17CA1B;
	Tue, 11 Jun 2024 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNrC/Eo8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0017CA05;
	Tue, 11 Jun 2024 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105765; cv=none; b=Z0R1ijYLYhORspJVutyOEPJsoyZf6+T2MeMQE7BzuqjOXPKINkt2FhAuHTCRSvUiXfWpjlswkxDkQNsiSbwBGssx1ymNGSWmR2STP5fhVa9xl2RVERzTxpIMZFSdHEZsLyReUie9Yu7CWEZ4g/JbGoFwnqoEB1eB1b31B6iCkm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105765; c=relaxed/simple;
	bh=96fjUGXbzrw3k5xl5NUqCMW2L7GOt6QRlWz3M6YrZiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGsQSNKFdLMrOn+deyVTSzdtD9jK24wb2rXLbewGsbZESirjAO02xgp3aiRvbAPG0upkg9qsANRuWEi3ib961Qa+K/x0fkyLkRMusb8RQFFUD3tBknIXaD1/J1H5EHat+T2QGh1+f5Iy3C/bTE6MfyRE3vQJSWghnT12D7fG3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNrC/Eo8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c1def9b4b3so877337a91.0;
        Tue, 11 Jun 2024 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105763; x=1718710563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6B1NQaDMHjP+qp3yd7SriWtlaqA+mWbOie0xS43jhQU=;
        b=eNrC/Eo8J6SqeF96aISjOy0z0g18RD2tSXT+FPj/yMdzk/ehp6U+hfk3w0bvDmGRoe
         XpNzqQQkZgh71L5D8ZtPQHovJrYPOrTD2Txi9J6mP8o5bhv8FWgBobpFa1bJrimMRsJX
         fZGQhWn8DDMCirflwLdxYH7QXnfRrd2iwVJBooUOTJ2GIaKI1FFIhha+w8xc9KOgAT9f
         Ck0hWW1TGWlWnXu2Hz2N68JWdB8HbGWn/hIeH6yC5HrMowfAKbSuxzrg2lEsdthwOBVw
         iiwoTOcs4O/GpW6SyiJdietTGoNYAaPtlTEEuYoApNCwJGGN7JAwCNkeSK1gian+eB13
         jluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105763; x=1718710563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B1NQaDMHjP+qp3yd7SriWtlaqA+mWbOie0xS43jhQU=;
        b=XGZ8iuuN97z70BDVKS1zy9qF/UDV+wrFSO8kPGQH/4pDNVBaGCnqZ/L0L95RpPstfD
         xPcgt0c3offOvrvRsYLSyEYrKBRAja+vImjhYFJfqGfMDKh69uMb/JWCBnBXNab2R3sk
         GDKXQanolV16cb//ynqzPstDTfhup2AOtxs4zrMctqHpToXay/JEalgZwIve98s/H7Tl
         jW46UvZgUsUN6tjMJuOqBrM4eDY06D4n38jQDHAnft9rvEjyRVpzYnX/f1KxouZhJ+N+
         opRRICa+ITEcXWiQy6qcpx+zZUlq4IWDI+396m9fMNXpXvSZGtKXzIt+Q8ZtsSvO9QU9
         sIog==
X-Forwarded-Encrypted: i=1; AJvYcCVgTLLUKuZcY0cEoomqXFaOR6tqvwzAs/pPTPaXg9wOqPJN1340k9j6+lsxXBTqHugE8XZ23kMTEohxvI/9CgPrBvbi8CT9yA0/S1XaGhgenI5xHvPBXdHXVYacxtqLIqQZw9TptzFZ0n4+lVyUJ8l3Sa8loLO83hyHcIoIbeLtvKPYKrg=
X-Gm-Message-State: AOJu0Yy1oUyq7i0xc9U2l/72QjCLFmkvG8ZDKZHXtkSUE6RXA2YfgcEC
	sQ7WH511bxSk2bvoA1JKx2Yxh0SmUeHddu7ZficR/uB8n3VWwJP0
X-Google-Smtp-Source: AGHT+IH+QFfeJzg3SwJBv0yxSrEZhSpvFHi/ea9dnKyOBCzGUE/0iaBFQ4k1uM8ptZcVVQWbcr0kQw==
X-Received: by 2002:a17:90a:ad98:b0:2c2:def4:6520 with SMTP id 98e67ed59e1d1-2c2def466ebmr8302982a91.38.1718105762888;
        Tue, 11 Jun 2024 04:36:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c2dd785762sm6705086a91.37.2024.06.11.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:36:02 -0700 (PDT)
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
Subject: [PATCH v7 2/5] mips: bmips: rework and cache CBR addr handling
Date: Tue, 11 Jun 2024 13:35:34 +0200
Message-ID: <20240611113538.9004-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113538.9004-1-ansuelsmth@gmail.com>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
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


