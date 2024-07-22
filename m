Return-Path: <linux-mips+bounces-4415-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F0938CEC
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 12:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0E6CB24A9C
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 10:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC1F1684A3;
	Mon, 22 Jul 2024 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="deDa2cyZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B5167296;
	Mon, 22 Jul 2024 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642337; cv=none; b=tDU43gbICUVYhFVqAIWcpGGNlcV3gJ1k8PzPoYEPSwcGhOGVv/guj7tdVHGsA+iK40eiyLUC5F7bA8QGSt5ExKxX8olCEuifKYA1hzQKJR5eV9Pe4WzjdTtzsrJVsM7ae0nPfkULlKtAw6Mez/xQ8vlJm1OMTsaSuAgWSz4wqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642337; c=relaxed/simple;
	bh=9J3yO3VnNWzO/4STaUVUzujyu858CDek+7ttBwvKm1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JjH+dHNk7e3m4seyW29cw+dPso+0htb3o5/kvosIWkCI/VICTEGthykTK/WqfIKsZwjzrxJpv2h8BEZ73EbEwTJMy11j3JQO+lzIRAiLWJyC9WgY/ocJpciQlXy4YqX8toNwZT9Xh99D81REB37i733SWNUgZw2F5GM6pQuOXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=deDa2cyZ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4775E1C0002;
	Mon, 22 Jul 2024 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721642332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/jAjVSgCQGsv/OChkMWXRpZsKoUOm6qP05EXuWLEAc=;
	b=deDa2cyZXK/WVwDqDkFUeqqrAK7RXja9FxvGIsK4UQPE0kn2ufXUP81r1HTH/NKOU+2x8N
	jv1WcY67MFN2LC9szuPfFKBrfrU1LaHpuk+Zr1ZlIyLFfQ6uwfeiZ7FZnXeBI0xJ7NjO3x
	LXs6jpOnmYjg7yfXB7tBEJufa04ubwJJ+eQruLGmf/EqKDIFk+AdZ1NBo4jCZHRH9YTsOg
	ZKE6EaQcc7EpT8/QeEvBxoDR2JHEV7wR+Sth8pGbKIge0Zxz9eUpmZ66xUYpzgmzWpRyAe
	BrgOIjjSXJAL8nvwjqwlx+5hjAW5ipq6aWvIJKV4dD9eNzR4HL7iMl+ZygtlFQ==
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
In-Reply-To: <6cbe8375-c11d-4fbf-8e4f-b15828ac3480@app.fastmail.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
 <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
 <6cbe8375-c11d-4fbf-8e4f-b15828ac3480@app.fastmail.com>
Date: Mon, 22 Jul 2024 11:58:51 +0200
Message-ID: <87jzhdkask.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Jiaxun,

> =E5=9C=A82024=E5=B9=B47=E6=9C=8820=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=
=E5=8D=8811:13=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> =E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>> Unlike most other MIPS CPUs, the I6500 CPUs have different address
>>> offsets for the Global CSR Access Privilege register. In the "MIPS64
>>> I6500 Multiprocessing System Programmer's Guide," it is stated that
>>> "the Global CSR Access Privilege register is located at offset 0x0120"
>>> in section 5.4.
>>>
>>> However, this is not the case for other MIPS64 CPUs such as the
>>> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software User's
>>> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
>>> offset of 0x0020.
>>
>> Hi Gregory,
>>
>> I confirmed this is a CM3 feature rather than CPU core (Samruai) feature.
>
> Oh I=E2=80=99m not really sure if it=E2=80=99s CM 3.5 only.
>
> Let me check this Monday once I can checkout old design database for
> I6400.

Ok, so I am waiting for your feedback :)
And I am also trying to see if I can find the datasheet for I6400.
>
> Hardware resets GCR_ACCESS to the most permissive value so I assume
> it=E2=80=99s your bootloader doing wired hacks.

Indeed, other bootloaders seem to not modify it, so that's why I think
the issue was never detected until now. However, we want to be as
independent as possible from the bootloader, so we really need to fix
it.

Thanks for your review!

Gregory

>
> Thanks
>
>>
>> Please use CM version to select register region.
>> (And perhaps Cc stable for this patch?)
>>
>> Thanks
>> - Jiaxun
>>
>>>
>>> This fix allows to use the VP cores in SMP mode.
>>>
>>> Based on the work of Vladimir Kondratiev <vladimir.kondratiev@mobileye.=
com>
>>>
>>> Fixes: 859aeb1b0dd1 ("MIPS: Probe the I6500 CPU")
>>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>>> ---
>>>  arch/mips/include/asm/mips-cm.h | 4 ++++
>>>  arch/mips/kernel/smp-cps.c      | 5 ++++-
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mi=
ps-cm.h
>>> index 3d9efc802e36..41bf9b3a98fb 100644
>>> --- a/arch/mips/include/asm/mips-cm.h
>>> +++ b/arch/mips/include/asm/mips-cm.h
>>> @@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
>>>  GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
>>>  #define CM_GCR_CPC_STATUS_EX			BIT(0)
>>>=20
>>> +/* GCR_ACCESS - Controls core/IOCU access to GCRs */
>>> +GCR_ACCESSOR_RW(32, 0x120, access_i6500)
>>> +#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
>>> +
>>>  /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=
=3D1=20
>>> */
>>>  GCR_ACCESSOR_RW(32, 0x130, l2_config)
>>>  #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
>>> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
>>> index e074138ffd7f..60590890b6da 100644
>>> --- a/arch/mips/kernel/smp-cps.c
>>> +++ b/arch/mips/kernel/smp-cps.c
>>> @@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigned=
=20
>>> int vpe_id)
>>>  	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
>>>=20
>>>  	/* Ensure the core can access the GCRs */
>>> -	set_gcr_access(1 << core);
>>> +	if (current_cpu_type() !=3D CPU_I6500)
>>> +		set_gcr_access(1 << core);
>>> +	else
>>> +		set_gcr_access_i6500(1 << core);
>>>=20
>>>  	if (mips_cpc_present()) {
>>>  		/* Reset the core */
>>>
>>> ---
>>> base-commit: 9298d51eb3af24f88b211087eb698399f9efa439
>>> change-id: 20240719-smp_i6500-8cb233878c41
>>>
>>> Best regards,
>>> --=20
>>> Gregory CLEMENT <gregory.clement@bootlin.com>
>>
>> --=20
>> - Jiaxun
>
> --=20
> - Jiaxun

