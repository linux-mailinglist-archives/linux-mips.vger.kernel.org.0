Return-Path: <linux-mips+bounces-6156-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BEB9A4BB7
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6BF1F2359C
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA181E0484;
	Sat, 19 Oct 2024 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH0Fd7Po"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193C1DFE31;
	Sat, 19 Oct 2024 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321868; cv=none; b=egmFR5DtX9cHDc4AdA+RYCBs0wpJGY8+iZol13dCss995nUzfM7HIjUuurbRr/ogoBJrBJw7Pt2MLt/j20rUK2+gfRYp6SG3XCGQcUq83lYfXQNNbP50lzE5f381JJa/A+OPRd8Yqtvz2jZbhFtQ220Ahc46kcb45owxCtyjNjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321868; c=relaxed/simple;
	bh=UYR13zTpnsVdjyChblEe8JTdypBUsbR67lFCXkmUjXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gk2f50yb6PnbJiF6YwQ6oIVFZqjvzuX0tb7kQQgNRICRKDO+8BNh5GcuITjdLfSrxbHSe8DSGfDd5n7VY7rJoemY2wt4Xdqf6fJ8tPSVnc9Nk2U6BVPJM0tHPLuJMK+izRyvjsWbYz/MalA18PXyBTiuSN3sHWqIhnX4J7LiRJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH0Fd7Po; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso3055681a12.1;
        Sat, 19 Oct 2024 00:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321865; x=1729926665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU2+3TuVWKSNcAj+UxUj5vL8IK8tlhYUuvDJAWOUIuo=;
        b=mH0Fd7PobWcqMud7m7z+QTbjJ+cQtmdTHSEJnCNx5/+3axXGAUc2JyNE2+0w4NEj3E
         QIR+FspwAn9sFpHuKExK760QRKC04bAZGrBPsiBjyUKG8VgdRBlNA9wrssYNxsiQMPtX
         VX0ghwsse3LP+paBU01eikjRX9HPOwuR3eKagRs5queHmJJnfzB05P11tWw3LF+4fW4+
         oRBO32wFig1l/dJrcoq6wY/D0KR0pe3rj1SKFZBje4hvzafmZDlxl376DBf+bTadJGYi
         gehYGtPtLNii8odZP2VryTDkL1dZ2CGrXRgFNRaO9UGnUndlL4o0oAszFEIVJkVn/uYU
         SW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321865; x=1729926665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU2+3TuVWKSNcAj+UxUj5vL8IK8tlhYUuvDJAWOUIuo=;
        b=GMDAqptZCue7woMHp/3/ilc5oTJ8AEGGrAxLa1L+xKixO8QJyIeXUCVnwIIUJxaJJd
         I0Dk1DIjg09HwKbbuNUK9KQD5yV8wH2ApHmpigNGDsD5qCJCah+mgl7z+gAJ4TyLYLJW
         NXK5YHfNg7Y1VEK8DoCF7JcdsYYAD0czSf/UXjRki/JJaMocTOTSDP9bzb7bZcFAMnkC
         4GrTEoKh269payXc6iKkKpuiLgB9Co4FllbC2Yp7QMpQlrf+n7Yk7omg1ilhUXeDJ7qC
         rckCZ0SS6Xv1aKia/6U88UYahnTP4TN0FgSTwnzLhqXZCGdf+al3FmmFSZlXpxYBrHhx
         6nAg==
X-Forwarded-Encrypted: i=1; AJvYcCVvYx9SC/5FbSRiaWBHVMOUgcigkwmUwOdzh7QSoq43BqrDrwgOnKmK83BM1abr3HQe6gjXpvAG+ZahKJQ=@vger.kernel.org, AJvYcCXjhKudUcno+0uE9ZgdNibovWCwngewL4P/JQAzzD9dnA0cMTdQHGXBi8Jt6HE+B/3gAX8SQOv34EeRKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynH82dW04Ktr6c7msNN6P0COymClJtZR2NOwxYQX5h4eKogQ3O
	VRwVltKXB0OnjvvgDF3jOLXvTXIS151qr7ArgzIgzEmK8s+fGdIJ
X-Google-Smtp-Source: AGHT+IFXMiII9k2Ah/EX3izTyqFCLgJcV85Yfj0DKVvorEzpjcpOTu8ppf3hVL1oWKEx3Wo/VF16FA==
X-Received: by 2002:a17:907:3f9e:b0:a99:c075:6592 with SMTP id a640c23a62f3a-a9a69cd301fmr465581266b.56.1729321864593;
        Sat, 19 Oct 2024 00:11:04 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:11:04 -0700 (PDT)
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
Subject: [PATCH v7 11/12] MIPS: CPS: Support broken HCI for multicluster
Date: Sat, 19 Oct 2024 09:10:36 +0200
Message-Id: <20241019071037.145314-12-arikalo@gmail.com>
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

From: Gregory CLEMENT <gregory.clement@bootlin.com>

Some CM3.5 devices incorrectly report that hardware cache
initialization has completed, and also claim to support hardware cache
initialization when they don't actually do so. This commit fixes this
issue by retrieving the correct information from the device tree and
allowing the system to bypass the hardware cache initialization
step. Instead, it relies on manual operation. As a result, multi-user
support is now possible for these CPUs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
---
 arch/mips/kernel/smp-cps.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 4f344c890a23..265cf52c0dd1 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -39,6 +39,7 @@ UASM_L_LA(_not_nmi)
 static uint32_t core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
+static bool l2_hci_broken;
 struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
 static void power_up_other_cluster(unsigned int cluster)
@@ -254,6 +255,22 @@ static void __init cps_smp_setup(void)
 #endif /* CONFIG_MIPS_MT_FPAFF */
 }
 
+static void __init check_hci_quirk(void)
+{
+	struct device_node *np;
+
+	np = of_cpu_device_node_get(0);
+	if (!np) {
+		pr_debug("%s: No cpu node in the device tree\n", __func__);
+		return;
+	}
+
+	if (of_property_read_bool(np, "cm3-l2-config-hci-broken")) {
+		pr_info("HCI (Hardware Cache Init for the L2 cache) in GCR_L2_RAM_CONFIG from the CM3 is broken");
+		l2_hci_broken = true;
+	}
+}
+
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
 	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
@@ -307,6 +324,9 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 					   sizeof(*mips_cps_cluster_bootcfg),
 					   GFP_KERNEL);
 
+	if (nclusters > 1)
+		check_hci_quirk();
+
 	for (cl = 0; cl < nclusters; cl++) {
 		/* Allocate core boot configuration structs */
 		ncores = mips_cps_numcores(cl);
@@ -368,7 +388,7 @@ static void init_cluster_l2(void)
 {
 	u32 l2_cfg, l2sm_cop, result;
 
-	while (1) {
+	while (!l2_hci_broken) {
 		l2_cfg = read_gcr_redir_l2_ram_config();
 
 		/* If HCI is not supported, use the state machine below */
-- 
2.25.1


