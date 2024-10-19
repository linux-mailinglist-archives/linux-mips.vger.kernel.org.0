Return-Path: <linux-mips+bounces-6148-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 331559A4BA7
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A261C2166F
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE7C1DE8A1;
	Sat, 19 Oct 2024 07:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G50LRNVe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748911DE3A3;
	Sat, 19 Oct 2024 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321850; cv=none; b=IAyNdM/oNOAqwf7g5c694+3Rj8e7B6Mhx9hwf6MgfPultM3TOVU0Gu/Fx9LMbxMEVmDpUoBTSvqsssPeDoGwMy37A9U8THRe+jGQSABqG8hCZHM3K0aieDmnkDlmvBW2Y3dcQoVYJN/MrZG1NuUO8BEe2LPRrIJpvXVFeI8qS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321850; c=relaxed/simple;
	bh=F+ZcSGOqx9X/ZvXyBUNOAihkxk6As3xiu6/7A855sXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eg0fcUgM3tseD5uQ1oVsVmsc6ZyJ/g/5/1U/bjUL2b6jLFZHlEtFGgMpBbWo/wH6chpRfYu3B4qvVb7rnP3ad9ZIrM/zoNk003pkrZ5LlcGzH5Jv1E/DuvDwn2hbHQV6T1ly6OT+YH2+LcXiGFAANvL1JCKoUWWdwQBDLyHhoIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G50LRNVe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso400217266b.1;
        Sat, 19 Oct 2024 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321847; x=1729926647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz0kUjpzsFWVo1j1eqZUTSojq1aOuYqxFxKOuRH0s6M=;
        b=G50LRNVeDrEr4KQmJdYLnv7YfvlYCxB9VnNm9jRA6rcW3VwSuOjQ6xu4JARZfTVU0r
         G4Ww8dQOE8tZSNLSPrkAFA5hkuv9y/PMW8dvNDxYwkxaBGHBeJ5t/34ucfaYdHF6wzSj
         Y7GWd18WYTXf37yyaxeHXoDZl7CaWRHuq6FDaRwFNi0srZl5ErMKAM/LZ/+PNU9TgBsa
         WQEEStzTmKWsnJb6WqMciMamCjMcI/vBgwSQ0+MoOhlzW7QNgh0QFtpUvSvtdabFhJc9
         2Rf7wMZEfnxzkW/lDO/IUL4XmswXITMnYEqVpDyMp895+ZJnPdnymVdKjQTaNqe/gxvu
         FFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321847; x=1729926647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz0kUjpzsFWVo1j1eqZUTSojq1aOuYqxFxKOuRH0s6M=;
        b=dIoR/AWee8TYdmMNqzdh99c6C8VpZriS6VezgRPZEj+G74u8zGv+sj6TOI9Y28zkkN
         hZTcO31PrNAxKC49G6GP0EJK3ASEa4ToL1HIkPtVH3T+MyAMR9vLBmKoi+3jM5Yv/hS8
         HpTNbwOhSHioWB3r0XOAYoDawC5NOj56Ly/fRajXWfYpZhmgZnF8oI61ah45BuvzttMS
         ZZUc1SEtdU+tk7DVogW1s5aEHyF4MfgybllsFN+nYOJ+StNV1iQC33h1a7jMaexEBTap
         eFcxGay2uvyRqp0GpgeUHTRREQ+z1wsxyu0Imd+Wi9upIzJbZG9+/LkuShUnN21ykqF5
         1QuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW4X2qGX45V/5oYLm7U+tN/mdZkHEJiuZj0b2+UGrVOL38teuNT3AY8HtCSAIlAAmCYWoYrAJYBAlaBA==@vger.kernel.org, AJvYcCXWSvIoZumhd+hZL+3UHpfbMVY3BWC1ohZ4ZDd+RH6EH/281ChlUNMXaJalGq29Hpv2OvXIr/a6/3qg95Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXtTcgVvsUrBqTqB3divPxtqDdaZC5Xb13k60aWCx7ZmCYRDK
	rwxr6L4pe/XD6RpFl5WCgxLqjd4I1rk/U0FhGKvAmgRaDudTfWQE
X-Google-Smtp-Source: AGHT+IGu3lkYPoo6x2nm8178jeDi1BdfNNEofeFQVnJ5yAzMmtmoaQO4zTRkzYlsyYj0pX52xdOEyw==
X-Received: by 2002:a17:907:1b81:b0:a9a:80cc:d7b0 with SMTP id a640c23a62f3a-a9a80ccd822mr99402966b.44.1729321846622;
        Sat, 19 Oct 2024 00:10:46 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:10:46 -0700 (PDT)
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
Subject: [PATCH v7 03/12] irqchip/mips-gic: Setup defaults in each cluster
Date: Sat, 19 Oct 2024 09:10:28 +0200
Message-Id: <20241019071037.145314-4-arikalo@gmail.com>
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


