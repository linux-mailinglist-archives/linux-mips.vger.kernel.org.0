Return-Path: <linux-mips+bounces-5432-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E58379709C4
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 22:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 938E0282AFF
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 20:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FB6178CE4;
	Sun,  8 Sep 2024 20:43:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0B0175D4C;
	Sun,  8 Sep 2024 20:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725828193; cv=none; b=RUG+FA8pGqz4fLgnGzlIOhn6QSaHW0kL4aAxgNaFolJHv+u1095hU0zeZmQ7bec72w9EGsx+oj4Pz8WPGnazgg/fG1nsDOdekj3flOnRBiY8D3z+vjI+vL2C5ZG2GKiUjMrHamWCSzO5JNJUQxSysQAuCyxoJGH9pMhk5kPMMtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725828193; c=relaxed/simple;
	bh=f90I9bwSj2dxzrEciXcFScy+CumS9+bcyiuMt83JQhA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ur4HbL2YTEUvSvNqF88fAjo/jXP7cUxwD1uh2ziIgqGFLTIQ0bCnpLrDqKDZinFxoyYa1rukIGez4f9dK5hpCYsdsdceNisIuaf9KaLMkoRWa6w8lvmXG195dReqiOVWVQOUs7N48OZUD+XGqyLDbRaynwKgQ3s4VAq0jATHGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 96E4792009C; Sun,  8 Sep 2024 22:43:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8806B92009B;
	Sun,  8 Sep 2024 21:43:02 +0100 (BST)
Date: Sun, 8 Sep 2024 21:43:02 +0100 (BST)
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
Subject: Re: [PATCH v2 3/3] rust: Enable for MIPS
In-Reply-To: <20240905-mips-rust-v2-3-409d66819418@flygoat.com>
Message-ID: <alpine.DEB.2.21.2409082138160.60835@angie.orcam.me.uk>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com> <20240905-mips-rust-v2-3-409d66819418@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Sep 2024, Jiaxun Yang wrote:

> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 863720777313..bbdf8a4dd169 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
[...]
> +        } else {
> +            ts.push("arch", "mips");
> +            cfg.get("TARGET_ISA_REV").map(|isa_rev| {
> +                let feature = match isa_rev.as_str() {
> +                    "1" => ",+mips32",
> +                    "2" => ",+mips32r2",
> +                    "5" => ",+mips32r5",
> +                    "6" => ",+mips32r6",
> +                    _ => ",+mips2",

 What's the consequence of using `mips2' rather than `mips1' here?  How 
about other ISA revisions, e.g. `mips4' (that also applies to the 64BIT 
leg)?

  Maciej

