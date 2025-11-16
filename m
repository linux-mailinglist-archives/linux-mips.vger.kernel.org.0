Return-Path: <linux-mips+bounces-12262-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9AC61345
	for <lists+linux-mips@lfdr.de>; Sun, 16 Nov 2025 12:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9F917346E22
	for <lists+linux-mips@lfdr.de>; Sun, 16 Nov 2025 11:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6921C2BCF4C;
	Sun, 16 Nov 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="RSVEekvx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R9Gw91EL"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003F17A2E6;
	Sun, 16 Nov 2025 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292433; cv=none; b=EUhyD37b+c9gWgK5WngkmTpYvLs3CpwCWthL1yZZ9XdFAv+Pkfn86O63faF0JrhfI4SzySryo9EjfrUaPNRHbfZlWOcsWtl5fMOObIIXSsUvYDMEpNLVH8LXf/2P5CSdPlezoZ9BjvNXo2N9Qc0ybRCt6N5EKSOfh4/4K+rtNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292433; c=relaxed/simple;
	bh=MOV3u8HqqIFh/vyW3zDrg+6cXg0RPf7jVMZXm4iNJNY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jVTIFevAO7Pk58YX93HU5V0flIIp18JPisT8cgwmB/ZKTh8w8U4dtC3O2+CI74S+ZBDfwFDbHRg+d5dxQO7evzvWNmY6LubvTAcTU2VKoo/dbfGe2MXsP8KINP+nxk7FODXB4gX36GwwsHeTGEpSBHBFioZQUjzZkpW58MPVWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=RSVEekvx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R9Gw91EL; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id E51AFEC00E2;
	Sun, 16 Nov 2025 06:27:08 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Sun, 16 Nov 2025 06:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1763292428;
	 x=1763378828; bh=wWbnWFq97EeKe5bcxTlVW1/Ci+SE8i7JE7s30v7XTww=; b=
	RSVEekvxisW6aY5o6zkEOe2TOEjcYgV2maKYT7ZR7G/og33d+pAnQD91DRuf/g+J
	LCg/0kMwx3uvH7d9CQA0grZJBwptFY8zKg81mTQO5M/itnrRy+PDToJw7MFxU3zb
	e/eiMNdCj3Unq7mFcrP3QReaV06D8ED9rBRI1l9UuN107DEuD/r61YvdK6Fa/4pU
	FKfkM5yjWzA2RRtrWnpKQLtFLrQB/IFtDqydWCrYd8GNlnOXDmNFJSZnbmAGZ/eq
	ntX60PYc9ZiRTo5kh2emdWSpXCIN3+1QxHQnlW0HqYJxmDCR8kbjDeoxa3w40tNC
	atxArPNRF10cgxSiormd+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763292428; x=
	1763378828; bh=wWbnWFq97EeKe5bcxTlVW1/Ci+SE8i7JE7s30v7XTww=; b=R
	9Gw91ELdVHAxdG8/iIKB4ozVbs3ggqBZDIUFqSNd+Lpq92Y6YIsB0JVINL6NkaP1
	7JJWN8an02qAl5ZUueTE5MCot2KwipT2H9HRCqS7ANDyKa9kIKD3kxQAPRWbHS6T
	UCbWHOdImrrYRmrRA+6T3UVvISZs5t3wuAGbTdEFBB4HzYXWS7MkPcxdhtb4JP1E
	HjDLscX+vlxLU/YllOcAfITC1OFtHwF4qSlWrpq22JN8XnU6piIG6ZgxaOD67r6t
	Yhp3xHKcFdCK9zu4tZN+QOFzT1ndibFR6Bf1GMsolCiD0pxJD6e/CvoCYEODN7ym
	yKgt+teomHwb15eYI8DPg==
X-ME-Sender: <xms:DLUZaexQSZmby1xHCAB-j415BXUdBpfCz2htH15uQcR3koJCt0V_hQ>
    <xme:DLUZaVFQCkCFPuIDxKs20JU-97Zy5JBlaBqOiPPxg79zui2beFyBnyIlLciu52QO-
    1pt5DhSVwTaqoyh_VtPR9QYgA_1YlWAql4VjD_Hmj_fmGHHgmqTNh4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudehgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehnsghofihlvghrsegurhgr
    tghonhigrdgtrgdprhgtphhtthhopehmrggtrhhosehorhgtrghmrdhmvgdruhhkpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DLUZaSdNG4nnyOrGNuP_PP4WICfI-TwFr0AjMI2Nb1Tui10vCCkKQg>
    <xmx:DLUZaVhT0r29fqi0WvkO86ZzIlkC9kW-rwtWM57mN5Gq6f8N2iSTiA>
    <xmx:DLUZaaxbBFWHNswOB1r5MWrQxPJQSNqFOMi8Lds5QD118q39dw9qtw>
    <xmx:DLUZaROv91bkfu6F6qEPfDp3K7PvwQw7pQJMIosBAFVKgiqIshjl7A>
    <xmx:DLUZaYwwnQ9S7W_OP68hxK3gvzlNWreBXfEqGinOqbjyFt8tOVtqcTu4>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EACEB2CE0067; Sun, 16 Nov 2025 06:27:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq97S5jklcXJ
Date: Sun, 16 Nov 2025 19:26:45 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Nick Bowler" <nbowler@draconx.ca>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <e0ff0c2e-b69d-41e3-89a5-f874f8092299@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>
Subject: Re: [PATCH v3] MIPS: mm: Prevent a TLB shutdown on initial uniquification
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 13 Nov 2025, at 1:21 PM, Maciej W. Rozycki wrote:
> Depending on the particular CPU implementation a TLB shutdown may occur 
> if multiple matching entries are detected upon the execution of a TLBP 
> or the TLBWI/TLBWR instructions.  Given that we don't know what entries 
> we have been handed we need to be very careful with the initial TLB 
> setup and avoid all these instructions.
>
> Therefore read all the TLB entries one by one with the TLBR instruction, 
> bypassing the content addressing logic, and truncate any large pages in 
> place so as to avoid a case in the second step where an incoming entry 
> for a large page at a lower address overlaps with a replacement entry 
> chosen at another index.  Then preinitialize the TLB using addresses 
> outside our usual unique range and avoiding clashes with any entries 
> received, before making the usual call to local_flush_tlb_all().
>
> This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB 
> entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual 
> address).
>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> Cc: stable@vger.kernel.org # v6.17+

Maybe we should drop 6.17+ tag here given that the origin patch was backported
to 

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # Boston I6400, M5150 sim

This approach is indeed more robust!

Thanks
-- 
- Jiaxun

