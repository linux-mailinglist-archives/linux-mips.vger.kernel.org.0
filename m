Return-Path: <linux-mips+bounces-12365-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFF9C91013
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 08:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512CD3A7BFA
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 07:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23132BE622;
	Fri, 28 Nov 2025 07:12:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE44243954;
	Fri, 28 Nov 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764313926; cv=none; b=MV6dXeePNevXXOofH5DeH35F7doFnMx1UCguzDNLvjq0N8wEl+niZo/qP02/t/5RceoIfB0gNAZFKQKhmz0gEugz+I+NVE6eRP++aKL42U9b/kOPNmZPubfTDqsJTWF0tNR/XN2zP20pvNQd9Oy8focLTGaC66MVRFrIPkpYU6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764313926; c=relaxed/simple;
	bh=rb2DjSyzHs6jvb9wPywMlMgLcHYy8IXZBYvwBVxBkJE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Uk9lgWOgGVmScPGOwUoHUu2GrsSmNyAksye3r/5P6XBLAqSJlIphjnntpI3aQsIPcD6zHfKeHgwXwLsSIqEpFVTOmkpOM/H5/3RpT7yirCbVTfjhOmQoP3J0Q150DXzkYrkfJhirV0joofSPns49uvYOTzqQts0mGEUWqWPKb3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 235B592009C; Fri, 28 Nov 2025 08:12:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1552492009B;
	Fri, 28 Nov 2025 07:12:02 +0000 (GMT)
Date: Fri, 28 Nov 2025 07:12:02 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Klara Modin <klarasmodin@gmail.com>
cc: Nick Bowler <nbowler@draconx.ca>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
In-Reply-To: <umdusxatsxf5g7x4jhwvf75w3k2265x5dbg3w5wcdxikomjnk5@ver4ackawk2v>
Message-ID: <alpine.DEB.2.21.2511280646310.36486@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk> <umdusxatsxf5g7x4jhwvf75w3k2265x5dbg3w5wcdxikomjnk5@ver4ackawk2v>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Nov 2025, Klara Modin wrote:

> > +/*
> > + * Initialise all TLB entries with unique values that do not clash with
> > + * what we have been handed over and what we'll be using ourselves.
> > + */
> >  static void r4k_tlb_uniquify(void)
> >  {
> > -	int entry = num_wired_entries();
> > +	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
> > +	int tlbsize = current_cpu_data.tlbsize;
> > +	int start = num_wired_entries();
> 
> It seems that for my Edgerouter 6P (identifies itself as "CPU0 revision
> is: 000d9602 (Cavium Octeon III)") current_cpu_data.tlbsize is larger
> than 1 << MIPS_CONF1_TLBS_SIZE (256 rather than 64) and
> num_wired_entries() returns 0 so the loop will overwrite part of the
> stack and hangs the system.

 Thank you for the report.  A fix is in review already, please try it: 
<https://lore.kernel.org/r/alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk/>.

> Although it boots if I remove the call to r4k_tlb_uniquify(), I have run
> into issues when enabling transparent hugepages and hugetlb in the past
> but not sure if that's related to this, and I still seem to be able to
> trigger that issue sometimes with this patch. Attaching the panic for
> that just in case, though.

 Unrelated.  There's an obvious clash here:

[   23.341961] Index    : 80000000
[   23.345104] PageMask : 1fe000
[   23.348073] EntryHi  : c0000000000c609b
[   23.351911] EntryLo0 : 000000000014afc7
[   23.355749] EntryLo1 : 0000000000000001
[   23.359587] Wired    : 0
[   23.362122] PageGrain: e8000000

-- so this is an attempt to create a TLB entry for a pair of 1MiB pages at 
0xc0000000000c6000 (which is already suspicious as the VPN is obviously 
not 2MiB-aligned, but the extraneous bits will be masked by hardware), and 
it collides with all these entries:

[   25.918311] Index: 193 pgmask=4kb va=c00000000005a000 asid=9b
[   25.918311] 	[ri=0 xi=0 pa=0000593d000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000593e000 c=0 d=1 v=1 g=1]
[   25.933035] Index: 194 pgmask=4kb va=c000000000072000 asid=9b
[   25.933035] 	[ri=0 xi=0 pa=00005955000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00005956000 c=0 d=1 v=1 g=1]
[   25.947760] Index: 195 pgmask=4kb va=c000000000016000 asid=9b
[   25.947760] 	[ri=0 xi=0 pa=00000000000 c=0 d=0 v=0 g=1] [ri=0 xi=0 pa=00005886000 c=0 d=1 v=1 g=1]
[   25.962483] Index: 196 pgmask=4kb va=c00000000001a000 asid=9b
[   25.962483] 	[ri=0 xi=0 pa=00005888000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00005889000 c=0 d=1 v=1 g=1]

 HTH,

  Maciej

