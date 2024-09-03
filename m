Return-Path: <linux-mips+bounces-5305-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6496A596
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E6A4B20F23
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2CB18EFC8;
	Tue,  3 Sep 2024 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMhGilmf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF018BC3A;
	Tue,  3 Sep 2024 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385440; cv=none; b=BBvj8KwdlTsIb0D0bgQC+o+QgTB3P7Uabrmjp+cO4ceYEgmwZEt3iiGI6iDN/p5zHDsHrAvFBcXDKJrgIVgcOlWeXy/+zrzJG6NbLI90xtSiDSLXyWcc6+KzG+lylUYYkHsIoFdfTytFO3FAVxw4dyVdGveOV2ag01/oa7crLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385440; c=relaxed/simple;
	bh=gi+yu/z+/Fjxnn4wuJ/sFP88katAdvUnvWOv4IPfnOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhSRSe81BEMC6uFjY09TQiPltz5/D+HLSM2XV/G9AHqUSdXJUFeDqaXIALUAoCzjqWjmivCmGjYkVhBss9eySBpLu2kfe23/Ta7+x9LtZC4HpJU7TRXrJH+5Pky1/ZXoiKtIF9F4A0qYpvbSji37yNExOFE6PUdB146loZoJ8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMhGilmf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71447da79e1so308364b3a.0;
        Tue, 03 Sep 2024 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385439; x=1725990239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi+yu/z+/Fjxnn4wuJ/sFP88katAdvUnvWOv4IPfnOI=;
        b=cMhGilmfpAT7xH2nI8o3HIdkUvaEMzWYMd5cTPoMEHWysp9x3HBJY2bRuwfkucyNGP
         Iwe7TlGK8ws/o6vocV6hH98eX/3nl8FnHR1DnmiROf2zPD1k+cY0+wVs1ro07DQF3Miu
         gaFtfi4JAx4d+joSAQ/rS7FjMlzNTchsmz4wujlX4Rq3x8z3Y75T6p3UOwstKiYRGUn0
         hfacwPP84WHfziF1A25EZCajPVTZi2UrKXmHhus7OmscLPn7D4vfLfIUmWsOu5vu0eqA
         oWJxgHFfFwE3QZAsmXZqsIEjrqI6Th4YM4yYiYrP8RqLBc0ay2VXZAIEE0f2F77LU655
         SJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385439; x=1725990239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi+yu/z+/Fjxnn4wuJ/sFP88katAdvUnvWOv4IPfnOI=;
        b=jv+APQHGwUFa2dh7ecxbCYM+y5EgcL+hJLWX5+JBMzJmg2/FpGJtoBGd1CmROu1kvI
         YhD56oE/VP6ihay4CFHI/HcZrowNvMLue3pkWbOguy2wEgbGSzlX2fdGPbU8LM11HLS/
         0ySeYlcX0nnwcJ7ILWAibI9TPW9Jlqp2ev3XjC727+UbuKiOW3oEe9VL3yyhYTnO6fCM
         14nsSy/bAPs7nDSJayN7QxKmPSv4rdrAUMpmPjhZf4Vv8DrD0zQrC9/Q3dtvtAn8jsuc
         7DSIslYB51+iRIHDRDCGlpkP6DcEFhZFHLzOYaFDQwyoh5lQIM/Vv1gyK0YTkO2mXdnA
         wwTA==
X-Forwarded-Encrypted: i=1; AJvYcCUim2GC69A6uNH0JT1kOIkTZ+jNrWoEyqx1dQSq5Vh7K8jMUl880ymLhNuJRaWTgs9wy9yiIAgloFH6Qg==@vger.kernel.org, AJvYcCUv17qgK1AvXuiXwpMf0sJuVBzdu1uT9Btbd2IRXH21PAwJPmbC+IldKWzTiElypqijYb0lQc7Sg8fI/f/U@vger.kernel.org, AJvYcCV7zgU5mYWQNv2tU2Wq20sTCA3PnwCBwsdnvJoFx5MpRmzPlrX6pcIyhxakCcvQGdpKax6/UrY/775SRcGZ@vger.kernel.org, AJvYcCWiPHiHtfe1CY9opo423ZwrFGbwh0EnMS2Srjx1Plhwgsd5UveX/QE4ThEDTRE02XLFwhJjavS3QTO1f4Ee5Fc=@vger.kernel.org, AJvYcCWt8ldtxEYwVXLT3u6OO3/H2znzFUtnXEUu/qen79nPlTQswmsmp3jfQbk9v55aRnURTKh1iFStkSvTBNOLCig0Mul+@vger.kernel.org, AJvYcCX/N12mxD01RpWJRkPMA/p42MA6YfKwqDeWcvImmHS/g8ZKI+kr2UwJe70wy706zE+qrzup2XFRe+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsSTfNopYOE79JaIXggC28ODkHr+9W4SCkqZsNaOHQRNZbrksZ
	Xs7UzqBLLT34FznTslb4U/ZsNtqjK5oW+UxMHy1GHUWBB7Pjjftd3ITV4XzXJ92DxjkKxKJ6rvA
	Sq4DzozNRsbtGvUEsnfhz9MsSOFQ=
X-Google-Smtp-Source: AGHT+IGOit+pKE1XEmbe1GmHAZjGSQFBSI/2mJn7mS7tx95JcJrV9hAXdxD2z8nbCI3vzg90VuXd/BAf95vimO+HTSw=
X-Received: by 2002:a05:6a20:c513:b0:1ce:f7fe:83ba with SMTP id
 adf61e73a8af0-1cef7fe848cmr1647514637.4.1725385438739; Tue, 03 Sep 2024
 10:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:43:46 +0200
Message-ID: <CANiq72mKZukJ+V_fXtvfBxN-WVBBOr1pZJ3iKrWgagTrJC4pdg@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: Rename mips_instruction type to workaround
 bindgen issue
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
> We have a union and a type both named after mips_instruction,
> rust bindgen is not happy with this kind of naming alias.

For this sort of thing, you may be able to add it to the block list at
`rust/bindgen_parameters`, so that you don't need to change any C
code.

I hope that helps!

Cheers,
Miguel

