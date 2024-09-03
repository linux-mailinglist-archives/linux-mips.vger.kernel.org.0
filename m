Return-Path: <linux-mips+bounces-5313-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AE96A70C
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 21:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50ECE283F0B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C17205E2F;
	Tue,  3 Sep 2024 19:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw+//3ej"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AB201254;
	Tue,  3 Sep 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725390100; cv=none; b=uw0aX74dzSraUDwze1mVmJJOSq2xgynMrT3ZYw+r3WM/VQIjVVBj+4t1ZA+EKrnNeMyzO36L1/jFqCk9NtMdqxbLiuS8D+PtZiaQz8GsL8mc258EnhwX+bzMqUYH1Hzw2EmVH+464YV7/xNZ7sO8NaLJOZNNTiRE8zX8P3vBkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725390100; c=relaxed/simple;
	bh=KE5xWwHnPm+WIDf2FbxryrsTqOGezFO5SQcRnazmxKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kjzu+cUWdpZgL24f0AeRZ+MaaIy3B5nZhE+/CRQEDhpCKDIGoXZDF61f1klKiT7Sm+bltNWzcZRX9aSv/fmgojehIOBQ5Hk7sLA0NBlJPT6vm3HUBue/9JYUtNIn77jmFcK2Uq7X69aRSol5EyoAJCcJDpdT9SjsElDzWjEjUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw+//3ej; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2da516e6940so121730a91.3;
        Tue, 03 Sep 2024 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725390098; x=1725994898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE5xWwHnPm+WIDf2FbxryrsTqOGezFO5SQcRnazmxKM=;
        b=iw+//3ej9ZMZ1yKToRbCt5XbxgMQO7/fZoH3xmzGIoom2eZvoJJr5CNfjzfaWjB1IX
         ot94pRMPoIs0tXR+Tmrdn1HzvETCGCEtTNhZPdleCyFohmZXPb3zUlSqXED6jLkEO5A4
         Az5l9GkwCdjT3Wx1j+Uh+K53Xd1o+h0wg65NerJxPkZVQkk8naGX0aKoDPlt31KDS7On
         3w2Q/JMNXicH4Vu0ZW6FhBOSxa0sWAR0noq+FToOC3Ms4WMiGP+utnbyyx+Iz2PBvLXI
         7ZAixbn1ha32G6KTDpoZCPEDvlohrDGhQvAzaE1oc2Zo5qh3ZtFyjy1xhgjEBH3OCHgz
         F9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725390098; x=1725994898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE5xWwHnPm+WIDf2FbxryrsTqOGezFO5SQcRnazmxKM=;
        b=So55j8NoFXN33qos7R+WAEoCdRiySPKDp9Niae6YRwCtrGjuFI75sYYBDs5CPJjfLx
         Hucl5WMCl2Wak2Xcc6oS3K6C0srGqgB2g+e9GE4I+7ZqQOGk/7GtgOhXyYyTJf6HeQW9
         +YxjaZpqUJ/0ffjhncg8DHH1pEo/GEKrq52bAQPYXE6Ed4OnqIpdB4f3kBRBZyh6oTu2
         oEjQrlbkOkcuD88YZYndILMfravVIlTlwzRm8S023RlB0pqXvwf3a7wiyvoWBsj9Q++G
         mDKKYzgSYKvlq3AgXXal2jfBupioJEAq43IFuetSP5YgEky5PsBRI7Ryg2XIp6WkQwLb
         53IA==
X-Forwarded-Encrypted: i=1; AJvYcCUDBHcL6djoksYe7376qO8oxC2U1u7CMoFLcjhqy256FXGgudazWLM+LaK0iCs5xfyQggj0YqpmylsKzZk+@vger.kernel.org, AJvYcCUMnhgwIYMU/eBR3CetYv3nQXrR/0KPWH3YZiD3xoorVgcdBbVyIv3jEY6GFQp2NKD6Ch2m7xrL+1dU3DiSYuuxymO3@vger.kernel.org, AJvYcCV8AtvzHvkjtdbMScLMnK2OUCzefPM+atbrYGQxsFcoRwTTv33qUTzCWW69vQO7NbMNgoSodq+eBY3koC5j@vger.kernel.org, AJvYcCVIf6K7eEHewcCCXkxFAOYyYampiR7kt29kCR20HTUZKilOR9D7NJLeab7MaRtk3YYtt3812ijQH13CBXIZsSs=@vger.kernel.org, AJvYcCW+ru6IsmFFX1pBBQvJ7pt0wpKuibSrZ3SeB142eCRGrUH5bcpKrBh0v14Y2wQGXjujc1b9vPWnn33dxw==@vger.kernel.org, AJvYcCWxPi4SdtQYOcZdoLXXrNKICMD0WSlC5YmFBAUT7Ukc1OEqI0fgK0fP3pVq41x0o+wKNJIyYswscuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDI9YMK1nM37hoY3ZyQfUw99TIzWn2wV4SL4poAlNynRpcLlEm
	RSNvMrlhDrG8kyAiKquZOcCRBUSvthh8WxuKMeR6ld1D4HrH2XKIcG95wqB3+2pLIzdza+KMHfw
	t3UxB7WiFybm7+9QeOJGvf5M1kkI=
X-Google-Smtp-Source: AGHT+IGRHnvtSIMPglv/36A6hpMPDiFKSZKiUYGzC4lWBAVbp+fP4jGwB7yTCWBdu31Z0QsqEhbQ0JnFGvwe1zJu2gc=
X-Received: by 2002:a17:90a:dd88:b0:2c9:863c:604 with SMTP id
 98e67ed59e1d1-2d86b82a57amr8603316a91.3.1725390098481; Tue, 03 Sep 2024
 12:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com> <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com> <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
 <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com>
In-Reply-To: <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 21:01:23 +0200
Message-ID: <CANiq72mvTTgyTjDCWBz_kOdY1f4gopAtWxyC4P4c+Lr0YVkzLA@mail.gmail.com>
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

On Tue, Sep 3, 2024 at 8:32=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> Ahh thanks for the elaboration.

You're welcome!

> However, kernel supports many ISA variants that are not defined by any ru=
st target
> triple, I'm not really sure if it's appropriate to define them all in ups=
tream.

They need to be in upstream Rust somehow, because upstream Rust does
not want to stabilize `target.json` since it is too tied to LLVM (as
far as we have been told). Whether that is via `-Ctarget-feature`, or a
new `-Cglobal-target-feature`, or specific flags like `-Zfixed-x18`
(originally `-Ctarget-feature=3D+reserve-x18`), or (many) new target
triples for different combinations, or something else, it depends on
the case and what upstream Rust wants to do.

That is why we should tell them what is needed, ideally in a new issue
in upstream Rust, and link it in
https://github.com/Rust-for-Linux/linux/issues/355 (please see that
list for similar examples).

I hope that explains a bit more the context.

Cheers,
Miguel

