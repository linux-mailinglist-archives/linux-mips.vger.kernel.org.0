Return-Path: <linux-mips+bounces-7962-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD4A44F14
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 22:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE9A17A7095
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 21:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D0D210185;
	Tue, 25 Feb 2025 21:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ezp6ZY0K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lv997lUg"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1421925B8;
	Tue, 25 Feb 2025 21:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519722; cv=none; b=skwww6YlXrVFLQMKBakj5WgIE+NmXjEEMFxYKUobFIeUssYfIqWM9xL2rG0Rzci1bMJEkmk7AMSG5onxKZQsyKGwlsF88bRyyk+ttZlil7NwndPu05sY67+eqml0FCRUfziM9Y5ZgwNtxVaYrYfYazYTPbZIK4eRAG1naWA1lhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519722; c=relaxed/simple;
	bh=HdTv9CB5HWU9vWfOn/u4h3nvvKwIS2GLS6S2i62V/B8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iImCm6LlvvEeSCuu/xNuTPRfH2vXcS0uinaSggPcveJfFi0iwu7IO5zH18/3qS/Oh1X1T4lcAoC1XxloK7lMag3tVhwKMyd3KA8REKNs3a+vbbxpMvQGnxfrFnKQV7MhKKw4YCLkAFMt5GtoQzNZnFGjxsyvEavm6XKFF7Xtt5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ezp6ZY0K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lv997lUg; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 83EAC11400FA;
	Tue, 25 Feb 2025 16:41:59 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 16:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740519719;
	 x=1740606119; bh=MtYdg6N3u1ZvNXN25E9k3h9XmFGTIiZ/1bHuhQqIar8=; b=
	Ezp6ZY0KYr4iDDMxa4MKeExP6HHLI6z5iWLlb740zBnbdNh7lx1f9pfXWz9RXNXu
	sWWyCjoBURL5fLCZiykljyNnPEWTgMCItEi5Lvqp/jpRhAs3vzlGvZAGStXpGuG2
	kb9Lxt5bx/4/359HSmtgYEfb91xPxJsoroV6WeWllwrfYrphITTBfAF3wj5vV4HN
	3nMRPK8p/nvSPwZFu7Ajfs2nDn7goqF4oclbzAvL8dH+K0MmuztBrndTs8SucTxZ
	blnoxiHWR0Z/3O37rWidrcbugK0GzuvcaprJu6UpTgkz1xb4UUmuRQpVYxOAmmXA
	pg+x7yxuh0l6t/MLNhLPZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740519719; x=
	1740606119; bh=MtYdg6N3u1ZvNXN25E9k3h9XmFGTIiZ/1bHuhQqIar8=; b=L
	v997lUg6tL38799F8UHUN2MLk8X3jEVGDdqA33/ICRugznJi1xdic/WH9Tq+rBDt
	7wcaPNv6y8CQRIq2FxseGHqoUk2jETGtHwgRQ+Hkj1Xp401y8yBtDuYfbHvuPS4a
	czNxgTnaa+OCmLRSZgqb6almiScgBtG53CzIY6aD8vMp/EfetBZMgdzi2RezwW/V
	aG7GsF/NuA+z+kLwLgXNkrDKPMkRJYACdRdXUqjGDJr/N5Ptrh/LKHoaTy3Iam4k
	ns6S+BpbnqGWjNyKt4C+GZ72diLPbqEaSO0KMo4TLIW7NBA9M1lqXxB2g3R5ZCza
	YZqouaweitfG0eQVWiaKA==
X-ME-Sender: <xms:JDm-Z_q8MzMHtAh7pT2j-ng-G4p1_G_Rs_-9cyznx3AzeWO1p1HrEg>
    <xme:JDm-Z5ouPpMwU9Swmjb11x-oDgBEruk4xDLga3kD0VP1VV-skGx3oa2xW8ouQFdmT
    twdh1nYSIIUq0HuvUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhope
    gurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgsvghrthes
    ghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegvsghighhgvghrsh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhies
    hhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopegrrhgusgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrghrkhhkoheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JDm-Z8OLsAjQ42FKZOMswmncgdeROZ5HMpfdpAWHzhG8dDeDkar93w>
    <xmx:JDm-Zy4gZIf74q1lPhb4QYKJh-ea1LN_b_gETUIYCiEvjsONRqxJdw>
    <xmx:JDm-Z-7LNmU_lC_lHZpmEvWmuzmOWpuXNE6ys97GnqGk-WYy-2QiDQ>
    <xmx:JDm-Z6hE2zcb6nYEqjh5RXGgoTASshLoGlCvc19584xMSM2AYtzwhg>
    <xmx:Jzm-ZzrcPJvnTgL1FXzopat1UXwNfaql9--z12dfOkhI7qJOAHcp5cWJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE9722220072; Tue, 25 Feb 2025 16:41:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 22:40:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
In-Reply-To: <20250225213344.GA23792@willie-the-truck>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies more more
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025, at 22:33, Will Deacon wrote:
> On Tue, Feb 25, 2025 at 05:42:07PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> A recent change tries to fix Kconfig dependencies, but introduced
>> two problems in the process:
>> 
>>  - only arm, powerpc and x86 are changed, while mips, arm64 and s390
>>    are now broken
>> 
>>  - there are now configurations where the architecture enables its
>>    own helper functions as loadable modules, but they remain silently
>>    unused because CRYPTO_LIB_* falls back to the generic helpers
>> 
>> Address both by changing the logic again: the architecture functions
>> select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA, which may be a loadable
>> module or built-in, and this controls whether the library is
>> also built-in.
>> 
>> Fixes: 04f9ccc955c7 ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
>
> Which tree contains this change? I can't seem to resolve the SHA locally.

Sorry, that must have been an older commit ID. Today's linux-next
contains 56b8e4bb7622 ("crypto: lib/Kconfig - Fix lib built-in failure
when arch is modular")

which is in
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git

    Arnd

