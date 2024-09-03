Return-Path: <linux-mips+bounces-5304-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC296A590
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A4C2858C5
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF23C18EFDC;
	Tue,  3 Sep 2024 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUZMtyXH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0A418BC3A;
	Tue,  3 Sep 2024 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385414; cv=none; b=dl3oFkLheX6d8ty6LQvvbJ5QrO/m+CzUVifQXQq0IE8swU8PnwOGo5wuLcbuK2miSM3J34uvdNdOGiIP3RBpp5hnf+geSzcmzvLOzy05wpIlnme+ORBFIr/xUlY6AAxud07dn6LrkfvCCoUNm/czb1fmO+Xt3x9+w+uIp1v3m+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385414; c=relaxed/simple;
	bh=W2NvEDiPMdCRkIQi/U2zn9qbgZ8I+Gm2PHbpakhn09U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKXtO+qA+hG3e0rLHZFwk6XtjB025IEbEmd7uzvVN6geYMAx6M9HH0S4iArUTWAJUOTUlxadvwwbeNQ/AC8x5O6+i3BDjBKPDKpJiaCCgvzZE5ac8ubr1ODM4+qMlF6Or6Z3dWYx+vaBEUoKkMGEkI1KX+Slg59tRFwdLOKR/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUZMtyXH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d88a8c66b7so136645a91.1;
        Tue, 03 Sep 2024 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385412; x=1725990212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy49/AVvXvkuJP3eSVDqTTRc5F7gppOTJPxMN+eltxo=;
        b=EUZMtyXHxLNyclRiA3d6JyyAUj3NQkKYFDZTdFrHjPPrLVAYYdSHOFc1CDnp1b3VIA
         rHkXxyPOcQisqmV7wVpluHjOV31BCOLnlsdT30pv1+tSeowdChXTz74NG4gOWDAa/4kE
         XHRocy+Y9UvfaDVUEBi9WHzoqx/FuYLHn4bGE03GykvpzVR/ehzXjFf6Sf5PuJali+HZ
         UYTAK/ZFwY5ZgZAsZuxkRzXq+U41EjFcvomq8Sl0P2yKqsI2VAtdINN+kXxd7QI9QUCF
         U0lOIpK+caMWRY+2BzMotyqikquTuQEnY56xswE81EydxikwxXFLtQ2iyDkQGzfZDi6r
         gEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385412; x=1725990212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy49/AVvXvkuJP3eSVDqTTRc5F7gppOTJPxMN+eltxo=;
        b=dM0XGOWR0vfKp1IVjuvlRBmzECzhLBTWPFkyWwVjRBjpXJLdc8RR81gkIh+gQX9Swa
         Tf/7nfUgGIzl0ueVGSGgBNGKEcM+rRuef8m2kEZLRulOEnuRk7j5f7M6/atLji6iVVqB
         rMdVj79o3lWli6nzu2oIkpj75tSw9ylRjtWb/Z4CEnXMa/yZPfhU9WmlfGPYzdkJ2yMg
         zmDPuzl50eooGdPid20fPm+8VpV8TtZ+nlQ+ZycIge9uIEI7DhjEXxaHKEj9U2Mvxegv
         loYniRnGFz441uKdFWEw86JXr7NVIFEWMXj7Vf/gcFsgQeFiOp03YHJXz1IvKRd5w5C1
         AXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1Xhj3dVsvR0IeGikxwYwlUpVhUWTeceO2MaGrNw3NbQeLDAC0o24/HcUMcry9i/L2RMLroD0jDNmrvZYvXpES8eT@vger.kernel.org, AJvYcCV8QwmfEcaf9iCBTY6Afas8l+5g/cgY84RAtsJXDH2Ewt1vnOPz6NCUCMuRYr9pFYDXpriPGN9miUvJQJtd@vger.kernel.org, AJvYcCV8bxrt58GhQCQcepo0fzSDR1LXNyNMQSIEOLtNBRQkcvbxa3DM/Piq8O6d/HwTSRSSS0EB9bJ7k93yh23qpgQ=@vger.kernel.org, AJvYcCVO8j6ZSxlXgeIFm5IllkCizCaYwGt7YsEr5ld/+fFcTjatzF+4uEQgNJCr0IaFomo4FvVHHGiR+47W9OWV@vger.kernel.org, AJvYcCW2ZfUcDKeBfHL9fgWiONaoVypcVkdnAaVIJej4N+INOrE/mAsHzESsAyYlbx3LAzvdxA0oKEYGrtA=@vger.kernel.org, AJvYcCXi6Ef8pGtilB6RD0pQktgvKpDbJOR/YMcS+lXHr4uSvxEbhY2hoKPq6266WUD7Omn9VUgoC2KatMQdmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYIaerTbdX0xT6qW8mLQBTd1DBTIQK/iW1MN9st6icBhvndxF
	EBvQclrmJHWx8Qc1YprP+dn9I7M8Jcj2o/CpgqOLNvhX+8C82vT8I7zErgP1lmYL34Kfuwo6fMP
	WJRcaNjCltzmap2wQjJVqfolv9/c=
X-Google-Smtp-Source: AGHT+IEqKH0OWriiC8wInpcf2ZECoytsMPUwBDofLFkYfPN9ogN181tpD7iUm1gfTEwa1l2o3VI73EHRfYV1D0wWJPU=
X-Received: by 2002:a17:90a:ba93:b0:2d8:ca39:5972 with SMTP id
 98e67ed59e1d1-2d8ca3991a8mr4648735a91.1.1725385412437; Tue, 03 Sep 2024
 10:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:43:19 +0200
Message-ID: <CANiq72kx+aJXJCGPv6PazCQ7BnSDN56WyVFj=6e0FNRYqunSfw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config option
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> +

Spurious line?

> +config HAVE_GENERATE_RUST_TARGET
> +       bool
> +       depends on HAVE_RUST
> +       help
> +         This symbol should be selected by an architecture if it
> +         supports generating Rust target files with
> +         scripts/generate_rust_target.rs.

It should be more like "if it needs" rather than "if it supports",
i.e. the `target.json` is something that should be avoided if
possible, since the goal is to avoid depending on it in the future.

Cheers,
Miguel

