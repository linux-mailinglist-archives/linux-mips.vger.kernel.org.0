Return-Path: <linux-mips+bounces-5524-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0849745F8
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2024 00:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39D0A287A63
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 22:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6141ABED0;
	Tue, 10 Sep 2024 22:28:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EBD1A3BAF;
	Tue, 10 Sep 2024 22:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726007308; cv=none; b=Uch7/nWFycpWVMVMqaJ8ip+W/pImMRHmbV1nO/90GV1fpt0gopDfRKR8FTfLREkl77B46XQ+yudgpRMVMLXKAl4MN3P2qxtlHGdSj5H0Z8hO3smJmmr3XOzOBcYkP77iZ9tBWzGlNOHBIb8643EfUfmfTrze2Oi/BhT0Hg67gZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726007308; c=relaxed/simple;
	bh=m6bZTfRafhQeKF0FHn4HDoue1BzzxhJP3n0bqBSUuiY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hUnQvMMADoHdedtl5lvRg8jWRdfmgUPTPNljPCPaQEypZO2U5sZJjjUPhoRSIBzHzB5bOt0EkBk0t0+KJQb0cVn14cCiu3UxquraNB8oeawsTRnkLszK+/Z0ZaH9EAwJgYOT1wmjLY5gZHZT354UNhjYeMBlEiRBV36TETzJzGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 24E6892009C; Wed, 11 Sep 2024 00:28:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1E05C92009B;
	Tue, 10 Sep 2024 23:28:18 +0100 (BST)
Date: Tue, 10 Sep 2024 23:28:18 +0100 (BST)
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
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
    llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/3] rust: Enable for MIPS
In-Reply-To: <54ce7574-43fd-40ee-9ae9-dd72283d1040@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2409102318270.60835@angie.orcam.me.uk>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com> <20240905-mips-rust-v2-3-409d66819418@flygoat.com> <alpine.DEB.2.21.2409082138160.60835@angie.orcam.me.uk> <035ccfe5-c368-4cd9-8e0d-34e0e355cb05@app.fastmail.com> <alpine.DEB.2.21.2409101643210.60835@angie.orcam.me.uk>
 <54ce7574-43fd-40ee-9ae9-dd72283d1040@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Jiaxun Yang wrote:

> >> We have no good way to tell ISA reversion prior to R1 just from Kconfig TARGET_ISA_REV,
> >> valid numbers for TARGET_ISA_REV are only 1, 2, 5, 6 from Kconfig.
> >
> >  This approach doesn't work for some MIPS architecture processor configs 
> > anyway, e.g. what ISA revision will CPU_P5600 imply here?
> 
> TARGET_ISA_REV will be set to 5 for CPU_P5600 (CPU_MIPSR5 will default to y
> on CPU_P5600, and CPU_MIPSR5 sets TARGET_ISA_REV to 5). 
> >
> >  However if there's a need (and previously there wasn't), then I think it 
> > can be sorted in a straightforward way.  We have just a bunch of CPU_* 
> > settings and we can define corresponding ISA_* settings to select, e.g. 
> > ISA_MIPS1, ISA_MIPS3, ISA_MIPS32_R1, ISA_MIPS64_R6, and so on, based on 
> > information extracted from per-CPU_* `-march=' compilation flags from 
> > arch/mips/Makefile (possibly combined with ISA data obtained from 
> > GCC/binutils for said flags).
> >
> >  It could be a bit tedious to write, but not a big challenge really, just 
> > mechanical work.
> 
> TARGET_ISA_REV is guaranteed to be aligned with CPU's supported ISA for now,
> so I see no reason to invent another set of symbols....

 Ah, OK then, I missed these bits, thanks for pointing them out.

 So we only need to define CPU_MIPS1, CPU_MIPS3, and CPU_MIPS4 settings
(we have no support for any MIPS II CPU; there was the R6000 only at that 
ISA level, exeedingly rare and unreliable) analogously to and along with 
the existing CPU_MIPSR1, CPU_MIPSR2, etc., which is even simpler.  They 
can then be used accordingly for TARGET_ISA_REV == 0, either directly or 
perhaps via an additional TARGET_LEGACY_ISA_REV setting.

  Maciej

