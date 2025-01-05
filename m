Return-Path: <linux-mips+bounces-7251-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39CA018A6
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jan 2025 09:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4231883ACA
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jan 2025 08:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC2D13AA41;
	Sun,  5 Jan 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBhlTbj/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8479C4;
	Sun,  5 Jan 2025 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736066275; cv=none; b=M2ny4cjyeFzCcXI8zWa7QkHBeS0yd87rhXa7H8baUTLL1czi4Q2KMngzFCby2D7HqBH4CB4XtiypmVm+Lc9bWBvbR06sWe6Kv3yZCoxyOfY5adlTtETyFwv3CUHcmtHL4hQDsinOMi75jS+2gEGQBPSMiW2ftgSEvOdfrbwVDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736066275; c=relaxed/simple;
	bh=YV4ke7QHSjER+1rNV2NNuMxK5hdwXxO3ApJMbKsp354=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Bcj/6ZxG97cN5l4plPvvkZRypYUcR7Yp2VSFuCu6qGVv8t0F+4flGYpoGqkhfnTjCAb+ScR33U8/n96USbX9hj9p2CkS5qwuHudDjhlxkbuElQIHGS6t3jHsq3uXDXt1E0W0zIW2+Ny5FsaRkZ9cOmDNIoHVD14+oct8K31lG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBhlTbj/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A69C4CED0;
	Sun,  5 Jan 2025 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736066274;
	bh=YV4ke7QHSjER+1rNV2NNuMxK5hdwXxO3ApJMbKsp354=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VBhlTbj/QDO2/Dz7eWdjeWk4xLt15MqGu9xwdNmO2byIYifw6vrv76+YYglUktIgl
	 F3RsaxzFK6XaVp29UXwkkif6i8Yt7tAC1g3YXus+nrCn9/UzCAea0QbGD3INUl0x2S
	 hAentLAhC8z+BAHzObi5pVM+mj8mTwexZu9tLC+qR6p0cb4gxDwzmym4kq7nfaZpXd
	 /0yU6XII3dlBe8ficCwCmjS6maECBgSlOa8a/XuWQek2kVOgsB1azL6YQhp9537Air
	 0l0Rlba+mM3Gtvq4jOZlS749z8Yg7TRFerO4HH/BpAUN7NlYMBNldtR+LWDsB+L0aL
	 Er7TgNXZZnNpg==
Date: Sun, 5 Jan 2025 17:37:47 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, xzhong86@163.com, wuzhangjin@gmail.com,
 srostedt@redhat.com, linux-mips@linux-mips.org, ralf@duck.linux-mips.net,
 jeffbai@aosc.io, zhanjun@uniontech.com, guanwentao@uniontech.com,
 jiaxun.yang@flygoat.com, gregory.clement@bootlin.com, philmd@linaro.org,
 tglx@linutronix.de, rppt@kernel.org
Subject: Re: [RESEND PATCH] MIPS: ftrace: Declare
 ftrace_get_parent_ra_addr() as static
Message-Id: <20250105173747.3859102eeabed7ffba8cbc07@kernel.org>
In-Reply-To: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>
References: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  4 Jan 2025 22:47:08 +0800
WangYuli <wangyuli@uniontech.com> wrote:

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

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>


Thanks,

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
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

