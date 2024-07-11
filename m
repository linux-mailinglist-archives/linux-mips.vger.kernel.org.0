Return-Path: <linux-mips+bounces-4276-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870092E22F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B92E1C22C37
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31956157494;
	Thu, 11 Jul 2024 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMjK1bUD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C778156F3A;
	Thu, 11 Jul 2024 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686433; cv=none; b=b7uXb2/7IdGAkFzB3vcW/wTtehQwS7L6hrxzlJBNQHWrqvRyimLFZY2T2yTTOwYjcQ3N2NgMMePQKWLZ3BaLcl7ubqCbbWcQHloVbOUkR3G0PjQaJCyPvehK0pR8+ToBDza/WqGOYlFOa/NFKWBXvpXUEi5OO5E+baw+kicnbEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686433; c=relaxed/simple;
	bh=/xE0w9SR+3yMBtreBYEwxXqcCREle6Eog1NUc4b7uGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j97OoLYfHJsVbh1fKIPyd0p2zWc3N4+wWcPlB+IvnQ9POSDNyS7Kwr7Dq3ristSr8NpegSempadjth8eTrLvip9sB1p9NCI7YrkYARyU0U6Yq4DMTJTE1dyKWW9h6pr4+PsQ48LRkWWH302QNVDnakOLiA/5pUcxqaijmdT4TxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMjK1bUD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4265c2b602aso4014125e9.3;
        Thu, 11 Jul 2024 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686430; x=1721291230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1Vgvtd2WAkghL37NXwrCMUEOPeUgVOtQe2UKqlBzbU=;
        b=KMjK1bUDsQ4AapU5VIJxNTMOyIBJnKkEVpDXno0ESQyS0HbfSxQAy8RooGOq2wDOOw
         Iljvcvv8L8uiigcLCHzBPfshOZqlkX81QT/iQ/XnX6b1Z7Fp6kTdm+XqYoGGK8wnnuYz
         CwEHGUfbBrrZ7MVwRhC2ib4lMf8x830FhlFL4HiVdVLzjJuPNH702uYD3IgL8vllc3Gw
         Y+5QQmo+VwLT9gQZHUYSoFqYJcex7qgmaJwUMJwUD/snYdKE+io8QuDecG1yVRjYYpln
         o7/mD+tWjsIFrbaf/5N0crXpR4+q3plQqB2xwL1v8b2IPe891oCyluIFTul9CWs1kzsB
         18pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686430; x=1721291230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1Vgvtd2WAkghL37NXwrCMUEOPeUgVOtQe2UKqlBzbU=;
        b=aeJkpX7kVYJvegmxTTTfINDqCoKc6MLwU3aE41sXOL4MoFHenJmUFTj6Nf+K+UyS6v
         Yl6bOVMO+LOgpQ6cAosSxN4vAS4SiH69EyecfDp+65Etb98oSGeq9fziuis8xvxu6oxr
         QIKCo4KzWgsEAEjJa4v7QueauAX2yUCyldgIOpJEEc9BJNYpZegcbpL/Me79sI0t4ogu
         PAoizyR7XhgOS3YCxm99R/t/yMyQgGxRpB/mrxYfrNjrrKmd9FUXEZEi0ObjqfT5SCzR
         4H1ZVKGzjBIJLzQE3nAOtKWSsYh426hL4sglZRzG3/sXrFfGdYRP56ZVuX7THiBqzyT4
         BDDA==
X-Forwarded-Encrypted: i=1; AJvYcCVAvSYNqYFLjFO1WL4gJa1O/yuRF67eYjSxZRDtqHKGa1ABP7kiktZ/iIr+LwURYJxWEELwCW3tr95FtuUBmHCfCKT+83CCcCISdYdJoyDFpJa8qvqYGywDk3uXBF3RtACb6LgmjXTrkA==
X-Gm-Message-State: AOJu0YyWbqdmHCMlG0ZLep9bzxIzFS++gQj3KxGwvEMeHoqzpsahKQKJ
	Pzz5Pey6wUxzS58cVigcPSYpb8kdiD+mlz1dO6oyWHt12VzSs3Q5
X-Google-Smtp-Source: AGHT+IHj/QA+7aGk/J1y/qlEAHos5RnBKqOiKcSp7UWvu0DLrLUaiyEL4yPIz/F95q3R+7JyFLfrcA==
X-Received: by 2002:adf:eb81:0:b0:367:9ce3:167a with SMTP id ffacd0b85a97d-367ceadb3e7mr4994435f8f.64.1720686429675;
        Thu, 11 Jul 2024 01:27:09 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:09 -0700 (PDT)
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
Subject: [PATCH v5 05/11] irqchip/mips-gic: Setup defaults in each cluster
Date: Thu, 11 Jul 2024 10:26:50 +0200
Message-Id: <20240711082656.1889440-6-arikalo@gmail.com>
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

From: Chao-ying Fu <cfu@wavecomp.com>

In multi-cluster MIPS I6500 systems, there is a GIC per cluster.
The default shared interrupt setup configured in gic_of_init() will only
apply to the GIC in the cluster containing the boot CPU, leaving the GICs
of other clusters unconfigured.

Similarly configure other clusters.

Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/irqchip/irq-mips-gic.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index e7358d3f4e74..4fd6e316616e 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -764,7 +764,7 @@ static int gic_cpu_startup(unsigned int cpu)
 static int __init gic_of_init(struct device_node *node,
 			      struct device_node *parent)
 {
-	unsigned int cpu_vec, i, gicconfig;
+	unsigned int cpu_vec, i, gicconfig, cl, nclusters;
 	unsigned long reserved;
 	phys_addr_t gic_base;
 	struct resource res;
@@ -845,11 +845,29 @@ static int __init gic_of_init(struct device_node *node,
 
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
-	/* Setup defaults */
-	for (i = 0; i < gic_shared_intrs; i++) {
-		change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
-		change_gic_trig(i, GIC_TRIG_LEVEL);
-		write_gic_rmask(i);
+	/*
+	 * Initialise each cluster's GIC shared registers to sane default
+	 * values.
+	 * Otherwise, the IPI set up will be erased if we move code
+	 * to gic_cpu_startup for each cpu.
+	 */
+	nclusters = mips_cps_numclusters();
+	for (cl = 0; cl < nclusters; cl++) {
+		if (cl == cpu_cluster(&current_cpu_data)) {
+			for (i = 0; i < gic_shared_intrs; i++) {
+				change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
+				change_gic_trig(i, GIC_TRIG_LEVEL);
+				write_gic_rmask(i);
+			}
+		} else {
+			mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+			for (i = 0; i < gic_shared_intrs; i++) {
+				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
+				change_gic_redir_trig(i, GIC_TRIG_LEVEL);
+				write_gic_redir_rmask(i);
+			}
+			mips_cm_unlock_other();
+		}
 	}
 
 	return cpuhp_setup_state(CPUHP_AP_IRQ_MIPS_GIC_STARTING,
-- 
2.25.1


