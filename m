Return-Path: <linux-mips+bounces-7561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D338FA1750C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2025 00:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05BB3A06FD
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 23:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9B41E47C4;
	Mon, 20 Jan 2025 23:36:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13361155A52;
	Mon, 20 Jan 2025 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416181; cv=none; b=AVHb7mqhFm/WgozO38o1T895hpfUgEPCL3vPcvbu4l5qQ/x95hABLNC4r0mZ7I0G6h/CZHEZzjuyw/pzCmVSka+du7HLgoWzjqr4eWPFONlqXH3x74ggry5CExqXAKk/Jzs8VmH95bFyNvzFO3JJ2LDOvVLOV1/V8URYCe+2/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416181; c=relaxed/simple;
	bh=Vh6vt8JqtKH+T0gvo2bfIDrRVBaugQjXkHlYCH6XpRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLezJ/zyNM7xRYRFlnFkdDgVUL7WusbUFucKK2xhEX7XoYePDHkry0MVXD0GY8oBA67WR+EXfLCigqyLOIDkrBs0UApKMfKYSo+Sgfjo1fiUsBw57n4AgwN0sT1hh1MFPq2VOzW2IbG96p1WkRPirF62tQFSTemgK7CTRoFvy38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ta18z-0006Eo-00; Tue, 21 Jan 2025 00:25:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DDCAFC013E; Mon, 20 Jan 2025 20:41:05 +0100 (CET)
Date: Mon, 20 Jan 2025 20:41:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Message-ID: <Z46m0T_cNdpCfkCf@alpha.franken.de>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>

On Tue, Jan 14, 2025 at 06:11:58PM +0000, Jiaxun Yang wrote:
> pci-legacy systems are not using logic_pio to managed PIO
> allocations, thus the generic pci_address_to_pio won't work
> when PCI_IOBASE is defined.
> 
> Override the function to use architecture implementation to
> fix the problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4bfb53e7d317 ("mips: add <asm-generic/io.h> including")
> Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Closes: https://lore.kernel.org/r/99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> This is a quick fix for fixes tree and stable backporting.
> In long term, we should get logic_pio accept fixed mapping,
> and make PCI core code aware of platforms not using vmap
> for PCI_IOBASE.
> ---
>  arch/mips/pci/pci-legacy.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

