Return-Path: <linux-mips+bounces-7557-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9500A17446
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 22:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF50188A618
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 21:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5491E3DFC;
	Mon, 20 Jan 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ul7c/xwL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7423A9;
	Mon, 20 Jan 2025 21:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737409709; cv=none; b=NdhP5SSTGQMwiHT2gKoJ82WElaiAXPHukBjvXuqbMJn9TYgLzfGAdlyYT/EvlJbU98YspmBLT63S0KcTg1q8bk6ZIAokXr6G+7hRxwSq8h71RD1NYLRAae9fDpgI84DzdyfWDRc3S5kfLKZ8HmVYBQJdnMIX1icwJ+SM18VyeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737409709; c=relaxed/simple;
	bh=KJBGFuDnQEzeIGfx6nk02kCtmyMiS+ukeSEcCPa1o2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeJhsf+XDKK5tLLjRedf6+KmO9vlKuvOnPA1U7evcrPvSWvGj3lnwn2stUxs7amY36e3YSduhiv/jRCytd4hNBsTeqoSo/afAtvw/79Y8uaFp2k1o8Wquz5ajkkkSw95+rJ/ZGrUqtAXDDRaf3vBQ+VJ+yjfJ0qMEDEJxXpULIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ul7c/xwL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B029C4CEDD;
	Mon, 20 Jan 2025 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737409708;
	bh=KJBGFuDnQEzeIGfx6nk02kCtmyMiS+ukeSEcCPa1o2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul7c/xwLDHY/rXiymPqGfvNNH/EQK/VE6tlmlLiHLAKWHy8qi26cYVItN7x8jsjLl
	 tY+N12xvlQuU9bhlpyq6wczQp9MZ6rsfdqwEv2F2U4cVIVwS+XcKlk38vYgQVBz2cp
	 ek/HRgkUSGvwVdNFUhjlsd4mn/byqUVr470aPlH1+5nRZ0Idg0D3GbUwDZBVYKCGyT
	 RHKWUVC4dUNCGhNsLqqvHg+ljDnn6FR5Ik8OyWbbib+8GfWBMdZfrFoUjXutaJnRd/
	 dXKHGlYRH2Cr3T0OuNiceU7OhgcnnTb5lg6m87Xhirj1Ma8N8Mg2MDhBk4giQZgRez
	 WvNCUpJ7DsDTA==
Date: Mon, 20 Jan 2025 13:48:25 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <202501201344.E7FBB164@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134445.GA21268@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134445.GA21268@redhat.com>

On Mon, Jan 20, 2025 at 02:44:45PM +0100, Oleg Nesterov wrote:
> arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
> can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
> and "sd == NULL" checks in __secure_computing(sd) paths.
> 
> With the change above syscall_trace_enter() can just use secure_computing()
> and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
> not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/mips/kernel/ptrace.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 61503a36067e..f7107479c7fa 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1326,24 +1326,8 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  			return -1;
>  	}
>  
> -#ifdef CONFIG_SECCOMP
> -	if (unlikely(test_thread_flag(TIF_SECCOMP))) {

Yup, this test works out the same as what secure_computing() does.

> -		int ret, i;
> -		struct seccomp_data sd;
> -		unsigned long args[6];
> -
> -		sd.nr = current_thread_info()->syscall;

This matches MIPS's syscall_get_nr() in populate_seccomp_data().

> -		sd.arch = syscall_get_arch(current);
> -		syscall_get_arguments(current, regs, args);
> -		for (i = 0; i < 6; i++)
> -			sd.args[i] = args[i];
> -		sd.instruction_pointer = KSTK_EIP(current);

Rest matches the rest of populate_seccomp_data().

> -
> -		ret = __secure_computing(&sd);
> -		if (ret == -1)
> -			return ret;
> -	}
> -#endif
> +	if (secure_computing())
> +		return -1;
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->regs[2]);
> -- 

So this check out logically from what I can see. I can build test it,
but I don't have MIPS emulation set up. I'd love an Ack from a MIPS
maintainer...

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

