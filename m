Return-Path: <linux-mips+bounces-8225-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B2A68912
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF744189B062
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C411B1F866A;
	Wed, 19 Mar 2025 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GcmL+8oN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ll+tX74h"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5A1E1DE6;
	Wed, 19 Mar 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378891; cv=none; b=bkI0ddvVte0X6kvdJ064QMITYSEm4hwz4ghpzPf23OG0S19ZYWEqFYqm4DBIqfW0w1TrkbudlhuzdtmRmj8bNqvQxt5oXD2vil+wo0rgRalA6ILptRjdpJpGYPkXct7xJ1Fxl9KFta8D9/6QrFqhTPSCrEW9a7CTy1HWyfbMijU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378891; c=relaxed/simple;
	bh=653Xw5WDdZi5f9zRy+VDblToAdC0Pc4DFptOhWOAkUo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DqS/i/IxHZoWsQ5ffrmQ37p+fMTWSk3jnEeZWi9+NqoMwo73DjZwOlpMfVK6ssfM5f3CK3vYRNGADDusNB/mEOPoouixSGomqRe39kwCCBm10gS/jdMG+4n/4E3xrilPJsVTljL4RNQaZFOEAjA6ulw46dZsdCFZ2OEPz5MS98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GcmL+8oN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ll+tX74h; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id BF0561140140;
	Wed, 19 Mar 2025 06:08:07 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 06:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742378887;
	 x=1742465287; bh=S9YVuKHlnv1ZyMUq4TEDd3H0YO9uZ/3hlqbRc9H1EUE=; b=
	GcmL+8oNGkykR82Zip4Htvd2172Sylh+hfVtPxSIIUAoP9JidFD7WSKqs0j9HcWS
	LFYrvueLLiBPhUhvZLk7QfpO8tK2wvAS+FjF+B5p4pcAPc38ueuTHYKwqAVtRe4T
	aK7NxG4U14EPRVnyiL3NF8wOucxQ58/mrxB7/kDPJX7awQv1NNs/axaIg9mgL7vi
	MtkA/I3Z72lkE5bJrt73S4I5zGIt9cCxq/JOIYvZNrk8YpMRe8nwBylVTdXqT8wc
	zn2DYSwriW2KI0Bck+8HbJfJhtnKDkEtUo+Hm/a89iCdVoETwJa4sAL0/VYnCXao
	ZlEWssKtWiGagyocKFoTIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742378887; x=
	1742465287; bh=S9YVuKHlnv1ZyMUq4TEDd3H0YO9uZ/3hlqbRc9H1EUE=; b=l
	l+tX74hEx9NGa1MAnSIcA5hx/vDNthfcjEwicGFNJEw4uuah1iCN1PCHQb59mxpB
	9G+KnSJbeHv3ub5JhzlePnsi5ZcZFmlPb+sfO2mFp28mnkfE3ONCbI8IhjDU1fVW
	Z51majWUVA7MBd4K8gxMdijgpdhm1BnJkB4IS9jz0nrUdHmwZLmZiQ3ccsmoloBp
	hL2u09l1u0P1jyjHfH6bRncCvChn1HVPO9XrwEbW/QRrZP/SL1OWT4O8ZWEFuhD9
	D0UJd0SGWwiHJuUaU/zkPYGSFr0/Om8uz9FskOPe0u6pxR2Ns8pMt23E+MUYnhBB
	pJYWEPGhRmEFJJE4o9piA==
X-ME-Sender: <xms:h5faZ5CL_Yy4Sb2ykvqxjpGRyoZGPcEZC7O4k3jNdmOXqCLSy49HlA>
    <xme:h5faZ3joDaRdnC_x2oPETSrlbmU_g7-elhh_ENt9QSOpGj7m1ZAGxNWZyvcP5ypgd
    dsBL7HZmE9jA55VTAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphh
    grrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhmpdhrtghpthhtohepshgvrhhgihhordhprghrrggtuhgvlhhlohhsse
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:h5faZ0kjyK5Pi42Mavfr6j3k5ADXPix9POl-13XRjQfo7204FKnGJQ>
    <xmx:h5faZzwIGlWYtw7xOy0XiPquXkczSUHkktu66t1LsjyorEXkxapCYQ>
    <xmx:h5faZ-QtD3uPfilv-HsJNYKO0lQwtlaMWkARaz1bzwTrg8DbKC0LHg>
    <xmx:h5faZ2b-x4-gVcdLPR8mwNeL9Bal78FdHEBhY_mweHnbfcdGyKsUMQ>
    <xmx:h5faZ9H0JLC5rA71SnHa-GzQUZv8rRo3eli3vUW2LYozGzw6T4HQE2ad>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 39F432220072; Wed, 19 Mar 2025 06:08:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ta8684b9f4c2ca420
Date: Wed, 19 Mar 2025 11:07:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <9066761b-e222-4855-b97f-17c36b1440e1@app.fastmail.com>
In-Reply-To: 
 <CAMhs-H_3WTMvd0kitT6Bp3a5ijjwhwEYhWbFTQ2uUQpmis12cQ@mail.gmail.com>
References: <20250318214406.874733-1-arnd@kernel.org>
 <CAMhs-H_3WTMvd0kitT6Bp3a5ijjwhwEYhWbFTQ2uUQpmis12cQ@mail.gmail.com>
Subject: Re: [PATCH] mips: fix PCI_IOBASE definition
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025, at 10:43, Sergio Paracuellos wrote:
> Hi Arnd,
>
> On Tue, Mar 18, 2025 at 10:44=E2=80=AFPM Arnd Bergmann <arnd@kernel.or=
g> wrote:
>
> It looks like nothing got broken regarding PCI enumeration on boot
> trace. I don't have real PCI cards with IO resources to test, but FWIW
> the enumeration is the same as from my stable 6.12 kernel boot.
>

Thanks a lot for testing!

     Arnd

