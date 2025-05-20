Return-Path: <linux-mips+bounces-9034-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E4CABDEBF
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 17:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3823918915BE
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 15:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BDD2505AA;
	Tue, 20 May 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TCzYOyEK"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177E2609F7;
	Tue, 20 May 2025 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754484; cv=none; b=laUU+TwnKkpbl7JSMWhJjAeD4nOOc+arBzIm+XCvoTzEGhzpR0gw2CWQ/VF7z1NmVp2TCwWOojkyAMDi38BCIHXz/kW8vr5VWCuzx35MUkAg6Il8EqS4Ib1WZtp0eJ32uZPX2Z129LUaDVY9kzbCp+sspu7MVDKPD5w6Vum1wpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754484; c=relaxed/simple;
	bh=z5P7CONT1ywGaof5hgEJNdVhBVbo2agcMGUmL6IeqjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HaUmTFUHnXh8jGfMBTqejZHPiIdB/dxkvz17nTv7rroJn06cWG9gZxg1SI7Z/bkKEq8NaR1RBBmpkV8bcLzz+UNIQHRThgyrpFsuOAq7yq9KJxQQ/kTlhSxxEz6KDT9YZZoP38nSva/8lUrPvZZYUMtjhPLJHAxio05bpUw/1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TCzYOyEK; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23C5C42E81;
	Tue, 20 May 2025 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747754474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MGyH80hKA3CxqDOT/ua8xdpa3Pj377K183xum/RA554=;
	b=TCzYOyEKQ984Ooen127OdWcxXhPoHo9DPpo46TqW4elbi0SZl+rikIxKRQsiif9LnhoTSN
	4sZJQpv58c4LFUhOGmr6XykuGbzaGVwfx20Pk0MVVRDkgNFpx/B2yv5n9JvGLUO3+iCvDL
	9LxjxS4WIpL7MchUfwZaZTJrkvxl3J8/x51n4uARAnqOICfnsfmGapdOC+fwmtWHl5XXYP
	iHmtAgSa7+JudsLVWree2NRrcrd6/33QHJUAeQ+xXAWgp2yZRlYDbktg0gpj0/islY9mtX
	uZ/f982CP+F3CMWOUPXpiAzo1lthQIgukM8OqKzLV9WRReHcstZiPJj2Rq9WuQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue, 20 May 2025 17:21:11 +0200
Subject: [PATCH] MIPS: CPS: Optimise delay CPU calibration for SMP
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOadLGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMD3eLcgvjkxJzMJF2zFGMDA8tUwzTTJEsloPqCotS0zAqwWdGxtbU
 AdaG1vFsAAAA=
X-Change-ID: 20250520-smp_calib-6d3009e1f5b9
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdehheejveelgefgleffgfejudfgudeludeutdfhleeiudevffegueelkeffudfhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudgvhehfmehfjeehheemvghftgekmeejiegtvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudgvhehfmehfjeehheemvghftgekmeejiegtvgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
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
 arch/mips/kernel/smp-cps.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 02bbd7ecd1b9557003186b9d3d98ae17eac5eb9f..93e01b90b4a21323c7629350211083a81eb549d4 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -40,6 +40,7 @@ static u64 core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
 struct cluster_boot_config *mips_cps_cluster_bootcfg;
+struct cpumask __cpu_primary_cluster_mask __read_mostly;
 
 static void power_up_other_cluster(unsigned int cluster)
 {
@@ -225,6 +226,7 @@ static void __init cps_smp_setup(void)
 		if (mips_cm_revision() >= CM_REV_CM3_5)
 			power_up_other_cluster(cl);
 
+		cpumask_set_cpu(nvpes, &__cpu_primary_cluster_mask);
 		ncores = mips_cps_numcores(cl);
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -281,6 +283,24 @@ static void __init cps_smp_setup(void)
 #endif /* CONFIG_MIPS_MT_FPAFF */
 }
 
+unsigned long calibrate_delay_is_known(void)
+{
+	int i, this_cpu = smp_processor_id(), primary_cpu_cluster = 0;
+
+	/* The calibration has to be done on the primary CPU of the cluster */
+	if (cpumask_test_cpu(this_cpu, &__cpu_primary_cluster_mask))
+		return 0;
+
+	/* Look for the primary CPU of the cluster this CPU belongs to */
+	for_each_cpu(i, &__cpu_primary_cluster_mask) {
+		/* we reach the next cluster */
+		if (i > this_cpu)
+			break;
+		primary_cpu_cluster = i;
+	}
+	return cpu_data[primary_cpu_cluster].udelay_val;
+}
+
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
 	unsigned int nclusters, ncores, core_vpes, c, cl, cca;

---
base-commit: 3b3704261e851e25983860e4c352f1f73786f4ab
change-id: 20250520-smp_calib-6d3009e1f5b9

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


