Return-Path: <linux-mips+bounces-12464-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02534CBE4F3
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 15:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66FBF3005F01
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 14:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACAC29E0F6;
	Mon, 15 Dec 2025 14:26:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8432D77E5
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808766; cv=none; b=iAC+tTrVqIOo1M37jEQ9IcdBth78HOUNBu4g3mlqgScSm8MfmQuNZBfAqNmzmkQmvNWP46jnmSMrJ2aR4iehWZOkK2WXN5FQLQZcrxQflrqgA6hds75JkhAJ1yOD0m40zX7xso9fRu4KgjIc8y9hAfxenzyM8LQLqhxS+sF+BUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808766; c=relaxed/simple;
	bh=eRDUo7gBXv29C1bdpd469PHu6VRdUy/NDBVZwDcMhBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvbOBf1C+Dxzs/NuwobW9N8oo06a3Xq7tNmGsQqvsuwcds+nNtOzp2zTtnnrXmVHT6iMCtDT3ImTvN9fmiItq5FEsszOUtIKY5uJqfpsr+jrjiHssx7vuMtX0LUgwlXoSnp+z5z6FMFEle0sGHDTXLAYA6DtmRx9mdPKZoFPFyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vV9WK-0006Oj-00; Mon, 15 Dec 2025 15:25:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6FE94C0256; Mon, 15 Dec 2025 15:25:42 +0100 (CET)
Date: Mon, 15 Dec 2025 15:25:42 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mips@vger.kernel.org, macro@orcam.me.uk
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
Message-ID: <aUAaZvQfawmqNN0T@alpha.franken.de>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>

On Mon, Dec 15, 2025 at 02:11:39AM +0100, Hauke Mehrtens wrote:
> Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x SoC) any
> more.
> 
> When I revert these two patches the system boots up again:
> 
> MIPS: mm: Prevent a TLB shutdown on initial uniquification
> commit 9f048fa upstream.
> https://github.com/gregkh/linux/commit/135713cd0751bf296e515f5fdec234320f73bbd8
> 
> MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
> commit 841ecc9 upstream.
> https://github.com/gregkh/linux/commit/231ac951fabae2aaed8b2c00b4a097107be49c8c

do you need to revert both patches or is t enough to revert the second one ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

