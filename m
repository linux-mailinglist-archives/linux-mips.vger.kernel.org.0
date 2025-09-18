Return-Path: <linux-mips+bounces-11507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B21FBB85F4A
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 18:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593CD1C20958
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 16:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04577314A92;
	Thu, 18 Sep 2025 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="hT3UzSYH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="narD2chK"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38F2459FF;
	Thu, 18 Sep 2025 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212337; cv=none; b=kLjC0EOEWePLIp1jD/2B+YB099Yrj6YzGkCKV8qkKoSEo8R/tEYFEf8jMSk7iOUHQyOXWWxYeGK/HxlDe22GK03X9rJ53gb0hbTQkyAQh3y+nw82wjQ4LZiJQBx8x+197IqXAGDyVhf26iH3h2x6po/5wE8jz5mlJgN9YSQ4CBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212337; c=relaxed/simple;
	bh=n5ugKKrKr8boOM+KoGTUyv0+47qGlr1Y+LScrFHm+Nw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=E+lCpuyhqPyDDpD8HgejuN60EFPCLLpOQByStvj9JyYn9jHMkQcf06SvfsSr7/GpeAUC2TN4iFpPyW7j2siI9FgcQGSjiOp8ycTAnJ+ZtcsCSIjHYcPsofjwp1mWpmciySVbP0JmrN7sArjLb0AxJNuXwfKLxDknlWraOYLP+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=hT3UzSYH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=narD2chK; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E9DB1EC030E;
	Thu, 18 Sep 2025 12:18:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 18 Sep 2025 12:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758212334;
	 x=1758298734; bh=fm4R8b6atPDjgItmLn3c75WIBp5VlWzcsZH4FVIt7ag=; b=
	hT3UzSYHqECruml9nJYhLaF2PeApMfKPsa2Kchq0gCzfeBYX32RBViapVaUovlLI
	Txe/jjqieezrzrzA7uJYsDtvqVjCXXnC1LoBBhdcmSoOMaSrN5Fqt+5RD4WlTS+u
	BKhECFDp11UJ471uauSho7G4oGR/BvOy/5lMipcEoJKhdbXiTwla7TTe3MuQrnYQ
	KueeBTCWfI8OcXJS2UG9kae6uVbtlAF7CcZVk2LQ2vS/xIuZHiD0Lp9ICyNHy82r
	40M21sNMmpSgYWUZzCPqKroJovjjCGbk7bJ6mlDgjqwo5fwELH5lepoBABDtgS9L
	scjCSBoybymPnkbUAktH5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758212334; x=
	1758298734; bh=fm4R8b6atPDjgItmLn3c75WIBp5VlWzcsZH4FVIt7ag=; b=n
	arD2chK72CMw+3XE4ZMyHoCXIAodtWOlFh+lygozTruGzTZh8h856redrTp47dRO
	sXbFqPqDBwTwab9JjkqMOZqEpw8xcAx1CsSrhxGH9ZhJahklo+5B/YYA8F9qKGuK
	wms91Otr8e2xctRFqgvVzfrtq2c8xTnxS+u/pW8oiV7Qo/b/JpZmiOHUmjZVqgw/
	j7EXQHPtj5+QrGpRsg0kWk6VvAUAduP/2DL/i1mtAsRcQBIRbZU3Rh1twx82usbv
	RgntitcMyx+XgxmuyvLSSVKNtRoybAgMqWlWzYvwXSnU7WaKl8QejTpIg2kBSi6W
	CaYxaV9Q1r98Co569m6Gg==
X-ME-Sender: <xms:7TDMaNodCGNeyIp-SBSrJ_TtgdGNi08_RHKQYU5GUMzQyGU2qL51sw>
    <xme:7TDMaPqtNE5Wm9OwOTBTVsoBpq7nOqMcCYUvpQ-AcC442Pi0J8C_IlqeLqpTVtfET
    Z4yar8_IO-zzD-k2lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeggfejudejvdeijeeglefgtdfhudffieetfedugefhffekjeefhedtjeefjeetfeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgvshhtvghrrd
    grrdhunhgrlhesrghrihhntgelrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgv
    rdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvrghssehgrg
    hishhlvghrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihgu
    vghrrdgsvgdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsvghrghhiohdrphgrrhgrtghuvghllhhoshesghhm
    rghilhdrtghomhdprhgtphhtthhopehsuhhrvghnsgesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehirhgr
    rdifvghinhihsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:7TDMaPbKt2WoXqHMwpanytM6BOnhzj_CQNwGh1PFIqubtDAyu5jB5Q>
    <xmx:7TDMaGKxNLlBIr_WiBflz4DJZ5ui2U4YOwVgSsgJGQrpphOVta5LLQ>
    <xmx:7TDMaG8COQwGxvO3AW0IJmLokZHWS06CKK-GHPM5ep7McMCa1__b0A>
    <xmx:7TDMaNp9nu7518TclPj1lZvDtvnU_ezCWZtqceFpg9Flbxum44e-lg>
    <xmx:7jDMaKcwFz32-9rZOzFDRZfXWP5Uej9dboxG4Bi3HNtAfR6kH7cYV8fc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7D7F370006D; Thu, 18 Sep 2025 12:18:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Thu, 18 Sep 2025 18:18:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, ksummit@lists.linux.dev,
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
Message-Id: <ea6562f4-ec8c-4e99-98ec-000c25c34a3e@app.fastmail.com>
In-Reply-To: <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 18, 2025, at 15:34, Andrew Lunn wrote:
>> * Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
>>   powerful in 2008 and could support at least 1GB of RAM,
>>   but I only found one machine (OpenBlocks A7) that does
>>   this. It's unclear if anyone is still updating kernels
>>   on this machine, but they could /probably/ use
>>   VMSPLIT_3G_OPT if they do.
>
> If i remember correctly, there was a design issue with the OpenBlocks
> A7, and it would not run with its full amount of memory. To get a
> stable system you had to limit the RAM. I don't remember if that was
> just with the NULL series, and it was fixed for mass production
> devices, or they are all broken.

It's possible that the bug is in the exact bit of code that
Jason was suggesting to have removed, if this was the last
ARMv5 machine that actually tried to use highmem.

> I doubt there are any mv78xx0 machines left, why where never very
> popular, but there are still Kirkwood NAS boxes around.

https://github.com/1000001101000/Debian_on_Buffalo does support
some variations of the Terastation Duo, and they were planning
to do a DT conversion at some point, but I think there is not
much hope of that ever happening now that Debian armel has had
its last release, and I expect we can drop the entire platform
soon.

The reference system for mv78xx0 of course was the platform
that Nico used for implementing highmem on, with a full 2GB
of RAM. I think in the end this was around the same time
as dove and then armada xp.

> I keep mine up to date, put an LTS kernel on it once a year,
> update to the latest debian sid.

Do you know of any kirkwood machines beside the OpenBlocks A7
that have more than 512MB of RAM?

    Arnd

