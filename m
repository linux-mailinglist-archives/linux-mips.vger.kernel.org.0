Return-Path: <linux-mips+bounces-12644-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FECE80C1
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 20:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A08A73002D3E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 19:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BE13A1E94;
	Mon, 29 Dec 2025 19:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6lFsNLy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D01510F1
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 19:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767036926; cv=none; b=PXsuNxPOve2YdkcBruCK5NhjMfyAfoCtFX2clZ9QdNfC1o7T4MOuvGCIr+u7mS2DMlXsPMBlN4hB2cffuKMUeQEhqbNiAZqKUaZa5eW76R7o9Cyda17r0ZzHjvbiVNwS+cH/INihnsq1F8RNO8I7JdC4BvR/oyZiPWN2LUohPYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767036926; c=relaxed/simple;
	bh=ta+pVxuxmmi+pZHKzWk8vMI4jIbLF80FO28qLw2fLfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVfqrk78h+nreVkxyVeqwG5fUyuAsqfChAOIQtFQbzba3TXBJ1l7iuLtQ07RaWBFSw01uaZOIRG97VdFUiGFQiWJbhcay0Weq92Je/jW35mzFDuQFjVD/t0gTBJ9Q6vPUlvFP6PSWwJMKmuFeUmsZCKv+DTGC0e0+QIHWStkjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6lFsNLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0F3C4CEF7;
	Mon, 29 Dec 2025 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767036926;
	bh=ta+pVxuxmmi+pZHKzWk8vMI4jIbLF80FO28qLw2fLfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6lFsNLyWQf0eqYfDJ43ouM6W5wTlFQhP7iRhbLrx+m8FnAWwUpcSBbVmrUatV8wN
	 4XmH698AYwaMguS721dOMST3Kq5aHAwS8QDVBZPdjB1G2mEm8mL2XCIvcgAQM+3u5T
	 kLyoa+kxXOw6JWa2odklGZC/jCz3jvDjQZCzWh/wz25C7FJgHqjvu79l0uskoi3hfe
	 JesbjpdOXM+Ifg4AQRyaHOdEIIHaOGjSNZ9B1jfucpOdDr0zcf99SXdQ7BWi6r/aQB
	 Arc0uT5sGjY4ZQtx4TjxsvWvdjuRalv/UAW65NQEkb8joAm+wLtP6RQuPij3vV+lgI
	 a6iuIH74HcQeA==
Date: Mon, 29 Dec 2025 21:35:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: markus.stockhausen@gmx.de
Cc: tglx@linutronix.de, linux-mm@kvack.org, linux-mips@vger.kernel.org,
	jelonek.jonas@gmail.com,
	'Chris Packham' <Chris.Packham@alliedtelesis.co.nz>,
	hauke@hauke-m.de
Subject: Re: HIGHMEM freeing patch breaks Realtek RTL930x builds
Message-ID: <aVLX9yLmIBPzI0MQ@kernel.org>
References: <007d01dc78f2$1ca4bf90$55ee3eb0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007d01dc78f2$1ca4bf90$55ee3eb0$@gmx.de>

On Mon, Dec 29, 2025 at 07:36:52PM +0100, markus.stockhausen@gmx.de wrote:
> Hi Mike, 
> 
> > Von: Mike Rapoport <rppt@kernel.org> 
> > Gesendet: Sonntag, 28. Dezember 2025 10:54
> > Betreff: Re: HIGHMEM freeing patch breaks Realtek RTL930x builds
> > 
> > Hi Markus,
> >
> > On Sat, Dec 20, 2025 at 09:57:40AM +0100, markus.stockhausen@gmx.de wrote:
> > > Hi,
> > > 
> > > sorry for being late on this topic but downstream OpenWrt just started
> > > kernel
> > > conversion from 6.12 to 6.18 these days. During preparation of the PR
> > > https://github.com/openwrt/openwrt/pull/21181 we noticed that Realtek 
> > > RTL930x soc based devices with more than 256MB (highmem) do not boot 
> > > any longer. 
> > > 
> > > These are MIPS 34k 32bit multithreaded SoC with layout 
> > > <0x00000000 0x10000000>, /* 256 MiB lowmem */
> > > <0x20000000 0x10000000>; /* 256 MiB highmem */
> > > 
> > > Bisecting the issue gave " arch, mm: streamline HIGHMEM freeing" 
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> > > ?h=v6.15-rc1&id=6faea3422e3b4e8de44a55aa3e6e843320da66d2
> > > as the first bad commit. This is back from the 6.15 times.
> > > 
> > > I have no real idea why removing mem_init_free_highmem() and letting
> > > __free_memory_core() work on the whole memory range gives issues.
> > > 
> > > We are aligning to upstream very slowly and are still in need of 
> > > downstream patches so here some additional info.
> > > 
> > > - Until now we never cared about FLATMEM/SPARSEMEM configs
> > > 
> > > - We are still using dedicated prom.c/setup.c for the devices
> > > https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/
> > > realtek/files-6.12/arch/mips/rtl838x;hb=HEAD
> > > 
> > > Any idea or hint is appreciated.
> >
> > Can you please send logs from a working kernel and a failing kernel with
> > "memblock=debug" added to the kernel command line?
> 
> Good hint. I've done that and collected all information in
> https://github.com/openwrt/openwrt/issues/21323

The successful boot disables highmem:
[    0.332305] Memory: 495640K/524288K available (8188K kernel code, 647K rwdata, 1504K rodata, 9620K init, 244K bss, 27528K reserved, 0K cma-reserved, 0K highmem)

And the failing boot actually enables it:
[    0.332285] Memory: 495640K/524288K available (8188K kernel code, 647K rwdata, 1504K rodata, 9620K init, 244K bss, 27528K reserved, 0K cma-reserved, 262144K highmem)

so I believe that the partial revert should help.

Anther option is to simply disable CONFIG_HIGHMEM for that platform if it
anyway can't support highmem.
 
> > Another thing I think worth checking is will the system boot with a
> partial
> > revert of 6faea3422e3b ("arch, mm: streamline HIGHMEM freeing") for mips:
> 
> Will try this out next, update the issue and inform you here.
> 
> Thank you
> 
> Markus

-- 
Sincerely yours,
Mike.

