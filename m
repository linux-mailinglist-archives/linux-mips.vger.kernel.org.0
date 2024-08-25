Return-Path: <linux-mips+bounces-5074-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8E95E36B
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8EE1F216A9
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 12:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC53E14F9D7;
	Sun, 25 Aug 2024 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="XygxjPE8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sXQ19pl4"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554C16F2E0;
	Sun, 25 Aug 2024 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724590267; cv=none; b=Sit5UqyHdOsQWDaeSCKMF4bKrwoteiyQNJa9QgZEPVRBtbsQvbC0NTrXQSwvnClovXh6gtiHR3//rHpXj/muH0G6X4gKmXyM31645jYfKFTADQkZUMN3x4/T+2XOWl51O5w5ChBVJ+KH1H/ibcrD1XXMQGr0jWB608i+UbRnGHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724590267; c=relaxed/simple;
	bh=uH0vRo07eqJvNRsWlEFkW8Fn11KexfDSYwMeQpYSrZs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lWb06ieFGtMBDa/cdKnJIWT+pESRVS0ug85EiKtyz9apDGQvQ3m5lLK6Lsb0VdPpT7BeWN5KY39q2IiRmEQdZsPdclsQA0FOLxuV2564GvJTXctKo1d1Hvu4eHe0zk/Uc17sFeek69p9CLYFfULZOwLtn0heKnbqTZ4EJ3A5oEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=XygxjPE8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sXQ19pl4; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 67E2F1151A93;
	Sun, 25 Aug 2024 08:51:03 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Sun, 25 Aug 2024 08:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1724590263;
	 x=1724676663; bh=C07nC/Gdw5FMNcdh4udq8f0bUm0ol8opjnDd2CaMRtQ=; b=
	XygxjPE8y3g4/t++wyifh+hUrIrfk+Jgk/Wngaa+XuMCbHZgrBmoScOSRLD9qcLv
	PF8/CYNdYunpdFCKQKDoOwwPa9WBIWbnDdzsOiYe9Uh8HsD+JTWryyFvSaiRROs0
	4CEoMANscMUKPB+/4+NFx2v0+nBWHdFtsuoTYwTrJsRR113o4jFBbvANEu6rY9Yy
	ybfmq1vjSH2U/P5tihLkrbJjwDxneT8A/F68WdWKzDLqgiEVrj92a9P7uw5y5UCS
	csZQpoTXo8gPwbCUWQZboCVVaepVpbrrxpHhaVkSPH4gCl/VvF+onyJTgzxnc6MB
	hGo4k3ez195FYk4JMWnp7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724590263; x=
	1724676663; bh=C07nC/Gdw5FMNcdh4udq8f0bUm0ol8opjnDd2CaMRtQ=; b=s
	XQ19pl4xQl2ksOFs7hkEwKun0/amB21blORw6EMfkvZyQp/qJMhGt7KirJUHB0Th
	tvAqeObSs8sCq1yneSXSGkxY+IjFlM1sOHe4mSAElXfrUnN7uFCm6XH9WJ358uQk
	XNAYEhWYgL8Ryj+CR5s8M1yObBbo19yOOs44CX0PkCEGspOEbx2P+4OLpDuMSEQY
	d1L+upAZscID1XDjHOXMIPkrdzTbNJr60Ce6M0S+7OkjwX9z5AN3JRn31DfLdIhM
	84LKGLIwo42z76msmz5eyMPUYwnfPAUqCSSYl0vMidYwbYkp5xL9e8n4Mvg3Cn+7
	3dEiJj0sBRvvGv4uOroUg==
X-ME-Sender: <xms:tijLZvNIX_RN9CQycVqlO1a_v8GFQWrQjUhkEWiUI8qtOmNKtxUf2A>
    <xme:tijLZp99FuoEDzxfTtBuUdWGYWR9UFbUvcV3ieHCEFbG7I8Bzea_SRJUhM1mmy5xk
    tSfLPyyf00escATl6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddviedgheehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:tijLZuSuZIiinWWz8lcIXwXXiUQopnWOOSLTYdlB1PrsuN2nZpXnvQ>
    <xmx:tijLZju7Er9yHfGgPAtQko5GbwtVWmrRmHYSdLohUi5Py9e9svd6Mg>
    <xmx:tijLZnd-2C82drQGRTUbwY8YBt5UV2CX4qcaGc8zgIzZKDO9197uIg>
    <xmx:tijLZv1eZynntPuVfGgLr9DHbg_xKP-ucZNYDi8PR3p-6tkJ2wkK3g>
    <xmx:tyjLZoE3NaHoUnqPFQ-rjwlrBPK_xsyh09jaV6DGKN2ZhruIIXZLNczn>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 968F41C20064; Sun, 25 Aug 2024 08:51:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Aug 2024 13:50:20 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Steven J . Hill" <Steven.Hill@imgtec.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
In-Reply-To: <20240824144133.1464835-1-bjorn@mork.no>
References: <20240824144133.1464835-1-bjorn@mork.no>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=8824=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=883:41=EF=BC=8CBj=C3=B8rn Mork=E5=86=99=E9=81=93=EF=BC=9A
> Boards based on the same SoC family can use different boot loaders.
> These may pass numeric arguments which we erroneously interpret as
> command line or environment pointers. Such errors will cause boot
> to halt at an early stage since commit 056a68cea01e ("mips: allow
> firmware to pass RNG seed to kernel").
>
> One known example of this issue is a HPE switch using a BootWare
> boot loader.  It was found to pass these arguments to the kernel:
>
>   0x00020000 0x00060000 0xfffdffff 0x0000416c
>
> We can avoid hanging by validating that both passed pointers are in
> KSEG1 as expected.

Hi Bjorn,

This is actually breaking 64 bit systems passing fw_args in XKPHYS or KS=
EG0.

Maybe something like:

static inline bool valid_fw_arg(unsigned long arg)
{
#ifdef CONFIG_64BIT
	if (arg >=3D XKPHYS && arg < XKSEG)
		return TRUE;
#endif
	return arg >=3D CKSEG0 && arg < CKSSEG;
}

Will be more robust.

Thanks
- Jiaxun

>
> Cc: stable@vger.kernel.org
> Fixes: 14aecdd41921 ("MIPS: FW: Add environment variable processing.")
> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> ---
>  arch/mips/fw/lib/cmdline.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
> index 892765b742bb..51238c4f9455 100644
> --- a/arch/mips/fw/lib/cmdline.c
> +++ b/arch/mips/fw/lib/cmdline.c
> @@ -22,7 +22,7 @@ void __init fw_init_cmdline(void)
>  	int i;
>=20
>  	/* Validate command line parameters. */
> -	if ((fw_arg0 >=3D CKSEG0) || (fw_arg1 < CKSEG0)) {
> +	if (fw_arg0 >=3D CKSEG0 || fw_arg1 < CKSEG0 || fw_arg1 >=3D CKSEG2) {
>  		fw_argc =3D 0;
>  		_fw_argv =3D NULL;
>  	} else {
> @@ -31,7 +31,7 @@ void __init fw_init_cmdline(void)
>  	}
>=20
>  	/* Validate environment pointer. */
> -	if (fw_arg2 < CKSEG0)
> +	if (fw_arg2 < CKSEG0 || fw_arg2 >=3D CKSEG2)
>  		_fw_envp =3D NULL;
>  	else
>  		_fw_envp =3D (int *)fw_arg2;
> --=20
> 2.39.2

--=20
- Jiaxun

