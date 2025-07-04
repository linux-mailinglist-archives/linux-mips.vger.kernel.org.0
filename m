Return-Path: <linux-mips+bounces-9633-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60CAF9A11
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 19:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA6831CA2F78
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 17:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FC21F0E47;
	Fri,  4 Jul 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="0WGuHz4/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bQURtbnH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADF4137923;
	Fri,  4 Jul 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651239; cv=none; b=Z7Rv/lRgoMJa6IT3/SnvJqQyz0sF7PoMYVj6YM8GnG9GQqA+EaAH1/4czTh5hTW0CoCMavjpYu79txo0+mgvll+tD4Y1pif3kKNNzoyA+Mz2RvAbMliwhfICFGiNooalH/Qx9mIKve/reBwqUk0Yc05YvWMq9hOH8AURHh4NBa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651239; c=relaxed/simple;
	bh=4bDRDyMVduyjGC1QQC+nquvNjod0Ndp9PuAXL+SgjjU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RAmxsOxTCvb0np5Aewq7aq3mfTKL2n9UatM7s/6v0IbCbprOQy+X4wNscy1GmD863UH1bJ/oea2KuYhh6ZhA3XDIOifNB7lVboa3TmA1UBMMaMBO+FET+QLhb1kPAWBlYsyf3m/k5nXea0+J3PeQ54FJfUMLwL5f3uBvkROgu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=0WGuHz4/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bQURtbnH; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CAEF31400219;
	Fri,  4 Jul 2025 13:47:15 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Fri, 04 Jul 2025 13:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751651235;
	 x=1751737635; bh=4bDRDyMVduyjGC1QQC+nquvNjod0Ndp9PuAXL+SgjjU=; b=
	0WGuHz4/qcJupUnsLtWmCBRIoVdHILLaMUv6eUjsGaIhCwPiQAEy0VXb6D1FmicX
	hYpERKdueINSQFFYuWyIkZ1/mwQyk9vw58RvshmHHp5X++uhkpfePC4hYAB3iov2
	BARI1KwI6q5gjPX4Xu6xtyx08jWcRYF9P0b7F89vzsTAbuFmUiDI3qikLBEDXmx/
	4fjx4CPCH4g0wmOQ8IVzeffeeQvD+BZfTmDZYlacS04lHJhZZfbUEBBcIE3E53cM
	Ss9uF+tmfqpbTEFLY5ZN1CU6HHL55+TFPDnXsUAuGW9bAvcixRBt8CdmqLF83ZEw
	ekVGlHODJXA7Ly6/3SVAHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751651235; x=
	1751737635; bh=4bDRDyMVduyjGC1QQC+nquvNjod0Ndp9PuAXL+SgjjU=; b=b
	QURtbnHWgP8Ff2gjGAKJpFFkyk29f4Q5x01F79rmU7KpwplqosofgBEkdHJpjwBt
	128ZXtXwnMY2OaddmBRACSMq5RcFpHg0B427SAs8Cb6B+//NlrgigPYYM44Obncg
	kV57HqpivRqVyjpwZFlldoP8Uz2EO6go8nvwfsqJqv9v2i8TNUMqnfJLv2AVq3Yt
	c2zurxSnoGWMcC7+rCu7kMqvsaM35CintLN1IF3GQNkOzoqVJZcR8HlJc9umJz/A
	OgReeFqXCEh05MPC0EfrnzQJnLDXPnZMLVFt65Xp3lKHVkk5292dhwN+k3kiWyKw
	ug0KDNQ6ZAk1mrh6H/odQ==
X-ME-Sender: <xms:oxNoaA4-DfppxZvDqFYL8v7qzmtW7fjYD_ZFRwWxHcsbpGOt15doDg>
    <xme:oxNoaB4cQv7Cq_2hQFFi5DBUV3q5OqArVqTTkVDL57Uo673-jU8TWRWCXw9RDZ1J7
    XWy3HiC_s2k-E3CG64>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghm
    vghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnse
    gsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhi
    segsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmh
    hosghilhgvhigvrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrght
    ihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:oxNoaPdEcY7HfZh8GU7T0k8f54kTuG2aH9-D-DC8z1Z_tscz3QMbPg>
    <xmx:oxNoaFKzx3QsvwpBNNZrFSg2NcbneGGloU81w8WhXyJ3waMWlNVsYQ>
    <xmx:oxNoaELK_ssVUEi798Gm4hYZi3ulrxUlsvuMuPi0DmnaspzV0y2RPQ>
    <xmx:oxNoaGwG8vb76jYBGs3qJkPXUit-hN7nZ8emAPNzj4drg7VIRvegJw>
    <xmx:oxNoaPxy0M11ia_oCNHTWpAZ75az73n9KyWS-eo3VoZw7agaruSNcZSv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 196252CE0071; Fri,  4 Jul 2025 13:47:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T39b5c23212bbd78d
Date: Fri, 04 Jul 2025 18:46:54 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <0eaf6e01-a690-40de-b858-4e23752486b5@app.fastmail.com>
In-Reply-To: <20250704-smp_calib-v2-3-bade7e9c0463@bootlin.com>
References: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
 <20250704-smp_calib-v2-3-bade7e9c0463@bootlin.com>
Subject: Re: [PATCH v2 3/3] MIPS: CPS: Optimise delay CPU calibration for SMP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B47=E6=9C=884=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=
=8D=884:13=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> On MIPS architecture with CPS-based SMP support, all CPU cores in the
> same cluster run at the same frequency since they share the same L2
> cache, requiring a fixed CPU/L2 cache ratio.
>
> This allows to implement calibrate_delay_is_known(), which will return
> 0 (triggering calibration) only for the primary CPU of each
> cluster. For other CPUs, we can simply reuse the value from their
> cluster's primary CPU core.
>
> With the introduction of this patch, a configuration running 32 cores
> spread across two clusters sees a significant reduction in boot time
> by approximately 600 milliseconds.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

--=20
- Jiaxun

