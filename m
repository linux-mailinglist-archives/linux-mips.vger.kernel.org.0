Return-Path: <linux-mips+bounces-6512-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA259B3877
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE08F2837C7
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5871DF996;
	Mon, 28 Oct 2024 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTiiCqgy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F11DF978;
	Mon, 28 Oct 2024 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138385; cv=none; b=TW5GjhT5orMLZrHEl5mVbL0sebaubHezofyXYpRGrEohISW/Hz3a7pe6DUiAwK+pFSAerBIe3CVxDAR4XXc0WNCYzqlZ4eo5TQY6XM1JgzxPBITtZMNVYbTN11DcGq0kpzEFh9fvHnDKu/aiicS0R1k8AekdyinYmKpyIyhcCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138385; c=relaxed/simple;
	bh=Rtrn4VLgu5DfagKoC7TxUEvBsOj+n2T7PA++iG8Vjp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kX3Q8+SqDnr1xLnnzctXZNJd1WWWuLr5fZ+L+TcAH1wrYLqus5KpTB4iz58uPcGPtWQq+SRcrCSOUi7knRN/0NAzIMV8Fr4kqYE5H5fvHXa05qA1Wi5Ctl5D5TLOQVpDpysn6XY62w9XnqQeU6vKfLyqmHBjm96/MjvBF6q5tOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTiiCqgy; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0472306cso630878966b.3;
        Mon, 28 Oct 2024 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138381; x=1730743181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8f9PcoY43I62EwhuLpsEoAimQzVe7SbZIt1u4SOlej4=;
        b=PTiiCqgy4zYAGWpqGKB8ZkvHIJfhWwf+ZT5S8XlWob832eYRIx+YuiAZPSx2WgHrWm
         KNh6OdcHXgBfyik0mv8jOeGZ238gxvILgYZz4vOQFVAm5udyvHANftbNXEkAWKP+fgbg
         hHc6kO0nZHJjIU7rqVHOO36Nk8zkmy5Wg8yFG/ZxSDCy6lfRWGLzUce0puFmVtp96SKn
         KuOClq6oZB4EBPyappYRoE27bFzfkxpl6W4ZEHm1lI5Lp8zlCU6DWMp/PhlJkZkTd+hr
         r+MVK2KruxiLMdLY1OzGD3wuSO/epAaKDad7YtzJdNCW7i9hyIvbhE9uLXOD9tHc7G/t
         UNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138381; x=1730743181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8f9PcoY43I62EwhuLpsEoAimQzVe7SbZIt1u4SOlej4=;
        b=sSyB8qNvb+9XOsxIHm7aIaSjltN2HIh/bDBhsfya8FAuwjonAehmDayVrxPrWR2D/j
         u8IDpu1wCAH/CsvuX7UM5rpSFT1oormQJxmoyiL9l0hwGVelDqg5kCqFt4M8fCDli4uu
         sewN6Zb31XfFk5nxPgEbNcKtkuEWKxQzLfKioopTN/ZGm/YRA0KeTdVe5pIfqM/PxZiK
         kXcTpyHj9PeW/HG0tkjwWo1pbCCTQuCLYVQ3XdTvinFA6E8SlxcRd33Gnr81vHlE1Hp0
         psW6brlGSP+VysreK8kpQeio8LtEWrdtolNWKkMjlKahkL02cev1ZbBEnHpCCkR23sCr
         OXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEvX5Q+OnwqzcsiQN0/BGOS+NfJ74OBvE94uJ5E8x+0xtBBalS+rLfl6Gh4oPgXJZGvWxf9Te8R7FE@vger.kernel.org, AJvYcCXT9jMLKAUjttg5nKGwtDUIYF8xVq/bpmYsQlL5OaZ/yZVw3V42c5VxquaRjS69o45ItxYHG5zU9Guokw==@vger.kernel.org, AJvYcCXwFqaEPRgrR/GpfPeI8ViPRAHSiWCjAJHsAEuewiz1WChMWjUZVrkRprs9hGnWiQGln2yV3NrDVcln51fz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+W+GVbgGc9la1ZCyMGR6ATPVEIHKzbs1WxuIriITQ0zntFOaz
	cQxEgnN2wKY51Jdji1utnGsp6aMXxwl0lqDKax6/cMuCQPr66b8C
X-Google-Smtp-Source: AGHT+IG7C7sZZ8GB7+eMPJDp7gB/Ed+PcxCWYwIERQr4mXe5Tv0nG2H0hoCUZ7oYsfB1HkHda01TVg==
X-Received: by 2002:a17:907:3f0a:b0:a9a:ca1:5e09 with SMTP id a640c23a62f3a-a9de5f23b50mr736555966b.29.1730138380969;
        Mon, 28 Oct 2024 10:59:40 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:40 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 01/13] irqchip/mips-gic: Introduce for_each_online_cpu_gic()
Date: Mon, 28 Oct 2024 18:59:23 +0100
Message-Id: <20241028175935.51250-2-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
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
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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


