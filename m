Return-Path: <linux-mips+bounces-6146-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD969A4BA3
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 692981F2352F
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC171DDC1E;
	Sat, 19 Oct 2024 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md1lRrZz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109F91CC890;
	Sat, 19 Oct 2024 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321847; cv=none; b=ritvkGykxxGcp1Cy1CwWYLZ8sw9HDYSAsDJ685tUmv09INQYr+OJ0heJHCG297xcgSST0xDCSxVoMAM8oVJvQ/ndRynPPReFSCYq+d86q6wuXM0rx/2xU5KLFoTpBpquys+ICNgQGDaOASmNc5pNINm5qxzW/h8uiOd6x08Bc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321847; c=relaxed/simple;
	bh=cAw1fMa88K0eSA4QdBE4QrEFyFaLSup0xnRQDCeAFRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SiQslN97GGcUNdGe1yQtTxX8KEpmpVXPZyEeziDOAATEk9TZfnEzAVpP5nxT/e3GyxeWA3Cq7OC1Mn8BoRKRYzvJalLQQOoTNtRYw01qTQyWVaQVC5N+fpM6wikFVV3nsL2MVXjt8CgHIrKTlMwxHsNaFMGZ108dgIxv7mnRFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md1lRrZz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99f646ff1bso341718966b.2;
        Sat, 19 Oct 2024 00:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321843; x=1729926643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bRNszhMVq/3+e44FU1ywn3qp6VaEiQfTqGQh9hECvc=;
        b=md1lRrZzfH2RPMSJWS2M3Vg8n6JyJVZ6Gv/imdxyobmj8XM7GyhvYc4tESaK2+hI3G
         +UE6RzRkQArXlXbYk8Eb9gjHiM/S8Eh0SS/Thhg1xH97/MuSSlIWE9E9KccTEQCmZPn+
         9X1bd8z9rjltjcgvz17Of/YFMqz55nXYdjWoKgp4Ps0N9EKrMlYCcI4dh3/TWeyYgloZ
         DxUNp6lTCuy/pU6dWB+kF6YcFyZMTMV/7Mamh7GCCyLKUZIWimA16nz8B23u/cWX9wxs
         t8iUeSRirS8uqTyrhLyTwCNEjOinoBqoloSpejZSShfKcHAyqLb6n7WCTKXjrE59qzmt
         ldXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321843; x=1729926643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bRNszhMVq/3+e44FU1ywn3qp6VaEiQfTqGQh9hECvc=;
        b=QjjasYGcq+vE2fbnpk5dTH9v+MH0Jr+vP+G2PvCSo/s3+4pKvBBRzdZRF1ir+ICkcH
         mJwppyAPOfzXVDBj1woLBvW47d7uoo2KIOsStqFiRQ15HUJsN3P2g93FfO+7aV0Gquit
         RGJ9m0R+2W0+n1cFi2rOmqny+QqnHsN8KeHQkWjG+U1RUKMUef7wfOIN+FDbXt0DMm6m
         Tm9gXO0JT9M5iP3ka61KnjUA6jfotiwEqtRwhCQUWInMlTfL/UOtVycJxBiL/Kl6QI2Z
         kLyEC6uHcD6+ktWq1PG4jXoQpAG2H6sbBIcIJMtmJNvW8ioVQh67D6or37EwvcrTfxpT
         HxXA==
X-Forwarded-Encrypted: i=1; AJvYcCUF9ahEM+yU30KkzWNXgv/IH3OmoiHkdAUOneZReTgYGSPrkPXjQfpb4Fx1T3xrl9iZQknokW7qWWF98jI=@vger.kernel.org, AJvYcCVX930FZ5SxLPadM+nWycqFLrECBj+O7trWYu4LH57hhKP+ieW+vDKmDS9vZ4yIsYht1a3zUO+xJpVhsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFr4WrRSPHwhfrc3zuY2EHwOAnt6ZX2md8Y12QXlfybccKHk1t
	CNwMJVeaJj5pdJ986nhJ2q1rqArMD2Ormx2k6K/ma5Ca2aiXq4Y1
X-Google-Smtp-Source: AGHT+IGppaA77Lc8gUzFG8Sn2L44DEvG5ITDYyRJPRNkj9KEz0ruBX/VEkB2i2/BvfABZpE+p0wNnA==
X-Received: by 2002:a17:906:db08:b0:a99:5234:c56c with SMTP id a640c23a62f3a-a9a69ba5cf8mr400693466b.33.1729321842927;
        Sat, 19 Oct 2024 00:10:42 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:10:42 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 01/12] irqchip/mips-gic: Introduce for_each_online_cpu_gic()
Date: Sat, 19 Oct 2024 09:10:26 +0200
Message-Id: <20241019071037.145314-2-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
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


