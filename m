Return-Path: <linux-mips+bounces-9665-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD6AFCC69
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 15:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92C543A79A0
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 13:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD052DECB1;
	Tue,  8 Jul 2025 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z9L5syEc"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315422DA15;
	Tue,  8 Jul 2025 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982384; cv=none; b=IWO1o6odCgOnUt46hoEzRvbUn3ZnzRoUxypESfn76U6hb3RA+Dl+nnaVLgvTtF3Tjp0+b3pV9Kdv+g0XKKeZB1VWgDuvblYPieVc4z0AuZMUBzS/mpW0w9R+FLhjJrYQdnK4lq2W1GWMiuBqJ7jK4fFzU77FZxEtc8VnMDr0z3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982384; c=relaxed/simple;
	bh=u3mOjZL8HlprN+ucqtSMLbYsiTcrRkQEcZv4axstnkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPE62SifV9fQ6U8rpE8ZqggRbnHQvyYgVnoVDE6Ovp/u3iC08xbNM9qMRdHCoLFb45Yq24bhA/dWqLG0BEbeEaaHZXq2P6pHNVp4+iITvvex2qL7hamZcOOixz2lkABIVFzjO75sRlItMTjVbE/6Whsv0jTExqnMEQMF5uMlO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z9L5syEc; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8292243A23;
	Tue,  8 Jul 2025 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751982380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynEjQanVjx7lJcfMhqKPdS9j3JjYwrWdI9qW+hDgZ4c=;
	b=Z9L5syEcixFSUv0ag2d92k4CL1O6UB7JVgtkpbULM3NuUC+0rvcLJFxn9Yb4YVMzJ02rc4
	yk7n1ZIUuBXUqLBw3PgV7hOkvZCwXXPTYW4TrXJYZaSn7hxWUiqH1UNNLRdjZzjfmXmd7U
	wCLztpxdlqKnJPFF+NxNKJq0mEtuoAv6MXkg36m/BSc3ZwZ+MqAPuD4j538apDAFOg3gIf
	bUiS5dDJGd8rRFmhNqZwhBoQBKHyImNtqc17UA4qxkn82xPx33EjGGzbsr4TPPUFmfg0yW
	3Re5BBrNF3q//1TrLHO/cC3I08YfbEusZWxOGLJDcmBIiNOG0RadcokfarEevA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue, 08 Jul 2025 15:46:12 +0200
Subject: [PATCH v3 2/2] MIPS: CPS: Optimise delay CPU calibration for SMP
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-smp_calib-v3-2-6dabf01a7d9f@bootlin.com>
References: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
In-Reply-To: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieejgedtmeeftdgrleemheguleejmegrvdegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieejgedtmeeftdgrleemheguleejmegrvdegledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfr
 hgrnhhkvghnrdguvgdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomh
X-GND-Sasl: gregory.clement@bootlin.com

On MIPS architecture with CPS-based SMP support, all CPU cores in the
same cluster run at the same frequency since they share the same L2
cache, requiring a fixed CPU/L2 cache ratio.

This allows to implement calibrate_delay_is_known(), which will return
0 (triggering calibration) only for the primary CPU of each
cluster. For other CPUs, we can simply reuse the value from their
cluster's primary CPU core.

With the introduction of this patch, a configuration running 32 cores
spread across two clusters sees a significant reduction in boot time
by approximately 600 milliseconds.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/smp-cps.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 6c5f15293a8e58a701601b242f43ba19a6814f06..22d4f9ff3ae2671b07da5bb149154c686e07b209 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -281,6 +281,17 @@ static void __init cps_smp_setup(void)
 #endif /* CONFIG_MIPS_MT_FPAFF */
 }
 
+unsigned long calibrate_delay_is_known(void)
+{
+	int first_cpu_cluster = 0;
+
+	/* The calibration has to be done on the primary CPU of the cluster */
+	if (mips_cps_first_online_in_cluster(&first_cpu_cluster))
+		return 0;
+
+	return cpu_data[first_cpu_cluster].udelay_val;
+}
+
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
 	unsigned int nclusters, ncores, core_vpes, nvpe = 0, c, cl, cca;

-- 
2.47.2


