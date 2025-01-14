Return-Path: <linux-mips+bounces-7450-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B22A1110A
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 20:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86531168BDF
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955501FA14A;
	Tue, 14 Jan 2025 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pPSLPGZw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vLapo5pt"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1481E495;
	Tue, 14 Jan 2025 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882431; cv=none; b=mmjtsbduNbHGLpJqtl9RAiV5NChkLCNDcHaAF1VJ7GUEo+D0cBqOP6Bh24iI140aFGxTt/1LMNsQ+qVQO3kHMJwdGyL8UEgsc6diQPTNiSBRaNAee5gDjehfEAwrTJt6S/Zkpgjo0jsDD37Fxr5mINNp+2+Teggyvkz5y2+24Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882431; c=relaxed/simple;
	bh=kZRBKpHdQX1zFPZVOWGK1gU9ZS8qndaTw8JFbZYANAs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HhoqK41HWFWoPGFA99pdQgIFnTbz35k5rhNU2jSlXatF7zl3WpXfw2IFOh1ucamfRKLppuVPu6hNTMHlDaf7oK0PbzEuMMmejUEiEHTwl7hoNLCSi8MbtZrU5D3y4+OpS/zx/PuMgZiPaJ4FfTAR1BKX3WSP08I5xa88oZ2QCKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=pPSLPGZw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vLapo5pt; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 9B4BC13802A3;
	Tue, 14 Jan 2025 14:20:28 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jan 2025 14:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736882428;
	 x=1736968828; bh=pPgwFjXpd7GFlw2n/9FPXAtr2bxArsjbYMjfJ456tT8=; b=
	pPSLPGZwHpxO/H07gwezVe0mU2FDjOe1uLCw7dh+/Pq2P7ui5kBJYsrf4ug7/iAr
	3GW05CKJwfc4ji6r5E4G4s0YT3jhCTabX60y1x3e0SxAMtcLZc/y96mJslpDN2x4
	i00C0ABRMD5ruL882Lecm0zANWnrGhNoAFwaJXHhbTCpwF0ysHpHq0aizgYAntBF
	/WipoVHWjwr9XGTkklbYv5QghM5dLPm1Xy5pP4HCX+DcyjpdYeuvqOJVJLX4NUwh
	rM8cVmPuh9IoLfQcaTHZzoIRT0FOesGgfjVO3ijndJufvFhsrCLhje8PMcB8S0Ww
	x1PBeAMvbtU+fMaWN7veQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736882428; x=
	1736968828; bh=pPgwFjXpd7GFlw2n/9FPXAtr2bxArsjbYMjfJ456tT8=; b=v
	Lapo5ptdtv8dP+T9gFhhXpDyzuHyNz28F3ElXAzWCNhrM9aDhQq47CTsdjNvWkRF
	8sq5mNNnGBknZyXnSsKOTyKAUVUuec0V76c0d+jVHWCs7opZtlM7FZK5xDGKWrJr
	V9YiPFN9F0WAMrJy4XMRSOK/HaiG6PPnXASqHM2qEZeizZyMwhF5do/RRhxfPp7K
	37BwBku0HJteA72FpJeCMR1YXqD07Z5HjCvhTVVDPb6+l05jy8ak2SK3DvP04S+2
	H+8s+356ef7eLsIIT+23NqAF3BpwqEhSBRfaFraRU0QoHczJH8vRw2hunhf9cveN
	XOq90TuQgtKP64EdPU1lA==
X-ME-Sender: <xms:_LiGZ2yuJAKUo1DcA-1nFFd1sez-PlKpafy26lxzRVVVRoccdDJkvw>
    <xme:_LiGZyRo2ZmWviyWNDMmWrsauKs5zIPzXPLgv51J7Wce66fBkBJXswpa3X3sCwOLM
    EIQAsRC1s3FMwqB6sM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    oheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehmrghtrdhjohhntgiihihkse
    hovddrphhlpdhrtghpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_LiGZ4UHsgVutYrAyAR8At3c9Q5TgpCLqaKJpsXsG7F7862d4RNEzQ>
    <xmx:_LiGZ8gdDumUbujWOVU3Rf6Ufygun_s1ImN_yW3uYEEtF1hGjE_1LQ>
    <xmx:_LiGZ4AiaAopLgUtVWyQonMIBdr2psYdL7aggoAB3nGJdw7dtSsSLQ>
    <xmx:_LiGZ9JMPEy0r2abOR01rrM_6dELvRyPq1hKPTJqWqfRAsBQ8LLqQw>
    <xmx:_LiGZ62GCgm3WOlYY2P7PFZvGe3euKI0B8vSf_hEBfhTaI8rjXd3Ou2_>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 504431C20067; Tue, 14 Jan 2025 14:20:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 19:20:09 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Arnd Bergmann" <arnd@arndb.de>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Baoquan He" <bhe@redhat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Message-Id: <fb3aa671-45bc-4d57-b90b-2056eeed0ea6@app.fastmail.com>
In-Reply-To: <5ef27e01-2c5a-400a-be32-d3bcdeea6d26@app.fastmail.com>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
 <5ef27e01-2c5a-400a-be32-d3bcdeea6d26@app.fastmail.com>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8814=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=E5=
=8D=887:03=EF=BC=8CArnd Bergmann=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, Jan 14, 2025, at 19:11, Jiaxun Yang wrote:
>>=20
>> +unsigned long pci_address_to_pio(phys_addr_t address)
>> +{
>> +	if (address > IO_SPACE_LIMIT)
>> +		return (unsigned long)-1;
>> +
>> +	return (unsigned long) address;
>> +}
>> +
>>  /*
>
> Isn't the argument to this function a CPU physical address? I
> don't think there is a point comparing it to IO_SPACE_LIMIT
> on architectures where I/O space is memory mapped.

Actually not. It seems like the argument here is just raw PIO offset,
without applying mips_io_port_base.

We should validate it to ensure it's within the range specified by
mips_io_port_base (which is sized by IO_SPACE_LIMIT).

Thanks
>
> I see that you copied the above from the the non-PCI_IOBASE case
> of drivers/pci/pci.c, but that only really makes sense for
> architectures that have special port I/O instructions (x86,
> ia64) or that use logic_pio.
>
>       Arnd

--=20
- Jiaxun

