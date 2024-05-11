Return-Path: <linux-mips+bounces-3234-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E68C317C
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 15:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA4A282195
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 13:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6972451C33;
	Sat, 11 May 2024 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzUn2RWJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961C050A63;
	Sat, 11 May 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715432653; cv=none; b=YQvzQwKOoHmP8OTP00HmQtULDGM5LsqYcX2Y2cPUEgviLEJ1VtdcvJ+DI4BenA9mH53ruQ+V0gB4QiEyTo5gP6SlNl4+f/cTZXpLJuVAgFUhi6O1ke9SNhCbY5aILkiDbd7EQqwrVitbp0Mu9fw1wOGkl8sBy+4+jhZFDw1dCMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715432653; c=relaxed/simple;
	bh=dLf+sRfTEbzgn8sbcR5eeaVA/W0uDh3WvKW0ze/SR1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doGZMQ4wNIgS5vxyKfOrrjGzo3AyvQjD2Snfh0XFyhhXYdFXFqnYa++RI5qjes3dlw8BSqDyNMDZNvnt3MZNX0Nmdw8PCMLkQglUr/ZGEUC4zf0mLAYl1SJFxLoCN3lIJ7uFf/ABwxMaO8iYUEGm0NJMc8oETa5+S+Y94Sha0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzUn2RWJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so39202881fa.3;
        Sat, 11 May 2024 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715432650; x=1716037450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnHwdZLA5DykwWleNIsiGbLVxAuo8Ou7t0lUWcNVJ00=;
        b=KzUn2RWJt5RPbQGt7NpkDoheWJKLpjTVMFYz9/L3I4mT62Qym9NZx00AKyEap4qS5R
         cU4+ave0x+pdr0T19eJchmPeztlRluowtyyMVi5OxHZ1eVYkD7CH8fwJ2NFfycnUFjXC
         C7m9P8PjOh0onskhHCSdTZYrfe60TvaPzRd+3hy+3TufMv06lY4iBt601pta/22Tx83z
         9U7eLxyJQIV5V7+P37tSob70s5y6zZXmaeZDWYWMHBtjIWBcvOkp5vJe5EbzmYEM/gw5
         uZrDE2xK/+P7+qwqJGe/sIhZ7tpPFMjNZg0gHaJJL649bZgvO4/RBBRTSm6KcQ1UA+It
         l28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715432650; x=1716037450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnHwdZLA5DykwWleNIsiGbLVxAuo8Ou7t0lUWcNVJ00=;
        b=uN6Nd0UBIkYY/3CQnHscAyj9OCVtTHCRLFkCzL1rXlGEMJcxomUqZ/sbWLtKVIR2e7
         bDxzK5C52wTXZAo8XRjd2NJ9bxDUAtQQx7UkxB9j+RAxey7zGf9VetpyQU9HEaMGo/Bc
         i07xUJo4psuB6kXXdoOXGNt6s9UG8hg3KaV/1yMSYsS3ZYUIuJUF4aQlx98pU/5LtObx
         M/nMJesu4fMaC7Nkh//ZOO9RFZr58wJXlCQPKzPTgpBjzOyWV+cchAkXzoxx8xHHXkoV
         bEZKOixepvtYuZem+jcnUa1slMP6BuoB90YOWTaEyMJPs8EZHmEN+qOUh6OBsLWe5V78
         hV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrRR4/Hek6AMyHINGmKpU2uOeZNIVxgSeRJJzWzOgYhF/Rbb1J7REkAmrBwhQ6oUttrDh3q6dSwNq0FFneBFMCJwLVfntj/FAqxTUy7sonn8EV6SYU85uSeFVTnhm44y3FIJ+FFgh2YSLdYxPL6lUjP5h/W6QtBJfgRXLRl6uLy+Eit1E=
X-Gm-Message-State: AOJu0YyETyp0mwUJxkJcR26XIcxw13VDZ8wDbX8sjJRelkRr88zTf/+c
	JMJ0WhG9/3FNoJR/PPgTowzN4GkHTDdGoY5GUiP0KB8lX28DKQgU
X-Google-Smtp-Source: AGHT+IGy4K49ZD4rNb4xaUU0Ykb2AdsAiZgzWu26IW3wBkyRN54KZb7y05wbQpmohBt66J90HvHgQw==
X-Received: by 2002:a05:651c:22f:b0:2e2:113c:cbab with SMTP id 38308e7fff4ca-2e51ff530b0mr40565031fa.21.1715432649320;
        Sat, 11 May 2024 06:04:09 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42010ca475asm15995495e9.16.2024.05.11.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 06:04:08 -0700 (PDT)
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
Subject: [PATCH v5 1/4] mips: bmips: rework and cache CBR addr handling
Date: Sat, 11 May 2024 15:03:45 +0200
Message-ID: <20240511130349.23409-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511130349.23409-1-ansuelsmth@gmail.com>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
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
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
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


