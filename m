Return-Path: <linux-mips+bounces-12358-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0252C8BE67
	for <lists+linux-mips@lfdr.de>; Wed, 26 Nov 2025 21:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3EBDD357531
	for <lists+linux-mips@lfdr.de>; Wed, 26 Nov 2025 20:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CDE340DB0;
	Wed, 26 Nov 2025 20:45:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CB5341051;
	Wed, 26 Nov 2025 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764189920; cv=none; b=eMP1VxeS53RSZqgStLTrkLw+LVgq9sfWMjc9P/DEaHtXVP/cxMrT+u6dtpXbs8jAWga55kzRPq020u8lRszBNVqla8U+jl9roeYcXr4bKZFfDstlHgu0gQuSQicQ5m/rqD6hfZho7cQT841lL2fWC8mda6KimTnzipmcboKDwTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764189920; c=relaxed/simple;
	bh=QCVg/2gIxJSACNZyeiPCc4TpLtqaDNFf+wk6RkvV4gk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kiOIOzBxI4TGwoh6/e5OVzTEFwhJ46cU6qzNIyfb4faVUBOHVForo/H2NOT/p8wK8K7BARqKSOjY3wAvNkwmmwEr4ixRaXSlLI1/GeIuBZyrfAihI8GEVMPBsXM3a9JKK1wTOC7+Idg/YPU2wG4ANSvu3Sf7hOuf3+DYQlyZpGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 810A392009C; Wed, 26 Nov 2025 21:45:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7B5A092009B;
	Wed, 26 Nov 2025 20:45:15 +0000 (GMT)
Date: Wed, 26 Nov 2025 20:45:15 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
In-Reply-To: <aSdShmTVEmmGQ5v1@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511262043590.36486@angie.orcam.me.uk>
References: <20251125213942.125599-1-tsbogend@alpha.franken.de> <alpine.DEB.2.21.2511261847410.36486@angie.orcam.me.uk> <aSdShmTVEmmGQ5v1@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Nov 2025, Thomas Bogendoerfer wrote:

> > > Latest MIPS cores could have much more than 64 TLB entries, therefore
> > > allocate array for unification instead of placing a too small array
> > > on stack.
> > 
> >  Hmm, I get:
> > 
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 0 at arch/mips/mm/tlb-r4k.c:540 tlb_init+0x2a0/0x4bc
> > Modules linked in:
> > CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.0-rc1-dirty #60 NONE
> > Hardware name: mti,malta
> > Stack : 00000000 00000004 00000000 0000001d 809d1d2c 00000000 00000100 80944048
> >         809d91bc 80944048 80a16a73 00000000 80b634a4 00000001 809d1ce0 809f7bc8
> >         00000000 00000000 80944048 0000001f 00000001 809d1c14 00000000 653a206d
> >         00000000 80b656d4 80b6570b 00000000 00000000 00000000 80944048 00000000
> >         00000000 0000021c 80a40000 00000000 00000000 00000020 00000000 800472a4
> >         ...
> > Call Trace:
> > [<80112bd8>] show_stack+0x28/0xf0
> > [<8010a69c>] dump_stack_lvl+0x48/0x7c
> > [<8012fedc>] __warn+0x9c/0x118
> > [<801015e8>] warn_slowpath_fmt+0x58/0xa4
> > [<8012ba84>] tlb_init+0x2a0/0x4bc
> > [<80114738>] per_cpu_trap_init+0x17c/0x27c
> > [<80a1d0f8>] trap_init+0xf0/0x794
> > [<80a19ae4>] start_kernel+0x3c4/0x598
> > 
> > ---[ end trace 0000000000000000 ]---
> > 
> > exactly here:
> > 
> > > +	tlb_vpns = kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
> > > +	if (WARN_ON(!tlb_vpns))
> > > +		return; /* Pray local_flush_tlb_all() is good enough. */
> > 
> > I'll try to find out more, but right now this doesn't appear to work.
> 
> kmalloc() doesn't work at that point :-( It only fixed the problem, because
> we skip unification... d'oh

 Correct, I have a fix in the works.

  Maciej

