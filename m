Return-Path: <linux-mips+bounces-9735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADDB018D7
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 11:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1963A29C8
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 09:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E7F27F4CA;
	Fri, 11 Jul 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cBkSdE7u"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDADB27FB38;
	Fri, 11 Jul 2025 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227669; cv=none; b=kuFYTcFqC/ZJOoQgckJdNjpv9vKTt4fUfFM+zOWRc4hDrvZ8oM6TPjblmtkSr7g/26fMwMUcuPFOlK1fora1YefSHldgAbZ3rFdXNk8oCn9GN4+zedHRdbqhQCLZQfCDf6RmxEXwJVfI+DkI4ik0AIfUm9hJAOeZ/5qRqAEcZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227669; c=relaxed/simple;
	bh=k492wyPg1/aSmygem0XNrsfXTcZ/jKItqYhTy3qtMs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnXW3w7G2XwEEy9jkhjk52NkphUos3EKep+nz5RjHqI7SQwGASZ9DAIBsr2TBhJUnVwEfCIRCfzVWB8j/8a/NvKM6DfcTTQYqU387swjTf/+irEMH3p6Ula0tpCutjmuzBBJGtnNWcUz22ci76odFylnQaMQc5xjo4TwYAIv+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cBkSdE7u; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86D44433D0;
	Fri, 11 Jul 2025 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752227665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRYTwmrTTEIRWgg+kkfZPmUJH6CKDeujlUlFeIiF8II=;
	b=cBkSdE7ukb8fyBUMmszSIuoxzoSSNxdDpo/ZtLQzAC3ULJ8tlsrJ/kINaY/Vbo5qp/Xsjv
	0Xpv7nt8LfvXEmCI/f9h4Cf7u0LPhivL6BPTHfHH/f4tIXCH0OS2FH4qpErp6RryeDtmZu
	d/lmhKAj3ZXus7CPBCrCnaJb3lyuaqZHgOJntLrHef+dKH48VjF7z1ChSmEss3R34c2Pwk
	2+XPID3ZgtO3SV7+jiEl0B8THTTtq/0/BgYlBLWIXtL+L6PZa+J5wihRNtpQqNgGNXFUF1
	lNdnWhZnsvQzpjHCQXkRehpnFLe0HeDUwx/4NT84eHKZRZ9uTFxiPemHPebn+A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Jul 2025 11:54:21 +0200
Subject: [PATCH v4 2/2] MIPS: CPS: Optimise delay CPU calibration for SMP
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-smp_calib-v4-2-1e743b225bcc@bootlin.com>
References: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>
In-Reply-To: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemgegtjeekmedvkegtvgemfegtjeegmeefgeegtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemgegtjeekmedvkegtvgemfegtjeegmeefgeegtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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


