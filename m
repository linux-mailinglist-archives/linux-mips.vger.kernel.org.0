Return-Path: <linux-mips+bounces-9629-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BEDAF9680
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 17:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1046C1CA224D
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 15:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E8E2BEC3A;
	Fri,  4 Jul 2025 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SQQrVaDz"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B661CCEE0;
	Fri,  4 Jul 2025 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642009; cv=none; b=kZ35fGvjwmHgFihHroKxmD8O7dmEg1XVkMTa3ezC8aFrH0SDgmajzRoqksf5gpo714f1k6eoO0xYgCL6oh5U6FlcNAYz3UipKlruW+qIh5L3yc4fUQwV/vfYXssWl8WW1H44wpN99Ofp4RA1yDJCHpxnWa4E2IVuO5Yt0qO8wQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642009; c=relaxed/simple;
	bh=fcwf7YfKJAeIkLvcCaYJ53dpv6SjXwc1DwOndJgGk30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuSnig9jePiVj8tH9fHc4ZX4S7on3WSfr9QEjVIYl3sE5lQI77zsQAnzJmuW9HBESdniLDcE3c6xPbzUdyJUiU5OxfBH3oGorX7OiCRh6SNbGsHo5uL4uUQP9JXgKsHy9aYMKOO/br3cgi98WSdyipzmpAXf1jCP060dW2zacjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SQQrVaDz; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F2AD44289;
	Fri,  4 Jul 2025 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751642004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QgtaQ/ncbSN/RDre0wgEPgUaRpu7wPSsUfotLVPVN9Y=;
	b=SQQrVaDzWxQ0lS5d6dipt5TiQzvt4CnCDPsU1jeaEyszai/m21Oab/z5mSLD7/G/syGP/p
	6Wj89D7bbDy3kgiyRQ3Qap28WwsEXBdXnvQuHGswXLhegyoAWaa5URiMivOxXN6A4QiSdi
	+P5deYYvvbYcgb9tklhUe8QeKSaJebRneYWFPQSaLR6IZOYwwUzPyrFhOy+//6VzP3UbAg
	Gi9DMHCLKGZrqhR8MEGVcluEkfvNauygtH/HTi8qs+ak3RLkGtbwAvniAgNp/NxjhWS9Ep
	Nc5IU6GDS5H2S1IQGUfAO+X7F1gSFc8dfEwJFDr32770MFKuh1XgaL29IN0b2A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 04 Jul 2025 17:13:12 +0200
Subject: [PATCH v2 3/3] MIPS: CPS: Optimise delay CPU calibration for SMP
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-smp_calib-v2-3-bade7e9c0463@bootlin.com>
References: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
In-Reply-To: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggrtdgumeejtdehheemugdtudgvmedugeekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggrtdgumeejtdehheemugdtudgvmedugeekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihou
 hhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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
index a5c538742769dcbf22e27d2d4485c071e2e64ec2..9c4882c3c69d20f15d4826f125e975e64e712e9b 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -283,6 +283,17 @@ static void __init cps_smp_setup(void)
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
 	unsigned int nclusters, ncores, core_vpes, c, cl, cca;

-- 
2.47.2


