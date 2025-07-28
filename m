Return-Path: <linux-mips+bounces-9928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA6B13605
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jul 2025 10:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 069D11898977
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jul 2025 08:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEB8224225;
	Mon, 28 Jul 2025 08:05:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06F621C9E1
	for <linux-mips@vger.kernel.org>; Mon, 28 Jul 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753689944; cv=none; b=Wib/3jr4OSQPNsY8pqzNL6qtGuNpXQLSea+Ov/JXQWAYcq8fXCpyLZ4si0iKr1lu83q3iV2Hiy0vn4CBOIK+g31UKfkISjvCWpNxFp2Fe2CUA6fBGazmiIja1GgGaoZltuZKKId+dUOh8194WiqzKlCBajT5rpPavyGdLgZS5ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753689944; c=relaxed/simple;
	bh=r5pNTU0ZBNQC6BD4BpEkUQGgvQV4ApyxObsIs4Teh7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U64q9RaMgjcWuh0IpylaRFRkjvSHzzZV3rHDLN80fVhIQg9BROIlR5fAhrvEaJntsKDUDIi19c8XS1vtCz7HiqKcRtrgHrp+jXDP6j1tPL4xg5NHtCGnG4MfelkJCjXZ5GN/i9tZ5c8RpqZTmdS80/YxMpJz3OR18pw5FZvBUgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ugIrZ-0003qT-00; Mon, 28 Jul 2025 10:05:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D66B4C075D; Mon, 28 Jul 2025 10:05:14 +0200 (CEST)
Date: Mon, 28 Jul 2025 10:05:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Joshua Kinard <linux@kumba.dev>
Cc: linux-mips@vger.kernel.org, Joshua Kinard <kumba@gentoo.org>
Subject: Re: [PATCH] MIPS: Update Joshua Kinard's e-mail address
Message-ID: <aIcvOlSQglDlhkQ8@alpha.franken.de>
References: <20250721165715.20478-1-kumba@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721165715.20478-1-kumba@gentoo.org>

On Mon, Jul 21, 2025 at 12:57:15PM -0400, Joshua Kinard wrote:
> I am switching my address to a personal domain, so some files in the
> SGI IP30 and IOC3 files need to be updated.  I will send updates for
> the MAINTAINERS file and rtc-ds1685 separately to linux-rtc.
> 
> Signed-off-by: Joshua Kinard <kumba@gentoo.org>
> ---
>  arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h | 2 +-
>  arch/mips/include/asm/mach-ip30/spaces.h                | 2 +-
>  arch/mips/include/asm/sgi/heart.h                       | 2 +-
>  arch/mips/sgi-ip30/ip30-power.c                         | 2 +-
>  arch/mips/sgi-ip30/ip30-setup.c                         | 2 +-
>  arch/mips/sgi-ip30/ip30-smp.c                           | 2 +-
>  arch/mips/sgi-ip30/ip30-timer.c                         | 2 +-
>  arch/mips/sgi-ip30/ip30-xtalk.c                         | 2 +-
>  drivers/mfd/ioc3.c                                      | 2 +-
>  drivers/tty/serial/8250/8250_ioc3.c                     | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)

applied to mips-next.

Thomas.
 
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

