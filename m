Return-Path: <linux-mips+bounces-9092-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76882AC1DAA
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 09:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31751BC70B8
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 07:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD19F21C165;
	Fri, 23 May 2025 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HJIDY/j2"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2514B08E;
	Fri, 23 May 2025 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985274; cv=none; b=NZdoydQMsdx7Ey99IHrTyLcl6CZxp/UI8yxPgk+ZCu/IxA7vRWAwYmwyCxgCORjAs/dBvAVWtrMMAI6Z+P13gL1k9B9RGeuTLwUGaSPKvdb6uU1q7OCZUEKF+QE6Aq1MdSMvBuzjF0blwZlKpqZ/m5yWe074vwDdSQAEHTgaae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985274; c=relaxed/simple;
	bh=pia6GTF0Mh+haWDlLZtC6NVS3VxsyNTEbcDkMYl8C1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BMCAQyC/tS4BUbIyVsKlRbYtGJ0l4B/q3n7CWJOXYVYLLFxLvzz0Krllm4httrHTNQuMZbtjETMIxkbvR3CqumOPmdXRwHSCrg366txTHhheYsnaEOqV4z3g4SsiAn2tKKASdCEj5g6701nxErDwvB423RuSDN1CNNeKW+CgtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HJIDY/j2; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EB6B439C1;
	Fri, 23 May 2025 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747985270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fF5aUob062i9t3JjOPj+hAJhI1ZrgpdxwhEcSjQny0U=;
	b=HJIDY/j2NTaUSvk0Cw8TM3MMrasu71tQYPx49illiSCk5D1Y3/FS76LgL/tMkSGZcFPqFP
	ZtQVO5w8xZ46fkL6itUQxl81z6107ANG2/uteUokZNAEJFIxA+H47mKv+U31ZBETbWLXfq
	jerS8+Ej7sOL9kZV2d4e3vbk4+Uh0UVTqbvLN1xoIValn0ndMiFSwDJFocKSijwYrdfzuT
	6BYteusE2MuC9sKbZfedyonTeZgR4VjBsLYOV4PgcoP1NuoBmxyzjT/iWyw/DkXB1ftHgk
	kwDnPutLffO4d9kxY8jMvS08CKUyxhXpSZ1/1dvJshfXz7Z1VXGNfppFDQPmUw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SMP: Move the AP sync point before the
 non-parallel aware functions
In-Reply-To: <CAAhV-H54bTCatqbabhOuvr6O-oOBa-Z4TGyvoT7uGnTjR6OfDw@mail.gmail.com>
References: <20250505-hotplug-paralell-fix-v1-1-86f222cb6d90@bootlin.com>
 <CAAhV-H54bTCatqbabhOuvr6O-oOBa-Z4TGyvoT7uGnTjR6OfDw@mail.gmail.com>
Date: Fri, 23 May 2025 09:27:49 +0200
Message-ID: <87frgvokga.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekvdehucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueetgfffueeivdeitdeuhedtteffueffjedthfevvdegvdevgeduhfektdfhleeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejugdvudemuddvieelmegvtggufhemtgejieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejugdvudemuddvieelmegvtggufhemtgejieejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrr
 ghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Huacai,

> Hi, Gregory,
>
> On Mon, May 5, 2025 at 8:58=E2=80=AFPM Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
>>
>> When CONFIG_HOTPLUG_PARALLEL is enabled, the code executing before
>> cpuhp_ap_sync_alive() is executed in parallel, while after it is
>> serialized. The functions set_cpu_sibling_map() and set_cpu_core_map()
>> were not designed to be executed in parallel, so by moving the
>> cpuhp_ap_sync_alive() before cpuhp_ap_sync_alive(), we then ensure
>> they will be called serialized.
> set_cpu_sibling_map() and set_cpu_core_map() are the most obvious
> functions that need serialization, but you'd better check other places
> to make sure there are no similar functions executed in parallel.

I conducted an exhaustive review of all called functions, which allowed
me to identify an opportunity for improving boot time:
[1]. Additionally, I noted that CPU delay calibration is the only
remaining part where concurrent access could occur. This was indeed the
case prior to my previous patch submission[1]. To ensure safety, I am
about sending a new fix addressing this issue.

Gregory

[1]: https://lore.kernel.org/linux-mips/20250520-smp_calib-v1-1-cd04f0a7864=
8@bootlin.com/
>
> Huacai
>
>>
>> The measurement done on EyeQ5 did not show any relevant boot time
>> increase after applying this patch.
>>
>> Reported-by: Huacai Chen <chenhuacai@kernel.org>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>> Hello,
>>
>> As discussed last week [1], this is the patch that fixes the potential
>> issue with the functions set_cpu_sibling_map() and set_cpu_core_map().
>>
>> Gregory
>>
>> [1]: https://lore.kernel.org/all/aBVBHFGH2kICjnT3@alpha.franken.de/
>> ---
>>  arch/mips/kernel/smp.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
>> index 1726744f2b2ec10a44420a7b9b9cd04f06c4d2f6..7901b59d8f60eddefc020cf2=
a137716af963f09e 100644
>> --- a/arch/mips/kernel/smp.c
>> +++ b/arch/mips/kernel/smp.c
>> @@ -374,13 +374,13 @@ asmlinkage void start_secondary(void)
>>         calibrate_delay();
>>         cpu_data[cpu].udelay_val =3D loops_per_jiffy;
>>
>> +#ifdef CONFIG_HOTPLUG_PARALLEL
>> +       cpuhp_ap_sync_alive();
>> +#endif
>>         set_cpu_sibling_map(cpu);
>>         set_cpu_core_map(cpu);
>>
>>         cpumask_set_cpu(cpu, &cpu_coherent_mask);
>> -#ifdef CONFIG_HOTPLUG_PARALLEL
>> -       cpuhp_ap_sync_alive();
>> -#endif
>>         notify_cpu_starting(cpu);
>>
>>  #ifndef CONFIG_HOTPLUG_PARALLEL
>>
>> ---
>> base-commit: 3b3704261e851e25983860e4c352f1f73786f4ab
>> change-id: 20250505-hotplug-paralell-fix-25224cd229c6
>>
>> Best regards,
>> --
>> Gr=C3=A9gory CLEMENT, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

