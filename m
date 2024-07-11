Return-Path: <linux-mips+bounces-4275-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481892E22D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B681C22C44
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FAB156C71;
	Thu, 11 Jul 2024 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSb4hLS8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B388155CBA;
	Thu, 11 Jul 2024 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686431; cv=none; b=L5b/7nMF/sWy3sc+gkZ108yb4jyGSBPspKhmHXlpXXODMyfyUidgpgCRdnIpZqT8dAhaYTRtzJu+aTYMAoPO7mH/VSSh/P7Ozar6nM5nSTcza8GeutKZ1+pGBvrmq+a7BOWBpruU2DKZIdDSLtJzJZw3tKCbyeKXoLXrexf2I1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686431; c=relaxed/simple;
	bh=zUVIkISW3jZnhcMxLsleQnjjg0Ud5N6so9W6XSuUCpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sExldKe27YA8duXDu8HHu2zVGZPClZpUSUD24bIPwax0gZgKUGNFWlnFpvArfPigZdyTnqMhkpNzKSO8dJ+3pibz1+7MYXL50Ya/3mgQJSVXSe8yS4IUeh3DWWqZZ0GHjJDKigTbVGcQLOODmbItbeVuu2k88ycUaE2ZaV7WX58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSb4hLS8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3678fbf4a91so282236f8f.1;
        Thu, 11 Jul 2024 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686428; x=1721291228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOO3jOTAGVFfwBWAICwL9MIO5uU5dpebDIzy/18ap1w=;
        b=ZSb4hLS8qzvcQnqu7tKj3tV8Uv9QgQS7YEfO209iD79EDkBsQYcosjiQjYApTKZgH1
         SqZ1f6Mqj8XUpef25pVL8++12rPnSg32byCwlukyGY3+kKxy4JWi/uPYoSKKig1YDPEa
         S7TUHDmxNyMRZ35KfdhPL0Isz4D0eoIDkz3zkmYNrWdbrV3vULXYquN7gqRhAfe+jTUv
         6JYXGcaGAb5+suKNpahTP3Be8Nlv0AAUUZk9rHnSVNFNzrpyrxO67DyTmuKmkxytvld8
         KaB8gElu1luUg/ibl49ERD35u76tqlSLxiDuNCD09s8AGlrlBecL1uJ1d7FhrWR43N5K
         pU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686428; x=1721291228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOO3jOTAGVFfwBWAICwL9MIO5uU5dpebDIzy/18ap1w=;
        b=WzjEuxWcWcokcV+srZRaKjzmPfyduSuewURoRKfL5Kyo1xNE3TxqkRc44mAWNntqsL
         nhEH+4EB63jqnPRD/cfKgLkZqrqyyHUU6YaSWK5i4apuk+QjD9pocYKpwLlFebnxy4ij
         KAdSLsxOOk0C9K4gT5IRNtJ78bXmpGKxwJrK21SnmjTXH/XP5bMVEBxZnXF+GC4721lB
         qhTIeqYyDg11eSpGJAhkJ7blFuiornlGwyYbv/rg5PeNQTtETxbe4Zv6yFGmjJnj7Jsz
         2PRzwwUoD0m4bgqq48RXeewwEgVn05P1BP/o55kTGbR47+b6linK0n+aSlY/Wmp1xA6x
         GOoA==
X-Forwarded-Encrypted: i=1; AJvYcCUlgUDJG1ApdhdL8p2d6kYG9ncb21QWHtM1pIQbwsM9f0xCJd6fs/EOLpSbeoWQe2yjSQcDJtjI6HDcLDMrJaJlarwmgvUiSFIinF97ZB/HJto/daM0EvPU5/w4hixWbJxyvlanvwqAwg==
X-Gm-Message-State: AOJu0YzxyaTtnqOQaocMuuM817sntyXFq48hKLLEcdm5/kHEdiokpqGf
	5onSH3VlPRJ4236JfKK4HlaU/OhpTZs2cyB4GjTuhgHh4eTr7hmw
X-Google-Smtp-Source: AGHT+IE9wgH2mUydYc/dbEwsCa2ULDGix/rao40AXMd3CPfxnFN4bkrvzhEzSMFAzpGl2wJLnya4dw==
X-Received: by 2002:adf:cc88:0:b0:367:94ee:734c with SMTP id ffacd0b85a97d-367cea46df5mr5009692f8f.14.1720686427799;
        Thu, 11 Jul 2024 01:27:07 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:07 -0700 (PDT)
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
Subject: [PATCH v5 04/11] irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
Date: Thu, 11 Jul 2024 10:26:49 +0200
Message-Id: <20240711082656.1889440-5-arikalo@gmail.com>
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

Use CM's GCR_CL_REDIRECT register to access registers in remote clusters,
so users of gic_with_each_online_cpu() gain support for multi-cluster with
no further changes.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/irqchip/irq-mips-gic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 6c7a7d2f0438..e7358d3f4e74 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -98,10 +98,17 @@ static int __gic_with_next_online_cpu(int prev)
  * loop body using read_gic_vo_*() or write_gic_vo_*() accessor functions or
  * their derivatives.
  */
+static inline void gic_unlock_cluster(void)
+{
+	if (mips_cps_multicluster_cpus())
+		mips_cm_unlock_other();
+}
+
 #define for_each_online_cpu_gic(cpu, gic_lock)		\
 	guard(raw_spinlock_irqsave)(gic_lock);		\
 	for ((cpu) = __gic_with_next_online_cpu(-1);	\
 	     (cpu) < nr_cpu_ids;			\
+	     gic_unlock_cluster(),			\
 	     (cpu) = __gic_with_next_online_cpu(cpu))
 
 static void gic_clear_pcpu_masks(unsigned int intr)
-- 
2.25.1


