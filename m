Return-Path: <linux-mips+bounces-9679-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A7AFDA1D
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 23:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17034E6CE4
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 21:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324142248AC;
	Tue,  8 Jul 2025 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hm9omw8v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i31DRMRU"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3638D1A8F84;
	Tue,  8 Jul 2025 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752010981; cv=none; b=jxnS4yMAAYTad2A+Y0kHMqOq3bzRJb8aHZAeJS59dDLsNZ1qmFDhYZZoN7AUcBrVM/A7SwIOLCAReJlq5nV3MDtDH+0uQI7dGxXf7pXJVU7FyDKMAsTMke+3hDMQQuC8TocC4ruea32MWg06qFJ2Cig9sPa1mjr63dINdYUaKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752010981; c=relaxed/simple;
	bh=rlUpxaefP62xVFcgqrG1RemxR+OP20zTE2mFC8Jwm6k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DvB0YZ22VlVlWDDJQgxKHm/46w0Ip9BSl2ZWYzRZXG8Aun0LfCHYId5R8AWC3/haLvILeAe/G7MewozdyZaEFThux5UT22JOuT3PtOyI4R9VIXt3uqpF9ftMMASxiuWku6rUzoEn818rooCqptak1AghznZroV5erhYlFPO9sX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hm9omw8v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i31DRMRU; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 30B157A0139;
	Tue,  8 Jul 2025 17:42:58 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Tue, 08 Jul 2025 17:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1752010978;
	 x=1752097378; bh=122JoHfcZ2JTLSx2NlHDO3Rynz7MlgiM2NceyIsAJR8=; b=
	hm9omw8vjMbPKDGX++H2mY6IRXMxRX6qFobPArQl0D6xBWgG/cXyVs6qLebnorHd
	bTNGQ1gvL1CsluoyQPv7u3R62ujhivXiPH1dUJopwpVWO1somJRr2RjG5PfbH0rd
	Ep5IekVW/GbrmWSezyMjokjoJfpB3Z9UhafVEX6uIBBnTZRQzfkR55DNIhkd6ccg
	6KW5x05fdlZr1jCZ63TMwDMbYo+Jg+vch01lZn+MUU0CRytjcMj2DM1tSavgPhag
	SLjhtkvHYCerVIZTyENRbhPfKAVNfrQ9BzMMmMi8m/Iz5+8m0bT1vZgKswnTqEff
	ctqSIQZ0j2XMWFLJSFqw6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752010978; x=
	1752097378; bh=122JoHfcZ2JTLSx2NlHDO3Rynz7MlgiM2NceyIsAJR8=; b=i
	31DRMRUltTAQdMl96JTnzTKm89i0zzgEx5fV7w8PBQS6SExdndtOQkdsFEnAFIkG
	LXU8773vUzW988F/IpVx5/KBmCElG7a5TA7lc+EvGl9/agyi88M97hfzWY1yKjtR
	aWYmwo2R/d5k3Ccu3YlhWBBjV1qNpH7EKUrgCDWsVbpDtyDsQL+VzhOL/fjQqGg1
	z6fee5a/dadw3sFV27hqsEVN+NTIL87ori8sBRq7vvMcv4R7HoLi53T/Oi/nVCTU
	SgcGhXYee883sRedRk7bosTB0Sajhps08EaX+V6zTSQkv36lmI5ViEWOpFz39ceW
	2IDXf4lZAV3TNT+hak/Vg==
X-ME-Sender: <xms:4ZBtaPaLeoVmism6rhms5Yt2xjzC2aDnfZEe12eYG-66vCzt_R38bA>
    <xme:4ZBtaOa3qpEpHQVn53itbuntQTdz7e9l8ZlxxPkKUHaF8nXJ2CDZVK1XALFY7as4E
    1awkNHxEkMlm3dOO8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghm
    vghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnse
    gsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhi
    segsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmh
    hosghilhgvhigvrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrght
    ihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4ZBtaI5LZF_6NA4mBvxL4sljGe2YDehU1y0rPAteLsCj_jRLaXGZHg>
    <xmx:4ZBtaGyUmwvJ0V_oWimqnGxRDXg_FnZ3gDVz8w_ojxSMlM6DIA25Hw>
    <xmx:4ZBtaHPvs0FAqChrcG-QpYL6USL5_yBjLJYLMAy787jS_NWga4HR-g>
    <xmx:4ZBtaMl1QpzmvpylhpA5q1AB7Jvx4gW_XwHyiewEB4HApf_-hQHlVA>
    <xmx:4pBtaAuQ5kCk3cba5sDNk5GkJCIdw8tebhis12cdBgHKG9GKafJiYco3>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D62642CE0071; Tue,  8 Jul 2025 17:42:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T0d515a0de5731984
Date: Tue, 08 Jul 2025 22:42:37 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <cd148cc2-bc18-43f0-9b6d-1b59b45cb400@app.fastmail.com>
In-Reply-To: <20250708-smp_calib-v3-2-6dabf01a7d9f@bootlin.com>
References: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
 <20250708-smp_calib-v3-2-6dabf01a7d9f@bootlin.com>
Subject: Re: [PATCH v3 2/2] MIPS: CPS: Optimise delay CPU calibration for SMP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B47=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=
=8D=882:46=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> On MIPS architecture with CPS-based SMP support, all CPU cores in the
> same cluster run at the same frequency since they share the same L2
> cache, requiring a fixed CPU/L2 cache ratio.
>
> This allows to implement calibrate_delay_is_known(), which will return
> 0 (triggering calibration) only for the primary CPU of each
> cluster. For other CPUs, we can simply reuse the value from their
> cluster's primary CPU core.
>
> With the introduction of this patch, a configuration running 32 cores
> spread across two clusters sees a significant reduction in boot time
> by approximately 600 milliseconds.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>  arch/mips/kernel/smp-cps.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index=20
> 6c5f15293a8e58a701601b242f43ba19a6814f06..22d4f9ff3ae2671b07da5bb14915=
4c686e07b209=20
> 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -281,6 +281,17 @@ static void __init cps_smp_setup(void)
>  #endif /* CONFIG_MIPS_MT_FPAFF */
>  }
>=20
> +unsigned long calibrate_delay_is_known(void)
> +{
> +	int first_cpu_cluster =3D 0;
> +
> +	/* The calibration has to be done on the primary CPU of the cluster =
*/
> +	if (mips_cps_first_online_in_cluster(&first_cpu_cluster))
> +		return 0;
> +
> +	return cpu_data[first_cpu_cluster].udelay_val;
> +}
> +
>  static void __init cps_prepare_cpus(unsigned int max_cpus)
>  {
>  	unsigned int nclusters, ncores, core_vpes, nvpe =3D 0, c, cl, cca;
>
> --=20
> 2.47.2

--=20
- Jiaxun

