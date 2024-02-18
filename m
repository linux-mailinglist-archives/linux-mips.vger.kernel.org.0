Return-Path: <linux-mips+bounces-1543-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E285979A
	for <lists+linux-mips@lfdr.de>; Sun, 18 Feb 2024 16:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7287F280D1B
	for <lists+linux-mips@lfdr.de>; Sun, 18 Feb 2024 15:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739AD6D1AA;
	Sun, 18 Feb 2024 15:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z0XxTgjq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1F6BFBE
	for <linux-mips@vger.kernel.org>; Sun, 18 Feb 2024 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708269588; cv=none; b=F8802sGFXjdd3MXP4S9GcAsOkesC4qylxDwC/32uPUvCRRsCWiFoNO6vlu0PgArENicGw4PRMbZebjtHj9oAaRIiC+lQyoE+RqvuOWR1rek6gP13Ui3KePSRT+3IBG9AAX/hZFUAyVT9RlRH8xGBvt2wsifjS7v7Lxd+qWaUTqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708269588; c=relaxed/simple;
	bh=lYFHSwKGcbZg0KftqGMF5GiOnvyk1uaue8OvErSz/MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwJXLted7GPU07EzaqeT98GaRJHuByy7frj9TydWRjjaeHneUsAKOyqCTz8s6buOgh27NiWuZKqT1b3rh7VqISSDzO5+4zwo0N8vrBIaqLp/ZCmmaf4DtkQTtIlk85QKzP8plBSC10+CrCGspsWFLAoRtC9BXc5eluxvAhzGy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z0XxTgjq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e34d12404eso686281b3a.2
        for <linux-mips@vger.kernel.org>; Sun, 18 Feb 2024 07:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708269586; x=1708874386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiWOUozWnezeYn8cXQvtDvCvh6gTYyUB/9KcoNgO2S8=;
        b=Z0XxTgjqWyazp15zaW/ZnhQPP/vQUJ16DOZ1Hq0r+BT7AlgmbJ9FONeOG3yHNtb9PL
         NY72Vj0zKPqaAgRpopK2+aqqkrQfRItybiUPkatXi9wwD13ZxQHcl8NYYoFU5Jp6RHdm
         c0o9K96cAg54FH5HIBpabLJjAOkt0mQ2F2mQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708269586; x=1708874386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiWOUozWnezeYn8cXQvtDvCvh6gTYyUB/9KcoNgO2S8=;
        b=Hx2NvNlE2a7uTTbaGn3E2tEU6qO0h6h7k6MY2tevD7NQx+Ie8qwI+ad8jzeax4GYVD
         zaSPr13fa+5L19c/dICMTH/WXAADZ8of/OhLTYxspFPSyBbHLejJTXDWwbthDU4oZRj/
         qFBpQ5DH6L/apJTTEzPVCUEcx8pNtIZHlRnNnuph+Xjg9jbU2raBTR5yFEq69w/KjnNW
         KVBHhF2YZbNBh4VM3sZtNKdJJF9MjFI0BRUTcUtgvVtn//V3PxdO44dN2WEkRWtYuV0y
         W8gVF7D144KLq57QU7JqyeMz3UZXMPSe78Pgfhds1bF6/J+dmRm2eIHT4JjL3/BfVTiO
         B5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgTuPRAb2oTpXrnpBDWEHyM6MbwjkESiaoZFuUvkNvnT7r1MFhdUB4quW8HA953VuoBmaZtWTeqx8zhlzb4FMoE+fVG8kMMinuKA==
X-Gm-Message-State: AOJu0YysITRRH7tiZWQUFKDlK8jtiKy8rUHcMg5/bfPJie8trrvg4lc2
	OGMqQU/cx55Q2Ayl7z8qodxKxsBOhOCcczc9GvEYDGHjDa9M10BXBbDY1MgGqA==
X-Google-Smtp-Source: AGHT+IHQkmCTEZjB8VrcrwmYPHm1xqN+oDo5E9U8MtwdiC0lI+BGRPycjpyIHGY52kr+uXWivxarDw==
X-Received: by 2002:aa7:8202:0:b0:6e1:dbd:e800 with SMTP id k2-20020aa78202000000b006e10dbde800mr9961775pfi.17.1708269585774;
        Sun, 18 Feb 2024 07:19:45 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r22-20020aa78456000000b006e24991dd5bsm2894532pfn.98.2024.02.18.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 07:19:45 -0800 (PST)
Date: Sun, 18 Feb 2024 07:19:44 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Zi Shen Lim <zlim.lnx@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Wang YanQing <udknight@gmail.com>, David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, netdev@vger.kernel.org,
	"linux-hardening @ vger . kernel . org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH bpf-next 2/2] bpf: Take return from set_memory_rox() into
 account with bpf_jit_binary_lock_ro()
Message-ID: <202402180711.22F5C511E5@keescook>
References: <135feeafe6fe8d412e90865622e9601403c42be5.1708253445.git.christophe.leroy@csgroup.eu>
 <ec35e06dbe8672a36415ebe2b9273277c2921977.1708253445.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec35e06dbe8672a36415ebe2b9273277c2921977.1708253445.git.christophe.leroy@csgroup.eu>

On Sun, Feb 18, 2024 at 11:55:02AM +0100, Christophe Leroy wrote:
> set_memory_rox() can fail, leaving memory unprotected.
> 
> Check return and bail out when bpf_jit_binary_lock_ro() returns
> and error.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Previous patch introduces a dependency on this patch because it modifies bpf_prog_lock_ro(), but they are independant.
> It is possible to apply this patch as standalone by handling trivial conflict with unmodified bpf_prog_lock_ro().
> ---
>  arch/arm/net/bpf_jit_32.c        | 25 ++++++++++++-------------
>  arch/arm64/net/bpf_jit_comp.c    | 21 +++++++++++++++------
>  arch/loongarch/net/bpf_jit.c     | 21 +++++++++++++++------
>  arch/mips/net/bpf_jit_comp.c     |  3 ++-
>  arch/parisc/net/bpf_jit_core.c   |  8 +++++++-
>  arch/s390/net/bpf_jit_comp.c     |  6 +++++-
>  arch/sparc/net/bpf_jit_comp_64.c |  6 +++++-
>  arch/x86/net/bpf_jit_comp32.c    |  3 +--
>  include/linux/filter.h           |  4 ++--
>  9 files changed, 64 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index 1d672457d02f..01516f83a95a 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -2222,28 +2222,21 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  	/* If building the body of the JITed code fails somehow,
>  	 * we fall back to the interpretation.
>  	 */
> -	if (build_body(&ctx) < 0) {
> -		image_ptr = NULL;
> -		bpf_jit_binary_free(header);
> -		prog = orig_prog;
> -		goto out_imms;
> -	}
> +	if (build_body(&ctx) < 0)
> +		goto out_free;
>  	build_epilogue(&ctx);
>  
>  	/* 3.) Extra pass to validate JITed Code */
> -	if (validate_code(&ctx)) {
> -		image_ptr = NULL;
> -		bpf_jit_binary_free(header);
> -		prog = orig_prog;
> -		goto out_imms;
> -	}
> +	if (validate_code(&ctx))
> +		goto out_free;
>  	flush_icache_range((u32)header, (u32)(ctx.target + ctx.idx));
>  
>  	if (bpf_jit_enable > 1)
>  		/* there are 2 passes here */
>  		bpf_jit_dump(prog->len, image_size, 2, ctx.target);
>  
> -	bpf_jit_binary_lock_ro(header);
> +	if (bpf_jit_binary_lock_ro(header))
> +		goto out_free;
>  	prog->bpf_func = (void *)ctx.target;
>  	prog->jited = 1;
>  	prog->jited_len = image_size;
> @@ -2260,5 +2253,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  		bpf_jit_prog_release_other(prog, prog == orig_prog ?
>  					   tmp : orig_prog);
>  	return prog;
> +
> +out_free:
> +	image_ptr = NULL;
> +	bpf_jit_binary_free(header);
> +	prog = orig_prog;
> +	goto out_imms;

These gotos give me the creeps, but yes, it does appear to be in the
style of the existing error handling.

> [...]
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
> index b18ce19981ec..f2be1dcf3b24 100644
> --- a/arch/x86/net/bpf_jit_comp32.c
> +++ b/arch/x86/net/bpf_jit_comp32.c
> @@ -2600,8 +2600,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  	if (bpf_jit_enable > 1)
>  		bpf_jit_dump(prog->len, proglen, pass + 1, image);
>  
> -	if (image) {
> -		bpf_jit_binary_lock_ro(header);
> +	if (image && !bpf_jit_binary_lock_ro(header)) {

I find the "!" kind of hard to read the "inverted" logic (0 is success),
so if this gets a revision, maybe do "== 0"?:

	if (image && bpf_jit_binary_lock_ro(header) == 0) {

But that's just me. So, regardless:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

