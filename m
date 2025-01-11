Return-Path: <linux-mips+bounces-7396-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B4A0A38E
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932D03AA4EC
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922A51922E1;
	Sat, 11 Jan 2025 12:18:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B278B19DF98;
	Sat, 11 Jan 2025 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597925; cv=none; b=W4fyGShQshCc+LE0XOKgA+OGWazf/vjiTSfnYnTO4/7a04obcysrNGm8K5MNGBs6768ohEudecjDMq1yzCtEI+E316IPGXogKx0ZQmE6yWp5Tdx2wCJ0W0UTyIb5+7W9OwiLj7i1Bx0H3HqC31bE1FvvC/Y1MIpfNfi35lK1pBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597925; c=relaxed/simple;
	bh=G0j+rxfkOVl3z9RAPt9oe6aH0XqdmyhM1QLNxNwzeqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4iVgN9BSAbq7d3GW8jvMaHYTxZBpeRxCJ/du1n+KoFO3TyQdDPqst5VzmxTIwo6aX0Kuepu9+w+pxMjiWEUHLiauddfG8z0RCcV60IEH9s5Nn9qrpVuKl9X0rbnscL4obqTDlsZuI9e9B0gEgkxIGpkr5VCBpOOfNder7szoVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRL-0006NS-00; Sat, 11 Jan 2025 13:18:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 19C70C06B0; Sat, 11 Jan 2025 13:02:25 +0100 (CET)
Date: Sat, 11 Jan 2025 13:02:25 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, xzhong86@163.com, wuzhangjin@gmail.com,
	srostedt@redhat.com, linux-mips@linux-mips.org,
	ralf@duck.linux-mips.net, jeffbai@aosc.io, zhanjun@uniontech.com,
	guanwentao@uniontech.com, jiaxun.yang@flygoat.com,
	gregory.clement@bootlin.com, philmd@linaro.org, tglx@linutronix.de,
	rppt@kernel.org
Subject: Re: [RESEND PATCH] MIPS: ftrace: Declare ftrace_get_parent_ra_addr()
 as static
Message-ID: <Z4Jd0aiLQY2KYRmS@alpha.franken.de>
References: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>

On Sat, Jan 04, 2025 at 10:47:08PM +0800, WangYuli wrote:
> Declare ftrace_get_parent_ra_addr() as static to suppress clang
> compiler warning that 'no previous prototype'. This function is
> not intended to be called from other parts.
> 
> Fix follow error with clang-19:
> 
> arch/mips/kernel/ftrace.c:251:15: error: no previous prototype for function 'ftrace_get_parent_ra_addr' [-Werror,-Wmissing-prototypes]
>   251 | unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
>       |               ^
> arch/mips/kernel/ftrace.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>   251 | unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
>       | ^
>       | static
> 1 error generated.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/kernel/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
> index 8c401e42301c..f39e85fd58fa 100644
> --- a/arch/mips/kernel/ftrace.c
> +++ b/arch/mips/kernel/ftrace.c
> @@ -248,7 +248,7 @@ int ftrace_disable_ftrace_graph_caller(void)
>  #define S_R_SP	(0xafb0 << 16)	/* s{d,w} R, offset(sp) */
>  #define OFFSET_MASK	0xffff	/* stack offset range: 0 ~ PT_SIZE */
>  
> -unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
> +static unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
>  		old_parent_ra, unsigned long parent_ra_addr, unsigned long fp)
>  {
>  	unsigned long sp, ip, tmp;
> -- 
> 2.45.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

