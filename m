Return-Path: <linux-mips+bounces-5106-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51A95F2B6
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 15:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7309F2851FE
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 13:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39319183CD3;
	Mon, 26 Aug 2024 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="xAo5l42A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nk9TpX9U"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD0518660E;
	Mon, 26 Aug 2024 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678286; cv=none; b=b9pW7tvVbwAXnLW+yaz/vq0ePxKSnXDsPuAAgf+XNJKaAPvG6z5O99d7tTEdwMidQJDDlIhnnk/bPe6WpJ3g9qqJ3iDHnqMdtwAbWvsZkBmARVy6CrzhsfbJB1n0sk4AFY4tOCVUwJtSe3d1ZMofJ/mlrrwzpDJ2jY5xHxT11MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678286; c=relaxed/simple;
	bh=pmu7uXPGqcVzcXzrSfNLN44lOCpm1i7XA4x7XEEIdCo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=S7VeVo6g7QXoBbsi/ihgvp6A8InLk8SHbo/+IHdIXPwBN+okW05o0VVvhVw5XPuBZzBZ5FpkkITlnthX/Uqa2a2vxuw/v7CW3h6pBlsCX1vnf1Y0XQqHgfpHQt9P0yEUr0x+nETMSgN1fKP2Q5lkY9tWuJFDnTrvJCu6B871PaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=xAo5l42A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nk9TpX9U; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2752A1388073;
	Mon, 26 Aug 2024 09:18:03 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 26 Aug 2024 09:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1724678283;
	 x=1724764683; bh=zkeHuNn5eQC5k7Li4eeQB4/dsmwDOJpcjedrrQwZgjw=; b=
	xAo5l42AOfVfEcWQHh80Y7r/rlHcTguF1vYEtfsTO0UcdKZwFR9awOT9ksjAUrXZ
	hNRa/LJVVRonvhHMUUbQWOJHO9pdbuCxTpaM/bTcjibLi7rgYNgtVH+k9l2oWXV7
	81GyKdH87iigDmSNFQnaJDMt/UeNgXDrsmbWqhqKqrttDgWTRtQZoTGUh5ri5ZaY
	fEkGBDImlGV4yQpUOfo/fCnUB0unMIWroTKRliJ0AJsd47Bdg5upBXSPoYMch4gE
	90JjSnMWSAarVuLz0aa+aw6wLi0W1QqYB/pXmavZBHI0SFGX87CMVCB5ZB60KoXV
	BCQNtcUxsj4SoFgAvZi2qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724678283; x=
	1724764683; bh=zkeHuNn5eQC5k7Li4eeQB4/dsmwDOJpcjedrrQwZgjw=; b=N
	k9TpX9UYGhtDBR1bv+J3O3qPQAP9191EAXWs8mgUkvvHAle6BimUtn1e+uZoCgqZ
	YZ4K/qHdXAEKZnp4FExYEwqCMF6SDqqIdwPkOcOs7YcFjLyopJv1ozCyLr8hvfHj
	OQIt9Vebp8In9SiHejlycNapmWIpk35KcfpwJ3ncM/FqF9xRFUWV/UGpd1UtG0Gc
	aWx4f8ukZgx/Z0gme798tFZIvXTMJX025pyn3EZHYbryA+geeU+8MDDV9DDASMKk
	gxk+yKERy6zyNaMnMKeAaZ9rspuwi7gheAdFi9GYSMiQL31gbCKQPj793UUfdxWp
	IwXgBlNQjaECbsITEbPEQ==
X-ME-Sender: <xms:ioDMZhgvYOIG8yLCz8XkorYsmvrUqKpbC9Ic5HARzY9R9qLBdMrmUA>
    <xme:ioDMZmC5WU82Z9ZrD2ANM63CsXELdBWDZL0K9G6k2efGEQtF2HYECQkza3DiLxnBh
    xSIoBIajLWRRkxklx8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehsthgvvhgvnhdrhhhilhhlsehimhhgthgvtgdrtghomhdprhgtphhtthhopegsjhhorh
    hnsehmohhrkhdrnhhopdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:ioDMZhGGoIGFSLYRlqjBohaPNi1XyZvzqZqruZaXbkSSHZ64BN9obA>
    <xmx:ioDMZmTHWwSvPoGryZ_JxxGjQfE_qJ7SZN248B-IMsPhcRmqlXAFdQ>
    <xmx:ioDMZuyBqxQOOSGsxFiwiHKNXrMMKxR6x8MifYk4hDliuXJ2RcHjtg>
    <xmx:ioDMZs71NtLmG27sRW6d95kiS0WYjYqkQy_nmLJNAdfx7QNDubQpBg>
    <xmx:i4DMZlrbCd_BqEyQc8e4EHgDJztEUSYkvNngqar9bYohgmg61_VRK8x9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5A22F1C20064; Mon, 26 Aug 2024 09:18:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Aug 2024 14:17:39 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Steven J . Hill" <Steven.Hill@imgtec.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <8c49fec9-2afc-44ca-aebc-d08ae0d11305@app.fastmail.com>
In-Reply-To: <87o75gy85b.fsf@miraculix.mork.no>
References: <20240824144133.1464835-1-bjorn@mork.no>
 <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
 <87o75gy85b.fsf@miraculix.mork.no>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=8825=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=883:44=EF=BC=8CBj=C3=B8rn Mork=E5=86=99=E9=81=93=EF=BC=9A
> "Jiaxun Yang" <jiaxun.yang@flygoat.com> writes:
>> =E5=9C=A82024=E5=B9=B48=E6=9C=8824=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=
=E5=8D=883:41=EF=BC=8CBj=C3=B8rn Mork=E5=86=99=E9=81=93=EF=BC=9A
>>> Boards based on the same SoC family can use different boot loaders.
>>> These may pass numeric arguments which we erroneously interpret as
>>> command line or environment pointers. Such errors will cause boot
>>> to halt at an early stage since commit 056a68cea01e ("mips: allow
>>> firmware to pass RNG seed to kernel").
>>>
>>> One known example of this issue is a HPE switch using a BootWare
>>> boot loader.  It was found to pass these arguments to the kernel:
>>>
>>>   0x00020000 0x00060000 0xfffdffff 0x0000416c
>>>
>>> We can avoid hanging by validating that both passed pointers are in
>>> KSEG1 as expected.
>>
>> Hi Bjorn,
>>
>> This is actually breaking 64 bit systems passing fw_args in XKPHYS or=
 KSEG0.
>
> Ouch.  Thanks for the feedback.
>
> But if so, then aren't those already broken with the current test
> against CKSEG0?  I didn't add that.
>

Ah my bad. My impression was it is possible to pass args in XKPHYS with
existing infra (and some PMON bootloader is doing that) but it turns out=
 that
capability was somehow dropped when I was migrating various platforms to
fw_init_cmdline.

Feel free to propose a patch and go with valid_fw_arg, it's always good =
to have=20
robust generic implementation for validating stuff.

In long term we may need to clean up this as Maciej suggested, but IMO g=
oing through
jungle of platforms is not a feasible task for casual contributors.

Thanks
--=20
- Jiaxun

