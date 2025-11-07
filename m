Return-Path: <linux-mips+bounces-12117-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4CC3FD9A
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 13:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3DF73B8660
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 12:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC118326D67;
	Fri,  7 Nov 2025 12:09:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B432DEA8C;
	Fri,  7 Nov 2025 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762517391; cv=none; b=PHIdNBRcX7hKQVGNoQ5J5hLj744Pg8Nefjk/UX2PNN4AteG+KvaOyPaLm/sdrGOSW02XQUXo2VQanPpuKmD/Czx+QVDFcZwHR0HtmDYQx5eBVOBxDS9ulTLLMzeytFmNmJ8PdSFgKDvBMoMntuG9qY00P/Z6IVhxWde92FNLqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762517391; c=relaxed/simple;
	bh=W9Vw4MElQEsERdOwAA/rd42FELbDVPjO17UnQE4CmyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5MhNvI5sQzb9h9GZ7mpkOFVxRUob33Sifye1zfGrNY8EtJFnTSeNErnU01DWyruaZqBn1ekLOd2xnhKfyq60mJgnaIWOBpCtvT6VuUu6+k6T3tQ6fJ5Y+A6Eei1H4/o5MU/C9In+zpvCCn/mIDIwbptbI3gP748V+EU4i9mXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vHLHm-000763-00; Fri, 07 Nov 2025 13:09:46 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BD2DCC0256; Fri,  7 Nov 2025 13:09:32 +0100 (CET)
Date: Fri, 7 Nov 2025 13:09:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: Remove bogus static/inline specifiers
Message-ID: <aQ3hfHOTCPb6gxyF@alpha.franken.de>
References: <20251029150316.2522555-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029150316.2522555-1-thierry.reding@gmail.com>

On Wed, Oct 29, 2025 at 04:03:16PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The recent io_remap_pfn_range() rework applied the static and inline
> specifiers to the implementation of io_remap_pfn_range_pfn() on MIPS
> Alchemy, mirroring the same change on other platforms. However, this
> function is defined in a source file and that definition causes a
> conflict with its declaration. Fix this by dropping the specifiers.
> 
> Fixes: 8efb51ad1b05 ("mm: abstract io_remap_pfn_range() based on PFN")

I guess this patch should be applied to the tree, where this commit
is in.

> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

