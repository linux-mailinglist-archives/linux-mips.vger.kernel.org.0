Return-Path: <linux-mips+bounces-8286-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34BA6C3FD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E27D3BB029
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9EA22FF58;
	Fri, 21 Mar 2025 20:11:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE301EEA3C;
	Fri, 21 Mar 2025 20:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587906; cv=none; b=upYVmZKR6CvuSEWFXZcxg0PJ62Nf+eFfi/09M0XvY78ZwePSHKu9zkfr0UwA+OmcBXqOlGwVrH5iqVz/XJg5ZxBLxEI1qUUl7D9fQ/tBLD0X6bEjPvAoIhTjx5KCu9Cu34c0aJGr8xelLQSz+HRUcfy1YCtvrgQteJXDvamCChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587906; c=relaxed/simple;
	bh=vYgLZ84zwir5f9ywsYx/IUptJnaAwfPRnNZz617rS4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=enHxNtRvMA1Kra9bhhO3EvCwlLMVdfdGyACZuzu38+wZLP5w7HJhNyPuc9+7GA4BpiMUH2D5D10KfvuTmOh+DR46pX/Cg7a1QHvgI0BFMxEixSBVqlC4V9PdeXPUtZfhtvZoHZKPtVL2CmM7x7WNDIJTQDS1qG8G6IPTJuBLW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9E8E392009D; Fri, 21 Mar 2025 21:11:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 99F7392009B;
	Fri, 21 Mar 2025 20:11:40 +0000 (GMT)
Date: Fri, 21 Mar 2025 20:11:40 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Marco Crivellari wrote:

> >  This instruction sequence still suffers from the coprocessor move delay
> > hazard.  How many times do I need to request to get it fixed (counting
> > three so far)?
> 
> Can I have more details about this?
> 
> I can see it is the same code present also in local_irq_enable()
> (arch_local_irq_enable()),

 Unlike `__r4k_wait' that code is not in a `.set noreorder' region and 
the assembler will therefore resolve the hazard by inserting a NOP where 
required by the architecture level requested (with `-march=...', etc.).  
Try compiling that function for a MIPS III configuration such as 
decstation_r4k_defconfig or just by hand with `-march=mips3' and see 
what machine code is produced.

> and from the manual I've seen:
> 
> "The Spacing column shown in Table 2.6 and Table 2.7 indicates the
> number of unrelated instructions (such as NOPs or SSNOPs) that,
> prior to the capabilities of Release 2, would need to be placed
> between the producer and consumer of the hazard in order to ensure
> that the effects of the first instruction are seen by the second instruction."
> 
> The "Spacing column" value is 3, indeed.
> 
> "With the hazard elimination instructions available in Release 2, the
> preferred method to eliminate hazards is to place one of the
> instructions listed in Table 2.8 between the producer and consumer of the
> hazard. Execution hazards can be removed by using the EHB [...]"

 Whatever manual you quote it refers to MIPS Release 2, which is only 
dated 2003 (following Release 1 from 2001), but `__r4k_wait' has to 
continue handling older architecture revisions going back to MIPS III 
ISA from 1991.  We also support MIPS I ISA from 1985 which has further 
instruction scheduling requirements, but `__r4k_wait' is for newer 
processors only, because older ones had no WAIT instruction, so we can 
ignore them (but note that the MIPS I load delay slot is regardless 
observed in current code in the form of a NOP inserted after LONG_L).

> What am I missing?

 This is common MIPS knowledge really, encoded in the GNU toolchain and 
especially GAS since forever.  While I can't cite a canonical reference, 
the hazard is listed e.g. in Table 13.1 "Instructions with scheduling 
implications" and Table 13.3 "R4xxx/R5000 Coprocessor 0 Hazards" from 
"IDT MIPS Microprocessor Family Software Reference Manual," Version 2.0, 
from October 1996.  I do believe the document is available online.

 I'm fairly sure the hazard is also listed there in Dominic Sweetman's 
"See MIPS Run Linux," but I don't have my copy handy right now.

 Best is to avoid using a `.set noreorder' region in the first place.  
But is it really needed here?  Does the rollback area have to be of a 
hardcoded size rather than one calculated by the assembler based on 
actual machine code produced?  It seems to me having it calculated would 
reduce complexity here and let us use the EI instruction where available 
as well.

 HTH,

  Maciej

