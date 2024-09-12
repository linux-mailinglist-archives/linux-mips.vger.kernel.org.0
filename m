Return-Path: <linux-mips+bounces-5540-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B5097659A
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EE0A288EFD
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D57719F135;
	Thu, 12 Sep 2024 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3J0ciFm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1FB198A05;
	Thu, 12 Sep 2024 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133460; cv=none; b=kvJl4zSN9r8Ut/11QZvIwuK02ElXRFVA+P6QzDGNS5HCNo7aI56IpGW/9iJwA4tBABm1Pyj5lgLAl8tuJSnClJ6XnmMcSqU9nMfz+5X+VJz/XkI3MvGyTudQt6USmhuS440hoAZVC8zEZH4fcAPpEsEEv5lkxhXDCapWMpcblKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133460; c=relaxed/simple;
	bh=cAw1fMa88K0eSA4QdBE4QrEFyFaLSup0xnRQDCeAFRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jUoTlCF6E9/OHWVtbFSf1kAZBZFeLJK01IExlqqX233J58mKD7uyjA9RPT12Q31FjmjQSvN4bRaqYJMQG/GDq31BP/X3VvCn+sIBU1YkEw8NcccUqxK58ataLsipgS4FtooKSlXjMXW8Qyr37Kk6Odi8YJQ2PJvHRYPDGMftti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3J0ciFm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cd46f3ac9so6547565e9.3;
        Thu, 12 Sep 2024 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133457; x=1726738257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bRNszhMVq/3+e44FU1ywn3qp6VaEiQfTqGQh9hECvc=;
        b=a3J0ciFmLcR6aKtFXjXpcmbYqAK/pYUDMsTiSfPjodANL+HquIEBGhme+dp2JAYRrx
         GkD9QtXFQsuo6bk9KGiqeJXh1NmVV3EuuxmUlukskwp6bu1Yyzu3JlX3ySk+QxTB5P1b
         HlFWcbsoDUFTmBMjC/5svhOOE/OuE3vPwRpX0OHNJJKCVgjtQXH+m8NvroiAOK4VkHAx
         T4mWidcdKMVGTjjvkbgyHn+GgEwbtoYpBThBDvAA4beDt56d5QUruF3HPxDlF3bOhZlD
         WM9ynWb7ycs6kcpZ6pw8vuvnivxwrfFmwXtH1fgfq79MYPgN9TN4YIohIXx3eyKwvSJw
         MgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133457; x=1726738257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bRNszhMVq/3+e44FU1ywn3qp6VaEiQfTqGQh9hECvc=;
        b=W0mkm9T3LWIqVq35+iqr/mcmY9AVyb3XK8FpnB2JnG6hEDbDo8MwWs5CwmZe6v6+2m
         UdA4esDo/53JpGL6KPR2KKpBHt3jWU4teWIj1qlGkeL36pSkD0dR++n86R+vz4+ifA0x
         nWj7hQQvQ6z6N5FCkl0G7vGQwqRc/8853T2eFvwIK0N1MF4NOJhLM9Z1yr25NuvDEuRE
         YCncJBA3OB7VsLqNvmM9Lhx1Ov+4S9YnT2LiZWCVnGGcwmGQItmL1eP5HR5fiuqoG/36
         /MyuHCCnCbEfMIAjpXJ3Q1O17j1NSf0MgiaVTWAB4eF7YEfFFO6h1LYjn5egUAhAZs6j
         nWzg==
X-Forwarded-Encrypted: i=1; AJvYcCUc6I8GF01rqB8Tqp9O7kESJfbG1QNKklZmBLiGWjk/DwQzGLxn0xsDEiw306DQIzYgEs3tl9OgA1XrBA==@vger.kernel.org, AJvYcCXReMzGNRYwqd9jIYotRLpMPVsT5eF2pzT+Vb7e4H683ENyJ8D6lg1pBXHYpOGNae4hQ72AUXaX0xkueaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfoXZ9V/7bI7gF/STpztzEbNOvj6gNMxzCOemlkhLmhEmGgsXp
	1RJ0BEt4rfBxyQKC7O2qxCdvCqYAM1q/Xo4/Pn12v2sLWzRUfORm
X-Google-Smtp-Source: AGHT+IGJyBcjyFUHN1mKAxQ1N+NjIrechU3TDap7lzNpBTTBhXbaSyWFVEljHcj4VVhuumujNO+PCA==
X-Received: by 2002:a05:600c:35c1:b0:42c:bfb1:766e with SMTP id 5b1f17b1804b1-42cdb55006fmr17061985e9.21.1726133456631;
        Thu, 12 Sep 2024 02:30:56 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:30:56 -0700 (PDT)
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
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v6 1/9] irqchip/mips-gic: Introduce for_each_online_cpu_gic()
Date: Thu, 12 Sep 2024 11:30:43 +0200
Message-Id: <20240912093051.452172-2-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912093051.452172-1-arikalo@gmail.com>
References: <20240912093051.452172-1-arikalo@gmail.com>
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


