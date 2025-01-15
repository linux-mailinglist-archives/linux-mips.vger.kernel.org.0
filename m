Return-Path: <linux-mips+bounces-7455-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D2A11DD3
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 10:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D58188CAB3
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 09:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB3C1EEA2C;
	Wed, 15 Jan 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="tCBuyXN2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q7T7u8yB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF051EEA34;
	Wed, 15 Jan 2025 09:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933195; cv=none; b=jfL/Rs7gBwHpDe3xFJV2OnT7GPS4D89nKitzNI684spxRNrhHoxb1P/xP7CYVhJYgI2OAAHF2a8uFssQJNMury3XLpnfg30Mn26VgsTatkmZ7QtF67U3KzClTGE31i3DOiLx3hFPqoOde1zyBZNWSmmHZ6KcTJlZ55eH8VhuawU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933195; c=relaxed/simple;
	bh=rVpxLjddOBjKad+NcHQ6+JfwsTHpdxS+zG/yw4+jbKg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eE0e8t8ual9+ERHQRtRXsJZU4galBgcbgZQEmaf5rOczZe5ebwIiff3N0ME8Sl4G45v0a5Dh1mLpX3uWzd1A6C32pGAC2jLadynyqHE/6Rlr9DGJoPoIGfPU8CIu0f6vosa/Cy6qnUqtkkYDHVjaIrL6OZC7MlOOT/4bNx7Fj/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=tCBuyXN2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q7T7u8yB; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 6F13713802AB;
	Wed, 15 Jan 2025 04:26:31 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Wed, 15 Jan 2025 04:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736933191;
	 x=1737019591; bh=w+yuRssFr0VXlRiWE1+nOVxwR0IWRgLg5EC/Qld1RsI=; b=
	tCBuyXN21L8j+1zvN7D5+1v3KDnQsccpw7ihESEfDXedNqA80FQZShS588oSIk/Z
	NT365Mporxu2mkOu09pCb2doFvuKh2Qo4gng1HBFi0sBcf44qKIyo5TeAqQXuylE
	oE3Hh6YqCJdrU4LIdnBEW+6VrUiKoCs3xlhJNegxQXdBlFlui4ukcC7EqiVTMe9L
	iFuxFPXnRCfJmxsP7ItWm+IvGnpMJ01cxmD2yW6oZKfxF3ifU+g4Sbh8/RMHCOe7
	lcB+Ssw1s1571T6N9PIbr28YgWuxjDulHXbYgktwqeTaWvkyxZh7uaLiPM85wILH
	VgL5N9kzydhDyHaMAxjpVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736933191; x=
	1737019591; bh=w+yuRssFr0VXlRiWE1+nOVxwR0IWRgLg5EC/Qld1RsI=; b=Q
	7T7u8yB9Bn2ni5H0cvd9pwomxwho1+gBMoe60ZGV+/PC5BRh8MOxqWKmECt3HkdW
	+QyokhBKFVxktgBxhsgxH0pVoTDHrd350rTVNXo9di9To4aLWihEfDUhdwC95aEe
	bPdVFFXHDRrA+cInKXUntHFPUC9VoFFlVVJRoQRKImc0aX6sFKuHJmSg3KueQpG5
	3OdFEyobBJyZv7GHhYz8dynF8UkbYxQlA08jgfrO+qLQwd5pHKJkeRKflLw0H6/0
	cSQcXvYshn/o7ZA7c937yBS7WvxyIFrUuTLecO2TVZ46oPsNKY3LGfQjgC3kOpol
	xmqNnEb6euGBXrhnV78qA==
X-ME-Sender: <xms:Rn-HZ5oR_dPrPAcfUSCvaiwqZm_w543HLQRQeOnfEjk_FULKfv9wnQ>
    <xme:Rn-HZ7r2fq6TmW_csrlZV_5oddGCi3DfZf0oGWVym1AgPsK2UZHVzepTuBbd0ZVIV
    XcQMwKbWmr_b3Rt77w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehkedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepmhgrthdrjhhonhgtiiihkhesoh
    dvrdhplhdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    thgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Rn-HZ2OBkhRQweVox_FZwRcrV1Qw7A_sC7ht_Bs6KXBmgJjJmY3K2g>
    <xmx:Rn-HZ051x8gZk3PUo7xDrTTWBynYKaFj2dA3-L19P8najdXHR1QGDw>
    <xmx:Rn-HZ47KfLSk9igBk_y5CEE1DDhFiDpAyijO7g3Hrv8_SNdKl4XQcA>
    <xmx:Rn-HZ8hu7FbnbQMZYJAGa9lrgoEfekRW0wRi5EpBYoTpyIAX4yFkAQ>
    <xmx:R3-HZ1sRmjK4bwPbOscq80ZS-LGsNt-qkW1GFAPzM83ivfuJKoaVzOFr>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0D741C20067; Wed, 15 Jan 2025 04:26:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 09:26:11 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Arnd Bergmann" <arnd@arndb.de>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Baoquan He" <bhe@redhat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Message-Id: <11e402c9-ea38-4132-9ab6-0bd346a82c88@app.fastmail.com>
In-Reply-To: <23f46c23-a58e-4a85-8733-480b5ebf993b@app.fastmail.com>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
 <5ef27e01-2c5a-400a-be32-d3bcdeea6d26@app.fastmail.com>
 <fb3aa671-45bc-4d57-b90b-2056eeed0ea6@app.fastmail.com>
 <23f46c23-a58e-4a85-8733-480b5ebf993b@app.fastmail.com>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8815=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=887:38=EF=BC=8CArnd Bergmann=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> Where "range->cpu_addr" is the phys_addr_t location of the
> MMIO window that maps the host controllers port ranges, i.e.
> the fully translated address from the "ranges" property.

This is valid for MIPS's PCI_DRIVERS_GENERIC, but not for PCI_DRIVERS_LE=
GACY,
which have it's own implementation of various functions. See
arch/mips/pci/pci-legacy.c, pci_load_of_ranges. The address translation
is handled by io_map_base, which usually comes from mips_io_port_base.

>
> The point of the pci_address_to_pio() function is to convert
> this into the Linux-internal virtual port number that gets
> used as an argument to inb()/outb() and reported in
> /proc/ioports and that may or may not be the same as the
> address on the bus itself, depending on the how the translation
> gets set up.
>
> On loongson, we seem to have two port ranges that are set up
> like
>
>                 isa@18000000 {
>                         compatible =3D "isa";
>                         ranges =3D <1 0x0 0x0 0x18000000 0x4000>;
>                 };
>
>                 pci@1a000000 {
>                         ranges =3D <0x01000000 0x0 0x00020000 0x0=20
> 0x18020000 0x0 0x00020000>,
>                                  <0x02000000 0x0 0x40000000 0x0=20
> 0x40000000 0x0 0x40000000>;
>                 }
>
> Here, the cpu_addr is 0x18000000 for the isa bus and=20
> 0x18020000 for the PCI bus, apparently the intention being that
> these are consecutive in physical space, though Linux is free
> to rearrange the logical port numbers in a different way, e.g.
> to ensure that the PCI bus can use port numbers below 0x10000.
>
> On Malta, I see a very strange
>
>         isa {
>                 compatible =3D "isa";
>                 ranges =3D <1 0 0 0x1000>;
>         };
>
> which maps the first 4096 port numbers into cpu_addr=3D0x0. The
> actual port window appears to be at a board specific location
>
> #define MALTA_GT_PORT_BASE      get_gt_port_base(GT_PCI0IOLD_OFS)
> #define MALTA_BONITO_PORT_BASE  ((unsigned long)ioremap (0x1fd00000, 0=
x10000))
> #define MALTA_MSC_PORT_BASE     get_msc_port_base(MSC01_PCI_SC2PIOBASL)
>
> So e.g. on Bonito, the ranges property would have to be
>
>       ranges =3D <1 0 0x1fd00000 0x1000>;
>
> Not sure if this is patched in by the bootloader, or where the
> corresponding window for PCI gets defined, but I suspect that
> the reason for the regression is that the caller of
> pci_address_to_pio() accidentally passed in '0' instead of
> the physical address, and it happened to work because of the
> missing PCI_IOBASE definition but broke after that got defined.

Many other pci-legacy drivers are also working this way, PCI core
is not aware of virtual port to physical MMIO address mapping.
PCI core just see it as x86 style port.

Thanks

>
>        Arnd

--=20
- Jiaxun

