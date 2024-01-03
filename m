Return-Path: <linux-mips+bounces-857-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7352822EF2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jan 2024 14:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8599B1F242E8
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jan 2024 13:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11DD19BC0;
	Wed,  3 Jan 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="AWm0SZyf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r5hDHGJ8"
X-Original-To: linux-mips@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4B19BB2
	for <linux-mips@vger.kernel.org>; Wed,  3 Jan 2024 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 8504E5C01EA;
	Wed,  3 Jan 2024 08:51:07 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jan 2024 08:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1704289867;
	 x=1704376267; bh=l9+lZmw1/XeEju8JrA17+kEkcmevn43oaiKUgfnTTpo=; b=
	AWm0SZyfvocXGEzilCwrZp/aUYTsc875na6dFX85+p4VCcu5IKR6+Msnax5SqNOM
	/jdlBrl1qz0VNY1JFWlLG1AdvL6BL7KOsBve/ujAJ0YApA1pu0+is0/V6buJtu0W
	NXn4TOpaYdPIumrgx3qs0aNL0jUDE0Kyjz8y56QucAJLDT1dEyGbtOL/1lhnfFAB
	5SQ0aM7rCmwv69DQ/wOv2ZkkpaKav2LVlVLgx+W5EzB12m7j5EOycbCAPfu+Bt0c
	xU3a0PYVOKqb6BgU6YluFcB1wMFx0lZm2OI6jt+eFp0Q173Y0wBZuE7wi2wCLXLO
	FmoN/EGPh8k/X9mORlanlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704289867; x=
	1704376267; bh=l9+lZmw1/XeEju8JrA17+kEkcmevn43oaiKUgfnTTpo=; b=r
	5hDHGJ8qpFen5bFECiVVtrykBKPVVX9YuNEafucw8GBjGod35rHx7WqDfLTAFBA3
	aW2PgtqcHFDQt2d9t3gMCpRXrzhR4EyDpA0QkuFFqtz8ZMqMFQIiwtUjHKJXArxn
	T8RyeVDGei05GZIxWNGICPlYW0pEzEVZZUhK8g/gpP4Zcjy/6oAlfif33c0xx5cP
	OlKzNMQ0zIcTwOOWJRmNJeH1JnjQ5eCWt/3WvYTtTeO3HWyiNStzs1uQ1QTghnaV
	C7UewB4wm9xPpuceuny/uoGaSEQ1uiA0Xr5LlH8/itPt0Z/20mJWrnX/VP8DrbE8
	gIf6hKLvkU66gvz9LCYrA==
X-ME-Sender: <xms:S2aVZXX6T4-bL7s3ZfmbHtybrDQjltBlfTxY5uD5zUREgW6ShFNKwQ>
    <xme:S2aVZfnd5IEjemjO0ygBv-DFVUJouF4fKib7xQ_nVotgsZQpbpCNN2-rSNrqEDIq_
    nhYiK4ZS2CL7JMlsUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeghedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
    hqredtreerjeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefteegkeevfe
    ethffgudehgedvueduvdeifedvvdelhfefheekteefueektdefjeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:S2aVZTaRzHRCLq37_7qvKjmZhC8BLEIQtl9ePQHfTRukbR8l7LQpqA>
    <xmx:S2aVZSXEO3xjbiw6ZJ7uz5L8nSgP9uohaYk1yG51qT1xm0otnEILMw>
    <xmx:S2aVZRmGC7yISJVJlB7IYYW2yg1isGknL5Fj9q9UKblVDjiVEgeZ-w>
    <xmx:S2aVZfR2HxBiYVFs4oUR5vpR5PJXNQODgtJaQve2JzF2fe5r9ZobRw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2A3BC36A0077; Wed,  3 Jan 2024 08:51:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <bf5d0ac0-f237-4b68-a339-7f0a3b7b8f00@app.fastmail.com>
In-Reply-To: <ec0cc350-9c29-4c95-9ec7-871aaefe8cd2@flygoat.com>
References: <87plyyrupy.fsf@telent.net>
 <ec0cc350-9c29-4c95-9ec7-871aaefe8cd2@flygoat.com>
Date: Wed, 03 Jan 2024 13:50:46 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: dan@telent.net, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: question: malta doesn't use a1 for fdt from bootloader
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B412=E6=9C=8825=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8B=E5=8D=881:33=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A8 2023/12/22 17:51, dan@telent.net =E5=86=99=E9=81=93:
>>=20
>> Newbie question:
>>=20
>> I noticed while writing some test automation with QEMU and U-Boot that
>> the Malta kernel appears to ignore any DTB provided by the bootloader=
, in
>> favour of using the one embedded into the kernel image. Is there a
>> reason behind this, or is it just not a thing that's been changed sin=
ce
>> the board was converted to use device tree?
>
> Hi,
>
> It's a bit of history that DeviceTree passed by YAMON bootloader to=20
> kernel does not compatible with upstream kernel's devicetree bindings,
> so we decided to just omit it.

Hi Dan,

I checked malta YAMON firmware release and can confirm that it is safe
on to do so. These firmwares won't set fw_arg0 to -2.

I think you can make it a patch.

Thanks
- Jiaxun


>
>>=20
>> I patched my own kernel to check $a1 as the "mips generic" kernel doe=
s,
>> and it seems to work, but maybe I'm missing something? I did have to
>> rebuild U-Boot with different CONFIG options to make use of it (I don=
't
>> khow what real hardware Malta uses for a bootloader) so perhaps it has
>> limited use.
>>=20
>> If the change is acceptable in principle I'll tidy it up and submit
>> a patch with all the proper procedure.
>
> I'm not sure if this is ok for YAMON-DT systems, will check on those=20
> systems.
>
> Thanks
> - Jiaxun
>>=20
>> Opinions welcome
>>=20
>> -dan
>>=20
>>=20
>> diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/=
malta-setup.c
>> index 21cb3ac1237b..52e731f9b4e2 100644
>> --- a/arch/mips/mti-malta/malta-setup.c
>> +++ b/arch/mips/mti-malta/malta-setup.c
>> @@ -192,7 +192,9 @@ static void __init bonito_quirks_setup(void)
>>  =20
>>   void __init *plat_get_fdt(void)
>>   {
>> -       return (void *)__dtb_start;
>> +       return (fw_arg0 =3D=3D -2) ?
>> +               (void *) (KSEG1ADDR(fw_arg1)) :
>> +               (void *) __dtb_start;
>>   }
>>  =20
>>   void __init plat_mem_setup(void)
>>

--=20
- Jiaxun

