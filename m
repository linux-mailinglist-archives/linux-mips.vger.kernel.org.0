Return-Path: <linux-mips+bounces-3720-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7B90BD5C
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 00:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7771C212B7
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 22:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5610F198823;
	Mon, 17 Jun 2024 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="vwFNBclf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DV8E/Rs4"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D15215ECDB;
	Mon, 17 Jun 2024 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718662226; cv=none; b=sQ3LOoGQQh3n37jj5aqsFe2IsczzW4hRAMHmDFjBMs+wYz2ecFwSAYOjxpZJGrzdwL649EiRUzyeIZhWUjXd3Kj4zd3LIpgoGMUNbaTXrSuFZMj9VnumLX87IwBzLi5km0p2rDG6w2HKsSjPDmE+AjiM+/uU4+8iY/R4vZYokB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718662226; c=relaxed/simple;
	bh=yu4nQT/8ePrAM3ouivmhW62lENjSum0ac7Wc84vefGM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=gdFy+bmD6j2DT+Xi8nCirRTdDCQjp33MyfZlEKvmkDCbEpIjmeqaH67vnSHBzITgsdr2Rq4jbge/mmY0b/SmgykjhPOk8uqUIDJuQqb1OFK5e+x+JJ/9XL3zkS2n23XKY3vW28ScbQ3W2vHtSERXlcn0l1Nyv/04U4f3hGujHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=vwFNBclf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DV8E/Rs4; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 67D6F138006E;
	Mon, 17 Jun 2024 18:10:23 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Mon, 17 Jun 2024 18:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718662223;
	 x=1718748623; bh=a4L9Dxh0SmptwLif2QXxvZyXB25G9x6tM9KdZIqsHEI=; b=
	vwFNBclf+v3i/ee6KF7TKiKh1Sd+qvgNt03fY11AFcvA9P6II738Izvk3g1CHpr4
	AmxrTMfKwogra09W4VB2ie393HUByj1URtCMoLedXagEf1EfMG841uMWrLnot8SF
	0PQ7brFQwuCk3eyS8OOYgXldEciHmH4Kuzry9sEwgb2fXX1ZvoLX9GiEYNnhTAhe
	3hITgv7gNnGBoMaOCG738ZdBXqkO2jiorzte8CgGIzVxgJa7r3KW+4pnk/0X/OeN
	Kxpgp1Eq7NPVFDJrX0SKFvAEKtg/rYxGJh6V38DSLMK2v1fo9PhyxrTly3UhKnJ6
	KSLkmUZYMrpxR5CZVOWInw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718662223; x=
	1718748623; bh=a4L9Dxh0SmptwLif2QXxvZyXB25G9x6tM9KdZIqsHEI=; b=D
	V8E/Rs4/g+Dykas/NfZTI0+yLFZyu6y84GzOVw4NUpTnASb96I061lzBcX7rUZ81
	PZFDaTkRM1qEZdOO+JWx+S9YMDFrepRo0G+nwzEEjl14dss4CZXQnmie4nYyT3Kt
	8+ccaEWbH48sRL31ZVYtQRK7DRghjcdEHCV0BpyxSayNOBu7TnifbuBu9om4Lu7H
	ICpiHuSUUtdlD8GDHmg7lauyZbA652Zc2BKKjFq6M/fGMX1FKaGDQEFQOSqUqgP4
	yepe+4xZgWd6ZF7AmgkLeal+sFXeTcVkJNUNCjnwt8vB1dlQq6QAzK8PLwR1JCJ5
	XoWsvn6fxHpOBGSyAuvcw==
X-ME-Sender: <xms:TrRwZpxC-nJeEvb4ng-xHDCaARaflkLGw3-frg6k6rLK_nLe9A-EHQ>
    <xme:TrRwZpSgLMTAZG6i8qyG-WtruQt_6gqrub4tUzcGqT3Hxma8hvdmTyfPQAnmo-cPY
    ITjkBB4rp-RBcdCVMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedviedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:TrRwZjWvFfdj09K-WNF_hUXZiAOXh3_T5j-bCo-78CgJ6LnzOcXwsw>
    <xmx:TrRwZrijZG_j2KnuhwagyRgNnJdBUXpjl2Ald3MXO8_0mUk0wCwT3A>
    <xmx:TrRwZrDJ1JJ-yaSVLJcJeOFI1WimlGMECAMCTaINmLLAC-l2PCLQfg>
    <xmx:TrRwZkKc9MB6U4sa2HLAM_oocx-wIunCyAr1iR2TLGx5anLxEy7TDQ>
    <xmx:T7RwZv3OkmNxX2hKKYmlc5mDjPi4rgEc5lYVdE74SKSczt6yuqvcUVRG>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C512236A0074; Mon, 17 Jun 2024 18:10:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7cbf218e-d311-4c33-aabb-7208eac231ed@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
 <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com>
Date: Mon, 17 Jun 2024 23:10:02 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] MIPS: Move mips_smp_ipi_init call after prepare_cpus
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8817=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=882:53=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> Hi, Jiaxun
>
> On Mon, Jun 17, 2024 at 5:03=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygo=
at.com> wrote:
>>
>> This will give platform code a genuine chance to setup
>> IPI IRQ in prepare_cpus.
>>
>> This is the best place for platforms to setup IPI as smp_setup
>> is too early for IRQ subsystem.
> mips_smp_ipi_init() is an early_initcall() function, why do you say it
> is in smp_setup()?

Sorry, I was trying to say that smp_setup is not a good point so we shou=
ld
go prepare_cpus.

The intention of this patch is to move mips_smp_ipi_init to a certain po=
int
so platform would gain control over it.

Thanks
- Jiaxun

>
>
> Huacai
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  arch/mips/kernel/smp.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
>> index fe053fe52147..ddf96c28e2f0 100644
>> --- a/arch/mips/kernel/smp.c
>> +++ b/arch/mips/kernel/smp.c
>> @@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
>>
>>         return 0;
>>  }
>> -early_initcall(mips_smp_ipi_init);
>>  #endif
>>
>>  /*
>> @@ -460,12 +459,22 @@ void __init smp_cpus_done(unsigned int max_cpus)
>>  /* called from main before smp_init() */
>>  void __init smp_prepare_cpus(unsigned int max_cpus)
>>  {
>> +       int rc;
>> +
>>         init_new_context(current, &init_mm);
>>         current_thread_info()->cpu =3D 0;
>>         mp_ops->prepare_cpus(max_cpus);
>>         set_cpu_sibling_map(0);
>>         set_cpu_core_map(0);
>>         calculate_cpu_foreign_map();
>> +#ifdef CONFIG_GENERIC_IRQ_IPI
>> +       rc =3D mips_smp_ipi_init();
>> +       if (rc) {
>> +               pr_err("Failed to initialize IPI - disabling SMP");
>> +               init_cpu_present(cpumask_of(0));
>> +               return;
>> +       }
>> +#endif
>>  #ifndef CONFIG_HOTPLUG_CPU
>>         init_cpu_present(cpu_possible_mask);
>>  #endif
>>
>> --
>> 2.43.0
>>

--=20
- Jiaxun

