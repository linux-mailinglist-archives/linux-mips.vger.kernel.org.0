Return-Path: <linux-mips+bounces-5202-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A05963F22
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DE4FB23D61
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6A618CC1B;
	Thu, 29 Aug 2024 08:52:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4878918CC1F
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921548; cv=none; b=iWntasJQdCcP2ZawKsmNImChtMFixztPzP4MWzXQAFvuJkHDP8lp7hzNIhRNLOQ1ZnGeCDG8GIaAHl3gQFz02LzwMRYQzS2Kw8Q9TCp2bI/4XKCGBiqaMY7PgjK/BckW0fpgaZfv2uQQoKEQ9Yt+xKWkQuuBpMsSQ/wGlalr/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921548; c=relaxed/simple;
	bh=lJLWVVvabgJxcGvh2NhLxi8naO/JsmOqs9r9eDvw2AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0HJcliKsDh4RdepLRWo/G+6al5pHjWXR87V4BlzxNIoePZjVjTuJAyzejvPWvI1vBVBuzkKdl2Hj49Wss3tgvVjEEq0FlnaVErj9wW0CCOb3vn3bRzFsivUDmjqy6UbrkNZ8fBvf8lLd/KYek7KC1UVGkDpGAtVb0jkOvMIRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005n3-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B6BD6C0B0A; Thu, 29 Aug 2024 10:47:33 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:47:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: ricardo@marliere.net, arnd@arndb.de, akpm@linux-foundation.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: MT: Remove unused function mips_mt_regdump()
Message-ID: <ZtA1pYXOPB5S3H2r@alpha.franken.de>
References: <20240814103933.2053611-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814103933.2053611-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:39:33PM +0800, Gaosheng Cui wrote:
> The mips_mt_regdump() has not been used since
> commit b633648c5ad3 ("MIPS: MT: Remove SMTC support"), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/include/asm/mips_mt.h |  2 -
>  arch/mips/kernel/mips-mt.c      | 77 ---------------------------------
>  2 files changed, 79 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

