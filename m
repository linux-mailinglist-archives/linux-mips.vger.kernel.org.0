Return-Path: <linux-mips+bounces-4416-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E26938D5F
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 12:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995741C203A7
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 10:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61463163AA7;
	Mon, 22 Jul 2024 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gXvFQhuZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C509014B95E;
	Mon, 22 Jul 2024 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721643454; cv=none; b=sYrwToYH8FbJ/l+sAvs0VR4OiRgXR/hNx/Mfn83ntgOTBNO949q+5TiTyzTZtGFqV6WyN6edguC/f5H57ZomBj1SoVuFHhPYSBKB6+rkB1gVl0RGPBDbqzXVqwBeqMsR2mBfF38yIxefpso8w6Oq16stq6FW3mU9ZdNNHf7H3ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721643454; c=relaxed/simple;
	bh=n6M4WwTlYTgMRJXsb+W23WRcygwnxKzRq6IjSHZxoMg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QYavepeNbvMg5RtgDiZA0oORUjACZVmBml6PdDtpbFY0qvs4hZPI08rrR80voCuHSWoSy5c5suEEpnqc/+BtOaV4sZWfQEYn8IB5Kc6dupks12oRaefvF5167TOhyE36GCegAkGcXZGAzMD8GLo8360RPt8tEIgO8oTpe3YR9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gXvFQhuZ; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D570DC0004;
	Mon, 22 Jul 2024 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721643444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZl9/xxJh8NRVF5Fs1hNSmhJmlfmZgzABt1M/4k1Gb8=;
	b=gXvFQhuZlYPHYHR2jP1N8v3i7VJheLfZ2sdFIU4NR6xphhO9qqYgLc748zWIiyo1lPGf2u
	foXdTBBuXjhczCVQBcmDbbFMkAAxf+1qBNElfuJlHaJTEyhMFewN7B926VhASTILQi0oRi
	XgiylrBaxaQNlqAnuoKDiLRPo7aTYcDfYr/z6SD6Km62IHzVByYSYSVKx+RwmipUQg0EkG
	mkJUkjiFl7dN0Bun5jvh5ya2xUH6QBi05nBoAfuqanYgacur95BV1NXHpsx/wEgXmVpRjC
	cKpO0mUQ5kI/S/XI+aJZFSbjMM0upAX/J5/o8NLxpdyioAXC3cMjc2iFf1TInw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "paulburton@kernel.org"
 <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for
 I6500
In-Reply-To: <87jzhdkask.fsf@BLaptop.bootlin.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
 <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
 <6cbe8375-c11d-4fbf-8e4f-b15828ac3480@app.fastmail.com>
 <87jzhdkask.fsf@BLaptop.bootlin.com>
Date: Mon, 22 Jul 2024 12:17:23 +0200
Message-ID: <87h6chk9xo.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Gregory CLEMENT <gregory.clement@bootlin.com> writes:

> Hello Jiaxun,
>
>> =E5=9C=A82024=E5=B9=B47=E6=9C=8820=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=
=E5=8D=8811:13=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>>> =E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>>> Unlike most other MIPS CPUs, the I6500 CPUs have different address
>>>> offsets for the Global CSR Access Privilege register. In the "MIPS64
>>>> I6500 Multiprocessing System Programmer's Guide," it is stated that
>>>> "the Global CSR Access Privilege register is located at offset 0x0120"
>>>> in section 5.4.
>>>>
>>>> However, this is not the case for other MIPS64 CPUs such as the
>>>> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software User=
's
>>>> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
>>>> offset of 0x0020.
>>>
>>> Hi Gregory,
>>>
>>> I confirmed this is a CM3 feature rather than CPU core (Samruai) featur=
e.
>>
>> Oh I=E2=80=99m not really sure if it=E2=80=99s CM 3.5 only.
>>
>> Let me check this Monday once I can checkout old design database for
>> I6400.
>
> Ok, so I am waiting for your feedback :)
> And I am also trying to see if I can find the datasheet for I6400.
>>
>> Hardware resets GCR_ACCESS to the most permissive value so I assume
>> it=E2=80=99s your bootloader doing wired hacks.

I found an I6400 datasheet [1] and in the "5.4 CM Register Access
Permissions" paragraph, it is written "the Global CSR Access Privilege
register located at offset 0x0120". So it has the same offset as the
I6500.

Gregory

[1]: https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MIPS_Warri=
or_I6400_ProgrammerGuide_MD01196_P_1.00.pdf

>
> Indeed, other bootloaders seem to not modify it, so that's why I think
> the issue was never detected until now. However, we want to be as
> independent as possible from the bootloader, so we really need to fix
> it.
>
> Thanks for your review!
>
> Gregory
>
>>
>> Thanks
>>
>>>
>>> Please use CM version to select register region.
>>> (And perhaps Cc stable for this patch?)
>>>
>>> Thanks
>>> - Jiaxun
>>>
>>>>
>>>> This fix allows to use the VP cores in SMP mode.
>>>>
>>>> Based on the work of Vladimir Kondratiev <vladimir.kondratiev@mobileye=
.com>
>>>>
>>>> Fixes: 859aeb1b0dd1 ("MIPS: Probe the I6500 CPU")
>>>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>>>> ---
>>>>  arch/mips/include/asm/mips-cm.h | 4 ++++
>>>>  arch/mips/kernel/smp-cps.c      | 5 ++++-
>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/m=
ips-cm.h
>>>> index 3d9efc802e36..41bf9b3a98fb 100644
>>>> --- a/arch/mips/include/asm/mips-cm.h
>>>> +++ b/arch/mips/include/asm/mips-cm.h
>>>> @@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
>>>>  GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
>>>>  #define CM_GCR_CPC_STATUS_EX			BIT(0)
>>>>=20
>>>> +/* GCR_ACCESS - Controls core/IOCU access to GCRs */
>>>> +GCR_ACCESSOR_RW(32, 0x120, access_i6500)
>>>> +#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
>>>> +
>>>>  /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=
=3D1=20
>>>> */
>>>>  GCR_ACCESSOR_RW(32, 0x130, l2_config)
>>>>  #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
>>>> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
>>>> index e074138ffd7f..60590890b6da 100644
>>>> --- a/arch/mips/kernel/smp-cps.c
>>>> +++ b/arch/mips/kernel/smp-cps.c
>>>> @@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigned=
=20
>>>> int vpe_id)
>>>>  	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
>>>>=20
>>>>  	/* Ensure the core can access the GCRs */
>>>> -	set_gcr_access(1 << core);
>>>> +	if (current_cpu_type() !=3D CPU_I6500)
>>>> +		set_gcr_access(1 << core);
>>>> +	else
>>>> +		set_gcr_access_i6500(1 << core);
>>>>=20
>>>>  	if (mips_cpc_present()) {
>>>>  		/* Reset the core */
>>>>
>>>> ---
>>>> base-commit: 9298d51eb3af24f88b211087eb698399f9efa439
>>>> change-id: 20240719-smp_i6500-8cb233878c41
>>>>
>>>> Best regards,
>>>> --=20
>>>> Gregory CLEMENT <gregory.clement@bootlin.com>
>>>
>>> --=20
>>> - Jiaxun
>>
>> --=20
>> - Jiaxun

