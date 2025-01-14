Return-Path: <linux-mips+bounces-7448-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D59A110B0
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 20:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EFB07A2DE5
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7D71C07DC;
	Tue, 14 Jan 2025 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="8i+QxXZz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pxlpCv63"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12751B85FA;
	Tue, 14 Jan 2025 19:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881417; cv=none; b=fTInD+SGcNr1ooahJy5PpF45Vqpqjb6ni3M0l+bXyA2H8/c2WM7mvk9/4MyL5JuOuydwcw4o1G1unLV1qm1bPnpfQGvsdwE+m4SO2Dlpy16/fUFWPFeBk0bk33lj6dZRVS+JYkAtfS39dcJkfFMaRUel3M2UvFz6j21hvWhyi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881417; c=relaxed/simple;
	bh=NMOAE+XTrHT0Fb3RXjtVahrnpUUJh1ohvcdtz1NvNeg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XY6bBAT41Z54NXQV88rVy8ACag+ebVX6p/s5QTia3dL2J7KI3u/PnxBGL8NFME++Uqu3ow03D3f2woMGAYpRMIUTGZlWc+ChlHYUm1QNitinEsGVCETvN7YnLvU974B/Rn3UZO6GLGvMj/d+3yzmWlX2B935eX33jcGNTDR8Q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=8i+QxXZz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pxlpCv63; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id AE51D1140099;
	Tue, 14 Jan 2025 14:03:33 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 14 Jan 2025 14:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736881413;
	 x=1736967813; bh=MVfw8sweruAkXHon45bPN6yehLWpW4KW/lAmzafe/Xw=; b=
	8i+QxXZzo9TCh9Pki4DZszIdB6bxovg+VDb1fgO32EYgrx4VazOWvpUFC0BTLihp
	aTU1DXg1WEKmOOTwDNW2C1+GYAWssV7LF63MJGoeo9vPjUmBbzEoXxNFTYK0JWQP
	bBk8tTU77jiH3Tv2KIMPKMgax9NJJqbrKwlqme/jAaJ1YMJUCnBAa1f+tDNCFFFM
	1W3jTUiFk9y2pdFziU2/jQfyw/j0jSv3I3PiJAIDdM+coNpFIDZOII6+YolJH0fY
	0GTZM+WRtYxdf5oRaE/TFKHC62uEKaCPUYD1iDwwo7Hy2kDA+2mdUj0qrL0LUlBr
	ru/LEgq9yMHFQblKTt8AFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736881413; x=
	1736967813; bh=MVfw8sweruAkXHon45bPN6yehLWpW4KW/lAmzafe/Xw=; b=p
	xlpCv63RhmHSgq2ePkoHeXn5lXWuwKbrKO1bUSMm/jkbcY3jcjXJQmEkPwYJqwmB
	zQzub0LWPK+NdBadOy7S+yXdMtvA/Q2Ch4eCLkInf3/z76AvbB78vaLLE6dTcCh5
	J8Y+5RDrHFdWED1UIQimTDeWrl2WDfHXKQpm/6MEnhHR+ZKtk4nxAscD6wQOHjnz
	kIf2PSpbfpJMVlsAwZj5DOGMQLj+N6R3tPqbbM84wHW3QSxpoFynOM+z0C7h5jMH
	YuB5Ls9te1tgPRkZ6ONkZ6YZ9/XKoWuODe12ZUTcKybZFhEYCFMnQkPJhVq2oEz3
	DZBH3sZ5A6Ae0UVxiLXJg==
X-ME-Sender: <xms:BLWGZ0TLh7-7hiFOWwLPzfkXNSiMc0CNclITZh8xPK9C-COKIRTveA>
    <xme:BLWGZxzAFjAQltE7IwM-MdX1eKX0g2RfmwQDGEa9I3WWMZ1th2PYv-5dYrHXSCgm7
    0h94KfahmZlUu6qEjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrg
    drfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdprhgtphhtthhopehmrghtrdhjohhntgiihihksehovddrphhlpdhrtg
    hpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BLWGZx1MeUMGMMAfPVm-2a5w5RIZT0FsYvK4RfaLpb8P3wcNEMeLQg>
    <xmx:BLWGZ4DipkrJQoH4scDMklsxdJzDziyaobRaP-pRj8HfWwEJEOoXyw>
    <xmx:BLWGZ9g00cIc28VEQ4xHrkM5fQyI59JvLyqupQ38jVpVKI32REy0PA>
    <xmx:BLWGZ0oslHByfh3P809TO_nu7xHmjdtPeEbBrj7CGAUx9nyjwtcmlA>
    <xmx:BbWGZ4WJTvfUU9d48PpajejRMruuFgpD8C7Yy6068U_ZeU9wtu9rAyXx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B16BF2220072; Tue, 14 Jan 2025 14:03:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 20:03:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Baoquan He" <bhe@redhat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Message-Id: <5ef27e01-2c5a-400a-be32-d3bcdeea6d26@app.fastmail.com>
In-Reply-To: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 14, 2025, at 19:11, Jiaxun Yang wrote:
> 
> +unsigned long pci_address_to_pio(phys_addr_t address)
> +{
> +	if (address > IO_SPACE_LIMIT)
> +		return (unsigned long)-1;
> +
> +	return (unsigned long) address;
> +}
> +
>  /*

Isn't the argument to this function a CPU physical address? I
don't think there is a point comparing it to IO_SPACE_LIMIT
on architectures where I/O space is memory mapped.

I see that you copied the above from the the non-PCI_IOBASE case
of drivers/pci/pci.c, but that only really makes sense for
architectures that have special port I/O instructions (x86,
ia64) or that use logic_pio.

      Arnd

