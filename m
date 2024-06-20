Return-Path: <linux-mips+bounces-3754-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD2910B4F
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDC6FB25119
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75911B29DA;
	Thu, 20 Jun 2024 16:08:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACB01B1518;
	Thu, 20 Jun 2024 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899682; cv=none; b=G50I6VRL7vAYqVthdgIoJSnzrEAsmnL0FS+DgpRgJPA9nBudFJukd5rK5doJwveQUzEMytDGCiL/6hPtu/XhREoExm0uwKAq2tqSJw5mNS6laZHESBT27HXDV1vV7yc1CrNLmc+VtD74No3PhHBXbB+RQm6x7QWgRIhMBfx616U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899682; c=relaxed/simple;
	bh=GNVc8/vmFMgwRhMEy2TuqlraiLah1mxz5w2FWDs8fpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHIzZzHP9BCQSR7ceO8gbmOhMC6RgY2zgISX9wIq0rpZ+aWqCYdGa7Le2TDINR2nF1+k3fpgy1ZIYbO3Ceucf2abgc1yk3eGm7O1Q0UiNZ03yfsmO+4V4avhmHrJ6zo4Cvi/oJMD4zFN5xuMW6C2co4F36HNVo17JV4i4jva9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKKK1-0001mv-00; Thu, 20 Jun 2024 18:07:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0F12BC0120; Thu, 20 Jun 2024 18:06:28 +0200 (CEST)
Date: Thu, 20 Jun 2024 18:06:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
Message-ID: <ZnRThFlqqyDEprGz@alpha.franken.de>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
 <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>

On Wed, Jun 12, 2024 at 10:53:30AM +0100, Jiaxun Yang wrote:
> Introduce CPU_HAS_LLSC and CPU_MAY_HAVE_LLSC to determine availability
> of LLSC and Kconfig level.
> 
> They are both true for almost all supported CPUs besides:
> 
> R3000: Doesn't have LLSC, so both false.
> R5000 series: LLSC is unusable for 64bit kernel, so both false.
> R10000: Some platforms decided to opt-out LLSC due to errata, so only
> 	select CPU_MAY_HAVE_LLSC.
> WAR_4KC_LLSC: LLSC is buggy on certain reversion, which can be detected
> 	at cpu-probe or platform override, so only select CPU_MAY_HAVE_LLSC.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Make cpu_has_llsc logic clear
> ---
>  arch/mips/Kconfig                    | 20 ++++++++++++++++++++
>  arch/mips/include/asm/cpu-features.h |  9 ++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 8ac467c1f9c8..50260a7e9b54 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1548,6 +1548,7 @@ config CPU_R3000
>  config CPU_R4300
>  	bool "R4300"
>  	depends on SYS_HAS_CPU_R4300
> +	select CPU_HAS_LLSC
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_64BIT_KERNEL
>  	help
> @@ -1556,6 +1557,7 @@ config CPU_R4300
>  config CPU_R4X00
>  	bool "R4x00"
>  	depends on SYS_HAS_CPU_R4X00
> +	select CPU_HAS_LLSC
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_64BIT_KERNEL
>  	select CPU_SUPPORTS_HUGEPAGES
> @@ -1566,6 +1568,7 @@ config CPU_R4X00
>  config CPU_TX49XX
>  	bool "R49XX"
>  	depends on SYS_HAS_CPU_TX49XX
> +	select CPU_HAS_LLSC
>  	select CPU_HAS_PREFETCH
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_64BIT_KERNEL
> @@ -1574,6 +1577,7 @@ config CPU_TX49XX
>  config CPU_R5000
>  	bool "R5000"
>  	depends on SYS_HAS_CPU_R5000
> +	select CPU_HAS_LLSC if !64BIT
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_64BIT_KERNEL
>  	select CPU_SUPPORTS_HUGEPAGES
> @@ -1583,6 +1587,7 @@ config CPU_R5000
>  config CPU_R5500
>  	bool "R5500"
>  	depends on SYS_HAS_CPU_R5500
> +	select CPU_HAS_LLSC

do you have an user manual stating that the R5k bug is fixed on this CPUs ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

