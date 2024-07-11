Return-Path: <linux-mips+bounces-4274-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3423492E22B
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDF9D284CFB
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0AD156968;
	Thu, 11 Jul 2024 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARpZTf85"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE58155A47;
	Thu, 11 Jul 2024 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686430; cv=none; b=NXWslGwdpa9yr0RMMcYW+wCgP7CWNSYUrgH7eFvG47bIA3X5BWNS7Nv/rfzcKoS5ERDM9pD05+IPo+KBQOjfPb3lhjVgpNB75hUr1dUI9Kz/aTEtVmUW7L1pIqHNxeAJ5l7IsW8pn6uoxgAyrI9TNIWqH93sMkDHReYRCJ3CYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686430; c=relaxed/simple;
	bh=lRP8PrGqJ+uo9Zp6g0Qm8qLkDotTHxE60FSRnQlZCsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhAShUnmIvlDPuyWji9HCgtlxt0DXDqeYNUYd6f2pb5FoCh6E5bLoi/XQ4FFT1TEGV8UZdfIbAlIsCAxoRRhdc6SGTZHxg8zaJjpS4jBipoENnL77i9bATFYGAr77q5m5n7SWH8vBJFAGqkVAd/dVJHCXfVPC2qzfil8qpZtNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARpZTf85; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eec7e431d9so6496331fa.2;
        Thu, 11 Jul 2024 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686426; x=1721291226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReifRjJ+F7L7a0QBvncSYAOaGaiMv8UukF6KYGpSd/w=;
        b=ARpZTf85SKLKvne4AzMZ9UTfuEJEw4VV46YIzy7QpwUbjRXac7O1tvvF07XNxxx5bm
         vRCb8U/fxLA7mgB6w7v5MYeIPSczklM0zcBEvFdyMACBz0/5DV77vj058SmVuz+QIPiQ
         ek7gNoVsLeJ5y8AA4SEUHcWO+tfeJeYh6lkno7T2FukZbUzRL88TyI89uzrs4SC9fkZl
         v3KATvJC58IYvGQ7cLEWgcbiO+E76TKY+2Lf7FSWtmFT/ONpYuCKJaJLToxwdr9uRxMB
         YXq9Jni+os8bQCyYm+nsyAE8TL5TnTHX3y3TwFCDC5H93TjWLfqgQdPSwx3I1XEVD6Kk
         nIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686426; x=1721291226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReifRjJ+F7L7a0QBvncSYAOaGaiMv8UukF6KYGpSd/w=;
        b=F9gBAfMk1WAhcCjK6qUknjOP3wnfD5mnvu3IvNauQzuMft/2ew8fsA7/9LmtYdLW6b
         +kf4JxA8UFqFTc70FFX796tFNE8bU6AhjLozDw3OutR8XncZ/LG0AalnZJeC1q4oZmE+
         xpfUGVYpUyyuOV+WvI+Fhl4M8X41snQOukUXShlbLVG239UAODeaNS3h2Nnx8v8KRW0N
         ZhNHWkDszwl817bUt7+gcOWfqOz5dfr8oQm89GoEAauulTevgWiQ6lChIa/DBT5SkTef
         2AZi3yq3GSUqF6kLSKHfo1Xz+z/Mae2fq7MkhKBdagPJuX2ynjnXrV3aoQI3hbwoZBRq
         T+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWywWTgDKd7T2MzakEm8eOZE85+SM7zCFMBTCwABqidxC5afGS0ZCOVcAavLMVa1putuUDrj2v/Z5PifebAw5R7DN6Q40S9IcKYzZp3lmcVe5a4E1Qes4SQJWjB/d7ZWy61ykn/4CnCw==
X-Gm-Message-State: AOJu0YyZCnp5tsNorCs4Qj20r0fJRhntVcBkgKTDwBsZDbqwkNu1PYMy
	lVqR8Ot8IdgCvA6vTTR4gKLwRqzeX0juwKqYh3M+r74q1AbBvLZn
X-Google-Smtp-Source: AGHT+IE85Ukum8VZjJ8MbuTew4337izeAeArigurhDA/mX33JddC/tDb/b11mpGLgtyMhoyaVk+Qzg==
X-Received: by 2002:a2e:a7d0:0:b0:2ee:8a88:b060 with SMTP id 38308e7fff4ca-2eeb3191ab3mr62260971fa.53.1720686426174;
        Thu, 11 Jul 2024 01:27:06 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:05 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v5 03/11] irqchip/mips-gic: Introduce for_each_online_cpu_gic()
Date: Thu, 11 Jul 2024 10:26:48 +0200
Message-Id: <20240711082656.1889440-4-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711082656.1889440-1-arikalo@gmail.com>
References: <20240711082656.1889440-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

Parts of code in the MIPS GIC driver operate on the GIC local register
block for each online CPU, accessing each via the GIC's other/redirect
register block.

Abstract the process of iterating over online CPUs & configuring the
other/redirect region to access their registers through a new
for_each_online_cpu_gic() macro.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/irqchip/irq-mips-gic.c | 59 +++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 76253e864f23..6c7a7d2f0438 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -66,6 +66,44 @@ static struct gic_all_vpes_chip_data {
 	bool	mask;
 } gic_all_vpes_chip_data[GIC_NUM_LOCAL_INTRS];
 
+static int __gic_with_next_online_cpu(int prev)
+{
+	unsigned int cpu;
+
+	/* Discover the next online CPU */
+	cpu = cpumask_next(prev, cpu_online_mask);
+
+	/* If there isn't one, we're done */
+	if (cpu >= nr_cpu_ids)
+		return cpu;
+
+	/*
+	 * Move the access lock to the next CPU's GIC local register block.
+	 *
+	 * Set GIC_VL_OTHER. Since the caller holds gic_lock nothing can
+	 * clobber the written value.
+	 */
+	write_gic_vl_other(mips_cm_vp_id(cpu));
+
+	return cpu;
+}
+
+/**
+ * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
+ * @cpu: An integer variable to hold the current CPU number
+ * @gic_lock: A pointer to raw spin lock used as a guard
+ *
+ * Iterate over online CPUs & configure the other/redirect register region to
+ * access each CPUs GIC local register block, which can be accessed from the
+ * loop body using read_gic_vo_*() or write_gic_vo_*() accessor functions or
+ * their derivatives.
+ */
+#define for_each_online_cpu_gic(cpu, gic_lock)		\
+	guard(raw_spinlock_irqsave)(gic_lock);		\
+	for ((cpu) = __gic_with_next_online_cpu(-1);	\
+	     (cpu) < nr_cpu_ids;			\
+	     (cpu) = __gic_with_next_online_cpu(cpu))
+
 static void gic_clear_pcpu_masks(unsigned int intr)
 {
 	unsigned int i;
@@ -350,37 +388,27 @@ static struct irq_chip gic_local_irq_controller = {
 static void gic_mask_local_irq_all_vpes(struct irq_data *d)
 {
 	struct gic_all_vpes_chip_data *cd;
-	unsigned long flags;
 	int intr, cpu;
 
 	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
 	cd = irq_data_get_irq_chip_data(d);
 	cd->mask = false;
 
-	raw_spin_lock_irqsave(&gic_lock, flags);
-	for_each_online_cpu(cpu) {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+	for_each_online_cpu_gic(cpu, &gic_lock)
 		write_gic_vo_rmask(BIT(intr));
-	}
-	raw_spin_unlock_irqrestore(&gic_lock, flags);
 }
 
 static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
 {
 	struct gic_all_vpes_chip_data *cd;
-	unsigned long flags;
 	int intr, cpu;
 
 	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
 	cd = irq_data_get_irq_chip_data(d);
 	cd->mask = true;
 
-	raw_spin_lock_irqsave(&gic_lock, flags);
-	for_each_online_cpu(cpu) {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+	for_each_online_cpu_gic(cpu, &gic_lock)
 		write_gic_vo_smask(BIT(intr));
-	}
-	raw_spin_unlock_irqrestore(&gic_lock, flags);
 }
 
 static void gic_all_vpes_irq_cpu_online(void)
@@ -469,7 +497,6 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 			      irq_hw_number_t hwirq)
 {
 	struct gic_all_vpes_chip_data *cd;
-	unsigned long flags;
 	unsigned int intr;
 	int err, cpu;
 	u32 map;
@@ -533,12 +560,8 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	if (!gic_local_irq_is_routable(intr))
 		return -EPERM;
 
-	raw_spin_lock_irqsave(&gic_lock, flags);
-	for_each_online_cpu(cpu) {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+	for_each_online_cpu_gic(cpu, &gic_lock)
 		write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
-	}
-	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return 0;
 }
-- 
2.25.1


