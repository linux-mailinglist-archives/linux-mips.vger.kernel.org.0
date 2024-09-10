Return-Path: <linux-mips+bounces-5501-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56683973CE4
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 18:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700861C24613
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 16:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6C719EEB4;
	Tue, 10 Sep 2024 16:03:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD4F198824;
	Tue, 10 Sep 2024 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725984224; cv=none; b=WuyvIIh4JAYF7y/O4h6lDYZ6OB8u/B9uhzEiAWhVekkRajAa1LnHgZsTUM8dmur72dTjts5ZwJj8usUh/kZEw71xVBr5oGg1xNbVDAHFCRhtHzjrenvlbbs8NE9wPwJFyz3Xv+3221Zg/QiNjMUgcnoHLJkaEUj0QzbRv/KVwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725984224; c=relaxed/simple;
	bh=Cdiv22D2XE0zZV2f8MCtiT3Ss4BAr6XjTBSKLUi7loE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eQedEVEujSoS7PLqjhDOz+yJE010wvxOqwVwyFqtnSV++kgqmbjyJ1XRuYaCUP25AU5Cpr5FydBpLuR1Wq9fiViDNGBJjwyIk0jey4PmmwkK4whucCYRC6rmE0qzfl3MP7PqXwd+cow1wU8onZaEWvQYCzZ1Ega2MHkrQriyAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A5A2792009C; Tue, 10 Sep 2024 18:03:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A14D492009B;
	Tue, 10 Sep 2024 17:03:39 +0100 (BST)
Date: Tue, 10 Sep 2024 17:03:39 +0100 (BST)
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
In-Reply-To: <035ccfe5-c368-4cd9-8e0d-34e0e355cb05@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2409101643210.60835@angie.orcam.me.uk>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com> <20240905-mips-rust-v2-3-409d66819418@flygoat.com> <alpine.DEB.2.21.2409082138160.60835@angie.orcam.me.uk> <035ccfe5-c368-4cd9-8e0d-34e0e355cb05@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, Jiaxun Yang wrote:

> >> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> >> index 863720777313..bbdf8a4dd169 100644
> >> --- a/scripts/generate_rust_target.rs
> >> +++ b/scripts/generate_rust_target.rs
> > [...]
> >> +        } else {
> >> +            ts.push("arch", "mips");
> >> +            cfg.get("TARGET_ISA_REV").map(|isa_rev| {
> >> +                let feature = match isa_rev.as_str() {
> >> +                    "1" => ",+mips32",
> >> +                    "2" => ",+mips32r2",
> >> +                    "5" => ",+mips32r5",
> >> +                    "6" => ",+mips32r6",
> >> +                    _ => ",+mips2",
> >
> >  What's the consequence of using `mips2' rather than `mips1' here?  How 
> > about other ISA revisions, e.g. `mips4' (that also applies to the 64BIT 
> > leg)?
> 
> LLVM's mips1 backend is a little bit broken beyond repair, so I tried to use mips2
> as a baseline. I should probably let HAVE_RUST depend on !CPU_R3000 to get it covered.

 GCC works just fine I suppose, just as with the other language frontends, 
doesn't it?

> We have no good way to tell ISA reversion prior to R1 just from Kconfig TARGET_ISA_REV,
> valid numbers for TARGET_ISA_REV are only 1, 2, 5, 6 from Kconfig.

 This approach doesn't work for some MIPS architecture processor configs 
anyway, e.g. what ISA revision will CPU_P5600 imply here?

 However if there's a need (and previously there wasn't), then I think it 
can be sorted in a straightforward way.  We have just a bunch of CPU_* 
settings and we can define corresponding ISA_* settings to select, e.g. 
ISA_MIPS1, ISA_MIPS3, ISA_MIPS32_R1, ISA_MIPS64_R6, and so on, based on 
information extracted from per-CPU_* `-march=' compilation flags from 
arch/mips/Makefile (possibly combined with ISA data obtained from 
GCC/binutils for said flags).

 It could be a bit tedious to write, but not a big challenge really, just 
mechanical work.

> Given that mips 2 and 3 binaries (Rust object files) can link run flawlessly on all pre-R6
> (despite R3000) hardware with matching bitness, they were chosen as fallback here.

 I'm fine with having a MIPS1/R3000 exception for broken LLVM, but I see 
no reason to disable it for GCC.

  Maciej

