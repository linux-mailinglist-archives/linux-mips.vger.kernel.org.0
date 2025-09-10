Return-Path: <linux-mips+bounces-11201-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03449B51B26
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 17:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA47C7A24A7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 15:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE6430DD0F;
	Wed, 10 Sep 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Wt3vFLdg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H/gMzN7T"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62B1ADFFB;
	Wed, 10 Sep 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757517262; cv=none; b=kSYbA8noEur29S2LyODM54L140o4+u2uSvvPUz4kTUyKwK1xtlwAkrmk16XwKKGAQpL/Q+19+GFBHgBwcmw+KWFwfn30mcI8gI9qTz3ped+zrRsAGCCsDz/uaYq6kRftZUycf20OJ3SAZMxX6bJiPIiE1R5OnCgLKOsFab9+3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757517262; c=relaxed/simple;
	bh=j0peFtksgP54xqAUc1oP7yZ9W8M7m/k54T6JnFegQgM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jOK3VazoGJmceXiRBI6jxbDtT1wswUrxXwfKd/RaV+25njBT2tvb+cE7MmK66k5Xo3eolDUHkISf+J5W4m6E8uZT2452347qUl3BP0L1P3xv07ry7CVYzzPy+3NKknW4ZapKvFM7J0hrxA393cWIU9TFfFQ8X3on6uOeR3/tR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Wt3vFLdg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H/gMzN7T; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C49A01400375;
	Wed, 10 Sep 2025 11:14:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 10 Sep 2025 11:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757517259;
	 x=1757603659; bh=lsUUzVSssKb2ZuGuZgzggTzESfnxgxP19f0NGhCBk2A=; b=
	Wt3vFLdgaWOIw3mFFTO8HkI+FL3aLrAvk1XZkFPK029w4p9kIsmeNNXR2doMLfc2
	NQaimD6tWSMhyd9vrBwpPql7GPen65eFUN6bOfqTcjaYKQTvFwR3Tilc07C6ExJ8
	jmxdK+IoR3hnYmXzQTnYg/t2INRTwDKScAAC5Zh97EJg6FK42wOtjxbJQG0rbqtx
	vb435sW48hCiGaDmkSb48ej0GWsn5+SI3ezoINWNC9Mi29MHlc2MYgDudDq3vQpI
	E3JHV5FX9Je89nP69A4JyLOdFZEUPLOsF/5GLJ2vjV5NifsecRQsRhBZHOY5Wy9x
	jt6rDjYilo0TVNJQvnJkTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757517259; x=
	1757603659; bh=lsUUzVSssKb2ZuGuZgzggTzESfnxgxP19f0NGhCBk2A=; b=H
	/gMzN7TnwJd0vg/MTYVl/pyoe/hmyfwJF4mtR5JWM0w21EGmDqzYq1IsTdotAh60
	Fmd1Vg+SdRbChBFHMrAKmV4sr5AgLPgZE/hNEG3iugSyvyKHaye+uflCyTVZE7eW
	y5OXjXOMEmKkObNDMRZmLutp1NrnRb+HXmB/4TDEu05TLasJXe4OYpexHWqlypFG
	f5UGmGv6/ug4tXqoJzn54aHwEZlvC1X/XhFICwEees+qOB1PMhCXSGFdzGOeVRCA
	AmHdT3PYzk6ROQA/RcaMy/7tVU36ZMliytCzRpQYn6smIPsw/Gu6lhjsbjgbm1PQ
	nnukP2hsdOVcW4iab733Q==
X-ME-Sender: <xms:yZXBaDXOlmIombO1szwOlmpXbQqLOdZRNKdHj8DHhLwnjgybvVtD3Q>
    <xme:yZXBaLmGS84fPQjmk21XEVQnEGpISmEP8_Uye0ca4ReQR3HPDWjwuZEIYxBFYNeqB
    zTGP6WvYL_gjS6k-qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:yZXBaESgMqAfocAh5WwsNKvYXczfu7UTStKzoEZ_LOyYB88gFCsczQ>
    <xmx:ypXBaMq8oJRxVm5-KPXU3p6LapKK9VSGtugiiL7OXrTltECusc88CQ>
    <xmx:ypXBaCy-TVZZI6VvKyzbCn9-qbN6vjLZQvQ8eH7rWv4q8MqywpKQ7Q>
    <xmx:ypXBaPDeWwsS_0RafF3IO58JfOjBv4WASYIgwgXNH9S2I7eVRXv1Nw>
    <xmx:y5XBaNu8n69vsZmygvax3BlNn5O-QH6oHbeKtp693EevppGTS0Ykwx7j>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D18B3700065; Wed, 10 Sep 2025 11:14:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmcCJOTBQ5ho
Date: Wed, 10 Sep 2025 17:13:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthew Wilcox" <willy@infradead.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
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
Message-Id: <55cbc329-4b14-4f62-90bb-1e1007cc1152@app.fastmail.com>
In-Reply-To: <aMGFhuHyQwtwyF7B@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
 <aMGFhuHyQwtwyF7B@casper.infradead.org>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 10, 2025, at 16:04, Matthew Wilcox wrote:
> On Wed, Sep 10, 2025 at 03:10:05PM +0200, Linus Walleij wrote:
>> 
>> This in practice means the area 0xf1000000-0xffffffff
>> which also includes the high exception vectors that must for
>> natural reasons also be kept in the mapping.
>> What we have mapped today (all of the time) is
>> 0xc0000000-0xffffffff.
>> 
>> A minimal 256 MB mapping from 0xf0000000-0xffffffff
>> should be able to cover this.
>
> Can I ask where the MMIO (PCI?) window lives?

That 256MB area is shared by anything the kernel can access
directly, other than the linear map: vmlinux, modules, vmalloc,
ioremap, vmap-stack, etc.

This is mostly unchanged from the tradtitional layout on
arm32 that has the same ~256MB limitation, though it does
get a little tighter because .text/.data is now also
mapped into this space instead of executed from the linear
map.

      ARnd

