Return-Path: <linux-mips+bounces-8744-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F96A9CBDA
	for <lists+linux-mips@lfdr.de>; Fri, 25 Apr 2025 16:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62F45189DA02
	for <lists+linux-mips@lfdr.de>; Fri, 25 Apr 2025 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1764F25229A;
	Fri, 25 Apr 2025 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IIB197hI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LRJEWNN1"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF511E519;
	Fri, 25 Apr 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591893; cv=none; b=Le6iH/qN6cHFPtbDTk7tAbzzlgCpiFp6w74l8WIdE6UqiwBf1fz6AuDMpGA/2qEEneKrCueR66mGrxL6Lpo2oQmiGjKaBxmIKGbh51TXzy33DXKxUtDkB9tXwp1ovEmEJGv6mqY5M9Ksl6vWcIKqJnV4xxSz2yhdriv67IvjRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591893; c=relaxed/simple;
	bh=KcgPWLmFo8uI4i9ogemcO6qjIV++LFN8jSBNxPRJf0k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Fw2GDIjsqKUBcRn9E9VZQ9XfbSJVJKNkaZFqstz8L1LUMnv51XW2mG84GcvvZ4Z2PJYxPL2ISFGsKotbuN6zD55BBU7HeoWche9eBzpO77Tqamxw8sRJFCFMWydxqcrzX1qRTuaR5WZIM/FCqOfdUHENE1su4IFoLJ/S8eLRMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IIB197hI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LRJEWNN1; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E5BF41140223;
	Fri, 25 Apr 2025 10:38:09 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-06.internal (MEProxy); Fri, 25 Apr 2025 10:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745591889;
	 x=1745678289; bh=CLKLmE1kp6xGTNTaA1wv5clJAfh3naWBpIi72wRv0Pg=; b=
	IIB197hInL3ZXnIKKy6AS6kpOVK9xVy0j5obPxdwlBy0J6OGKWsrTXOeKWb/GFlj
	ve92u2CZxbcNIgZSf78pMU3FI/1pcIoICPojYNg2ZRlirnuoBtjCSMYJS9GZZQkf
	5PTbRYW45ZmO5VrUgM0+YeEID8Jvo7dmx805kKh1YQpscDhDNKfakERywUfswke2
	tTVr8aQ7hD6WOUC7U6ET8kDqj9phJgB7GDUiL5S9MgDAAzOEx/Yzos8+XfhU47Lu
	dtTM5zLPJGuVbVGaXf9XnGHpoD2sLutnpnI2rdwYRkX97VtIP877giHIe4aGbhCn
	7tLM0SgP6xr9f8bawLTBlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745591889; x=
	1745678289; bh=CLKLmE1kp6xGTNTaA1wv5clJAfh3naWBpIi72wRv0Pg=; b=L
	RJEWNN15MJ38l74OO/K4mQICXWcPYYs769PSSoHQmGPocLrlNQhZc28n5vPF/ilM
	TJSErQn/epZEItdvkffJ+zh6S2hnmvFDhmmjFeFL20SQFBOGWtxX8+4mdgpR98VO
	gyaHgBAyUgkZI7AukVJzCthpOhruOtBt1Rtu2zdzWLGUmTFg8OdQB7+qIdXWh2KD
	WwQM1nnbZAz50ySCaO1It33jl6XoNvywyBbUtMSWls+5fI2nCfYqliZyaU5A7Y8j
	+oIkQ7vSvxdAQ04sBDdrXnfLkkG4iwajbPWGA2O3XA5LgHyXpjVpzfloyr35o4oD
	EC1C0SusAbQssqH0Ok/kA==
X-ME-Sender: <xms:UJ4LaJzuFrScwmVvSMreMiJGsNw4zssVVxq7bE5PFTfM28mM8RDV9w>
    <xme:UJ4LaJTc6c-HKF6RSeRfSPMLhDNsmlmInff42A2GWn-hWE12YEffn7_S-_6vjeJUk
    oOlnl0e9VhpqUmMGgk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghngh
    esfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdff
    keethefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepsggvrhgtrghnthhusegrmhgriihonhdruggvpdhrtghpthhtohepugifmhifvd
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhm
    pdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehk
    vhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopeihrghjuhhnrdguvghngheslhhinhhugidruggvvh
X-ME-Proxy: <xmx:UJ4LaDU7kEpORcty1DpzHTJ6XWlQH5nxf7jXfij0IYLbcNiUxsha6w>
    <xmx:UJ4LaLg_WiQls_FNqNFKkEOewhBl_c1mtfAMcMu5_jWqGUGZba100g>
    <xmx:UJ4LaLA1kBlWNNgdzMXMcDXc79GZxNLyEsCkECKyttLyUshDEdNiHQ>
    <xmx:UJ4LaEKYyRE0mcsEzetqduYAqRyMRsmkIaA5OLN_qK_eUx7q9IfiAQ>
    <xmx:UZ4LaAhGAfJi20qTWF_xXrEjIny7QqCgxiNUPL4kSGuPhQCOEbIE4zLv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B2DAB1C20067; Fri, 25 Apr 2025 10:38:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T3a8c85c33977e557
Date: Fri, 25 Apr 2025 15:37:37 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
 "Bernardo C. Gutierrez Cantu" <bercantu@amazon.de>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, "kernel test robot" <lkp@intel.com>, rppt@kernel.org,
 yajun.deng@linux.dev, "Huang Pei" <huangpei@loongson.cn>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <1d6c1572-25fd-4865-9a61-d58d58d163f1@app.fastmail.com>
In-Reply-To: <16911666479b2fe4bc65944605199a8b3f12e875.camel@infradead.org>
References: <bd5842a92bd340799a74063f8da83d96@amazon.de>
 <20250425102003.64122-1-bercantu@amazon.de>
 <16911666479b2fe4bc65944605199a8b3f12e875.camel@infradead.org>
Subject: Re: [PATCH] mm: memblock: Fix arguments passed to memblock_set_node()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B44=E6=9C=8825=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=
=8D=883:18=EF=BC=8CDavid Woodhouse=E5=86=99=E9=81=93=EF=BC=9A
[...]

Hi David & co,
>
>
> I did a quick grep for memblock_set_node() callers, and the one in
> szmem() in arch/mips/loongson64/init.c looks odd.
>
>        /* set nid for reserved memory */
>        memblock_set_node((u64)node << 44, (u64)(node + 1) << 44,
>                        &memblock.reserved, node);
>
> At first glance I suspect the 'size' should just be (1<<44) or maybe it
> should be inside the loop over the memmap, and called with mem_start,
> mem_size each time?

You are right, it should be (1 << 44), it is an oversight when I was
converting MIPS private boot allocator to memblock.

>
> And why are we calling memblock_reserve() for what appears to be a
> single system-wide vgabios_addr, repeatedly each time szmem() is called
> for a different NUMA node?

Alas this should be done only for node 0.

Thanks

>
>
> =E9=99=84=E4=BB=B6:
> * smime.p7s

--=20
- Jiaxun

