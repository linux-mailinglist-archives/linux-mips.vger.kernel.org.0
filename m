Return-Path: <linux-mips+bounces-7779-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35399A36687
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 20:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E407118845B0
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 19:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA921C84CA;
	Fri, 14 Feb 2025 19:54:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86311C84B7;
	Fri, 14 Feb 2025 19:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562885; cv=none; b=eE1T7a/mjMypTzX7AZ/wcNFLxcFPgc1zMmgEqD18BKjDezIUMaugwCoayV3gRBWDCvrfrgMsOSsBsjl89ItlvgK6oCwa1pYQnVmSvtAt3tsKYQiLfXVOjt9FAAs646Ci8XlDMDJayCLGg6PNV5IBS+oMlkNX2qZush09FiWU9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562885; c=relaxed/simple;
	bh=I7GtKu8xGhniZm9RkZA41tbT5M4GN+3wrQPkrwjVDPI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RLeaQUyZU/9nKhPOv+UzULCaCkbUHYdYnjcsBn+jRAyHNp4B+74yAHPqU3JbO3vwQsSdw4McNSg1koRjbSBncbGawuvQozTZGDUm4q2LrF1pSMw/CFwr3Z0Zwz3UfDV4ntJjxsXy7R86AagGF30X2SVHmh0lUiR9wvjlic7UzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6236792009D; Fri, 14 Feb 2025 20:54:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5F97B92009C;
	Fri, 14 Feb 2025 19:54:35 +0000 (GMT)
Date: Fri, 14 Feb 2025 19:54:35 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com, 
    linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
    masahiroy@kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com
Subject: Re: [PATCH v2 1/2] MIPS: dec: Only check -msym32 when need
 compiler
In-Reply-To: <11D1B8A01F6006BF+20250214095523.175229-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2502141914410.65342@angie.orcam.me.uk>
References: <F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com> <11D1B8A01F6006BF+20250214095523.175229-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, WangYuli wrote:

> During make modules_install, the need-compiler variable becomes null,
> so Makefile.compiler isn't included.
> 
> This results in call cc-option-yn returning nothing.
> 
> To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
> without -msym32" error, just wrap it into `ifdef need-compiler'.

 I think this needs to say explicitly that `make modules_install' is one 
of the targets that does not require or use the compiler and consequently 
does not require compilation flag variables such as `cflags-y' either.  
Therefore this target sets `need-compiler' to nil so as to disable all the 
unnecessary compiler logic and we can also use it here for this purpose, 
avoiding triggering logic that does rely on the compiler which is only 
needed at the compilation stage.

 Otherwise the unfamiliar reader will still have to guess why it is safe 
to exclude this part as it's not mentioned explicitly.

 See the second paragraph of the change description of commit 4fe4a6374c4d 
("MIPS: Only fiddle with CHECKFLAGS if `need-compiler'") for justification 
I gave for the use of `need-compiler' there.

> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index be8cb44a89fd..4d8339d2f20f 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -304,8 +304,12 @@ ifdef CONFIG_64BIT
>    ifeq ($(KBUILD_SYM32), y)
>      cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
>    else
> -    ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
> -      $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
> +# Do not fiddle with the compilation flags when no compiler is
> +# going to be used. To get rid of spurious errors.
> +    ifdef need-compiler
> +      ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
> +        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
> +      endif
>      endif
>    endif
>  endif

 The comment is not correctly aligned with code here, but as I say I don't 
think it's really needed in the first place and then the `ifdef' ought to 
wrap the whole conditional for clarity, because none of this stuff is used 
(and then the call to `cc-option-yn' as you say will always yield nothing, 
because the variable will not have been defined).

  Maciej

