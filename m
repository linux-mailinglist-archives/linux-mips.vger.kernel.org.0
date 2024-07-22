Return-Path: <linux-mips+bounces-4417-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA0938D93
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 12:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2292818A6
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 10:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C11C16A39E;
	Mon, 22 Jul 2024 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="U/k1L1Qd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kwq5GoYW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450C23DE;
	Mon, 22 Jul 2024 10:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644621; cv=none; b=Zxf4KG+ulmR+mmHumiig5Z/hesjpwdfiwbwOnamohZpZEJi+Zia/jSkck2oFzfDWCzd0LelUfFP7HaD9riR/XiSPGA29AJyKwkMu9MSuHyqlOf65ouWLXC9QoEl6dYyUCmfuWxNKLGpTwiVddu2ZG8WfnFm65euuIdEkBDyspC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644621; c=relaxed/simple;
	bh=gIqQeeHccS1JosV/coIo4u8V0NEzZt0pXYow2gpkKZg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=e/hSA41IwzUC48vxBffn4Es4HC0zB6L106KlkEq+EIMGutTOeCHvVnAePdCe1HquxkG/1+u2piP5ZzzM83CI4soBATqZg0HOWw+Qg+e1olpVDYJD/0m8LDKbfrNHENTeCOxD/UaKEdDH08Mkz8LpLbysiKJTdTzIEJ3zUPV/PiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=U/k1L1Qd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Kwq5GoYW; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2FDB8138011A;
	Mon, 22 Jul 2024 06:36:58 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute5.internal (MEProxy); Mon, 22 Jul 2024 06:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721644618;
	 x=1721731018; bh=gIqQeeHccS1JosV/coIo4u8V0NEzZt0pXYow2gpkKZg=; b=
	U/k1L1QdNSuFOpsZKM8Rx2go25mrb6hC56G5s0KaJdYePMuRi03fg57zGN+AEU39
	j4Fu+R7FrHbk6/6MTvb1RV5Bei/kWtjsHmfXTerciLC0bbL1PYpmlNCU8dM07URZ
	yH9Q5duuLFZ00Ry3cyecTy+GIFwgCvYC1L7VFPr30rmD5E73tsDaIQ/TYwTO74HY
	d7NpSNvVyK4H7Hug1tuft+3E1O/SqScGG33ETjqvaCSei6C2kn0Ta9pM2UMsQ0JV
	qofT7agkD71sNdDHrP3/G/x6AY2MGGa+9HVTnsBQQdVVYdMhhmByLZGPExsMDZJR
	KBYpqowGQ1j7C5uZbCNdyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721644618; x=
	1721731018; bh=gIqQeeHccS1JosV/coIo4u8V0NEzZt0pXYow2gpkKZg=; b=K
	wq5GoYWV9HrxJAOyBYBhiSFiadKGp9X1ltD7wEwsL6VEeCFIKSJzJA850z9Fktr/
	/ByOg8yGYEqp37TdF2KQxXVrRHn2pp+jZ98YfpEMmCCVeSVrfHAQO0Ji2ggcmUd2
	QIj/9AeGkaNrSH0j61IZwuqK0kqz7Tj1PZMktgCTXTzn9ZB/ajndk042q8OXA+5R
	a95rVJ8q+ixaeVZ2X1GwIQPgMSKC8m+0GhNjXOW8P/MtAuxk2PYkfhLacryaFtis
	FJOlM3i7V31lMIXWGzELr7PzXQC/WWv2Uz1q61LsaYeXP1C3ze/4y4yjo0EjkmDY
	4Nss46t2Ui0a8HYYqZFpA==
X-ME-Sender: <xms:STaeZtSUK5WvzRFP1IQ-b0a1mmctUGcyZHLZKDTd1416W996LYpP9g>
    <xme:STaeZmzyqv4I2f_g9qSzNixj1YrycfyThtHe4EA6YkFn_Rhy-EqAc0lzqlHyKJFWT
    3uaDhYUKJAcAdhSe60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhephffhjefhhfetledvieehtdeghefgleegkefffedvffek
    ffeuueeikefgjeelteeknecuffhomhgrihhnpegrmhgriihonhgrfihsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:STaeZi2Yhh-SNwam89Csat_e7ZXZeQoSpW6BQw5i3u4AkU0L7_GxSQ>
    <xmx:STaeZlClZu1fDuBdy3uYqpiLl9mD1frfO9NfqAjorsN0tqPtR6ziMQ>
    <xmx:STaeZmgHPk8fCRsBHiTIyvNyw8aPoTFAkvqXSxFPLTBPUvEm-XFbRg>
    <xmx:STaeZpoz1_z14GX_Cya8uBYd-B1BBXaTYtUc3mtJvzju3EOHd7zB1w>
    <xmx:SjaeZvXlbxo-DOB-GqfLSGuudCH8E5UIKfaLdwd-jSbi89qMnzNd0wV->
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 752B019C0069; Mon, 22 Jul 2024 06:36:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1811a5de-1a7f-46a9-b8ad-a76ec51f3a23@app.fastmail.com>
In-Reply-To: <87h6chk9xo.fsf@BLaptop.bootlin.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
 <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
 <6cbe8375-c11d-4fbf-8e4f-b15828ac3480@app.fastmail.com>
 <87jzhdkask.fsf@BLaptop.bootlin.com> <87h6chk9xo.fsf@BLaptop.bootlin.com>
Date: Mon, 22 Jul 2024 18:36:37 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for I6500
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8822=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=886:17=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> Gregory CLEMENT <gregory.clement@bootlin.com> writes:
>
>> Hello Jiaxun,
>>
>>> =E5=9C=A82024=E5=B9=B47=E6=9C=8820=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=
=8A=E5=8D=8811:13=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>>>> =E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=
=8B=E5=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>>>> Unlike most other MIPS CPUs, the I6500 CPUs have different address
>>>>> offsets for the Global CSR Access Privilege register. In the "MIPS=
64
>>>>> I6500 Multiprocessing System Programmer's Guide," it is stated that
>>>>> "the Global CSR Access Privilege register is located at offset 0x0=
120"
>>>>> in section 5.4.
>>>>>
>>>>> However, this is not the case for other MIPS64 CPUs such as the
>>>>> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software =
User's
>>>>> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
>>>>> offset of 0x0020.
>>>>
>>>> Hi Gregory,
>>>>
>>>> I confirmed this is a CM3 feature rather than CPU core (Samruai) fe=
ature.
>>>
>>> Oh I=E2=80=99m not really sure if it=E2=80=99s CM 3.5 only.
>>>
>>> Let me check this Monday once I can checkout old design database for
>>> I6400.
>>
>> Ok, so I am waiting for your feedback :)
>> And I am also trying to see if I can find the datasheet for I6400.
>>>
>>> Hardware resets GCR_ACCESS to the most permissive value so I assume
>>> it=E2=80=99s your bootloader doing wired hacks.
>
> I found an I6400 datasheet [1] and in the "5.4 CM Register Access
> Permissions" paragraph, it is written "the Global CSR Access Privilege
> register located at offset 0x0120". So it has the same offset as the
> I6500.

Yes, I hand confirmed this modification was made to CM block at transiti=
on
from CM2.5 to CM3.

Other unannounced CM3 products (Daiymo, King for people knowing codename=
s)
have this change as well.

So for this modification, you can safely do:
mips_cm_revision() >=3D CM_REV_CM3

And perhaps name this GCR after access_cm3.

Thanks
- Jiaxun

>
> Gregory
>
> [1]:=20
> https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MIPS_Warri=
or_I6400_ProgrammerGuide_MD01196_P_1.00.pdf
>
>>
>> Indeed, other bootloaders seem to not modify it, so that's why I think
>> the issue was never detected until now. However, we want to be as
>> independent as possible from the bootloader, so we really need to fix
>> it.
>>
>> Thanks for your review!
>>
>> Gregory
>>

--=20
- Jiaxun

