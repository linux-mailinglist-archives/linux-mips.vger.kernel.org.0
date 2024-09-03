Return-Path: <linux-mips+bounces-5306-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C696A59A
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E5AB1F212E9
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32F718EFF0;
	Tue,  3 Sep 2024 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyT0sV5q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4355918E349;
	Tue,  3 Sep 2024 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385463; cv=none; b=W0ELhHfGOX2HnRSqYDlzPkWWRv+WFodTdN4/82HIZc8nHI04VWxhQJYfw2mkvaA1puNVi9pa3D+beWklYVHO3CoUZSJKknx6a/K9+/HRmT3wJhKzMMukdUj9RzvL3ijmwSfGAmet5zQDYogX0yPuLpjoj5YvuRkE77k64fuiUP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385463; c=relaxed/simple;
	bh=DzpwJQwOT3F0kC0YR4xC7AP8eabN0PyPAbZ0DqFkPfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSyZ3WMDy4B/gqYRKLqcHOWcvEv68ltdbgsUm/IT86oyWYmhtbfHcIg3rlg/5UHfr3aB6jucYP8vC/TsYdvMCI/GecM6od3ll7qES73FIi3z4nYHio00GvlUhvEDnIf4l6yC/mItxgMs1OZ+2W70W7aKFvr1rGZZAT1gHvoqboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyT0sV5q; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71420e66ecfso448198b3a.0;
        Tue, 03 Sep 2024 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385462; x=1725990262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzpwJQwOT3F0kC0YR4xC7AP8eabN0PyPAbZ0DqFkPfA=;
        b=hyT0sV5qgZde0nI7ZfSGeCVNQ0dgwvKmWO8Rgmfr43z0xAqY8K86fnOioSK7Rhb9q1
         bS8+vG9uo8HBYQYCjCMHX/cMW4rfuo2YfEofaR2uxhCH43pwaixUGOjEyig4XMl6vHJw
         3l4xQIOQPQAMAVSVGG344UQ+rqr1Egxtpo2KSlOAfL0obCdSa9dh9ZQZoRsCvhOSDG7X
         //28GY/YVolDix3yaQluMItsZuv7wqfY9MtBLRgCQpKIpXngKYkkPquTOA4yt7nHbdG8
         4To1c8FKaHMftsyp6E7s/tYrFEqvsAZFFIF84dTl8soKutHFUzLFEXkc1oF2AU+I+LJT
         DwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385462; x=1725990262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzpwJQwOT3F0kC0YR4xC7AP8eabN0PyPAbZ0DqFkPfA=;
        b=NnW6EzHrvZnKk7OmhGi4QFbCCRYYE4DYuC9JFqi8zVLakrThNRVVH8HMJYiyNrmQGq
         waXgWGHUSkcRPBGp/3RXkCT/4CosgUY4JnvTRCBiPqh0CvspRmsjr9Hq+/P8MGRdE5KG
         99vAJbZTThyy4XSq0l5uHYUf6TM3c7lax0X4L0YNJtownnHeyVeEIlpfT29KxU6jOefC
         hjB4b6awWu23NBxLy1L3Xge01G3GtDBTq6VlGVCRCQXZWOcAxe0ferEDZ9DyoZcLXw/L
         o5nPp7PCWUSsvv1bb+1jZAe4yjcDO6PPBCmjFdHrPGStCoPNVQXWKTzn04zMnMbhU3ju
         afMw==
X-Forwarded-Encrypted: i=1; AJvYcCVzH1chRqYwzuBbwQ2c7U6k/ycw0N8zmN0Niudzcxp5cpeEP1978eW8vQLX5tiGMvgw0g5UGgwOPf19RDWs73JfOp5a@vger.kernel.org, AJvYcCWCBawhL4eEEDbwRbjFVUU0yg97Xf03CFjzyIlKCEvJZMankICHt1fBqZelIMMeFiLNX7RhfiagV9E=@vger.kernel.org, AJvYcCWH6TyaHgpAsuBnfCKHWIwnZKOSIjosT32gQwjGkt/b05hE08BkbSluvV/1xXhmu7qHKUSFx7LWKvjD5Vsh@vger.kernel.org, AJvYcCWm0/CgFFU+AeDxqpngsN5cJOa+XEiLUZl5llN3ZTIqODkkcK2PpRj322//T+itw3L12oD7BUsBf4YOVZd1aFM=@vger.kernel.org, AJvYcCWvUqUkApCohKWethdAD40M1gbbW6/nCMSnQPupih2/mgpUpQ0RdP4SpSX/Bk6tEq5vMMpWVgZM00dCS2uQ@vger.kernel.org, AJvYcCXNzsovo7TkIDUrk0lGPgTvxG4KTW25atBU/iFKoYiUcrgz4asAxdZazOEaFp540IVul+jsNiMSj11l8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTdYPFgJZ4k7M5XM16J1c+o+j6mZkHAVF/f3A351/pgpZOoFa
	ZHLJgu2VMOHh8Z3h8oTBkEWJELP/FNg2WEPyO6jvCrNsogcGBWJXd3HaidOocW0QbuDm4YSa8RT
	rKIEALwAeKwAlZrB6JP/ZUbbFJlY=
X-Google-Smtp-Source: AGHT+IEr2msm5yg48J8o10JFNcKqa18Qf0QpuKetck9mzQgqKhHQ/7Pg+OEHdxchtehB6dyn3bXmyxfB4BSsSfVqxbo=
X-Received: by 2002:a05:6a00:1816:b0:70e:acd0:d8b6 with SMTP id
 d2e1a72fcca58-71730458903mr8460968b3a.0.1725385461577; Tue, 03 Sep 2024
 10:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:44:08 +0200
Message-ID: <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
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
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> We don't use builtin target as there is no sutiable baremetal
> target for us that can cover all ISA variants supported by kernel.

Since we should try to go away from using `target.json`: what was not
possible to enable via e.g. `-Ctarget-features` or other flags? i.e. I
see the `+mips*` features there in the supported list, and from a
quick test the data layout also seems to match, but I assume I missed
something.

If it is not possible, then we should definitely ping upstream Rust about i=
t. :)

Cheers,
Miguel

