Return-Path: <linux-mips+bounces-9678-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE0AFDA19
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 23:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB9874E6C89
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 21:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D922248AC;
	Tue,  8 Jul 2025 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="TpiCZyUa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gmf9EkA1"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5611A8F84;
	Tue,  8 Jul 2025 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752010973; cv=none; b=XjM+cguyeFFel3l9cBjoyeju6ZDEe8oigEYgaa1kBwnqP/mk6GNvLW4c2o7fbZ05j5rLlxj0q4z7DNx6razo/yZ2nkjpEEgs3R1I9Yw4Ft+f2suqQo4S+u87xts57TSojrkT+KvlclgRO32NONQHrntx9R0+zfud/tsAGJUMJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752010973; c=relaxed/simple;
	bh=3BzZ+S5Me4jrsdsqgpDLzZ8QPtyqyA5O+NvqN53hJ20=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nJAK0Uy823b3HArVK3CEQE8asBO94trew4R96UlVnbfKpuCGvAt5cGa7OA1WXFYXbsYtX/E0tn1JAtIrlJgBGzZdeDBi/bYRIWZxdc/KBBcSXDtKJE15h9fhTM/E7fUaxBcEWivUZ7FvFER5YBWNZVfMB9E7+mFfX1ijb7mFgu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=TpiCZyUa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gmf9EkA1; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 831B31D00266;
	Tue,  8 Jul 2025 17:42:49 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Tue, 08 Jul 2025 17:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1752010969;
	 x=1752097369; bh=KauPi9Zd55Fn0ZbVT6JrEqpHOv19bbTGiz+p1+rrlFY=; b=
	TpiCZyUakPdrhay2AKt3ry5L6pf+6rhhsG4i/I8cCdgYCRy70zcEzdrXqtVBMYMa
	c0FTB0pVZzXA0tkJGn6YReuHlXCGdYzcwKJ9Cqp8L2VbCLP8bZZMCeDaxRKRFrw0
	en5oPVgEl/xS790C6YD8/Q/oy0vnKqsHpuEIFiDfalEtfNxiA+5oS5fka1Fg2t12
	1YBvqVNwk9mROUaP397ENd2o0hByYUDl8hPteMkjiHjkx+yw23OsIl78rFp2SVgX
	OzK3/Rq2hhWxoYOiqbIyyZhsyPfE2phJsLkm8Jm7YUmIDgxSFmNAYkGl9x+J2ELh
	U7AZqXl49JKlG4j1MmIodA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752010969; x=
	1752097369; bh=KauPi9Zd55Fn0ZbVT6JrEqpHOv19bbTGiz+p1+rrlFY=; b=G
	mf9EkA1UybRcVGm7mdMpp4tkkCyocNJlYJ9R8HaGWlKY5jC3GzOX43S9OftKlL4F
	LWh5wSOfGxdPC1CTfbdZrOdQgdoAD7p8PSGpMq900M/f0RAfR2Fmg5tR+jAtZOag
	vh2UqpoGPU4siydHnAjR3A8QUURpj7lZXLkpt/LCzKigkFaL1sWl5Hj2qt2JYTjm
	rfTRkV5BLFGcJpZQdiQItg/B2F1NTdsx48bz0OveukCH5gKkj5TlxOc/ZtIfBzpO
	sCTQkPQmJMDnZZAycn8qsN0cA95klNGCQiQ4Tu+bSPIyEGaR3QGlU+lXTH7j/Ms0
	sZSv4ICDn5EpNDKnki5fA==
X-ME-Sender: <xms:2JBtaFrQDm9CGEgiDXU8YlTcunQO16hmI7Nxb9MIM6bdnSeBALZjpA>
    <xme:2JBtaHqubf9KXJh0S-58hfm7U2SKBVvJlbfND2-FtYk3IbKF_GEnvZsAFLkiBHH73
    T_pXwVziLVdRnk57Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
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
X-ME-Proxy: <xmx:2JBtaHL79BpNb1Ib-aLJ0IrnsdJGqp0KJVwVjKYEooHSUudwN9zgQg>
    <xmx:2JBtaIBQbcSEq39HygChftiWNKO2C3onSxK9TRuqVWdEl901GnWnHA>
    <xmx:2JBtaPf7ahwu86cvJoojgjxJVDHhnruyXerKpmYfkiZEodBX8BiB8w>
    <xmx:2JBtaP1hITPTSnKSoJojBtvhkMVkhtOhlak53FlTwCmb79sYPkLC-A>
    <xmx:2ZBtaN_Dwd_RNyxYJUlNrYsw7eoyxLnvJqd0DCnY28NunblMmRE6mbmK>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9AAC52CE0071; Tue,  8 Jul 2025 17:42:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T19122930eb0c0c45
Date: Tue, 08 Jul 2025 22:42:27 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <1340594a-4eef-424c-9bc3-fbc16224ba77@app.fastmail.com>
In-Reply-To: <20250708-smp_calib-v3-1-6dabf01a7d9f@bootlin.com>
References: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
 <20250708-smp_calib-v3-1-6dabf01a7d9f@bootlin.com>
Subject: Re: [PATCH v3 1/2] MIPS: CPS: Improve mips_cps_first_online_in_cluster()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B47=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=
=8D=882:46=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> The initial implementation of this function goes through all the CPUs
> in a cluster to determine if the current CPU is the only one
> running. This process occurs every time the function is called.
>
> However, during boot, we already perform this task, so let's take
> advantage of this opportunity to create and fill a CPU bitmask that
> can be easily and efficiently used later.
>
> This patch modifies the function to allow providing the first
> available online CPU when one already exists, which is necessary for
> delay CPU calibration optimization.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Many thanks for this optimised implementation!

Thanks
- Jiaxun

> ---
>  arch/mips/include/asm/mips-cps.h |  4 +++-
>  arch/mips/include/asm/smp-cps.h  |  1 +
>  arch/mips/kernel/mips-cm.c       | 47 ++++++++++++++-----------------=
---------
>  arch/mips/kernel/smp-cps.c       |  5 ++++-
>  4 files changed, 24 insertions(+), 33 deletions(-)
>
> diff --git a/arch/mips/include/asm/mips-cps.h=20
> b/arch/mips/include/asm/mips-cps.h
> index=20
> 917009b80e6951dc7e2b308ad7fb42cd9fbbf7d7..1fffd47a4564fb891d3c1e3ae389=
5b34d6700e5e=20
> 100644
> --- a/arch/mips/include/asm/mips-cps.h
> +++ b/arch/mips/include/asm/mips-cps.h
> @@ -258,6 +258,8 @@ static inline bool mips_cps_multicluster_cpus(void)
>=20
>  /**
>   * mips_cps_first_online_in_cluster() - Detect if CPU is first online=20
> in cluster
> + * @first_cpu: The first other online CPU in cluster, or nr_cpu_ids if
> + * the function returns true.
>   *
>   * Determine whether the local CPU is the first to be brought online=20
> in its
>   * cluster - that is, whether there are any other online CPUs in the=20
> local
> @@ -265,6 +267,6 @@ static inline bool mips_cps_multicluster_cpus(void)
>   *
>   * Returns true if this CPU is first online, else false.
>   */
> -extern unsigned int mips_cps_first_online_in_cluster(void);
> +extern unsigned int mips_cps_first_online_in_cluster(int *first_cpu);
>=20
>  #endif /* __MIPS_ASM_MIPS_CPS_H__ */
> diff --git a/arch/mips/include/asm/smp-cps.h=20
> b/arch/mips/include/asm/smp-cps.h
> index=20
> 10d3ebd890cb2f3ac2b1db5a541cfe9e7f1a0c99..88cfae5d22c83e44451200ad3daa=
e12fced03303=20
> 100644
> --- a/arch/mips/include/asm/smp-cps.h
> +++ b/arch/mips/include/asm/smp-cps.h
> @@ -24,6 +24,7 @@ struct core_boot_config {
>=20
>  struct cluster_boot_config {
>  	unsigned long *core_power;
> +	struct cpumask cpumask;
>  	struct core_boot_config *core_config;
>  };
>=20
> diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
> index=20
> 43cb1e20baed3648ff83bb5d3bbe6a726072e063..f49138f551d3c347c6a98afe05ad=
5027b0d91637=20
> 100644
> --- a/arch/mips/kernel/mips-cm.c
> +++ b/arch/mips/kernel/mips-cm.c
> @@ -10,6 +10,7 @@
>  #include <linux/spinlock.h>
>=20
>  #include <asm/mips-cps.h>
> +#include <asm/smp-cps.h>
>  #include <asm/mipsregs.h>
>=20
>  void __iomem *mips_gcr_base;
> @@ -529,39 +530,23 @@ void mips_cm_error_report(void)
>  	write_gcr_error_cause(cm_error);
>  }
>=20
> -unsigned int mips_cps_first_online_in_cluster(void)
> +unsigned int mips_cps_first_online_in_cluster(int *first_cpu)
>  {
> -	unsigned int local_cl;
> -	int i;
> -
> -	local_cl =3D cpu_cluster(&current_cpu_data);
> +	unsigned int local_cl =3D cpu_cluster(&current_cpu_data);
> +	struct cpumask *local_cl_mask;
>=20
>  	/*
> -	 * We rely upon knowledge that CPUs are numbered sequentially by
> -	 * cluster - ie. CPUs 0..X will be in cluster 0, CPUs X+1..Y in=20
> cluster
> -	 * 1, CPUs Y+1..Z in cluster 2 etc. This means that CPUs in the same
> -	 * cluster will immediately precede or follow one another.
> -	 *
> -	 * First we scan backwards, until we find an online CPU in the clust=
er
> -	 * or we move on to another cluster.
> +	 * mips_cps_cluster_bootcfg is allocated in cps_prepare_cpus. If it =
is
> +	 * not yet done, then we are so early that only one CPU is running, =
so
> +	 * it is the first online CPU in the cluster.
>  	 */
> -	for (i =3D smp_processor_id() - 1; i >=3D 0; i--) {
> -		if (cpu_cluster(&cpu_data[i]) !=3D local_cl)
> -			break;
> -		if (!cpu_online(i))
> -			continue;
> -		return false;
> -	}
> -
> -	/* Then do the same for higher numbered CPUs */
> -	for (i =3D smp_processor_id() + 1; i < nr_cpu_ids; i++) {
> -		if (cpu_cluster(&cpu_data[i]) !=3D local_cl)
> -			break;
> -		if (!cpu_online(i))
> -			continue;
> -		return false;
> -	}
> -
> -	/* We found no online CPUs in the local cluster */
> -	return true;
> +	if (mips_cps_cluster_bootcfg)
> +		local_cl_mask =3D &mips_cps_cluster_bootcfg[local_cl].cpumask;
> +	else
> +		return true;
> +
> +	*first_cpu =3D cpumask_any_and_but(local_cl_mask,
> +					 cpu_online_mask,
> +					 smp_processor_id());
> +	return (*first_cpu >=3D nr_cpu_ids);
>  }
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index=20
> 7b0e69af4097025196b93115139a5e89c1d71fcc..6c5f15293a8e58a701601b242f43=
ba19a6814f06=20
> 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -283,7 +283,7 @@ static void __init cps_smp_setup(void)
>=20
>  static void __init cps_prepare_cpus(unsigned int max_cpus)
>  {
> -	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
> +	unsigned int nclusters, ncores, core_vpes, nvpe =3D 0, c, cl, cca;
>  	bool cca_unsuitable, cores_limited;
>  	struct cluster_boot_config *cluster_bootcfg;
>  	struct core_boot_config *core_bootcfg;
> @@ -356,10 +356,13 @@ static void __init cps_prepare_cpus(unsigned int=
 max_cpus)
>=20
>  		/* Allocate VPE boot configuration structs */
>  		for (c =3D 0; c < ncores; c++) {
> +			int v;
>  			core_vpes =3D core_vpe_count(cl, c);
>  			core_bootcfg[c].vpe_config =3D kcalloc(core_vpes,
>  					sizeof(*core_bootcfg[c].vpe_config),
>  					GFP_KERNEL);
> +			for (v =3D 0; v < core_vpes; v++)
> +				cpumask_set_cpu(nvpe++, &mips_cps_cluster_bootcfg[cl].cpumask);
>  			if (!core_bootcfg[c].vpe_config)
>  				goto err_out;
>  		}
>
> --=20
> 2.47.2

--=20
- Jiaxun

