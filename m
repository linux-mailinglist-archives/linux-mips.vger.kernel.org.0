Return-Path: <linux-mips+bounces-12442-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2ACB3802
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 17:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E70930038F7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 16:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0793101AE;
	Wed, 10 Dec 2025 16:39:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9672E3101A9;
	Wed, 10 Dec 2025 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765384788; cv=none; b=PP1Kj0HtxPU8EADKKe/OQfNntCV11u9ERbGH+UU2VvpVAu2x/EZ00Gj0wSyCt+kElpbRwglYymV73MBtJNh9058f2il354+ZPEjOLFYEtYv2BxHgfnzCKgxqbB0O5iW/gEdPl1GEvrht/jTUp9pRpyq1zB0K3G4b5jfy8NdVEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765384788; c=relaxed/simple;
	bh=84GGURsNA13LpL4qsOf3NcPDsG7USQV4q+4Oz5VMTNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2U1voFjtKc62KuAhcGPbGSBmxCuB7Bd04QI+EtyAzwJfTBnnNKd9qnHYBrRXea+fDZS4bW+7ChWcg7ssehsuUy6QN6T6ae9BGWx7Bal42ShrgpoUjuUFZ/4vcAfX/MFPyVPZhul8Ad7JBaZ2e9XeabyNaVTHXEeWMV3EDHTnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vTNDy-0004fM-00; Wed, 10 Dec 2025 17:39:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0BC5CC0256; Wed, 10 Dec 2025 17:38:52 +0100 (CET)
Date: Wed, 10 Dec 2025 17:38:52 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: Remove bogus static/inline specifiers
Message-ID: <aTmiHFTh89QER5vG@alpha.franken.de>
References: <20251029150316.2522555-1-thierry.reding@gmail.com>
 <c4212b4d-4728-4e01-b12f-43c1dc85436d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4212b4d-4728-4e01-b12f-43c1dc85436d@gmail.com>

On Mon, Dec 08, 2025 at 10:16:29AM -0800, Florian Fainelli wrote:
> On 10/29/25 08:03, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > The recent io_remap_pfn_range() rework applied the static and inline
> > specifiers to the implementation of io_remap_pfn_range_pfn() on MIPS
> > Alchemy, mirroring the same change on other platforms. However, this
> > function is defined in a source file and that definition causes a
> > conflict with its declaration. Fix this by dropping the specifiers.
> > 
> > Fixes: 8efb51ad1b05 ("mm: abstract io_remap_pfn_range() based on PFN")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> Tested-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Thanks!
> 
> Thomas, can you pick this up so we have working alchemy builds again?

well, I've acked the patch for inclusion in the tree where the broken
commit was applied, but I could take it.

I'll correct the Fixes tag to

Fixes: c707a68f9468 ("mm: abstract io_remap_pfn_range() based on PFN")

when applying.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

