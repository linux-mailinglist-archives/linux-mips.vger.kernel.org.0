Return-Path: <linux-mips+bounces-6522-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C79B389B
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63AE1C225F9
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DDB1E25F8;
	Mon, 28 Oct 2024 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lregVJzZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EC1E103C;
	Mon, 28 Oct 2024 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138405; cv=none; b=fu7hSTwVkjfPVNVPOHlsz/QdTppvXfXCoDefr9Hag8RuvHdP5gxdRqQVGaQnSiE+nrwMzsWxJwMffB7Y1Uz/pWNubwdsV+DJqSriWPl8QgC7eG0r73MSJ6ar6UndGLzaWi9HHfk3sAdZgGVuSs46IAa3Vpj/SXxaetD3V+fky7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138405; c=relaxed/simple;
	bh=kIF9957r5L4wQ3ncmcvDTVAMQbE/zBtqFZPtCQuRNUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ahAYcaraiYCGLRGoo9j3Aeug+6sQ7k6PmpUPRvL11WZ6C4zeMINeTxA57lwt9GJdEAVAriujvk16Lue6cnHB/ScWOlgcAQezVmtI24GPi2IkHd88DCUbENqTAQq/HH41KVnnvA7aHwK1tttk0FxWXzbx0KVWcIp/wUiIS5ZEgj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lregVJzZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso6100427a12.3;
        Mon, 28 Oct 2024 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138401; x=1730743201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zQMaFDQJWlsPtf7l7ch6SDTyUDA1/vrM9zQnzmMI/Q=;
        b=lregVJzZ0Z+5wUhHgCDlNEIDThTfxMhQ5/CTihGnQsLZ4y0oRJ38WDOKjNohU3mFG5
         EhzhOlBWsP4/4NvxZ+yxuriOBGoAFVOaUJvtZyVkOtJ7Au1cNcW1vcjl+RZj+p/HEyqL
         P2njiXMB9fN+StfmXoj1Vt/PlTlAMMZEbjtNi4f/G1jXAkHRQsGcucEETg7lk6BUdKbd
         6pZ75mG2QsBKJHwZv5arGBBbQSBJjlnS7Mhu8WIKOhjeIyHwzuKJUs7uh/r9SXR5OJQB
         m3/U/yJRRM4VrYpfylo2mFdFR/pcQxOhprDI6RtHD04QH2y4iUL3D2ZFeHHsXVVcT9Jg
         tCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138401; x=1730743201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zQMaFDQJWlsPtf7l7ch6SDTyUDA1/vrM9zQnzmMI/Q=;
        b=PMOZ+m3Isk+Y3ehpb40xdRiIOoeyXh2X6DTwRbcv53zY+9emiKKP2QXEMa0YgXRtin
         4doOlYEtWqx7RQchuuArYLrAvnkVQLTeCyLmd0tHfiZtR635+l/ScBTNU8IIKJDqTLe0
         27gb5iZL+WuRj+zzjnxyr4Arfz40/Kfk/SAtNoUhgFgEinjCgZ6iCUHSltYJq3STu90i
         l+p0YPX0pGCPK+z+fRcnJyt9wtd3TMluvHlnE6NmkUY4o6rhMO/kJWvH2VWIpfFhLjiT
         Wc5ynUnfAX+Np4xB91uaNND2kMYuIaezJcKL/wvylbK1xT4uinZvVU7/Rgz+zVIONviV
         +yoA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2VGvoYlKKAxkm5U8EISfVhdbbENyMzUmO6pL15Pz/0EVes7jHtAO2o+804mJhl9k22zOAaUVlMC4+A==@vger.kernel.org, AJvYcCX0Tva98/hAoDuDd1vFOqGnfYHCj9cqD3FP3rJbsF3u+Dfeor+M388wHB2jbFzqGl3GP4XqdsOyp6q3@vger.kernel.org, AJvYcCXqTl/ZA2+/WdR0SE6wsF2HjVcSNbmlM/mLJPM0exAoyw6DEqnD+DJvuuB6l+8z7eOYkOI/mRy9R5LTqaGi@vger.kernel.org
X-Gm-Message-State: AOJu0Yweaud5KyLvb+p3s9TOflo6O71gse16JMFwegGxywpipSL6Ybvt
	vOBLISVG2GonF38yMzYt7pjjSUPb6SPrmqhFl1lCFLM7K/lhUitE
X-Google-Smtp-Source: AGHT+IFqnX5pduxZANYQv//6T59Mipqh6SvMZuDqlQSJ+Vw7ZNoz6+YT7RHKAvn+U4U/L1CUj2lg/g==
X-Received: by 2002:a17:907:9495:b0:a9a:5d15:26c2 with SMTP id a640c23a62f3a-a9de619c888mr874683166b.45.1730138400924;
        Mon, 28 Oct 2024 11:00:00 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:00:00 -0700 (PDT)
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
Subject: [PATCH v8 11/13] MIPS: CPS: Support broken HCI for multicluster
Date: Mon, 28 Oct 2024 18:59:33 +0100
Message-Id: <20241028175935.51250-12-arikalo@gmail.com>
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

Some CM3.5 devices incorrectly report that hardware cache
initialization has completed, and also claim to support hardware cache
initialization when they don't actually do so. This commit fixes this
issue by retrieving the correct information from the device tree and
allowing the system to bypass the hardware cache initialization
step. Instead, it relies on manual operation. As a result, multi-user
support is now possible for these CPUs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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


