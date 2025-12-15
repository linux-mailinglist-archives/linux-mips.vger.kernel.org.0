Return-Path: <linux-mips+bounces-12460-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD2CBDE31
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 13:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F5D3301F5E9
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 12:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9965B3375AA;
	Mon, 15 Dec 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="oaKtIV8p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ch7K4PUS"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7102C026E
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802877; cv=none; b=OFhMfyAJSpMdSqJ0kP/p/Xg2ocPVQACRKQs//BsFC8eOglXOgP7J2BMKU2A3NWOcAcs5mkHUHCXNzNMRhpCtUWQ+BgQRd92vi8SWfYDc1uPBrFkL0rN8JhNZqtMmu5HaPnjXiHIWP2YDxZpEm6lmdg+SUUZq98MXlTaWOxiTpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802877; c=relaxed/simple;
	bh=RVlHnLAJaXFO+PADss9hcOPaqSSXvUMW/m7iIGTK+b0=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LfNPFLIQjL+9B70C2QvqZgMuKXrTknnSPRj7GcrumBSvBls/eo/vlP8NTOWKGu7CypmX7OzcSIfMBt1R8pdp6axPOT22SfCnm3FffQHzssh2y7R+5eeE0zTtfh+OEtPGI58lPi+V4eYW7vIxOEm232prIQ5nuHD7Rc/VvsRGmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=oaKtIV8p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ch7K4PUS; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 912941D0008E;
	Mon, 15 Dec 2025 07:47:54 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Mon, 15 Dec 2025 07:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1765802874;
	 x=1765889274; bh=2pkuf7V4XXyJ2jsazFvzvzdXLOMfnnAzbXSg1zL5E3Y=; b=
	oaKtIV8pV3Mp8W4Pijl5i2tydYqpyzH9bKvmLz6NCqSQXNkYQxi3eacce5/lJVu6
	g80v0stL1CTLNvq9gMo4n9fXWd4MvaZAk5XQZZsbKVYIoIqzljh7xtl+/m2vUtpn
	UAoJW19SItEc/DatMTltsfhlmRq6yKkaCtJ4+9QN2hnln1b89Y/rAweFMPC0OufE
	Tceut5k07zInk8B/+bma9kb3g1KJzEqeha+JLaZliyousfzSePSDECj8y8N4+1ic
	vey9yHa5k06G+KqWRPq3bOi+BxV2EkkT80n4Kr1q0+/NcppeXEGq7OWYINyyxEYh
	zl8DNwW9f46v8umM8ItdQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1765802874; x=1765889274; bh=2
	pkuf7V4XXyJ2jsazFvzvzdXLOMfnnAzbXSg1zL5E3Y=; b=Ch7K4PUSo+lL40+5N
	UN494OTe9Y9OhmYp25erTobo+mEOt+aIf03roKOC3LCCDUFXZmYxatxknIV/S31h
	Nd9sb4RRKBvN04+BooNb33lOqNR5en9itQIXiNou+4OKf0dw2a+l/ph6cZOboYcK
	me3PG28nwri6mNTI3Ud8PdOHRdqUnv7PMHQM0ZSH2eHt2Rf4vUFF+vtJz1uUhNXL
	ZdYYHJAYMzYovfdceIwXbJ9X485BbUqJHz5uaAkyFeg6q+bsACrz8nsKP95/+dSk
	YhLgq5od0VZPsr4DvGpWp3Do+WbiCA/6SsS+ttbQj+QJ/0rrrhyJ1dXOJcxUmZUB
	SMC2w==
X-ME-Sender: <xms:eQNAaXeplYZ01t-zQJFHn_FEsnuHGKuLqxlDmfQAVhAAFzJAIn5lPA>
    <xme:eQNAaYDlPAvC98vZWQlnsPIVmzTnWzdq_XWR3lfdhGU0hYlULIuycuGuiFyoibF6y
    NsVjShji8vVd-jFqqd4ARpiVp7zpsjQj_KJctGkhZQ_tHF-JnPXnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefieekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgiguhhn
    ucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepjeehuefgheekkeegueekieelteetvdeltdfgheeufefhgfeffeet
    ffehtedvffelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhr
    tghpthhtohephhgruhhkvgeshhgruhhkvgdqmhdruggvpdhrtghpthhtohepmhgrtghroh
    esohhrtggrmhdrmhgvrdhukhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:eQNAaZLLGkuKScqDKlLZ_FbDonmm3NhhRN72HG7IiChkpJEy6G-HvA>
    <xmx:eQNAacC_Em-gNWwaZxVzwYbnHgYLvwos3Zp53ZiG4PwpGT4MYqivNw>
    <xmx:eQNAaaC3VAt4UzTPU07MhuO5ROu0pzHvCpCt7duOrkhUf4wWm3MMmQ>
    <xmx:eQNAaWAZLX11Pzg7ZXvxK5k8Hr8eIbO0IP6PZwTpm3ItjnaNeetsxQ>
    <xmx:egNAaSyWbIds00DAh8SM_2fXjjMSQyoTsqZLgNEu6T7XHHXgai1Pv8oI>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4FEEE2CE0072; Mon, 15 Dec 2025 07:47:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 15 Dec 2025 20:47:33 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Hauke Mehrtens" <hauke@hauke-m.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Message-Id: <c892961b-ee77-4cae-8249-e4797c3ccb5e@app.fastmail.com>
In-Reply-To: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 15 Dec 2025, at 9:11 AM, Hauke Mehrtens wrote:
> Hi,
>
> Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x SoC) 
> any more.
>
> When I revert these two patches the system boots up again:

Seems to be another unification issue.

4KEc should have very small number of TLB entries, so unlikely to be sorting
space allocation issue...

>
> MIPS: mm: Prevent a TLB shutdown on initial uniquification
> commit 9f048fa upstream.
> https://github.com/gregkh/linux/commit/135713cd0751bf296e515f5fdec234320f73bbd8
>
> MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
> commit 841ecc9 upstream.
> https://github.com/gregkh/linux/commit/231ac951fabae2aaed8b2c00b4a097107be49c8c
>
> Someone reported the same for kernel 6.12.61, see:
> https://github.com/openwrt/openwrt/pull/21065#issuecomment-3622531763
>
> This was seen in OpenWrt, we have some additional patches on top of the 
> Linux kernel.
>
> The bootup hangs here:
> ```
> U-Boot Version: 2.0.0.59413 (Jul 08 2015 - 09:57:29)
>
> CPU:   500MHz
> DRAM:  128 MB
> FLASH: 16 MB
> Model: ZyXEL_GS1900_8
> SN:    S203C15000307
> MAC:   98:0D:67:06:9A:40 - 98:0D:67:06:9A:48
>
> Press SPACE to abort boot script:  0
> ## Booting image from partition ... 0
>     Version:   MIPS OpenWrt Linux-6.6.119
>     Created:   2025-12-14  21:51:17 UTC
>     Size:      3788916 Bytes = 3.6 MB
>     Verifying Checksum ... OK
>     Uncompressing Image ... OK
>
> Starting ...
>
> [    0.000000] Linux version 6.6.119 (hauke@hauke-p14s) 
> (mips-openwrt-linux-musl-gcc (OpenWrt GCC 13.3.0 r28784-155eea44e7) 
> 13.3.0, GNU ld (GNU Binutils) 2.42) #0 Sun Dec 14 21:51:17 2025
> [    0.000000] RTL838X model is 83806800
> [    0.000000] SoC Type: RTL8380
> [    0.000000] printk: bootconsole [early0] enabled
> [    0.000000] CPU0 revision is: 00019070 (MIPS 4KEc)
> [    0.000000] MIPS: machine is Zyxel GS1900-8 v1 Switch
> [    0.000000] earlycon: ns16550a0 at MMIO 0x18002000 (options '115200n8')
> [    0.000000] printk: bootconsole [ns16550a0] enabled
> [    0.000000] Initrd not found or empty - disabling initrd
> [    0.000000] Using appended Device Tree.
> [    0.000000] Primary instruction cache 16kB, VIPT, 4-way, linesize 16 
> bytes.
> [    0.000000] Primary data cache 16kB, 2-way, VIPT, cache aliases, 
> linesize 16 bytes
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] Initmem setup node 0 [mem 
> 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Kernel command line: earlycon
> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 
> bytes, linear)
>
> ```
>
> Hauke

-- 
- Jiaxun

