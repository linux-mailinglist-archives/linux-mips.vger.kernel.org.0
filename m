Return-Path: <linux-mips+bounces-12444-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1ACB431C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 23:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57FDC30221BF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 22:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7B22DA75A;
	Wed, 10 Dec 2025 22:58:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFDC285418;
	Wed, 10 Dec 2025 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765407536; cv=none; b=i8ghllox2u0ztKQpTsf+abnv8NLlRke9Qu9NdahyvCcNpT7MRQ3Poj9rsWtMNzHBm5Rh/pqrSyiKIDJSf2UiTa54Ru8ALlMukdhp4dHVJO/wHjdd8UIZ90wohJDcyQf3azEsL/+k3FTVwLsEB+c90y1XM605ryNjd1KB/yjslU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765407536; c=relaxed/simple;
	bh=04Fal+ekf7gKvmA7qnI2XLZFWu3ykoNHwR0jG48lY4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT1KA0Hf8bG06kUOHCfUq+TErgLDbBHnASPAVvDUWZ+6+w5CNVb+FZb6KZbPm93dpyI+Se+Vhgix7e9ALim0qYWU0awKDK7Bb8EklcM9bF+DUagHUntgAVkLMEngstCV0l6PbTEmHu2byNzwtJDw9GWUG7RBI0w1r4+K3Psh1XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vTT8z-0007V5-00; Wed, 10 Dec 2025 23:58:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 64BEDC0256; Wed, 10 Dec 2025 23:58:39 +0100 (CET)
Date: Wed, 10 Dec 2025 23:58:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: Remove bogus static/inline specifiers
Message-ID: <aTn7H3Ottl22e6Xi@alpha.franken.de>
References: <20251029150316.2522555-1-thierry.reding@gmail.com>
 <c4212b4d-4728-4e01-b12f-43c1dc85436d@gmail.com>
 <aTmiHFTh89QER5vG@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTmiHFTh89QER5vG@alpha.franken.de>

On Wed, Dec 10, 2025 at 05:38:52PM +0100, Thomas Bogendoerfer wrote:
> On Mon, Dec 08, 2025 at 10:16:29AM -0800, Florian Fainelli wrote:
> > On 10/29/25 08:03, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > The recent io_remap_pfn_range() rework applied the static and inline
> > > specifiers to the implementation of io_remap_pfn_range_pfn() on MIPS
> > > Alchemy, mirroring the same change on other platforms. However, this
> > > function is defined in a source file and that definition causes a
> > > conflict with its declaration. Fix this by dropping the specifiers.
> > > 
> > > Fixes: 8efb51ad1b05 ("mm: abstract io_remap_pfn_range() based on PFN")
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > 
> > Tested-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> > 
> > Thanks!
> > 
> > Thomas, can you pick this up so we have working alchemy builds again?
> 
> well, I've acked the patch for inclusion in the tree where the broken
> commit was applied, but I could take it.

but this has to wait until -rc1, since the breaking commit is not
in my mips-next branch, yet (and mergign current upstream is not
an option there).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

