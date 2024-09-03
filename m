Return-Path: <linux-mips+bounces-5311-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56B96A64C
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 20:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 054CE1F23C7D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 18:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2415C19047C;
	Tue,  3 Sep 2024 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka7gwTor"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259618BB89;
	Tue,  3 Sep 2024 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387439; cv=none; b=TgvS+tsq0GaUN3PvbzLwZzxs4Gr2vqnjFNC34xlCnZAeo6b471rs4HSpZMXV/z5i0wAmKDtEu+GIv99FTQdpxUhMDY/WpKILgguekjFw5RQ1VqSd4ShxZw1dBjWVnPvOUwBjZgbGYcUFfIHO3Sd2A8LLfJRCuOYVrMZdTMbSVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387439; c=relaxed/simple;
	bh=72SwK870brWuO+1H7M3ZgRnMKAN3mk5VB6H1CyKczVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glfAPuT0mStrDuJdUktejeWm46u/JYnYuhFBU57Jw96pabtztcncZQfXCAVOzj8nPuPoM5nhevEPHmkVZ5aS1hFMHh3JnjwHTF2pEzQM5MaRnU+fOM/bWaKwMkZYwcwtwnnVMo/AWBeyctQTFD9nErAbvx4wnBXYJXbSTu4LGD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka7gwTor; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d88ec20283so200492a91.0;
        Tue, 03 Sep 2024 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725387437; x=1725992237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCRq6ERVuiYfqPwMIYcT8lbPZnFxke33M5BuFbK5HIg=;
        b=Ka7gwTorlj2Fywai5mXwRlCuNaBaQpElz5O7QEltvWMQST6AbpJiLilfaSNDNHM1aN
         D0HSUWrtH87B1HypBmwIqfYvFN0yCQPunRXAIGhzqiSy7/1Nyb+tdgrX+8YtTUfGr27G
         IuK6KsBCJUXYScM1PIdxXqfSrJQ2dKeJbdqFXirIEC7fXCozaqAQaWzmo0skQS2i0dzv
         v7vASJJtJDYbZ8TMxlQ9EjJ6XqM7qMJNJ0VqIFEKYLqfxHIOIFD8cpKvw59JDNbuCzO6
         S8E9jjwhkt2YPW8/S20kxjLqZ9ZjJEvbiq6FqF66x9JU2EW6rkK+QwEmGbw5hKn6CHmN
         phQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725387437; x=1725992237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCRq6ERVuiYfqPwMIYcT8lbPZnFxke33M5BuFbK5HIg=;
        b=LJB7t2Rp3xKiwmPI3s6JPjbqbIPNYK+7UHuyVymVwkhjK13VTf3YkGYUrTO5ofVQ5L
         fKu7FQlAsqLQ96JlVVOX9XKe8DOQRyhNFiM4o+VYpXR5wy+YyJ2V6AStfGg2rdQCSy8W
         zKBAZwPejK61s07wS/Y3MuCBuUrjV8jpwTSJK2EYiSiytiCjtBOGoEC7himHVf9enfDG
         zdQIJajAZCCFGlPaZ6Zp1g2+gGppz6ltmubN3q8O8IRF4CeIT4ZHVeIda5pL7kj4SW7D
         ThZdd0//1cA1M8qwAhjWDg9GtP0/QHE+YbH9jjXOLERXDxFTEgRM5padN74K3yzcrexG
         +Cng==
X-Forwarded-Encrypted: i=1; AJvYcCU3GgEYeeoNbYT7NZ0bx8Mf9O+x6ZyDwyGNVlWUt8yU2X0AAiVBW0qo6SIDa4DDGaS5t0C3nqigg5M=@vger.kernel.org, AJvYcCVR3IXzzdrMYSQeKu5DPzdPUDyJfzL35Il2WZYZ0B/WrOu2oMe/CiDtiO4K9S4SYmvrqcKsa/VojcPL3oNt@vger.kernel.org, AJvYcCVcA+hq1dGgbUvB+C2/TQmzYEtp1uO3OaXmaMBlrdVPc//bnDuO7Apr+diDgMMWEZLgqAZf9IldRMawDu8m79o=@vger.kernel.org, AJvYcCWtohUHE1ZGkpYoG2DN2sazcIV7GFtJ1Lms1RtLZeCqkDXUu+KTQMa8JncO/BfoapCK4c8m5baW7+92MQ==@vger.kernel.org, AJvYcCXB8xVeRc0bc+Mb8EUL2ik19xbn8xAQBuuWzHGNaeGitqQygODXrw/CcjDDQDcJhWAiGAmswmU3/OhBv5YtCxnAPnrz@vger.kernel.org, AJvYcCXmzAXEFNDrmVjnvS8mKPMb6G2KM+iB3669EymwovNkqva1d4nT4EKwCp7JzflBvQISKBh/AYmK6mgdJZys@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVfFmsCMPXZwPsRtCIHkc4vXeitMKzfm2JwDgj+7hRIWiaZTf
	nAxRgA2dMQeu2IdhBpbjmcmX0CGDRHckWQpyeEFobyqv6wfc7RQ/eTbMdgdS8HqDTlb0GwN5cIA
	5AhrEAo0UVsN+ntEZYK0abdwNE2k=
X-Google-Smtp-Source: AGHT+IG32aDLtHKi6AhxBeXK5jquJ2AWi/0PseceBjRwkozuKShq4rru0SzsbIiSg4LmaHN2BLYJYbySTLJ6lDehrcs=
X-Received: by 2002:a17:90a:ee8f:b0:2da:5aa5:5d5b with SMTP id
 98e67ed59e1d1-2da5aa560f4mr2043322a91.3.1725387436834; Tue, 03 Sep 2024
 11:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com> <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
In-Reply-To: <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 20:17:04 +0200
Message-ID: <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
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
	rust-for-linux@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:53=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> Thanks for your review!

You're welcome!

> Triples defined for MIPS bare-metal target is surprisingly lacking, we do=
 have
> little-endian 32-bit bare-metal target mipsel-unknown-none but big-endian=
 and
> 64 bit variants are missing.

Hmm... Sorry if this may be too naive, since I have no expertise on
MIPS, but I see some triples that match the LLVM ones you specify in
the patch:

    rustc --print target-list | grep mips

> Also, those triples all assumed +mips32r2 as baseline ISA, but kernel act=
ually needs
> some other ISA variant features.

I guess you mean you are getting the warning about the
unknown/unstable feature passed to the backend? i.e. `rustc` knows
about those LLVM ones and forwards them when enabled via
`-Ctarget-feature` (with a warning):

    rustc --target mips64-unknown-linux-gnuabi64 --print target-features

So they would need to be added to the list at [1] (or targeted flags create=
d).

Until those do not emit a warning, it is fine using the `target.json`,
but I wanted to understand if there is something else you may need,
since we will need to eventually avoid the `target.json`, so it is
best asking upstream as soon as possible.

Thanks!

[1] https://github.com/rust-lang/rust/blob/d6c8169c186ab16a3404cd0d08666740=
18e8a19e/compiler/rustc_target/src/target_features.rs#L368

Cheers,
Miguel

