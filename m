Return-Path: <linux-mips+bounces-6524-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A39B38A5
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0292286A4A
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8087D1EF0B7;
	Mon, 28 Oct 2024 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt5C+odd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A21EE008;
	Mon, 28 Oct 2024 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138410; cv=none; b=BlYB6GFRlLgNc6o36gNkKAsvb8Hr0//FM7ej9NUQyn/qxoLiyE9rvH784atfSk5jYx+GRHNJ2VnNN2qztLNVrbv4dwE+j3Wo9gC63Bn/IG4fUwR+MmyuH0PFb4eSeBCcUpWg46puUTA1lN7sLGmt4g6lQTkcoAA6Xv9QYxLvp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138410; c=relaxed/simple;
	bh=r8fWALxY9pnx1sb7A9xCP2KVXvLRIDr6Sm4j2n3XmZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iEfRc7BgAtHVx62J08KT9hvtk4LTTo5lAF67GOd0Y2jcHIC8GrIiZUl+dstIWek7iB/jj3ae8Dl/azFAFrUqsI3yH7UhmdEEIM2GzTgU3b1vo0VjVVN5OLuFiH1Iotp932/vtodsAErmw5J5dw1PZLhkYxBjbajt6o0qxLnw+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt5C+odd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a3dc089d8so682637866b.3;
        Mon, 28 Oct 2024 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138406; x=1730743206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiQZgL3ro4zAwZa43jZc1RKKTs9QphATYHJZ+duswLY=;
        b=Tt5C+oddz+yIEHUtQJuYnHhkrR5oWQiTfuF1awuJifWj0+Ou2YUDt5J0K8K/ZQCY0U
         3WtfcJ5rpXZKRHMEnZPNN/n17aJw/aZKsuGc0rIz1YkwMf7L3a31aNqRbCC3droZ50Ox
         Dy0kim7GWgkRUnZmlbE3JylZzD9QpFFxa3gN6oLWYq+wHTvSDSaviqtqzTjE4S2Daxsg
         fHUjozIKBBMSHPxZmVum/zJYb+XiALMLtBHf3/bTQ/r6ZeHP6H2EypK4BYtVz8tugEUm
         NkUs8l6ss/VAjHhW7IokIPlPgflIvGwLoh5iXTMYXQq71hygrFjGI61K538iAqssn/+C
         wHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138406; x=1730743206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiQZgL3ro4zAwZa43jZc1RKKTs9QphATYHJZ+duswLY=;
        b=CmuiFxXdEFP7gwvv7M19KTSArQgKkF1AePeEX4dV4YUM9jKTfHfJUwakSlC2MXFCAW
         WrNCMQiW3o2lG57DoojJdFOpgPZaXhB5WRgnsfPVsxCT7aRBchxKk+7zDV7HwSFJ3nPB
         8Zkc9VJ8XgJNR055ROo9jiiE+rrVXbHl6oKFEQ/pjGKkznAhqWbKU3BZSziZ1gdGgcf1
         sqX0rHhNi6+KupNF9GccH5p0JFi/6QGmmw0vKC5OcsCG4JIb6KC7A2Sqg3m95YBRRvGg
         9VHe7x7SqhgcV6gfjuBKi4KAQ+2OfwY1RUHsvfoXWvm5mm7tbwS/GZiKFi381j3dPdO3
         BOdw==
X-Forwarded-Encrypted: i=1; AJvYcCVXgndti/bBcheuXi2+o2wT8+E/g6jSSV+y/NujS3pSZTA+hCUBhKDX8pyBsM4OZZv45Cr0uR6U0L45mHQn@vger.kernel.org, AJvYcCVuES4+QKzJiwTueLiRYgUdGPrN9DkpU01t6VqWIhG1vW3DVo6djLyx+cw/sRopF9f3AKc2MWmiixWskw==@vger.kernel.org, AJvYcCW7G0HGJWkRiL1EeRRer3IXW2yp5MjFseTaPH7K7Tg4GNQUjc2Vp7B6S8hS+0E4PzTKlYIAj6EJwWbL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qVyQMp7m4t9CkuiouKe2FXu4QtrUt//Mkpz5CBRnm0FKeo2j
	/KZ6rUT2ZsEeYbGxH6k71YR4KEed0nlJpEtF5gsrptDQI3ucW+GN
X-Google-Smtp-Source: AGHT+IG5jA+Nssk1Re12RA2qe936eHRH5gV4JTqDwHRurOHr80Tqiif6nLNwRMr7EsOl7pxdldGEAQ==
X-Received: by 2002:a17:907:7e86:b0:a99:77f0:51f7 with SMTP id a640c23a62f3a-a9de62ec48amr694120066b.61.1730138406055;
        Mon, 28 Oct 2024 11:00:06 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.11.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:00:05 -0700 (PDT)
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
Subject: [PATCH v8 13/13] irqchip: mips-gic: Handle case with cluster without CPU cores
Date: Mon, 28 Oct 2024 18:59:35 +0100
Message-Id: <20241028175935.51250-14-arikalo@gmail.com>
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

From: Gregory CLEMENT <gregory.clement@bootlin.com>

It is possible to have no CPU cores in a cluster; in such cases, it is
not possible to access the GIC, and any indirect access leads to an
exception. This patch dynamically skips the indirect access in such
situations.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/irqchip/irq-mips-gic.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f42f69bbd6fb..bca8053864b2 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -141,7 +141,8 @@ static bool gic_irq_lock_cluster(struct irq_data *d)
 	cl = cpu_cluster(&cpu_data[cpu]);
 	if (cl == cpu_cluster(&current_cpu_data))
 		return false;
-
+	if (mips_cps_numcores(cl) == 0)
+		return false;
 	mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
 	return true;
 }
@@ -507,6 +508,9 @@ static void gic_mask_local_irq_all_vpes(struct irq_data *d)
 	struct gic_all_vpes_chip_data *cd;
 	int intr, cpu;
 
+	if (!mips_cps_multicluster_cpus())
+		return;
+
 	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
 	cd = irq_data_get_irq_chip_data(d);
 	cd->mask = false;
@@ -520,6 +524,9 @@ static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
 	struct gic_all_vpes_chip_data *cd;
 	int intr, cpu;
 
+	if (!mips_cps_multicluster_cpus())
+		return;
+
 	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
 	cd = irq_data_get_irq_chip_data(d);
 	cd->mask = true;
@@ -687,8 +694,10 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	if (!gic_local_irq_is_routable(intr))
 		return -EPERM;
 
-	for_each_online_cpu_gic(cpu, &gic_lock)
-		write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
+	if (mips_cps_multicluster_cpus()) {
+		for_each_online_cpu_gic(cpu, &gic_lock)
+			write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
+	}
 
 	return 0;
 }
@@ -982,7 +991,7 @@ static int __init gic_of_init(struct device_node *node,
 				change_gic_trig(i, GIC_TRIG_LEVEL);
 				write_gic_rmask(i);
 			}
-		} else {
+		} else if (mips_cps_numcores(cl) != 0) {
 			mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
 			for (i = 0; i < gic_shared_intrs; i++) {
 				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
@@ -990,6 +999,9 @@ static int __init gic_of_init(struct device_node *node,
 				write_gic_redir_rmask(i);
 			}
 			mips_cm_unlock_other();
+
+		} else {
+			pr_warn("No CPU cores on the cluster %d skip it\n", cl);
 		}
 	}
 
-- 
2.25.1


