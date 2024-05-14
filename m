Return-Path: <linux-mips+bounces-3270-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4658C5D03
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2024 23:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7174B28121F
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2024 21:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A228181BB3;
	Tue, 14 May 2024 21:46:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014F9180A77;
	Tue, 14 May 2024 21:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715723169; cv=none; b=ctLcyD7o2DFeW5CqPNDThUmmnn33Rp42Gc47gwyG5w50QpPwJ38c0sODMm/m4iT40BjEdzdc1UANT2+HCRzZzaf4ShWxJpKHgWccUa6BREVHrJIhgMZu4yl97WUeZsMIPxLWgUS6otl2ZkE41F2Fdzxo5IXinJmW0fVCsbKisSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715723169; c=relaxed/simple;
	bh=tA0JXE2hoL6cfxV24wwc92Ng3pYIs8abpFOuRnVXY1A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f50cqnDPUsJWKwy9shL5Ue2Wk+gfwmwLNiBf0TK2KK+A0AklYo5/WIYJZAHbTZ5jWxYtXiJ1F9apIBlDP0y70CJPupKlWTwEeYS3LcsfKRmQ2FgAkerHQXL1zKwWDePRrCJJCcGqghSPHHlmf3WCTL63I4Ntyj6RF/pdWZelPv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2B44792009C; Tue, 14 May 2024 23:38:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2116892009B;
	Tue, 14 May 2024 22:38:19 +0100 (BST)
Date: Tue, 14 May 2024 22:38:19 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    llvm@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 6/8] MIPS: Limit MIPS_MT_SMP support by ISA reversion
In-Reply-To: <20240202-llvm-msym32-v1-6-52f0631057d6@flygoat.com>
Message-ID: <alpine.DEB.2.21.2405142235100.45291@angie.orcam.me.uk>
References: <20240202-llvm-msym32-v1-0-52f0631057d6@flygoat.com> <20240202-llvm-msym32-v1-6-52f0631057d6@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Feb 2024, Jiaxun Yang wrote:

> MIPS MT ASE is only available on ISA between Release 1 and Release 5.

 R2+ only actually, as also evident from Kconfig...

> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2171,7 +2171,8 @@ config CPU_R4K_CACHE_TLB
>  config MIPS_MT_SMP
>  	bool "MIPS MT SMP support (1 TC on each available VPE)"
>  	default y
> -	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICROMIPS
> +	depends on TARGET_ISA_REV > 0 && TARGET_ISA_REV < 6
> +	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
>  	select CPU_MIPSR2_IRQ_VI
>  	select CPU_MIPSR2_IRQ_EI
                   ^^^^^^
 ... here.  I wish people looked beyond the line they change, sigh...

  Maciej

