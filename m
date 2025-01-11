Return-Path: <linux-mips+bounces-7401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2AA0A41A
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 15:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A76D16AB8B
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 14:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A021AC429;
	Sat, 11 Jan 2025 14:20:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C4C29D0E;
	Sat, 11 Jan 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736605216; cv=none; b=UpCZUrAVw6+OO4FSxH4xC/zLTEZAcnRJqgoeHvwU3b/Ocg+AYciZBBuhZJOoGA8TggEizMFexhBBFgygNxxw1x3CCg9Wx4BqTTevt7JuBBIs9mCoTP3ZK6XF3GBEtUp79PX/qPPjYow0PfjD58mSBzGwLTivfJ2lkeXTyJwlWHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736605216; c=relaxed/simple;
	bh=xDn/s38PFdttbcUthOXq3YbothiXXATHIAepu25Xy3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6X2S7wZNwVEcAm7MQZhqGV5b0lx8PzkFAPNr0x/X3ROf5vqEyasIu+uLg2zy3w66ADOB33HK1+dJx/cJGhJlp5JlzJ0x+hGjY8LsriCsiLrechvTw2UYwDTYBbVnEOkQolzJVHKUm/YIazX0sWlUEvLEqpFTqt09q6j7dLb3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWcLH-00075W-00; Sat, 11 Jan 2025 15:19:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 98F25C010B; Sat, 11 Jan 2025 14:16:40 +0100 (CET)
Date: Sat, 11 Jan 2025 14:16:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Dengcheng Zhu <dzhu@wavecomp.com>,
	Ming Wang <wangming01@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH] mips/math-emu: fix emulation of the prefx instruction
Message-ID: <Z4JvONDiaYkQLAv/@alpha.franken.de>
References: <20250105211806.421305-1-mat.jonczyk@o2.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250105211806.421305-1-mat.jonczyk@o2.pl>

On Sun, Jan 05, 2025 at 10:18:06PM +0100, Mateusz Jończyk wrote:
> Currently, installation of Debian 12.8 for mipsel fails on machines
> without an FPU [1]. This is caused by the fact that zstd (which is used
> for initramfs compression) executes the prefx instruction, which is not
> emulated properly by the kernel.
> 
> The prefx (Prefetch Indexed) instruction fetches data from memory into
> the cache without any side effects. Though functionally unrelated, it
> requires an FPU [2].
> 
> Bytecode format of this instruction ends on "001111" binary:
> 
> 	(prefx instruction format) & 0x0000003f = 0x0000000f
> 
> The code in fpux_emu() runs like so:
> 
> 	#define MIPSInst(x) x
> 	#define MIPSInst_FMA_FFMT(x) (MIPSInst(x) & 0x00000007)
> 	#define MIPSInst_FUNC(x) (MIPSInst(x) & 0x0000003f)
> 	enum cop1x_func { ..., pfetch_op = 0x0f, ... };
> 
> 	...
> 
> 	switch (MIPSInst_FMA_FFMT(ir)) {
> 	...
> 
> 	case 0x3:
> 		if (MIPSInst_FUNC(ir) != pfetch_op)
> 			return SIGILL;
> 
> 		/* ignore prefx operation */
> 		break;
> 
> 	default:
> 		return SIGILL;
> 	}
> 
> That snippet above contains a logic error and the
> 	if (MIPSInst_FUNC(ir) != pfetch_op)
> comparison always fires.
> 
> When MIPSInst_FUNC(ir) is equal to pfetch_op, ir must end on 001111
> binary. In this case, MIPSInst_FMA_FFMT(ir) must be equal to 0x7, which
> does not match that case label.
> 
> This causes emulation failure for the prefx instruction. Fix it.
> 
> This has been broken by
> commit 919af8b96c89 ("MIPS: Make definitions of MIPSInst_FMA_{FUNC,FMTM} consistent with MIPS64 manual")
> which modified the MIPSInst_FMA_FFMT macro without updating the users.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: stable@vger.kernel.org # after 3 weeks
> Cc: Dengcheng Zhu <dzhu@wavecomp.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Ming Wang <wangming01@loongson.cn>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Fixes: 919af8b96c89 ("MIPS: Make definitions of MIPSInst_FMA_{FUNC,FMTM} consistent with MIPS64 manual")
> 
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1091858
> [2] MIPS Architecture For Programmers Volume II-A: The MIPS32 Instruction Set
> 
> ---
> 
> Tested in QEMU for mipsel and mips64el.
> ---
>  arch/mips/math-emu/cp1emu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
> index 265bc57819df..c89e70df43d8 100644
> --- a/arch/mips/math-emu/cp1emu.c
> +++ b/arch/mips/math-emu/cp1emu.c
> @@ -1660,7 +1660,7 @@ static int fpux_emu(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
>  		break;
>  	}
>  
> -	case 0x3:
> +	case 0x7:
>  		if (MIPSInst_FUNC(ir) != pfetch_op)
>  			return SIGILL;
>  
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

