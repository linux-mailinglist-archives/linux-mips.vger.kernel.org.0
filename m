Return-Path: <linux-mips+bounces-12374-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF8C92B76
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 18:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85DB84E2E02
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 17:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE9A2D063E;
	Fri, 28 Nov 2025 16:56:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75DA2BE020;
	Fri, 28 Nov 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348998; cv=none; b=quzh5F8nWsH4xaV00LdP9KJkUelt335V49innqeeQhGX16C/AEBYt/Ioosx08GrATqwvo32Eqe9fgkHVCBU5lx+6zYEQbleJcIrVo9HcA+rlllD7gXrHFAgtJDHFH7x4upLWfgJlOxgCZCeoFJ1Swqy78WkpJCrPYMbB8fR1Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348998; c=relaxed/simple;
	bh=xOhieXlHgJQwU6/TAxx+O/KvUKNKOyCT8mz8sHZ1rFY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RRGSyPSYtrzpOo54yShwPErEWJnh+31PwzYmuRSD8BYRWfXhu3Firq/+dR8/iB1W1rMxHQnLcNXNo5fhWctk7JbWC+g5mb864yowSCTYxu+ckbX1DcbX+m4CbMMihad2N1QMzbOTPQuE5BW3CclTKMWTtXsSS+tm3UfQDqIVsWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 61BEC92009C; Fri, 28 Nov 2025 17:56:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5B59692009B;
	Fri, 28 Nov 2025 16:56:34 +0000 (GMT)
Date: Fri, 28 Nov 2025 16:56:34 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
In-Reply-To: <871pli5x5a.fsf@BLaptop.bootlin.com>
Message-ID: <alpine.DEB.2.21.2511281654350.36486@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk> <871pli5x5a.fsf@BLaptop.bootlin.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Nov 2025, Gregory CLEMENT wrote:

> > Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+ 
> > cores can have more than 64 TLB entries.  Therefore allocate an array 
> > for uniquification instead of placing too small an array on the stack.
> >
> > Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> > Co-developed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> > Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: stable@vger.kernel.org # v6.17+: 9f048fa48740: MIPS: mm: Prevent a TLB shutdown on initial uniquification
> > Cc: stable@vger.kernel.org # v6.17+
> 
> Thanks for this patch. It allows booting on EyQ5 and EyeQ6H. However,
> during the build process, I saw this new warning:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: r4k_tlb_configure+0x3e4 (section: .text) -> memblock_alloc_try_nid_raw (section: .init.text)

 Thank you for verification and the report.  I've now posted v5 that fixes 
the issue with `modpost', which was missed in the flood of messages.

  Maciej

