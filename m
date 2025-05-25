Return-Path: <linux-mips+bounces-9102-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC6AC34BC
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 15:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27A4F7A68EC
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 13:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71001DFE8;
	Sun, 25 May 2025 13:03:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7191279E1;
	Sun, 25 May 2025 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748178189; cv=none; b=Y8iOV0gvZ1M4Dq26PJFk2DKgCeEkTbcUifWl+NLrFVtpLIowG4PjvU2qJ4iEYPqYuk/fwYa9DY3TL0UB5mrVr0nrFOmLQuP8gQjWDyY2soUBtKWiNfHzeHzCfdxe9Gr0WM/cVABMmosyBkLpiUnX+9ZsZ/IvlZPZPHRndVQ04MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748178189; c=relaxed/simple;
	bh=mQTy/+KL3YY6sDEBOSC+/Pdo1FrTRAynwZ5VvnElzY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rva+ybuVOWMnGPiTV7WA32LwM9HS6LK4Hhc1F7X1zTmH0xDcJAFUmYmfeywPVd5h680sCGIR8AdKmnengdGl2PEy42QYNA8DHHtqdrNsjcaAljsw4iT9TfUK6utLBlqLGPO/YIFM9KiLE7pC2yCEuVBggiWE8bRb7i93uYNMwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uJB0C-0006xc-00; Sun, 25 May 2025 15:02:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 77924C05FC; Sun, 25 May 2025 15:02:49 +0200 (CEST)
Date: Sun, 25 May 2025 15:02:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, lkp@intel.com, fazilyildiran@gmail.com,
	oe-kbuild-all@lists.linux.dev, paul@pgazz.com
Subject: Re: [PATCH v2] mips: econet: Fix incorrect Kconfig dependencies
Message-ID: <aDMU-QdA9I_rLsSZ@alpha.franken.de>
References: <20250521213333.481144-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521213333.481144-1-cjd@cjdns.fr>

On Wed, May 21, 2025 at 09:33:33PM +0000, Caleb James DeLisle wrote:
> config ECONET selects SERIAL_OF_PLATFORM and that depends on SERIAL_8250
> so we need to select SERIAL_8250 directly.
> Also do not enable DEBUG_ZBOOT unless DEBUG_KERNEL is set.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505211654.CBdIsoTq-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202505211451.WRjyf3a9-lkp@intel.com/
> ---
> I only now noticed the DEBUG_ZBOOT issue since they both touch the same
> place decided better to do it in one patch.
> ---
>  arch/mips/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index c3dbdc808664..1e48184ecf1e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -395,9 +395,10 @@ config ECONET
>  	bool "EcoNet MIPS family"
>  	select BOOT_RAW
>  	select CPU_BIG_ENDIAN
> -	select DEBUG_ZBOOT
> +	select DEBUG_ZBOOT if DEBUG_KERNEL
>  	select EARLY_PRINTK_8250
>  	select ECONET_EN751221_TIMER
> +	select SERIAL_8250
>  	select SERIAL_OF_PLATFORM
>  	select SYS_SUPPORTS_BIG_ENDIAN
>  	select SYS_HAS_CPU_MIPS32_R1
> -- 
> 2.39.5

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

