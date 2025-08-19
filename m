Return-Path: <linux-mips+bounces-10386-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B5B2C5C8
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 15:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C11EC4E41D5
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B32D33A038;
	Tue, 19 Aug 2025 13:39:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FCF7262F;
	Tue, 19 Aug 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610749; cv=none; b=hU6LCrsevHh7MGkF2+NUCnAWt9wrpMYNAfyujTUVsJXf4lz4WvIbNeRqcSkwsZypEt8nE1TvUCywro2MOA5nOnOXydy9To/dxMBdiY6GEzTq8Il1HevlbwQWFKlTojUfvu12qVDkN8JQ3dlEvZZT5DyD0QWFPIe7LV6nzE1cN7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610749; c=relaxed/simple;
	bh=kKVpD/+U4H/9/Fm3FDnpqnB1RCJMjPohCtNqg0WUqsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXlHLUAzKsUiKb5HG0J3AF6nu6szDlOa8dqO7yYMD0XaTl9pkOAmNuE/c0cy+9t8k8XJun+s3Q5UUwiWdIOO07Z3o33G6VfRx/tGjMsdUQFgaGjNFeFDTLsYURVJYA8PHOhHe06+PRWTDgv9vrfCA/4uHCSRZDVyKhdnKuVeCFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uoLkJ-00063D-00; Tue, 19 Aug 2025 14:47:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6960AC075D; Tue, 19 Aug 2025 14:08:11 +0200 (CEST)
Date: Tue, 19 Aug 2025 14:08:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 05/10] mips: Unconditionally select
 ARCH_HAS_CURRENT_STACK_POINTER
Message-ID: <aKRpK8v4NlzSBwLI@alpha.franken.de>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
 <20250818-bump-min-llvm-ver-15-v1-5-c8b1d0f955e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-5-c8b1d0f955e0@kernel.org>

On Mon, Aug 18, 2025 at 11:57:21AM -0700, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, the selection of
> ARCH_HAS_CURRENT_STACK_POINTER can be made unconditional since it is
> always true.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index caf508f6e9ec..bc7473505f4a 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -6,7 +6,7 @@ config MIPS
>  	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
>  	select ARCH_HAS_CPU_CACHE_ALIASING
>  	select ARCH_HAS_CPU_FINALIZE_INIT
> -	select ARCH_HAS_CURRENT_STACK_POINTER if !CC_IS_CLANG || CLANG_VERSION >= 140000
> +	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL if !64BIT
>  	select ARCH_HAS_DMA_OPS if MACH_JAZZ
>  	select ARCH_HAS_FORTIFY_SOURCE
> 
> -- 
> 2.50.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

