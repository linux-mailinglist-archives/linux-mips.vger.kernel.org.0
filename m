Return-Path: <linux-mips+bounces-3588-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4B903E83
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 16:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4901C23312
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9A317D896;
	Tue, 11 Jun 2024 14:15:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A95017D36F;
	Tue, 11 Jun 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718115313; cv=none; b=ciDBoDep2vmGImz1DlCVQExSakv2Pwb1eoW5jvr8m/qeR9fCYHzV5aaw9ss4I0MMqoiOIu3dmT90WJES1OLLcy4yDJCk3u+xNh93nOQz8ieu7rLPOQsxibNSguSzz90rP1P5+0OeskH6c5jxXKa5MSu2Olv9cp3DXHotzovUBbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718115313; c=relaxed/simple;
	bh=HAOmF6rdj6a4UzhcOHHBQoRqQ0wQFaxoA/VjGAh8ocU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rX3NbwSEiXuDQjNgx0Kkd69yH0m64qdaXUxuK1gQDceXsT1t+a6vzfiOAvbKZllCVrJKWB/oY5hp+IiFVa/tA0pPGv2XGzUT8FpdHAo0jepGLKSGKCN7rcBUVHQrXPFb+nCXvPV1gki60WfttuMJNX0Jv0FyjbtFo5Ef8Su+PzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH2Gu-00034K-00; Tue, 11 Jun 2024 16:14:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BE0F4C0688; Tue, 11 Jun 2024 16:14:35 +0200 (CEST)
Date: Tue, 11 Jun 2024 16:14:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Florian Fainelli <florian.fainelli@telecomint.eu>,
	Ralf Baechle <ralf@linux-mips.org>, Phil Sutter <n0-1@freewrt.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] MIPS: Routerboard 532: Fix vendor retry check code
Message-ID: <Zmhby7DtfLGVj+8V@alpha.franken.de>
References: <20240508120700.51374-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508120700.51374-1-ilpo.jarvinen@linux.intel.com>

On Wed, May 08, 2024 at 03:07:00PM +0300, Ilpo Järvinen wrote:
> read_config_dword() contains strange condition checking ret for a
> number of values. The ret variable, however, is always zero because
> config_access() never returns anything else. Thus, the retry is always
> taken until number of tries is exceeded.
> 
> The code looks like it wants to check *val instead of ret to see if the
> read gave an error response.
> 
> Fixes: 73b4390fb234 ("[MIPS] Routerboard 532: Support for base system")
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> --
> 
> IMPORTANT NOTE TO MAINTAINER:
> 
> This change has potential of breaking something and I don't have HW to
> test this with. I only came across it while going through all PCIBIOS_*
> call chains. Clearly the current code non-sensical so something is not
> right but whether this is the right way to solve the problem, I'm not
> entirely sure because it will make small change into the behavior.

I have rework of this code sitting in one of my development branches
and I didn't spot the bug in the old code, but the new code does
what your fix is doing. So I'm pretty sure this change is correct.

> ---
>  arch/mips/pci/ops-rc32434.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

