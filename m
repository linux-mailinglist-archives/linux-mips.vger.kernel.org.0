Return-Path: <linux-mips+bounces-13076-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLd8Oml3fmlZZQIAu9opvQ
	(envelope-from <linux-mips+bounces-13076-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 22:43:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6EDC40DC
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 22:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7D82300EFB8
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 21:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF75837A483;
	Sat, 31 Jan 2026 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="D9yOmMtJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GnckkZWW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED7379961;
	Sat, 31 Jan 2026 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895715; cv=none; b=CIexfGS/PumOWbfVSXrQ5FMsOUKmyMy20kqOuLlfN7oFOxlAvHqKMfbz3ZEr/GiKOhL9r4Oo3khrhAzWcpAqlvMFIBj841rdKYKXac/8dJhF7EeLia+1PbluNXBMDWb/JpQUa5YsIjExSU4crfQe7MG1egLEQinvDKUVCLEReyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895715; c=relaxed/simple;
	bh=ejQlIL2/XjWupKW5Jy+2ObJ6o4nWTxEeYajZg0azRmw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SbvhFaiG31Ed6h0SzsKD0bLUkp3cgIp9fwSKLyKkBp1m1Yh4VK4/zHC9v97n6+PY7Cfx76iBxdiZRrDJ8bWIz5+6SOMk+hXdt1Vp6C67J6sKTyKNiGv2as8m7p+P0iIIhAJBcYr00sr624LQ089GkprG4MdNFIsXnuEqEdfxtfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=D9yOmMtJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GnckkZWW; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 7BFD01D0004B;
	Sat, 31 Jan 2026 16:41:50 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Sat, 31 Jan 2026 16:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769895710;
	 x=1769982110; bh=NtfjM3qgMeHjUQWF6HSm6gMxcDB/l050kSLeAlHxM+w=; b=
	D9yOmMtJXz/1qsHmEi6EArc9gtgOHVQnEG39iUWm9wRH3lfhCkr2op2uG6i6er1P
	cmZtatq6PldDRM2891vbhFDRcjWgLYnNzaNhd+b8QR5DUNzxxCO/BDAZnsQAnttP
	N3vfGrKLsjJfqz8DF5uux8zqgUJWhV2cvAxjnlTweGJRda3OdaY1Z4jUCygEUxni
	KCYVguP+xk0wFuNM28MsxsUcXhIRk8iB8pzNey3gDJFS3nHSIn55df2sAo2rd/kD
	/E8yAO3JdZgRR3Ueug4TugZF8vYN4b3qThe+C0Y7vx9sfDjSkNhFL7joLKRqBWT9
	SeRcWL1ef83D0fJJkRjRCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769895710; x=
	1769982110; bh=NtfjM3qgMeHjUQWF6HSm6gMxcDB/l050kSLeAlHxM+w=; b=G
	nckkZWWQWuWh9LpyDdxjd+++ni80gY20eFpju6pxrrizfzeDfij4vVIXpMBswFT5
	1b9vWi/MEklKEqxQdV1esSsVgSQPEEkTJgF9ECxxLUH7xMntSGVSnX/lL4zhIQz7
	EDta8fNM7VwTC4DIAvjHUwCWkvxg+kY7xw1mD4bNab0EZWsU9ovQLrruTsJ59yXv
	heGo4ce+9YytS9djquvg+BzjHwbjrccnYJC8s1WO88LwJsebGsqVjibNnjGOc0+T
	TtiMCoz9GabND4I7i2PHODHTK10oK+FVssyZW6C2gwJjMl2Rmxe2BpOhEZRJiE0v
	0Bp54S3TXvBNqDvBrXjHg==
X-ME-Sender: <xms:HXd-adFHwYIUBTJ5r2sDt9X3tVJAk2FBamnZxUJkFvlU8daMr8u_5w>
    <xme:HXd-adItDKEMSzedmfjIhN2XujXVEOyC6LJ4eJqARC2bX9uduAzHDiiQKMHd2c8Lq
    Y3_8lSruyiiNUc4J5aI3COH12n_bIWZ4b1zdmBmOntIO5feTCqfcX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeeftddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehilhhpohdrjhgrrhhvihhn
    vghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhonhhgrhhonhhgse
    hoshhsrdgtihhpuhhnihhtvggurdgtohhmpdhrtghpthhtohepihesrhhonhhgrdhmohgv
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HXd-aev8X0IBU0cWzOjtn_LfPwUM4rVqAtyA-VEP_hnURguXGDp_0w>
    <xmx:HXd-adgxC8VFl4mgYaOsw16CU6u4m1wOIVaIZhUDZkS7ZCN7d83lJQ>
    <xmx:HXd-aZqkhqt05z2DGf-Hnjel4SqHGP7NXsXrA9CAAaVafxZqVeLGEg>
    <xmx:HXd-aatsl9gsPA8uotThMtqciOCxynfXqCQTxLJbB4LEiPmDHzAFnw>
    <xmx:Hnd-aTbTGGWPaKfRgChp_KSPZg8_qDzm49APNGEeRIpHdwrunR_zaTHv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 52E312CE0072; Sat, 31 Jan 2026 16:41:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFQOcv9bxohg
Date: Sat, 31 Jan 2026 21:41:29 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Rong Zhang" <rongrong@oss.cipunited.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Rong Zhang" <i@rong.moe>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <83760d87-151f-4947-9af5-6b4572d5a5d4@app.fastmail.com>
In-Reply-To: <20260131214003.833520-1-rongrong@oss.cipunited.com>
References: <20260131214003.833520-1-rongrong@oss.cipunited.com>
Subject: Re: [PATCH 0/2] MIPS: Loongson2ef: Use pcibios_align_resource() to block io
 range
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm1,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13076-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flygoat.com:email,flygoat.com:dkim,app.fastmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 4F6EDC40DC
X-Rspamd-Action: no action



On Sat, 31 Jan 2026, at 9:32 PM, Rong Zhang wrote:
> Loongson2ef reserves io range below 0x4000 (LOONGSON_PCI_IO_START) while
> ISA-mode only IDE controller on the south bridge still has a hard
> dependency on ISA IO ports.
>
> The reservation was done by lifting loongson_pci_io_resource.start onto
> 0x4000. Prior to commit ae81aad5c2e1 ("MIPS: PCI: Use
> pci_enable_resources()"), the arch specific pcibios_enable_resources()
> did not check if the resources were claimed, which diverges from what
> PCI core checks, effectively hiding the fact that IDE IO resources were
> not properly within the resource tree. After starting to use
> pcibios_enable_resources() from PCI core, enabling IDE controller fails:
>
>   pata_cs5536 0000:00:0e.2: BAR 0 [io  0x01f0-0x01f7]: not claimed; 
> can't enable device
>   pata_cs5536 0000:00:0e.2: probe with driver pata_cs5536 failed with 
> error -22
>
> MIPS PCI code already has support for enforcing lower bounds using
> PCIBIOS_MIN_IO in pcibios_align_resource() without altering the IO
> window start address itself. Register PCI controller in plat_mem_setup()
> instead of arch_initcall() to make it the root of other resources (e.g.,
> i8259) and prevent resource conflicts. Then, make Loongson2ef PCI code
> use PCIBIOS_MIN_IO too.
>
> Rong Zhang (2):
>   MIPS: Loongson2ef: Register PCI controller in early stage
>   MIPS: Loongson2ef: Use pcibios_align_resource() to block io range

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

>
>  .../include/asm/mach-loongson2ef/loongson.h    |  6 ++++++
>  arch/mips/loongson2ef/common/pci.c             | 18 +++++++++++-------
>  arch/mips/loongson2ef/common/setup.c           |  1 +
>  3 files changed, 18 insertions(+), 7 deletions(-)
>
>
> base-commit: ad9a728a3388dc5f66eab6b7135e0154249e9403
> -- 
> 2.51.0

-- 
- Jiaxun

