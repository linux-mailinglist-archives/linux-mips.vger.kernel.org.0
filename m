Return-Path: <linux-mips+bounces-3174-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284978C01E9
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 18:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D823228184A
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 16:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B235C1292C3;
	Wed,  8 May 2024 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="M5r0f/1E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bzOvvdS9"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF76D1B0;
	Wed,  8 May 2024 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715185450; cv=none; b=DHx9vzmZaekKwPdAIL7Gsz2QnSn+gHZEpxdYsedkqD7+ayWh5kEcrDmyJUFnzWK0mmWG/oTjNDyIBiFk9mP51fcJMLmCNDJZOa2315mrSxbKTY/Y2U95n+6FE/bmWb0ZPbo9AAvWk7FJqh+kbftAJa4xp0bkgjIOqkLjtZFw6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715185450; c=relaxed/simple;
	bh=ibNJ8Xe8MiZ/i4OLkjlyLfRh2B8XMD+/gb/5ylg6D/U=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=CyaYnjyfROxoTB198bKaKBHQlqyV9FaLxk8op6dnbglLDRRahZbg+NEbI+uSv0MP87k9kn0BNmo+0XhfG7PZwGP4kR9ei74Yng0hhVmpxY96T2lE2SkIPSAUug4Y/7KCnOgnwl5WhefA1UZ0cvkCLRtslx+0b1w36L6DIf6U5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=M5r0f/1E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bzOvvdS9; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id DDF5D1380259;
	Wed,  8 May 2024 12:24:07 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 08 May 2024 12:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715185447;
	 x=1715271847; bh=4nGit7XxeGIk2SVfnODtOYvvu5kqArp+iKedBGicZYU=; b=
	M5r0f/1EYGGBMZdHb2yx3K2srlH9EtawFjd1OIHaqMNPGJgqZGax9dOsaauwRxgi
	gSinIxlrgKyYVldrm1EG9CKjma973HUuKh3TWGSaqpKve3np8dFKWWmUcv8AZApU
	z/IKRMxtlcEmWmp6F9vyvY8ELHu76qZ/wEuHvne8GWpMHCVglpC/cSCYsACKXlmc
	gElXZYJTXNlu4wTb7iiQvWPwRq9CaY8suDi26qd5nvENKrdrOcDmWBSFEemGMhpi
	S5hqgo5wqYWh2h+9Q7cgs3wh2OvCFxJVIcWhNqrrewym6jyL1IZVNWYFTO2gs2ke
	Nt5C2NmzxhB+8PcOzOu9jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715185447; x=
	1715271847; bh=4nGit7XxeGIk2SVfnODtOYvvu5kqArp+iKedBGicZYU=; b=b
	zOvvdS9bVHsE0CusftMhnE2toFhTfNuk39zVNqUSBWlIHeyETt4HK12QuBRTDOde
	eb974p/2CNtXMYdqR+iuyTwEhfljN5u9A+GMJwHwRfwRTq2OsIZcw4OA2T9r3zZM
	paPt1ecjgWhoPVYaHgeyULeh7J3ijMF1pfALbPvmEhbciSf8Nt7zqdY6OAloLD6D
	hQeVDTr2Y5XDkLPJ43NE+0HSjvQPJauehOBqORzqMo48NTezKD/v/LcAXI3csUi5
	v94cm0iRGvT0Zq+Spri84UUhWLFTzccfqjsmppHyAr8Ur/hzD3CG1sODcA0iFP1w
	qMdEAeB/6wt1tQbxiP48Q==
X-ME-Sender: <xms:J6c7ZnKgPQIPzd-dMOjCFvhu7Iaq_7gwtCnOITu-_pqudo7vQlY3Ug>
    <xme:J6c7ZrLYcV82q6-CuDb5q2XgYseEioX9D6Beib_mbLsHCfXm3rEcw4IrIOez-xb8w
    LO5oLz797m27Wuc_-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:J6c7ZvuHoQMWAVCFq_9NOwcNCqjmhsrI5GRCuOAmDHqxwviLFt06Lw>
    <xmx:J6c7ZgbUOfY7ajcYqJCxsuPb07bZLIbwrPOqzIa9b5ppL38lAhfEdA>
    <xmx:J6c7ZuZu6LAb-gGkp6T5AfkzH40niWILIuhOdypY_VzWshPM8MOS3A>
    <xmx:J6c7ZkB4iFfJvfFdPAlN4lwblXZshDW3nPtlJDwo_WqgH5K4Tk8IcQ>
    <xmx:J6c7ZkNlfiQSEAo4BcU2NRQoO5PTsHQ5SQFDAWKlo0akBXXjQgWDRehr>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 34C0D36A0074; Wed,  8 May 2024 12:24:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8d02a270-c9b7-4389-899e-cd755e55f0a4@app.fastmail.com>
In-Reply-To: 
 <forgoxnzqnwreba7j57lgs6lgzny3zdnaqnpctr2qhtlcad3pg@l44sn4zf7hu3>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-3-11dbfd598f3c@flygoat.com>
 <forgoxnzqnwreba7j57lgs6lgzny3zdnaqnpctr2qhtlcad3pg@l44sn4zf7hu3>
Date: Wed, 08 May 2024 17:23:48 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Serge Semin" <fancer.lancer@gmail.com>
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] MIPS: Move mips_cm_probe after prom_init
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=888=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=881:50=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, May 07, 2024 at 10:01:51AM +0100, Jiaxun Yang wrote:
>> Move mips_cm_probe after prom_init so we can use fdt functions
>> in mips_cm_probe to obtain essential information.
>>=20
>> Impat for all systems that may have CM in system:
>
>> - geneirc: Adjusted code to accommodate this change
>
> s/geneirc/generic
>
>> - Lantiq: No impact, CM configuration won't be changed at all
>> - ralink: Called mips_cm_probe on it's own, in prom_init->prom_soc_in=
it
>
>> - malta: No impact, CM address comes from CP0_CMGCR
>
> Are you sure about this? This was one of the problematic part I met
> back when was trying to implement the feature.
> arch/mips/mti-malta/malta-init.c:
> prom_init()
> +-> mips_cpc_probe()
>     +-> mips_cpc_phys_base()
>         +-> mips_cm_present(): mips_gcr_base !=3D NULL
>         +-> read_gcr_cpc_status()
>         +-> read_gcr_cpc_base()
>         +-> write_gcr_cpc_base()
>
> So by moving mips_cm_probe() to being executed after prom_init() the
> calls-chain above will be broken since the mips_gcr_base will be left
> uninitialized. Do I miss something?

Hi Serge,

Good catch! This is indeed a problem.
I tried to dig a little bit and found that a possible solution is to
move SMP initialization to device_tree_init(), as what generic platform
did.

I was able to test malta boot with this solution on my heavily patched
QEMU, I can confirm that both CM-SMP and scache are working as expected.

Will share my QEMU patches and configurations in next rev.=20

Thanks
- Jiaxun

>
> Please, note originally the mips_cm_probe() invocation was right
> above the Malta's mips_cpc_probe():
> 3af5a67c86a3 ("MIPS: Fix early CM probing")
>
> -Serge(y)
>
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  arch/mips/kernel/setup.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index 12a1a4ffb602..732579c8f4f8 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -773,8 +773,8 @@ static void __init setup_rng_seed(void)
>>  void __init setup_arch(char **cmdline_p)
>>  {
>>  	cpu_probe();
>> -	mips_cm_probe();
>>  	prom_init();
>> +	mips_cm_probe();
>> =20
>>  	setup_early_fdc_console();
>>  #ifdef CONFIG_EARLY_PRINTK
>>=20
>> --=20
>> 2.34.1
>>=20
>>

--=20
- Jiaxun

