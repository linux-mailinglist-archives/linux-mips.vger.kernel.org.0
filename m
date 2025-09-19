Return-Path: <linux-mips+bounces-11525-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD8B89E3F
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 16:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49DB03B76CB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 14:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A9C313E2A;
	Fri, 19 Sep 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="3P7vtOxX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NwEFh+Eh"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C4315D34;
	Fri, 19 Sep 2025 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291777; cv=none; b=mMmUJrhH7phmzVN0uFJd25oB2M1nmDRtUcDk8uKmuSxuu/ev5qhcaS2AJnAjCBCJgF/lalxUKWfUPKTyHedBan1WzscGeNOo9APoafqghSUjwglOmG8LTS72N1UUobVCNL0khpL7tqCR7YYp1J+gnU6bv0yquQkPA+dtb01lptE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291777; c=relaxed/simple;
	bh=aZA8prTitTZ/eYBw5SroAW+Jfqg49mZTo5qsSdtKR3s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Kf9wtOYXm22SkYZQ5didS6b1ow6wL/aUDdicxNdkVMudR5CFMu5cT/WRWYvQRIelsSZYKpT0behldSWn3PENgcVAFL6QERjVBsNFs+FMY3+iFkulmu6l2in7/rscNgobf7ma0FBIXz26KGt+eNLds/DbQD4yTVrqWkCUjIM1ksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=3P7vtOxX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NwEFh+Eh; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3BC477A0068;
	Fri, 19 Sep 2025 10:22:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 19 Sep 2025 10:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758291773;
	 x=1758378173; bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=
	3P7vtOxXTlRKZGWlZLsRFVQlQg4bj5SvQvb5v1zmryo4PCz5xUCZ/fSZUuL33qsW
	2XFxpoh130HNWVqUH00GYFR2OLcWx0fbXjhyeBAR8yseNvBXLhN/0OOMJL6U3cy9
	NOxQGScNJsPb3WM84wfJPFb4rdhDXJNr0eUbkkBFZAqgCNYQVkp1Eolbo7eGfx6T
	UIhoCwGZmmCD2l9Vdt05U1amomaUxFZDiopcE8Uiha2UPEfSrnPL/cBLPrd/w2SK
	AOAYXKR8GES89WQNC+kxfLcj7gP5oZndIPzi3FtUM0Qapm2gqlAC8zK00Iux7Czt
	u3Hzk4X0b7bccGPCfsVDGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758291773; x=
	1758378173; bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=N
	wEFh+Ehq8I5Ne8BUFO132THoMndwZ6szg6zS6b+qZvszYrP+sSryFfqlrr++t+re
	52mUZjJS/MqYpcQK4IrqneI3Q+QV87n44m8BdrbXyltTFUsKqWVoFc7LxhztSzR1
	/CyOnK6h4cAgGvOrrvZPqQ+kytQaKCIBFxaNl1m4svOmCOmwcwS8Yq4fdKJu928x
	+iYoSc2Dwk0r2zFgWPLHA2uWyYEEbO2I/L1Q2EIYz5f60VEk6QPi921HwITH7WAh
	xpt1386OGSe7LQJ7/CDBPPYMPl7W+ZdVVK91Q5wl7+/wWjKCPzRy6B5d7I5vClBH
	kLIZeQgRg6fEx8N/FKj5Q==
X-ME-Sender: <xms:O2fNaHPZsDEluqQ3K1xXVYzEPxMOHfVlGvrDBsZCIGFfPOnh7MIMIw>
    <xme:O2fNaB8EpINHV6429QucyQqOJUWdlBgZRzftFfr0w1fqno7OIhXeVkca9g9sUwCxx
    WJ4lzYGsR2mwvafSTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeftddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:O2fNaLcxJAwbyL7fF-hDxzqk5CnB_5srfmblzDObKefDa2_Yw3Nu9Q>
    <xmx:O2fNaI_XmRHiAy2z_8UrPdVkq5oq8nmdQ4T2W7CdP781TiN2_pBACw>
    <xmx:O2fNaJixEsf2I4UZLqtJvoBDqXbeFMrBT42lISbnoEN9uVt68m1a8w>
    <xmx:O2fNaE_oeBhVK0r7xewR08-ipIjEJmwOjKy_oXBB5MOm1ZA557kJ_A>
    <xmx:PWfNaL2dV5R9mOO8RHYelr4frobgiBB2zH1lISJhguP3OD7Lp1pVdNvG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 04B80700098; Fri, 19 Sep 2025 10:22:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Fri, 19 Sep 2025 16:22:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
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
Message-Id: <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 19, 2025, at 09:17, Geert Uytterhoeven wrote:
> On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
>> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>
>> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>>   get kernel updates, and the only one I can think of with
>>   DDR3 support, but seems to be limited to 256MB total memory.
>
> Are they limited to DDR3?
>
> IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
> new variants of old SoCs, to accommodate the changing DDR landscape
> and market.  So perhaps they also accept larger RAM sizes?

Yes, that was me. The previous SAM9x60 was released in 2020
and I think that one was an upgrade to a smaller process node,
raising the clock frequency to 600MHz and adding more modern
peripherals, but I see now that this used the same SDRAM/LPDDR/DDR2
memory controller as previous chips, with a limit of 128MB
total DRAM.

SAM9X7 in 2023 added DDR3 mode with up to 256MB according to
the datasheet, no idea why they chose not to support more,
since a 32-bit wide DDR3 bus should allow up to 1GB with two
256Mbit x16 chips that are widely available, or even more using
expensive 512Mbit x16 or 1Gbit x8 chips.

       Arnd

