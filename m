Return-Path: <linux-mips+bounces-9035-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F229CABDF38
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 17:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A75C17ABB1F
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 15:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A444254AE9;
	Tue, 20 May 2025 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Lt60fuJ4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qOrC+dsj"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A3250C18;
	Tue, 20 May 2025 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755366; cv=none; b=SNFraFa8WrJ9ImiW3f6giE1eEgqZ8e+cJ5HVj1ur+fxhAzdXTAp2O9JqdVZ8jRLavl/EdIlWIomrAZrBvKV/kSmSYrAhKe0gNyqnLUpdJup9ODUKyW3/nedlTRkN7IFLV8l2P17AjnrAK8GmulcLw4OKZWakftLFpZ/rsx8LRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755366; c=relaxed/simple;
	bh=Tn7bzSywf0PlIW4GyXdCaLDy3DC9QlWpUhgKs091JAg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dd2Kn2HtYnKwEvAk2QkAUN9BnJCN7aT16jcY1Ea9zpmk07Av/M/3I8lKFRfGbC6wj0Ix2norGbhvwTbmQoiPQqV6M58rh/ItxMWI2RebJmcE+UoEkRqzhMh6P+NFeO/8UDL1Bfa9KiC8sVINMiVNyQOYoJcNJVqpCTddDtLA2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Lt60fuJ4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qOrC+dsj; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 283A51380447;
	Tue, 20 May 2025 11:36:03 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-06.internal (MEProxy); Tue, 20 May 2025 11:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747755363;
	 x=1747841763; bh=UQWKoDatZdQPoLt3PpXlt2G9WomRkCy2/pjhRcggo1I=; b=
	Lt60fuJ49inMENUW+8cxgv5/t8totVMjE/JxUEf5tC2JWc//MlbEFSpkmT+M+rK7
	+JK8RnrE2ScM7iweaqodRzXKsBl6C4QZ19Q7blsG5eHnTiTMIm2IKqIoeJy+uF5e
	WMiaZ5KGmBh5m+57SDR01rBKjfdgx5A/OEF2oMpXWjJ5H0mR1RZVRO06sGSrnhKs
	8Jw6Dj/EDh1iAXeAFBGyd2v0QxIK8vRB+16ruDhmg42LizCAmk75rK9OVPHYemEk
	GOA+OJdvSs69pUkPVxbaIz3JWpCEYbK5e8b/Ex5bkGMG6Iu+pQ/nIZcigoXaAvAd
	8KZza4MEUJaEsXj6U6nbKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747755363; x=
	1747841763; bh=UQWKoDatZdQPoLt3PpXlt2G9WomRkCy2/pjhRcggo1I=; b=q
	OrC+dsjZIaAmKJHxm5im4ni/aL3Mvw/m8DPhBJ2YlMJXtJoJE1OUgubdzDqrJvhZ
	6hzyR1MjnOJ8FJSFwQXFPEmqp1EckVUHCjCfffCqf1w2wVqtXFSZG70GrvAbrta4
	HXevmUrvaKDZblX5trols0PTZLVgDAsWRRa+qRR8dXHpZXlw8/XyHxJ54ynZtF3w
	LQj373Sw6Gje587b/0URgoK4fdx/hptqaB07GrdJwdWrp7NaD2MMb4F6LGFCDVYF
	IeA4fU6qDD4o9f41mE06Nf73FZjWPmVM+CBnhQkun9NZ2NrFAKpfbAqox9rLX1jy
	RNrp+EgVs7+V+CtNA89pQ==
X-ME-Sender: <xms:YqEsaCmk_i3GPGUX4zziD0NQcwGUKwmS6wnebfrddxJ6FGyWiLtFbQ>
    <xme:YqEsaJ3Xqogor-EmPKrm1QHVTr46xBXXrR3WqlCm1YGhP0S4C8G9m1-HnznUUqn0u
    twGjZQP7137GnMSX4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehkeculddtuddrgeefvddrtddtmd
    cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghn
    shhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtne
    cusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghf
    ufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjih
    grgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedt
    heevtedugfeuvdegvefgfeevtdfhffeitdegkeelhfeuudegveeugffhvdduheenucffoh
    hmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
    shgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvg
    hgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgv
    ohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrd
    hpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhk
    rdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepvhhlrgguihhmih
    hrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YqEsaAo0kZBQdFSZ08VpkuHFJfSbsFCiSctfHZyI-3gc6uCda4XlsQ>
    <xmx:YqEsaGmQr-yZDyFtbwk7xx5SvTRNo0fHlbPkzgUlha46xKVJL42mqg>
    <xmx:YqEsaA2Xju2U8vVE7PiDP3nQq351HV38AF2_FS3PHHDaTcagyclaMg>
    <xmx:YqEsaNuaTkgp_X0_Ji13WUC9zsdcKbTy1zykxglqSkKZeML6jjF1ow>
    <xmx:Y6EsaGOzIXsub78PihDai4gQRaPJSreIKwzSvxhGMkK6HFaGTp9ohJS9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 67CF71060060; Tue, 20 May 2025 11:36:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfc8a567c59a896e5
Date: Tue, 20 May 2025 16:35:42 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <8c4ef90e-82db-4711-a5f3-446bcca00e9d@app.fastmail.com>
In-Reply-To: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
References: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
Subject: Re: [PATCH] MIPS: CPS: Optimise delay CPU calibration for SMP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B45=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=
=8D=884:21=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> This allows to implement calibrate_delay_is_known(), which will return
> 0 (triggering calibration) only for the primary CPU of each
> cluster. For other CPUs, we can simply reuse the value from their
> cluster's primary CPU core.

Is __cpu_primary_cluster_mask really necessary?

Maybe we can just test if current CPU is the first powered up CPU
in the cluster?

Thanks
Jiaxun

>
> With the introduction of this patch, a configuration running 32 cores
> spread across two clusters sees a significant reduction in boot time
> by approximately 600 milliseconds.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/kernel/smp-cps.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index=20
> 02bbd7ecd1b9557003186b9d3d98ae17eac5eb9f..93e01b90b4a21323c76293502110=
83a81eb549d4=20
> 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -40,6 +40,7 @@ static u64 core_entry_reg;
>  static phys_addr_t cps_vec_pa;
>=20
>  struct cluster_boot_config *mips_cps_cluster_bootcfg;
> +struct cpumask __cpu_primary_cluster_mask __read_mostly;
>=20
>  static void power_up_other_cluster(unsigned int cluster)
>  {
> @@ -225,6 +226,7 @@ static void __init cps_smp_setup(void)
>  		if (mips_cm_revision() >=3D CM_REV_CM3_5)
>  			power_up_other_cluster(cl);
>=20
> +		cpumask_set_cpu(nvpes, &__cpu_primary_cluster_mask);
>  		ncores =3D mips_cps_numcores(cl);
>  		for (c =3D 0; c < ncores; c++) {
>  			core_vpes =3D core_vpe_count(cl, c);
> @@ -281,6 +283,24 @@ static void __init cps_smp_setup(void)
>  #endif /* CONFIG_MIPS_MT_FPAFF */
>  }
>=20
> +unsigned long calibrate_delay_is_known(void)
> +{
> +	int i, this_cpu =3D smp_processor_id(), primary_cpu_cluster =3D 0;
> +
> +	/* The calibration has to be done on the primary CPU of the cluster =
*/
> +	if (cpumask_test_cpu(this_cpu, &__cpu_primary_cluster_mask))
> +		return 0;
> +
> +	/* Look for the primary CPU of the cluster this CPU belongs to */
> +	for_each_cpu(i, &__cpu_primary_cluster_mask) {
> +		/* we reach the next cluster */
> +		if (i > this_cpu)
> +			break;
> +		primary_cpu_cluster =3D i;
> +	}
> +	return cpu_data[primary_cpu_cluster].udelay_val;
> +}
> +
>  static void __init cps_prepare_cpus(unsigned int max_cpus)
>  {
>  	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
>
> ---
> base-commit: 3b3704261e851e25983860e4c352f1f73786f4ab
> change-id: 20250520-smp_calib-6d3009e1f5b9
>
> Best regards,
> --=20
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--=20
- Jiaxun

