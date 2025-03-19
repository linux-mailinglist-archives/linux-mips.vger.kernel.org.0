Return-Path: <linux-mips+bounces-8230-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A068A689E0
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A7F17D92F
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4521F8756;
	Wed, 19 Mar 2025 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Chk1E+/3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U9Mw6AjW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E11DEFCC;
	Wed, 19 Mar 2025 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742381121; cv=none; b=PrcqurGzTQrvG6ad6Zm/wVMzjbDkADZmNnLPuf8vC5K89tcm2BvGugQk2REA4/OKQSdizaO68UwHeg47bBhFut5IIK2XPr4muaiPqHmzLoMtLf1tVMhutY0YhDz5JaVN9ppWOk3ZXSfYnECzBiuKrSevUKo6fPAbk/jBFB0UDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742381121; c=relaxed/simple;
	bh=dW0IHTu7KnFUiS9fwWz64T+VZC7ParWZARQ2CMSYNKQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MNAAuQTkQ4JX6mn2c+o2T5NDdH8Q4KRFZp8dHfjcs2qZmzDmUQND4H9RdKKzPXX5rjbYCzMmnXEYE3zMKJDBmJXo7JOuxdOG9dBBrE2tU+vDygXVQoWk5RIh0j7XC2LKC2WyYLv50kyrClAzDaVhDAd4OuBnR/g5sFfUgMPxhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Chk1E+/3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U9Mw6AjW; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 6D4BC1140165;
	Wed, 19 Mar 2025 06:45:18 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 06:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742381118;
	 x=1742467518; bh=4heiQIK3yLdk77Mzmzg7wBmTnbLxRUh5hbCFt69Yh6s=; b=
	Chk1E+/3xT0PnMhd9TypG6pOvvniNxHjoE/NKUcI7WGEIZEwwCWTCbCNh9bg3reB
	4qW6SbMFY6GRANeAS+oXhyQ9wvtNGI6ma0Vd5NT6Z5nWB7VnlAQWUO/N+lYI5HcA
	rF/V4rFQxgo50lZWa6dJiR2ZEygupkGsoJIS2+0g8p7Dxc2w0jii4s6ITSrmTBlB
	8MtmoV9jsVaKuR44nbEUzag4QsFjXSW1siGQdknLppEEmIkgfciBAENfWIenuMKr
	JkuxrykCVrLZsobbiG1ETZvqSUxffqYqTkyf1Nveuawjl5GBNo/NljM2Skr1/K+0
	Asiip2fJAONeDATjAli9sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742381118; x=
	1742467518; bh=4heiQIK3yLdk77Mzmzg7wBmTnbLxRUh5hbCFt69Yh6s=; b=U
	9Mw6AjW57asD9gJL4vldFv4yElWE0hRH9w+blpkQr4z9jcJso1Qxd4gdknod47TG
	WWrt5PbS+MbdiCcmJow4fjZX4O9aEwKShNccYFtvbWkn2+FplnS4MUA89P1jXMMB
	/WtMs0+fglknNzFotkrQbpFJD/KI/qmYkSwiitQf9Z7c78UF0ui6m0WDo3/uvtiR
	WmsxFT9fOC+GXxII2i4m9XrJGcxx3GHcQoV6ujU6rab1LPBmDjomDm4WzMRokmc3
	CCR4kj+Sb3f+NO+HsWXrwI40qUHN5wI+GEZXH1/yJHUvZPwGiay5kjrtbZ2InVIu
	B+v4Y1cTs3iv536A9Y4Cw==
X-ME-Sender: <xms:PqDaZ_jjSRDxsTF9Yo93JFDr0hrEvRE2wZ_y_7k8WujLWivA3fArew>
    <xme:PqDaZ8D83NI5nwA6ZwLjv4eW9H09x_AW7ES0o-mFvnrSQ82weMJXxqrzmb1uOIylY
    vTpnxCtA3MOkrJVb9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehuddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:PqDaZ_F1jMublN_Ow6DY9smnJt173v_Qn-3NQoib5qYgR5qcBr_KoA>
    <xmx:PqDaZ8Qp1NmkiS0esXOJS5b18F4syiTNBpiiNhoP1racpzUJWJWH0w>
    <xmx:PqDaZ8ykzxG1Jy8mrNvqOwkw_gClico2jVPM0tDKDI6yPsXQMRPZjQ>
    <xmx:PqDaZy4Pb3jaOdRADoBivoA0ITgtkWK3BWmJa5BxfDmSYH9NlNoZaQ>
    <xmx:PqDaZzk3WK5DxzPzUConwlH196AoVXNWwGbM5IQkMCIOILgqHbOnEGZA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 059382220072; Wed, 19 Mar 2025 06:45:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ta8684b9f4c2ca420
Date: Wed, 19 Mar 2025 11:44:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <8d335b05-c78b-422e-b375-17b6376ef605@app.fastmail.com>
In-Reply-To: <Z9qekYr_pYwI7dpf@alpha.franken.de>
References: <20250318214406.874733-1-arnd@kernel.org>
 <CAMhs-H_3WTMvd0kitT6Bp3a5ijjwhwEYhWbFTQ2uUQpmis12cQ@mail.gmail.com>
 <9066761b-e222-4855-b97f-17c36b1440e1@app.fastmail.com>
 <Z9qekYr_pYwI7dpf@alpha.franken.de>
Subject: Re: [PATCH] mips: fix PCI_IOBASE definition
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025, at 11:38, Thomas Bogendoerfer wrote:
> On Wed, Mar 19, 2025 at 11:07:46AM +0100, Arnd Bergmann wrote:
>> On Wed, Mar 19, 2025, at 10:43, Sergio Paracuellos wrote:
>> > Hi Arnd,
>> >
>> > On Tue, Mar 18, 2025 at 10:44=E2=80=AFPM Arnd Bergmann <arnd@kernel=
.org> wrote:
>> >
>> > It looks like nothing got broken regarding PCI enumeration on boot
>> > trace. I don't have real PCI cards with IO resources to test, but F=
WIW
>> > the enumeration is the same as from my stable 6.12 kernel boot.
>> >
>>=20
>> Thanks a lot for testing!
>
> are you taking it together with your other io,h cleanups ?

Yes, I've pushed it out into my asm-generic branch.

     Arnd

