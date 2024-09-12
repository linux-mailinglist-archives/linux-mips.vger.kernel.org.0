Return-Path: <linux-mips+bounces-5542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF49765A0
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D663B23DBA
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD1B19FA65;
	Thu, 12 Sep 2024 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsUHJ8pb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B578519F421;
	Thu, 12 Sep 2024 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133464; cv=none; b=iDXmeIujLjx2+ioDlJz8SseUOgXEAjfRYYQkMzrC38A/YgR5V01EvXiM2LZ2AlSpo/laMElBthI58XZbrltLL1iSAX8iUHbQ4nTHlIuXtSxsNHnF7ZNKReDSNqT74kTjb0ppr6NxEA22I4qNBFydRnpcANb9PrDXMGBnTqo/zzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133464; c=relaxed/simple;
	bh=F+ZcSGOqx9X/ZvXyBUNOAihkxk6As3xiu6/7A855sXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eZCzcomFAugCuWisgJCZ2sg3u4CbmQWujm7FqRWDQDz2c9tAEtzwCSvJN6RH1UhAuISVX27jGdkrE93+qPXDf6h/ZvMgtfxqMFhZEaDaF4EUz88Gt8ehUlCJWGpILvUv6IPlCQsPN6TUjeGAP5iB0H7pi+O4s+8Ssoq0LD3gd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsUHJ8pb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bbffe38e6so5690875e9.0;
        Thu, 12 Sep 2024 02:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133461; x=1726738261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz0kUjpzsFWVo1j1eqZUTSojq1aOuYqxFxKOuRH0s6M=;
        b=OsUHJ8pb13qQXuQjR4jWe5M+qmLGmWpLw8++YjCaOLFM2GEQcEzaQQQUeCFKusHsr+
         wR3Z9Ndx6ikNPQoxmxibt7Elj/K3LPKdgPuwXztMdeGkirPNJO9QVNHfZ76lOwmzF4Or
         t8OJebMeWYXRd71ARwNGh7seUbw+QZeT+YAphALERYWC6TWt9R+1+B1j5n4P8g7BquP3
         KJ0QZo063wUkiMAi9stb/h77EUh9dloZr9evimYdNrFIsC3x3zMZbiDnJsF3cexubgpX
         ngVlqU55Ll9XMdyP1mR7D2hNgcVsVnaASGzaruKmuik1SeKvJvppK20ALN3sJShkugW/
         9qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133461; x=1726738261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz0kUjpzsFWVo1j1eqZUTSojq1aOuYqxFxKOuRH0s6M=;
        b=T6/jmSz6KQXX57pwL9sIHyo9EuQ/rpaHU1UNUpAxN0Ntc4LyK2Amruyynxn6fvx7AJ
         t5ykfE/qS61fsDTwHttJ2BqBa8yUuFcZ6Pbr4JAFg1Pj/xqifmsZK/KDqpRm5s7fU6zr
         eaXkIsDPIZoFvb0nUhUramDz9glHq53gcaGA3i64TJ6ld5yjsMKLvIsiqXlR6zkvktks
         BSWQ8fICvUq7FbmwpjUnfi0ZdnggqtzzfQMGR3TpqKLb/Ir7LW6/S3go2TpadRYjh42m
         mOTqJE+Jem6DClYNuDyJV5Ji201W/ahSdMw6axASIBko12JbaSkljJukfD2ozgQoLxg9
         3A4A==
X-Forwarded-Encrypted: i=1; AJvYcCW3IYQGexo5TCiGFrALJq4dCunN6tq2S0EB4umoK9QJZq8aSbqngjkp47oGVTZ6I8RvNO87glP+GE8Tbg==@vger.kernel.org, AJvYcCWotzWUsiYz5RWo50/LBJ60FYTqxa1dH81iadUBMULu4uZ0NnPYvDc0eWlO++beHQ3k/yvumIbKSfrPj2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRzGIg+7zSu75sSSIy/e9GcD86/3QPqB/wqRVZiXzrlHPAFKh8
	aelo7a7QXqjqAJ5L3OYZyXsgKKdB6TCJ+WKrR6CwbIM0V5SnBd1C
X-Google-Smtp-Source: AGHT+IEuBnqLhcEUuPRV/yZSG+3KlKTYwY3VBgwE8+43RgJAjvCcbUKrxv2gmdyYCRwqY6t0nVrOOg==
X-Received: by 2002:a05:600c:1c27:b0:428:150e:4f13 with SMTP id 5b1f17b1804b1-42cdb572754mr16614615e9.33.1726133461065;
        Thu, 12 Sep 2024 02:31:01 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:31:00 -0700 (PDT)
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
Subject: [PATCH v6 3/9] irqchip/mips-gic: Setup defaults in each cluster
Date: Thu, 12 Sep 2024 11:30:45 +0200
Message-Id: <20240912093051.452172-4-arikalo@gmail.com>
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
index 29bdfdce2123..d93a076620c7 100644
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


