Return-Path: <linux-mips+bounces-12357-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B404CC8B8C6
	for <lists+linux-mips@lfdr.de>; Wed, 26 Nov 2025 20:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1EE2B351A98
	for <lists+linux-mips@lfdr.de>; Wed, 26 Nov 2025 19:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1658C33C1A5;
	Wed, 26 Nov 2025 19:18:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C8E33AD99;
	Wed, 26 Nov 2025 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184732; cv=none; b=BYShMLwedUYBQR81x7ZIww3A5pBCzKpz0U35wbNdrCIKZljYFC4zU5qw2s4v5sDanIXeMuuI5XUNG2DLrOwoQHR0OGV6/xtcZ5U0cXnklquMU6irSIt5NDk/GGJgKmvtDxs+y3F2Hl2TNfmb7qI7wdGGRLO/SFzYWH73RksePGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184732; c=relaxed/simple;
	bh=z2byGiT15pwyoP743yd52BV86OFISN2akGiaj+tCHD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaPOoaHrN0EVNtWsEcWUUvunmB21JpPaRlJ5fj3cl4JfuTCtrWzVRYxYaMpzfTD1kfZp51T3whCNN6DTIj6/jZ33iGDX5lb5wdDouXqVZOGIGB6VIvcGZbnPO1DIobN3kDobyWGuhtTdCnNqcWhP65bqySCqi6g1zqF5IGEQnF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vOL2F-0001bH-00; Wed, 26 Nov 2025 20:18:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 59984C0256; Wed, 26 Nov 2025 20:18:30 +0100 (CET)
Date: Wed, 26 Nov 2025 20:18:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
Message-ID: <aSdShmTVEmmGQ5v1@alpha.franken.de>
References: <20251125213942.125599-1-tsbogend@alpha.franken.de>
 <alpine.DEB.2.21.2511261847410.36486@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511261847410.36486@angie.orcam.me.uk>

On Wed, Nov 26, 2025 at 06:52:07PM +0000, Maciej W. Rozycki wrote:
> On Tue, 25 Nov 2025, Thomas Bogendoerfer wrote:
> 
> > Latest MIPS cores could have much more than 64 TLB entries, therefore
> > allocate array for unification instead of placing a too small array
> > on stack.
> 
>  Hmm, I get:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 0 at arch/mips/mm/tlb-r4k.c:540 tlb_init+0x2a0/0x4bc
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.0-rc1-dirty #60 NONE
> Hardware name: mti,malta
> Stack : 00000000 00000004 00000000 0000001d 809d1d2c 00000000 00000100 80944048
>         809d91bc 80944048 80a16a73 00000000 80b634a4 00000001 809d1ce0 809f7bc8
>         00000000 00000000 80944048 0000001f 00000001 809d1c14 00000000 653a206d
>         00000000 80b656d4 80b6570b 00000000 00000000 00000000 80944048 00000000
>         00000000 0000021c 80a40000 00000000 00000000 00000020 00000000 800472a4
>         ...
> Call Trace:
> [<80112bd8>] show_stack+0x28/0xf0
> [<8010a69c>] dump_stack_lvl+0x48/0x7c
> [<8012fedc>] __warn+0x9c/0x118
> [<801015e8>] warn_slowpath_fmt+0x58/0xa4
> [<8012ba84>] tlb_init+0x2a0/0x4bc
> [<80114738>] per_cpu_trap_init+0x17c/0x27c
> [<80a1d0f8>] trap_init+0xf0/0x794
> [<80a19ae4>] start_kernel+0x3c4/0x598
> 
> ---[ end trace 0000000000000000 ]---
> 
> exactly here:
> 
> > +	tlb_vpns = kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
> > +	if (WARN_ON(!tlb_vpns))
> > +		return; /* Pray local_flush_tlb_all() is good enough. */
> 
> I'll try to find out more, but right now this doesn't appear to work.

kmalloc() doesn't work at that point :-( It only fixed the problem, because
we skip unification... d'oh

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

