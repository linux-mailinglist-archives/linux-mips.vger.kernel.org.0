Return-Path: <linux-mips+bounces-7453-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 656BEA11CA1
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 09:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0924D3A7660
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44400236EBC;
	Wed, 15 Jan 2025 08:57:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD0C236EB2;
	Wed, 15 Jan 2025 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931476; cv=none; b=oeByapNYEkc0qNyGrpJbj/iIrE7tCXrd128yU/rZIXyd9o8Cgonkd68LsgrgyXP/gTlAe3Pa+BMOxJNklCG/QqM9FNZ8kpI0jpYR9MPQWueDESGbpzQ28NJERTrQI5IiI4QNoOyXn4JybzBgCcwlVtz1zZ4O/BvtNr7w4UM+KTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931476; c=relaxed/simple;
	bh=653wa/HyhnnwwgSe8O7BkvvGBPx+Amgkd8U34lyFl7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nW61ve/LWrc8R6z0MQuYg8L5ogeVQj0815epqwauhBHYrl+2jslX7q7ei3nMA0kmT1OR43mJzq/qGXOcDAyObnZ4yb95MmOmOvXN4G+P4uxmqVZjwGgu7UwZ/tAxNSAfcHEk07sHwH2u1y65VMuBNggc2L4qRFCEYFzmRx+xPkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D97B992009C; Wed, 15 Jan 2025 09:57:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D245F92009B;
	Wed, 15 Jan 2025 08:57:51 +0000 (GMT)
Date: Wed, 15 Jan 2025 08:57:51 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@arndb.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Baoquan He <bhe@redhat.com>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>, 
    =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
In-Reply-To: <23f46c23-a58e-4a85-8733-480b5ebf993b@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2501150743450.50458@angie.orcam.me.uk>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com> <5ef27e01-2c5a-400a-be32-d3bcdeea6d26@app.fastmail.com> <fb3aa671-45bc-4d57-b90b-2056eeed0ea6@app.fastmail.com> <23f46c23-a58e-4a85-8733-480b5ebf993b@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Arnd Bergmann wrote:

> On Malta, I see a very strange
> 
>         isa {
>                 compatible = "isa";
>                 ranges = <1 0 0 0x1000>;
>         };
> 
> which maps the first 4096 port numbers into cpu_addr=0x0. The
> actual port window appears to be at a board specific location
> 
> #define MALTA_GT_PORT_BASE      get_gt_port_base(GT_PCI0IOLD_OFS)
> #define MALTA_BONITO_PORT_BASE  ((unsigned long)ioremap (0x1fd00000, 0x10000))
> #define MALTA_MSC_PORT_BASE     get_msc_port_base(MSC01_PCI_SC2PIOBASL)

 The system controller (PCI host bridge) is on the CPU core card along 
with the CPU and DRAM, so you get what you plug into the Malta baseboard, 
which is where the rest of the system resides connected via PCI and CBUS 
(which is a platform I/O bus wiring boot Flash, an auxiliary debug UART, 
also usable by Linux, and a bunch of simple peripherals needed for board 
setup and diagnostic output before PCI can be accessed, all on the Malta 
baseboard).

> So e.g. on Bonito, the ranges property would have to be
> 
>       ranges = <1 0 0x1fd00000 0x1000>;
> 
> Not sure if this is patched in by the bootloader, or where the
> corresponding window for PCI gets defined, but I suspect that
> the reason for the regression is that the caller of
> pci_address_to_pio() accidentally passed in '0' instead of
> the physical address, and it happened to work because of the
> missing PCI_IOBASE definition but broke after that got defined.

 The windows are retrieved from hardware; cf. arch/mips/pci/pci-malta.c.

  Maciej

