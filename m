Return-Path: <linux-mips+bounces-11542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5DB935D7
	for <lists+linux-mips@lfdr.de>; Mon, 22 Sep 2025 23:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2B83B7D4E
	for <lists+linux-mips@lfdr.de>; Mon, 22 Sep 2025 21:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7D42820BA;
	Mon, 22 Sep 2025 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BOU6mVcT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gmHBoxtT"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25EC248F66;
	Mon, 22 Sep 2025 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576186; cv=none; b=VZKhFbSQb78VHtUD1oNB2x/6ByfXK5XakofZWmnj11nfZ0Z9/EgVdzZyo64BGC5OnFgmtqqtJUfcg7pwAiQGrVD4OZb4XuVbGWlPY+iy5pmoo5sVcfEyfs+gNxY+YWnW0oKaB4Hre8EWRgRgRJAX5EGnhEgkvnLk7RNkSZQa848=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576186; c=relaxed/simple;
	bh=9MeoJVbhO66Lo2sUM7HZCvvlOclMK/bvVvuvlROFij4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=renrY4ANz1DT6N90mD3q/2Yid4CeF2wP4z92jyidgI7+Lt/DDb3EOpWbqkgZwvg5032Ks0GPl1oBAfkVI2Fml3QdDsOAEyhoErMcpt80wbI4/AQXguMLOg2D4MJt0A+2Pjmb2QV/l+DrlOjaLcJN766sJwiMJYYiqgaq0QUU9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BOU6mVcT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gmHBoxtT; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 97915EC0301;
	Mon, 22 Sep 2025 17:23:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 17:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758576183;
	 x=1758662583; bh=Di8U+yHpW9PWxGMprMpa0qfyAiwc5nChUHQPZxjrHH8=; b=
	BOU6mVcToMxa6qFUiC6cht0bV05a8ANyKR5ukskNj74Kgap+DqTUaWSu+IKdFe3l
	WRpUM30Wu3H0Q7A2y/voOAEVMz1ItWGdFd+w1g29YJ7Tjl2aT+hQdsIjBYzOSRat
	P6tosIN336s/ecXEeQ/mGTufNXrxc6oPikF3ykV/4Wx5E6r8XKZkcW5rH07dbYAi
	hVS+ZWgjs+wGKwhWw9MlR/A61u1V4gi072jORA/RDnj7Nu/QRBfiadbi2FwamY3C
	z1g3eaCmC+6ZV0VO36eJ9rA4ai9KBUyUl+kX8rwbdvVby3ynOJZk+yOUH9dNivMj
	J6BkZ2jlIo5ZNgAXnGA8VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758576183; x=
	1758662583; bh=Di8U+yHpW9PWxGMprMpa0qfyAiwc5nChUHQPZxjrHH8=; b=g
	mHBoxtTQev5hHzzjS7DzOG6LjQc2O42dSxLb4L6WQb2WlRSURFQb5PpcuBN2HTms
	62d99pLVtJPUCF7OT5ICVSqlboyOqdGHXJIUax+oI0O3IgOolDGEnOWayvlw19bk
	GTctlMrBtCTrn15fz5C78bks5N4t7sTFyuHhpbp7bypfTbN9jsFm7miJXebzUTbu
	GkBm5/mf2z9Lam8hkmNkaZhD/Aa8ufZ9KIVP69Ld+kkRg/FCv7kH/PRqbJ/kSgjT
	Ys/j3Va2f5abW1fJBGV59q3b0QcV6n8w4sBB+Pm5+Jpany6I0MqmylWHR2hKS/7W
	p6MNsjIRV0fcgvwbafw5Q==
X-ME-Sender: <xms:Nb7RaHIv0elNNGqKqz2hq59PlbQ1WvH3PQekoKoYN6GHdrkbplcdZg>
    <xme:Nb7RaF9zWPO1z0eI-85xdehQcHCJ4U-ixtIweYwspyjZNwYzs6sJyQVkn2QKVroo2
    tuHZCnZ7Y6hRCAk3yvZYtO1xCbsZ8geow9JBfeHT6Z-a8qAnaICeO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtohepnhhstghhihgthhgrnhesfhhrvggvsghogidrfhhrpdhrtghpthhtoheprg
    hnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghn
    vghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvg
    hrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgihhordhprghrrggt
    uhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhogh
    hlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:Nb7RaHyj4-U5cmLtj8aV6Obmj2wE8qDHFtnv04wApvnSKRdpvOTwyQ>
    <xmx:Nb7RaPNEf6QOHCcg2sOwG2YcDZEDgMATtieOS7b2v4iNsq7NAARQhg>
    <xmx:Nb7RaM7LJ7xoeWbjkfv203dQeqEDMpWgwtURBYX5yI5dIc7-dM-KOA>
    <xmx:Nb7RaGcvvcBerj7e35_eqxKXMQdHMfkXoSuoEeKpoVO0WLLALUm55w>
    <xmx:N77RaF-PoW2bovyuykM0k5mv84evTeZMjlxPQrSMV7i2vSrQZNKLFHZX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2385C70006A; Mon, 22 Sep 2025 17:23:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Mon, 22 Sep 2025 23:22:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Schichan" <nschichan@freebox.fr>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <598ab56d-7dd0-4adb-b0fe-30ad5cf24335@app.fastmail.com>
In-Reply-To: 
 <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
 <20250919143436.GC2132010@nvidia.com>
 <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
 <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 22, 2025, at 19:05, Nicolas Schichan wrote:
>> On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
>> > On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
>>
>> I did get an email from Nicolas Schichan (added to Cc here),
>> and he is still supporting a widely deployed Kirkwood based
>> platform that uses 1GB RAM configurations. He should get
>> a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
>> would expect that to continue working, possibly with minor
>> bugfixes.
>
> We don't use HIGMEM on our Kirkwood platform, we are happy using a
> 2G/2G WMSPLIT. We don't need a lot of virtual address space for
> userland, and with the 2G split we don't waste physical memory.

Ok, good.

> I'm happy to test your patch serie with VMSPLIT_3G_OPT and see if it
> still boots with it once you send it.

The patches I did for turning off HIGHMEM on ARMv5 won't have
any effect if you are already running without highmem, so I
don't think we need to wait for your tests specifically.
Any testing would be useful of course just to check that
everything still works.

Jason, I think we can go ahead with your suggestion. I can
post my patches for review once I've done some testing on
them.

     Arnd

