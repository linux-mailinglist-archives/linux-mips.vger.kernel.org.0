Return-Path: <linux-mips+bounces-4128-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E75926B3E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 00:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2050B22778
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 22:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483C9152163;
	Wed,  3 Jul 2024 22:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="s8Zj7kWf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="esisf+gy"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3595D13D892;
	Wed,  3 Jul 2024 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720044457; cv=none; b=GsmCba1OVqtFTzhDCGCDEK3scw4oiGJquf4KhCJ+XmsACh4FkpQ9fqVr5MOrLQl4Xgc6FsXl03eFOb/SzOImtkzyuHDA1Izcr2nVlLSdxTSaBZJyXLv+i2txyEGpoL5FvnGYLZ6M28HWkQW+vMjm2XaTqZkCPeHy1AES0TFgwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720044457; c=relaxed/simple;
	bh=soJI4chtLIqLeO17PIJX+g63ipl3X1zqSemWr9hFUsI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=a0g7y3+S6T+P8Gei7F1nDey4pwNfyClmIPuNUv9rsa4DUpdZX07bZbVRSDKsYGs4YZa4rCL//IwT34RXCoe5xeJ84MMLg9pt0k++4eLLtB7RgBxnSweP6grqsYdcJ8FHXBTC21rjjXnGMe8gnWoUF3fmQuFhE8UmKfz0241v1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=s8Zj7kWf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=esisf+gy; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id 147CB20031B;
	Wed,  3 Jul 2024 18:07:34 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jul 2024 18:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720044454;
	 x=1720051654; bh=JbuTlFU3jY908U9UsfPP3FjyAvYnMyUyEQgWmOJdyvo=; b=
	s8Zj7kWf4HrHU7BXUKaqo4iWTIsCCdlJr14dprcvQzsKTwOA/JpaxfgbBaFnOxUD
	bM3ZEgesxre7ISn4gPFmMr0Vqa1nfWMj4Mp7RRGKtzUL9vVk2twk02BAOiHltvaD
	i5KpDb75zoyBC43IgyfDt90wqHBVQMf5BSre7IbOe+I/RoZdRDpe6fBOS2kvGURx
	E6Clfls0GV9bB4P+eND6NQImYXVC0xRO9jXPbmcyuiQiemh+8RNyXFC8k+dsJ0iW
	2cD/amQWFZurm2TG9XLtXvgr8EP9qoUFZ0YFIG2AJ81/f0UX+dFkJlof91fLi09X
	ri72xFPa9TA6QDJOWrbmeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=ifd894703.fm2; t=
	1720044454; x=1720051654; bh=JbuTlFU3jY908U9UsfPP3FjyAvYnMyUyEQg
	WmOJdyvo=; b=esisf+gyG2ZL/r/3cwCOMzi8Tzha2dArYF8lnjPuWcc5g8hiGV3
	5uJnI9VuZMxUuUpA3scYSX6w8pGKIDByRN5yzFC550syae3fh9TPXGNWQSuuZXkY
	JnAchkTwh84ve6P1LHxiHuKnGb6dwwEXDdVk4T2wZtwZKdwzpzFXpiUtgyNdrQ5G
	aWx3qnAj7tWD0UiiNAH9nnttrd1wm6n9BKQMm2yVmL0M4HJhRiZwuovzlU6PHiCA
	RFuW9XzOn6IiCbfWE5ivUzjXR+HgctEVwke7xCxILgEGVZCXpDqRwCC26sG6bYEF
	su9Fy49IWrmR++q7SkdYzYJqFakJ1g7yE7Q==
X-ME-Sender: <xms:pcuFZiQ6mKZMIfjBPPklrG3uySLYsu3YuPE2VdTunKuxTQaQQ9ryEA>
    <xme:pcuFZnw1M8yRchYnWPCwFLQ_2abTNJIjqfudP-DKfjO9vBF8TuupkkkvBVvd2saEb
    f4bGTalrbCcT3p67u8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:psuFZv2Fi8FQF90Xuy6zr7CRPetTEals_zlKX2vKfODDHKVt61PR-A>
    <xmx:psuFZuDG6PLJ4kMaHzgPD7oGG862n0zfwIDYED7OMYPn_o5hZ2sLpw>
    <xmx:psuFZrixjWJQZUOoCY5UMCa1CDwQLnFTWfWlPWmFOpjFSSCADNOB-Q>
    <xmx:psuFZqqXhirXqkG5UeR9IcA4cNUo1VoMoYDDoqS_5kNwKi3oPLrcgg>
    <xmx:psuFZujg5raPLlQFt2rSu0T8x2CrQClS-L0-j2A5zOshRZ96LnYszYFj>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E056D36A0074; Wed,  3 Jul 2024 18:07:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e54ec104-2e19-46da-8c3d-b6b7f620f563@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2407032204331.38148@angie.orcam.me.uk>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
 <ZoVokcDYqZnuqd2X@alpha.franken.de>
 <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
 <alpine.DEB.2.21.2407032204331.38148@angie.orcam.me.uk>
Date: Thu, 04 Jul 2024 06:07:12 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=884=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=885:26=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 4 Jul 2024, Jiaxun Yang wrote:
>
>> It has been tested on MIPS Boston I6500, malta SOC-It, Loongson-2K,
>
>  SOC-it (or SOC-it 101 to be precise) is the name of a bus controller:
>
> System controller/revision =3D    MIPS SOC-it 101 OCP / 1.3   SDR-FW-4=
:1
>
> used across numerous platforms from the M4K core onwards, UP, MT, or M=
P. =20
> I think it would make sense if you revealed the processor type instead.

Sure, sorry to be vague on the platform detail.

I actually tried on two Malta configurations, CoreFPGA6 interAptiv 2MPF =
(2 cores, 2 VPE, 4TC),
and CoreFPGA3 34Kc MT (2VPE 9TC).

>
>> I don't really know broadcom platforms and SGI platforms well so
>> changes to those platforms are kept minimal (no functional change).
>
>  Technically I could run it on my SB1250, but I'm too overloaded now t=
o=20
> commit to any timescale.  Sorry.

No worries, I'll try to fetch a BMIPS3000 SMP router to get Broadcom pla=
tform
undercover.

Thanks
>
>   Maciej

--=20
- Jiaxun

