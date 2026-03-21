Return-Path: <linux-mips+bounces-13859-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOJWMyCFvmn4RwMAu9opvQ
	(envelope-from <linux-mips+bounces-13859-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 12:46:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 626012E50BD
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 12:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC2AD300399C
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 11:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C77F38B133;
	Sat, 21 Mar 2026 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="vHAyyWtX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kAUUtRgg"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F171DE2AD;
	Sat, 21 Mar 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774093598; cv=none; b=DCHdE97bEDzrI0vHWLb39Kypt1bqC+AvWhjph+g/qP7kmMFABwjB83F5594jT2zG3+JU4UFtoALFqpfux7PX1sx61kqJjLz6ghT+U7Sq6mR7ue9A8ZQ6hS6HcKZfY/eiWgp0P28xWxgPD2pWAHoN71fiiUbf3Yze2kpS6JG4egE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774093598; c=relaxed/simple;
	bh=bztXV4euuPrhRT2ssHTIluQzRVGTAJjq9VmInF4hpTU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aI/hTbkyhFD2S3RTTVrLCMjEwSoakOAZDKnWzTCc1rk1GX5oY8+SLxXJabfm+JcDruG1CNXgMpYwTfpPvcZQCWNEzPmzy4sBF0qQ1Fginhscoj4lOM1Yeeg3l1BouRnue7mF/0WlkMjTKLIg6EBaUw8kz+ulrdTsEXrpytfnCtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=vHAyyWtX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kAUUtRgg; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 149491D00156;
	Sat, 21 Mar 2026 07:46:35 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Sat, 21 Mar 2026 07:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1774093594;
	 x=1774179994; bh=e7e4Se+PfjWD7DOyw/X91rALDV7hJ0KrQaseFUWVQgs=; b=
	vHAyyWtX0UqGQnj16ggZX6bt0eX74BoOuMb+XpEGZor64mTEVVQXAgrk9ioiNyuq
	HHg4EmHO/QTDegb7RsIbFGn47b9aDIj6HET4abye4OA9lVA8m7V8bENL7SQUeaHm
	liGv6fAWXEcANkpXVs4tVuOvmMN0183pkjvYEWULVgv3FtogKSLfhtNfkKsJV4Wp
	iTYHZpqH5/d9LnfuYM9zhAsoAbJC8AIQ9BC9Ocv/KQhSGsW45XpxyzEj0vqmObf4
	AMlm+pnnkjBb6DK3OpUjmMpAlgR1Iv8ExrGUn9IJnCWMEAvg+Tnma0yD46nHZdx4
	6i7FyYD/6oVsYuT5BWXbeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774093594; x=
	1774179994; bh=e7e4Se+PfjWD7DOyw/X91rALDV7hJ0KrQaseFUWVQgs=; b=k
	AUUtRggc6LCBuOnkjvPDth6FE8Vq6XNISyE12G5J3nQ/heY3O7kt9B17vKItMsiv
	wTGLEE2pDm3ugGip4o/sisK9FjjdEL/cCvB7ctzNAB1x51nLx0JZVRwtxrHSd+O0
	n/lkaT21pUpt0JdhRjuqqjB5f2gKFe0sGaO1/AF00FMCNNwN0tH4hvwiqA3PVOzQ
	UR20x8yCsbOlz/XUyEwVzKqftYNt4m1iWFZ5prekrxSwdyzzVvjHqu5oUo1aELoN
	Edvll+9ivkHBZUiD4Lne36gLEKHSOrDe4fNe0/rDT10rhR6V1d2VlS+ukPIBVYEz
	o/fc23O4rmYzO8CXJTSvA==
X-ME-Sender: <xms:GoW-aTQiv7u021WEIWEcKyhn_eE2Lx-4f_NHhVekiwzr6WnHTHp6xg>
    <xme:GoW-afkbmySIDvyjwr7x6-cWtJMlyFyXKiVLd_d7r6TF0e6_56liFPdkFxtGY0VmP
    J1ymLBsuwRxNwFhynMMMqA4bRu3BSJJU6THWv7ROU8_XbcTN8uVa_Ce>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddvjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnug
    esrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepuhifuhesihgtvghnohif
    hidrmhgvpdhrtghpthhtohepiihhvghnghigihhnghgurgesihhstggrshdrrggtrdgtnh
    dprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhonh
    hgrghrtghhsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:GoW-afXrO5aCGGk3sE5evmF7ZyTXf5ataKg4QHBpzH4DRvdhK7BauQ>
    <xmx:GoW-aYAICP2YFXjoOTjkovh-ovaU9vOXePb1M_4H36tRB7scwcEefQ>
    <xmx:GoW-abIO8ip4cklICkyBjlcWDA4xoqYfgayOP80VaxYq8z5s1RxTjQ>
    <xmx:GoW-aWv97QDauatGmf82XB1LR0fd_84NTe_RZTnlngxk1IcBmjYhRw>
    <xmx:GoW-aX--qOnht7nj8RuzBvBD1cCRVjbCBJiGiim6hH2I72GK8JJ_s4AP>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BDE772CE0072; Sat, 21 Mar 2026 07:46:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A59YFox_m8Ms
Date: Sat, 21 Mar 2026 11:46:13 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Xuerui Wang" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Icenowy Zheng" <uwu@icenowy.me>, "Yao Zi" <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <e2d1afb3-d137-4795-9bc3-e08711a767e5@app.fastmail.com>
In-Reply-To: <20260321092032.3502701-7-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
 <20260321092032.3502701-7-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v4 6/6] irqchip/loongson-pch-lpc: Enable building on MIPS
 Loongson64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm2,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13859-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flygoat.com:dkim,flygoat.com:email,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 626012E50BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Sat, 21 Mar 2026, at 9:20 AM, Icenowy Zheng wrote:
> As the driver can now support OF-based platforms, it's now possible to
> use it on MIPS Loongson64 machines.
>
> Drop the requirement of LOONGARCH for this driver, to allow build on
> both MIPS-based and LoongArch-based Loongson systems.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>  drivers/irqchip/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index f07b00d7fef90..f2eee2bd61dd0 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -761,7 +761,6 @@ config LOONGSON_PCH_MSI
> 
>  config LOONGSON_PCH_LPC
>  	bool "Loongson PCH LPC Controller"
> -	depends on LOONGARCH
>  	depends on MACH_LOONGSON64 || LOONGARCH
>  	default MACH_LOONGSON64
>  	select IRQ_DOMAIN_HIERARCHY
> -- 
> 2.52.0

-- 
- Jiaxun

