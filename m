Return-Path: <linux-mips+bounces-5207-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE3963F24
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7B74B217C2
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB26F18EFC0;
	Thu, 29 Aug 2024 08:52:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20CE18E776
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921548; cv=none; b=dcnsCgTm//i8F7FYskVN7CCGDHam+L0b5vzIlMiI+1nO/hsjr6Xy/Fq3+d5FLJRtdVeKH30tDJ3U9+tdlk94s5IsiqmtHYaZKrdPh+p6m3nyYEHKR4bZ7B1EiH7mddtVHZiI+y/1IkeZ7ii1fWlTeAZonEpcV0NUbjGrEYkjKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921548; c=relaxed/simple;
	bh=hxRskHPhL5ptF1z/i5dh8d6LQpFJlYPNoqWU5kn8lmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnvMD6wxMKodg9pnD1W9H7bcoMrp5EBZnVtC/LqfDhymQe0xZgVIWub9L2VAqSj0ID5jI1LTYIenQiLDirg1oiKi98y026xMR46USC1yLHfXd/HtCWfYqgalXHuN4DXbMerMHh9yRMjh11iEf59NZTSIrH37aoKTgrSpdTLDG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005mz-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 818EBC08E0; Thu, 29 Aug 2024 10:46:58 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:46:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: rdunlap@infradead.org, bhelgaas@google.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Remove unused function
 dump_au1000_dma_channel() in dma.c
Message-ID: <ZtA1glA6En/ksWim@alpha.franken.de>
References: <20240814103553.2053235-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814103553.2053235-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:35:53PM +0800, Gaosheng Cui wrote:
> The dump_au1000_dma_channel() has not been used since
> commit d56b9b9c464a ("[PATCH] The scheduled removal of some OSS
> drivers"), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/alchemy/common/dma.c                | 23 -------------------
>  .../mips/include/asm/mach-au1x00/au1000_dma.h |  1 -
>  2 files changed, 24 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

