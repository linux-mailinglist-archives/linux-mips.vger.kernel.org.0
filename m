Return-Path: <linux-mips+bounces-14755-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPoUNJlEFWprUAcAu9opvQ
	(envelope-from <linux-mips+bounces-14755-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 08:58:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 662695D1682
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 08:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBBC2300B45E
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 06:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EABB3C4141;
	Tue, 26 May 2026 06:58:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA53C37AC;
	Tue, 26 May 2026 06:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779778710; cv=none; b=povY4FWFDZdeudHq2C14lSIVZ9atHGTeG+arnAr+9+M/xBWQ/1PuoImC0m+8m7DMWTYaQvqE7Dilme2MkCXj6hOcZ4LCx/Dnxm8OYdmV34Zdd0gpHYK7qHewMgIqCrqC+zxqxyYmK0fCZy8r+NAbn2/g4habCW+iFzOO9vss7J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779778710; c=relaxed/simple;
	bh=w9ssTeV5INL6yuWiuciqjEqwrEPnS2I8FkOUS4ElljA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSg5CWsFDUS2HNWuI+26KfYZM2mw5e27vU9yBwZx8Bvu6Nn19BYzikiMQhm26j6Yp8HfjzcolQbo0EPcOgbseLGFFVuFM/fcLXzyCrwstaTe1Br0eYt4PVUv5wC68DtlBp4wYQbhxHxXDxp0pLyuwzKDP/M4DlAV2e+9VSfcpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRlk0-0002GS-00; Tue, 26 May 2026 08:58:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3953CC0154; Tue, 26 May 2026 08:57:39 +0200 (CEST)
Date: Tue, 26 May 2026 08:57:39 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yadan Fan <ydfan@suse.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org,
	rppt@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com,
	paulburton@kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: MIPS: mm: Fix out-of-bounds write in maar_res_walk()
Message-ID: <ahVEYycsosURdepH@alpha.franken.de>
References: <d060de27-6fdb-452b-95f3-dbcc48db17ff@suse.com>
 <sa4yfm5wnkrzhyviympfo4oenfqytvu7lrtrcbzt3fb5x3jf6v@oolrew3tlyxg>
 <983654c3-98a5-46bc-8e8c-e0e780c7dc61@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983654c3-98a5-46bc-8e8c-e0e780c7dc61@suse.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DMARC_NA(0.00)[franken.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14755-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 662695D1682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 08:51:25AM +0800, Yadan Fan wrote:
> Hi Liam,
> 
> On 5/25/26 22:15, Liam R. Howlett wrote:
> > On 26/05/25 07:06PM, Yadan Fan wrote:
> >> maar_res_walk() uses wi->num_cfg as the index into the fixed-size
> >> wi->cfg array, but checks whether the array is full only after it has
> >> filled the selected entry. If walk_system_ram_range() reports more than
> >> 16 memory ranges, the overflow call writes one struct maar_config past
> >> the end of the array before WARN_ON() prevents num_cfg from advancing.
> >>
> >> Move the full-array check before taking the array slot. Keep the
> >> existing behavior of warning and returning 0 when the scratch array has
> >> no room left.
> >>
> >> Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")
> >> Signed-off-by: Yadan Fan <ydfan@suse.com>
> >> ---
> >>  arch/mips/mm/init.c | 12 ++++++++----
> >>  1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> >> index 55b25e85122a..0ba958b7ffa5 100644
> >> --- a/arch/mips/mm/init.c
> >> +++ b/arch/mips/mm/init.c
> >> @@ -272,9 +272,15 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
> >>  			 void *data)
> >>  {
> >>  	struct maar_walk_info *wi = data;
> >> -	struct maar_config *cfg = &wi->cfg[wi->num_cfg];
> >> +	struct maar_config *cfg;
> >>  	unsigned int maar_align;
> >>  
> >> +	/* Ensure we don't overflow the cfg array */
> >> +	if (WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
> >> +		return 0;
> > 
> > We should probably change this to WARN_ON_ONCE() if we're moving it?
> 
> Yes, it should be WARN_ON_ONCE() to avoid repeated warnings later once wi->num_cfg reached ARRAY_SIZE(wi->cfg),
> I will change it in patch V2.

no need for that, just return -1 in the error case, this will terminate
the walk

> > 
> >> +
> >> +	cfg = &wi->cfg[wi->num_cfg];
> >> +
> >>  	/* MAAR registers hold physical addresses right shifted by 4 bits */
> >>  	maar_align = BIT(MIPS_MAAR_ADDR_SHIFT + 4);
> >>  
> >> @@ -283,9 +289,7 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
> >>  	cfg->upper = ALIGN_DOWN(PFN_PHYS(start_pfn + nr_pages), maar_align) - 1;
> >>  	cfg->attrs = MIPS_MAAR_S;
> >>  
> >> -	/* Ensure we don't overflow the cfg array */
> >> -	if (!WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
> >> -		wi->num_cfg++;
> >> +	wi->num_cfg++;
> > 
> > AFAICT, this is the only place num_cfg is incremented.  Since we are
> > trying to avoid overflow, I think the initial logic is flawed in that we
> > do trigger too late - we can write one beyond the array index max (to
> > the array size).
> > 
> > But what you have done changes the functionality in a subtle way - we
> > won't keep overwriting the last entry (as, I think was the initial
> > intent here?)
> 
> Yes.

no it wasn't. Before the switch to maas_res_walk the to be filled array
was exactly the needed size. Now we don't know how many entries there
are, but the limiting point is the numer of configured maar entries,
which might be even less than the 16 entries of the array. So we have
to deal with this problem anyway.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

