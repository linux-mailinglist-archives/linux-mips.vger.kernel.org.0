Return-Path: <linux-mips+bounces-9071-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D2AC0F9A
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 17:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE9F163A86
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EB1290095;
	Thu, 22 May 2025 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="B2GK1GUp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bGJiC52+"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2470C290091;
	Thu, 22 May 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926669; cv=none; b=BIHIMmwysjZiCmAw9lsKKggnRVvrzYN2UV4NlSh531z4Zf5mJeCXqZhot/lFqhEaUyheWpx3PAHr7DknjKv5u+oft/cSrX6Np49afMA0Puf+IRhdfbo+dE7J5pgmJlAMwNeomYt42fn9qM5jNmh9TGb1dAoIveB9gKEaJluERvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926669; c=relaxed/simple;
	bh=uT56pjrvDODLrsQoFu8ndFFw9NrNmImgPMsOSNIgUjE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oLMzmh3tqGOoQieVqF9x2t1qoXZns2T2NmvhRrVXpbCMhj/rgA4W9S85XKm6TmJNm+SEX+hvI76YSOlTCXhXo+z01/il9yEJB7+addDli43E/zYtmRRewuOCHDs/hkMI4rmWD0ZHxjJjF/x4u7eYAyC6txx3EpLsmJ+aRrqU47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=B2GK1GUp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bGJiC52+; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D11AB2540182;
	Thu, 22 May 2025 11:11:05 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-06.internal (MEProxy); Thu, 22 May 2025 11:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747926665;
	 x=1748013065; bh=uT56pjrvDODLrsQoFu8ndFFw9NrNmImgPMsOSNIgUjE=; b=
	B2GK1GUpl1NA51b5vZybgjb0RTZcOWylp/B5hN3M4O9JNmFfLw3pyh3N0qGDnMNF
	CRxa7frGRcSV4ktbMyQLUTEEnHqV6bR2Dyba3Z4uAVlB/H7MbWl5CUlovQxCfPJu
	so+UpCHnTTl2C6zorDQDs+ZPYkpGXR7onPO8pC3VmWsNdmTI0luryH81nqWY+DYg
	tV6gYiYEZj74MqZx/127b3mpUA9YFmzvwSWksg5XGjaxQHx1yi6S3RY978g5M/2b
	o4iUkXWf+5QaxXlJbTHUW7vzI0bDXJoLIzWg46pSMFCeKCei2nL2Q+v1nMegpVPu
	PDoACfGyNgRSBXZvXmChJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747926665; x=
	1748013065; bh=uT56pjrvDODLrsQoFu8ndFFw9NrNmImgPMsOSNIgUjE=; b=b
	GJiC52+Ov2Cj0OsrEFthR4S9pWr+SAa+j9PUYes+EpPWiw7ehXzGaInKCnN1cBYN
	Vr5GDJdBRnUosGCfbL0+/krsZS5TFwVNrqzc/OCfNd7DV5yDbsewLEbCT4zlExqN
	wAnnmzvHpAar9OkQB3aU3FIGb2Z9FjLJMENJcoKTpyAVb1nVedI4Q17xW40FDAsf
	gv2aSP5tGT5aYPnRPF4Wg0a+h22xI8p2mjEpUXX+DqlWaIoNpaLjJq+UfatuChS0
	8wik7mZopgVNkHhA/IPeaYdj0UH2aXBxbxS2spX50MdgVGDlSyAYBWc0qedSEb9R
	GVIHGXCVVRgnQDWNF1uoQ==
X-ME-Sender: <xms:iD4vaLCaxgREniukd5ATkkW_UDwR57rAgHEElglqxMptk8_m46PDgQ>
    <xme:iD4vaBgZwPnB2ZRx0pwyOPFHAdnI6sF1Xfn2tTcnSAo1IBnOQLO5kjPz1Wt0dzj0i
    pxc0fwU7-AyIkXjcnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeivdekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtqhertdertdejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojh
    hirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhep
    jeehfeduvddtgffgvdffkeethefhlefgvdevvdekuefffeekheehgeevhfevteejnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhk
    vghnrdguvgdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlih
    hnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtgho
    mhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtg
    homhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtgho
    mhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvg
    ihvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:iD4vaGmX1tYX0lxyVdxc39QVqV6oB-ykSztby7N0wP1xhqLojzBsaw>
    <xmx:iD4vaNw5Fi2pciKbSs4d6LaDyiD-9ac11q3_25pWznvUQ114mRbUng>
    <xmx:iD4vaAQPhoXk6QRYU-5SjSFgAOlfwj_BRNjt5AHsXapKEsNVtYRl6A>
    <xmx:iD4vaAaZKByr_I3aEr0cAO-eAfH4wEZQkJwyuTrFZ_3p1vtlqb8jMA>
    <xmx:iT4vaGbNj6f8ASmfLGRnt0cl30ZQaQEAh_uAN55DyVGp5Bux8lGSs7-g>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B93A11060060; Thu, 22 May 2025 11:11:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfc8a567c59a896e5
Date: Thu, 22 May 2025 16:10:35 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <bc3dd9ed-0fab-4f62-a55b-8ce33fea10f0@app.fastmail.com>
In-Reply-To: <87iklsofih.fsf@BLaptop.bootlin.com>
References: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
 <8c4ef90e-82db-4711-a5f3-446bcca00e9d@app.fastmail.com>
 <87ecwipfr2.fsf@BLaptop.bootlin.com>
 <105ed884-9ee8-429a-9937-d8f58a221faa@app.fastmail.com>
 <87iklsofih.fsf@BLaptop.bootlin.com>
Subject: Re: [PATCH] MIPS: CPS: Optimise delay CPU calibration for SMP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B45=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=
=8D=884:02=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> I didn't notice this function initially, but upon closer inspection, it
> appears that although the scan process is optimized, it still performs=
 a
> full scan for each CPU during boot. In contrast, with the mask, the
> information is created only once and within an existing loop.
>
> I believe this function would benefit from __cpu_primary_cluster_mask,
> which is why I prefer my current implementation over using
> mips_cps_first_online_in_cluster().

Thanks for clarification!

My concern is __cpu_primary_cluster_mask is pretty limited and the conce=
pt
of "primary cpu" is kind of fragile.

To optimize mips_cps_first_online_in_cluster I think the best way forward
would be produce cpumask for each cluster and perform cpumask_or with on=
line
cpu mask at runtime. cluster_cpumask can be reused by other logic later.

Anyway, it's just my two cents.

Thanks
--=20
- Jiaxun

