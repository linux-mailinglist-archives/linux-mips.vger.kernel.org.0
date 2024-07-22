Return-Path: <linux-mips+bounces-4418-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9D938F13
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 14:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F687B20FE5
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B8016D4D8;
	Mon, 22 Jul 2024 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZV4t3T41"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7816CD3B;
	Mon, 22 Jul 2024 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721651402; cv=none; b=hXg5aHeoCZKt/NxJ5McJCzUjYcA2LBGo/7gAjNtbqeUgHzUxvZ4ZPwsYRcff93GtSe6JHbJhVKDZmrWsZgkCx+cXi8VkdAFxph+qDw2snATy6N3APcCCbqX4pPhIz6g5jMcYnjS3UYC9gat0hILboWDQiRCzaD/ThTfhBWW51mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721651402; c=relaxed/simple;
	bh=SdQAuJ950WXTxzuizJg3Ouzx7Gwj+HNNdpFJ/vXsjpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V+v2cNL+CRbynBo27J5bbUecdleAcKsqTJiU+ETLmffwslH3pHlONMMGfIkklRFTAnRn/HXbZ+Zr02H9RRXbJdu48qoJgQHJBF9Qk360OBxvj1kJ9o8pMLfpzG/t/f+b/CFmH62p7n+h23PF6sg+oxPQt47KQc+bZQHtxSAZiuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZV4t3T41; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC66EE0003;
	Mon, 22 Jul 2024 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721651397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdQAuJ950WXTxzuizJg3Ouzx7Gwj+HNNdpFJ/vXsjpY=;
	b=ZV4t3T41+RtA+uevlEdtMHeZ0OgMeZz+48Z7AgRswoSSFyJ/EcgVL4ijbzGwLlalFy0NiG
	mwgzsv3pd7106Ehe24Rpp9+tAeFZHtriJtuOPQC7YNdOlxWZwSB9w7Qp1z/Tb19Xd+8kJv
	3H7co7JFxeuaW+r2Ekh19X4V90wrsrEkO2b2klRuVvUxw4XYjO3q9Y9wArvCuuhOGGgNQh
	wV3jFl9id529aMP6GwqgETAzSDvYVICNIy0wBYCyWXgksKbNcff1syC7qmQLUfHgXWCRAI
	PXy3WB58pXcrk9X0+f8G5jqc32HbZmLf6++QcA4oULjCm1lztYvS7qTGTXarbQ==
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
In-Reply-To: <1811a5de-1a7f-46a9-b8ad-a76ec51f3a23@app.fastmail.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
 <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
 <6cbe8375-c11d-4fbf-8e4f-b15828ac3480@app.fastmail.com>
 <87jzhdkask.fsf@BLaptop.bootlin.com> <87h6chk9xo.fsf@BLaptop.bootlin.com>
 <1811a5de-1a7f-46a9-b8ad-a76ec51f3a23@app.fastmail.com>
Date: Mon, 22 Jul 2024 14:29:56 +0200
Message-ID: <87ed7lk3sr.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

"Jiaxun Yang" <jiaxun.yang@flygoat.com> writes:

> =E5=9C=A82024=E5=B9=B47=E6=9C=8822=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=886:17=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> Gregory CLEMENT <gregory.clement@bootlin.com> writes:
>>
>>> Hello Jiaxun,
>>>
>>>> =E5=9C=A82024=E5=B9=B47=E6=9C=8820=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=
=8A=E5=8D=8811:13=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>>>>> =E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=
=8B=E5=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>>>>> Unlike most other MIPS CPUs, the I6500 CPUs have different address
>>>>>> offsets for the Global CSR Access Privilege register. In the "MIPS64
>>>>>> I6500 Multiprocessing System Programmer's Guide," it is stated that
>>>>>> "the Global CSR Access Privilege register is located at offset 0x012=
0"
>>>>>> in section 5.4.
>>>>>>
>>>>>> However, this is not the case for other MIPS64 CPUs such as the
>>>>>> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software Us=
er's
>>>>>> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
>>>>>> offset of 0x0020.
>>>>>
>>>>> Hi Gregory,
>>>>>
>>>>> I confirmed this is a CM3 feature rather than CPU core (Samruai) feat=
ure.
>>>>
>>>> Oh I=E2=80=99m not really sure if it=E2=80=99s CM 3.5 only.
>>>>
>>>> Let me check this Monday once I can checkout old design database for
>>>> I6400.
>>>
>>> Ok, so I am waiting for your feedback :)
>>> And I am also trying to see if I can find the datasheet for I6400.
>>>>
>>>> Hardware resets GCR_ACCESS to the most permissive value so I assume
>>>> it=E2=80=99s your bootloader doing wired hacks.
>>
>> I found an I6400 datasheet [1] and in the "5.4 CM Register Access
>> Permissions" paragraph, it is written "the Global CSR Access Privilege
>> register located at offset 0x0120". So it has the same offset as the
>> I6500.
>
> Yes, I hand confirmed this modification was made to CM block at transition
> from CM2.5 to CM3.
>
> Other unannounced CM3 products (Daiymo, King for people knowing codenames)
> have this change as well.
>
> So for this modification, you can safely do:
> mips_cm_revision() >=3D CM_REV_CM3
>
> And perhaps name this GCR after access_cm3.

Yes, surely it will fit better with what we know now.

I will send a new version soon.

Thanks!

>
> Thanks
> - Jiaxun
>
>>
>> Gregory
>>
>> [1]:=20
>> https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MIPS_Warrior=
_I6400_ProgrammerGuide_MD01196_P_1.00.pdf
>>
>>>
>>> Indeed, other bootloaders seem to not modify it, so that's why I think
>>> the issue was never detected until now. However, we want to be as
>>> independent as possible from the bootloader, so we really need to fix
>>> it.
>>>
>>> Thanks for your review!
>>>
>>> Gregory
>>>
>
> --=20
> - Jiaxun

