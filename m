Return-Path: <linux-mips+bounces-9049-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7BABED48
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 09:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4329E188C6E9
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 07:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0528231857;
	Wed, 21 May 2025 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ACTXc4/o"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79A17BD3;
	Wed, 21 May 2025 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813639; cv=none; b=gBCZxxvjlUpx5sFLjM3IaiRnBKusM9bCpLvXXZxVVKMzKLMw1RGa0OPVY3Un+aBYdaZeWJ+if1CJ2JwMgkDlh2V6OGwxXEXmdiGniyKKn3lW8XmjsfK1MEU6HIYVvSTPX743oVoDzj2gMZjVdbougsNtAys2BT0vvF3FW6SVucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813639; c=relaxed/simple;
	bh=vw26JKiFKR4uYW0R5VgaxwfnFZ2lLm+iwytxYxWPGNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xw0crJITGmw/1Z8mEQ1WynI1UZR66jodCXsF/cbdFZiRv7ecgsBOLDBaqb7fsfC62YqslAGzZIc5HVV/2t/ZVAbcSl3X+3id1P0kvHGiK+RsaFSDG33Yy/wT4DuC5RSyEzdegw08YZ79XRUkir0pv+lNVj73x1NgGqbLCpQfijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ACTXc4/o; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38AC24419F;
	Wed, 21 May 2025 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747813634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAkGPmegLdQxHulVFPQ6dFcIpdSagHdTkvZYmKcnSVA=;
	b=ACTXc4/o+mMoqzwhNv+UGAz0M0a5g3o98X/sNukDWTJQMtaLdCPjbquD17VyXUsI2c4DVs
	Yf01cH71Y2KMm7FMY2wrmFXak3iFbcGqxbbU6A4rrsaof47YkDnU+sfvmbb2a/sHer/Rxx
	Hsn4zJYeZkfzT5O3jN+IItqZ79D2JdpbuCU++r2YHfdUYubNDaxMKRtz+QaU8az64HQQGQ
	sFtu9e2lezdPa4Q+NS4uYLPTFF9mahXq++y/bv4y8rnGoc87PGUsbMfoGKSwjK6Y2C49Gs
	qKVNnY426ssWE32mSuv/gBRwZg9P4zRNINfwS2Tk7aMFRZ16ZfAHrlEK31HROw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPS: Optimise delay CPU calibration for SMP
In-Reply-To: <8c4ef90e-82db-4711-a5f3-446bcca00e9d@app.fastmail.com>
References: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
 <8c4ef90e-82db-4711-a5f3-446bcca00e9d@app.fastmail.com>
Date: Wed, 21 May 2025 09:47:13 +0200
Message-ID: <87ecwipfr2.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvhedvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemtgejgegrmedurggvheemsgejfehfmeektdejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemtgejgegrmedurggvheemsgejfehfmeektdejuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdpr
 hgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Jiaxun,

> =E5=9C=A82025=E5=B9=B45=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=
=E5=8D=884:21=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> [...]
>>
>> This allows to implement calibrate_delay_is_known(), which will return
>> 0 (triggering calibration) only for the primary CPU of each
>> cluster. For other CPUs, we can simply reuse the value from their
>> cluster's primary CPU core.
>
> Is __cpu_primary_cluster_mask really necessary?
>
> Maybe we can just test if current CPU is the first powered up CPU
> in the cluster?

That is exactly the point of __cpu_primary_cluster_mask: setting in an
efficient way the first powered-up CPU for each cluster. This adds only
a single variable (which is actually just a long) and allows for minimal
impact during boot time, by doing the minimum write and read operations.

I don't see a better alternative. What do you have in mind ?

Gregory

>
> Thanks
> Jiaxun
>
>>
>> With the introduction of this patch, a configuration running 32 cores
>> spread across two clusters sees a significant reduction in boot time
>> by approximately 600 milliseconds.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  arch/mips/kernel/smp-cps.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
>> index=20
>> 02bbd7ecd1b9557003186b9d3d98ae17eac5eb9f..93e01b90b4a21323c7629350211083=
a81eb549d4=20
>> 100644
>> --- a/arch/mips/kernel/smp-cps.c
>> +++ b/arch/mips/kernel/smp-cps.c
>> @@ -40,6 +40,7 @@ static u64 core_entry_reg;
>>  static phys_addr_t cps_vec_pa;
>>=20
>>  struct cluster_boot_config *mips_cps_cluster_bootcfg;
>> +struct cpumask __cpu_primary_cluster_mask __read_mostly;
>>=20
>>  static void power_up_other_cluster(unsigned int cluster)
>>  {
>> @@ -225,6 +226,7 @@ static void __init cps_smp_setup(void)
>>  		if (mips_cm_revision() >=3D CM_REV_CM3_5)
>>  			power_up_other_cluster(cl);
>>=20
>> +		cpumask_set_cpu(nvpes, &__cpu_primary_cluster_mask);
>>  		ncores =3D mips_cps_numcores(cl);
>>  		for (c =3D 0; c < ncores; c++) {
>>  			core_vpes =3D core_vpe_count(cl, c);
>> @@ -281,6 +283,24 @@ static void __init cps_smp_setup(void)
>>  #endif /* CONFIG_MIPS_MT_FPAFF */
>>  }
>>=20
>> +unsigned long calibrate_delay_is_known(void)
>> +{
>> +	int i, this_cpu =3D smp_processor_id(), primary_cpu_cluster =3D 0;
>> +
>> +	/* The calibration has to be done on the primary CPU of the cluster */
>> +	if (cpumask_test_cpu(this_cpu, &__cpu_primary_cluster_mask))
>> +		return 0;
>> +
>> +	/* Look for the primary CPU of the cluster this CPU belongs to */
>> +	for_each_cpu(i, &__cpu_primary_cluster_mask) {
>> +		/* we reach the next cluster */
>> +		if (i > this_cpu)
>> +			break;
>> +		primary_cpu_cluster =3D i;
>> +	}
>> +	return cpu_data[primary_cpu_cluster].udelay_val;
>> +}
>> +
>>  static void __init cps_prepare_cpus(unsigned int max_cpus)
>>  {
>>  	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
>>
>> ---
>> base-commit: 3b3704261e851e25983860e4c352f1f73786f4ab
>> change-id: 20250520-smp_calib-6d3009e1f5b9
>>
>> Best regards,
>> --=20
>> Gr=C3=A9gory CLEMENT, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>
> --=20
> - Jiaxun

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

