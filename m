Return-Path: <linux-mips+bounces-5382-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BF96EEC3
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 11:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D351C213AE
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 09:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47F61C7B83;
	Fri,  6 Sep 2024 09:03:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11941157484;
	Fri,  6 Sep 2024 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725613391; cv=none; b=AkWvN0oaaimb3Mab8H84baZHXZZ9ZENb1puoEvnZV/liIkh0qp4+sW71a9roR1ifL6FTL35PiZpqRoKnoF05lqeUnXdRF2mzqqNGC9uWv1hdy/uhjsPo89w8eSMF0YIYoW2zvTIYaq1flDrV6vYQdls9O3tm7t11nlODhnpAook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725613391; c=relaxed/simple;
	bh=2l09rkOqboCyjryA87QJc97kuMI3uMLu5CVxFZ/Bn6k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TERCNf28w6QhramM97ALXusB5nTyUrKcljjlmI85SMOhgQn4D9L7off3KeqnIP87sUrV6Hb9x/z4Zz7WJri131XW6Xv+IMSbAsyX1mZntBAB2V9kFH4fIEr3jvK51Ly6PFcSI+3ec0D4b0CSba3SugKldczKIDy/3O6tKug0VPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 961EC92009C; Fri,  6 Sep 2024 11:03:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 900F792009B;
	Fri,  6 Sep 2024 10:03:06 +0100 (BST)
Date: Fri, 6 Sep 2024 10:03:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Masahiro Yamada <masahiroy@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
    Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Wedson Almeida Filho <wedsonaf@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <benno.lossin@proton.me>, 
    Andreas Hindborg <a.hindborg@samsung.com>, 
    Alice Ryhl <aliceryhl@google.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    Masami Hiramatsu <mhiramat@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
    Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-um@lists.infradead.org, rust-for-linux@vger.kernel.org, 
    linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] MIPS: Rename mips_instruction type to workaround
 bindgen issue
In-Reply-To: <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
Message-ID: <alpine.DEB.2.21.2409060455300.1802@angie.orcam.me.uk>
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Sep 2024, Jiaxun Yang wrote:

> Rename it as mips_insn, which is not conflicting with anything
> and fits the name of header.
[...]
> diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
> index 8c401e42301c..153c9666a77c 100644
> --- a/arch/mips/kernel/ftrace.c
> +++ b/arch/mips/kernel/ftrace.c
> @@ -248,7 +248,7 @@ int ftrace_disable_ftrace_graph_caller(void)
>  #define S_R_SP	(0xafb0 << 16)	/* s{d,w} R, offset(sp) */
>  #define OFFSET_MASK	0xffff	/* stack offset range: 0 ~ PT_SIZE */
>  
> -unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
> +static long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
>  		old_parent_ra, unsigned long parent_ra_addr, unsigned long fp)
>  {
>  	unsigned long sp, ip, tmp;

 This goes beyond renaming `mips_instruction' data type to `mips_insn'.

> diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
> index dc39f5b3fb83..7a1b1c3674da 100644
> --- a/arch/mips/kernel/kprobes.c
> +++ b/arch/mips/kernel/kprobes.c
> @@ -90,7 +90,7 @@ int arch_prepare_kprobe(struct kprobe *p)
>  	}
>  
>  	if (copy_from_kernel_nofault(&prev_insn, p->addr - 1,
> -			sizeof(mips_instruction)) == 0 &&
> +			sizeof(kprobe_opcode_t)) == 0 &&
>  	    insn_has_delayslot(prev_insn)) {
>  		pr_notice("Kprobes for branch delayslot are not supported\n");
>  		ret = -EINVAL;

 Likewise.

  Maciej

