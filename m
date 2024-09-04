Return-Path: <linux-mips+bounces-5326-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3996B3F0
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 10:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2B728392D
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 08:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427EE17C203;
	Wed,  4 Sep 2024 08:12:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1783CC8;
	Wed,  4 Sep 2024 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725437573; cv=none; b=D75olnDBRhfcPYsmkfPuhnZxXA1IYZ3ULdYugy7VQpiZcKpPYRXQ70qXxu8VSD1tK4Xw/B0Af8qNnyVO6w5noX4rOD5zI6m+qF1bZm1Ymf5TV3Pkex4aQhi2E8DM7sk6H93JRp3zn7Vm7GkZzSP64TFtS8pWoKVahG2/dXGhfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725437573; c=relaxed/simple;
	bh=65cQQU+M2UnU5X6Ms72kWMCyjT6kucVE8wcCMX9suS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhmWsOhhMVKaKp7QEsKm4tTg9dwxKIk2u3vxQpf4uIosAfaA6JhIHa2OAwKh6GGsdFIzAe66WZ4Zeky3+VukYIkcVrnV5s5V9YYbrZOhgJoi77F9smFczaP0dGJ8nKaLd/WidHjV2jTRIZwRuYOuB2CATTTEn2pJAut2MeU5JZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e17c1881a52so331758276.0;
        Wed, 04 Sep 2024 01:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725437569; x=1726042369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mclf5cWZ7doo82bxSJ1tInXWyUxki/hxkifyVYswtWM=;
        b=F4mpiC22ZpflfuiiM4/lXrLRY7OTfbMPuyK0m02iXhQ12pQ09GBA2LOn/QR7SiD2tM
         v9WzaavnTELgxXj8HS0or7kb9dDQoPKlTSTs6R0GpPGFqsi89HrQepYPvvhieCuQBySq
         pwwRN3iLShnrbvKJ6RX4KNNP387/6QfKB/0k+OEO0nFn+rrBMaRd4/SFzCW1pLSjrA/N
         OfS1vOWLNN2F8taVa4oKLequnpBVAV1y3FboDpE3vj2q1fkJ/YNqqcRk8FIuSw1zSIxU
         gSFgi7997Z3YR4L9zNaOAEITd7OBG93mTD/ClYPUtRzIRlm1oeZk0vEP4sB7/OXDR7JW
         6PPg==
X-Forwarded-Encrypted: i=1; AJvYcCVNxlvzZLvtMI4bLAO4xhamq08x3Bjy/r4N/DeulADzx5+JcgeqzLhD/+0WGT++62PTP3rFSoJKF9XXlg==@vger.kernel.org, AJvYcCWDE65JwsnppsfM4k3wi5gvzxl8wtGPy6zkNXUmIO863pWx1QO/P8ORvdCkwNHANDoEMs+Foc9w37w10Drk@vger.kernel.org, AJvYcCWgylu+nNOq02xF+2JTjgImOeTuiFzX2kWbMLFMg40P131T+/PBjjaavvOO71PEb4tJyXWMEvqxpuCrDQnm@vger.kernel.org, AJvYcCXh6mf9foRHjZUC+DUDvg9YDZGOj7aApDL/pxwKmYpcgI9jwWb4qVPTO4nvFiR+xFLJtazQ/cwLiOQvh+496PU=@vger.kernel.org, AJvYcCXkFkvc+fMzuGhZfWVKjOTHuo8ab+gQJLKVcBS9arUbL/hwlonUwO5sopuAFU0ZKyZxVU+SEMZli8wvlmy2S7v8/Ejk@vger.kernel.org, AJvYcCXsb3RVq/rBMfBpJ8b3Zmdb9Nv3Hg+T8UJhGmy6l2a8snoyyrOPIrNrlrGcIW/ecntlskFSv4qac2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YztjeZBgIp1axkogJpgPacomNq9zUREAnHhHDLd4sbZwPPwcb8J
	bgWe2fEPWfavTxiXfpXyo7r+sVNjjjiOmcSeeL7LX7kBMbm5YuCeQ0q4PKNu
X-Google-Smtp-Source: AGHT+IGRFCsdqQLGpdas9pt7jPkVnbSeR+ActkhCb/ltZa/ps8gT/D14Xk053ij4LbbTQow/uahxRQ==
X-Received: by 2002:a05:6902:2d02:b0:e1a:7333:d63a with SMTP id 3f1490d57ef6-e1d10553609mr888235276.5.1725437569256;
        Wed, 04 Sep 2024 01:12:49 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a62361829sm2600860276.0.2024.09.04.01.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:12:47 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6cdae28014dso3826967b3.1;
        Wed, 04 Sep 2024 01:12:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwL81FgK9JRh5pGD2eupah9vvwSMLkHqUB7WGFq0O2XSAXp538ew5KXLLW1aqsTqrcEH3lRAzN2YNIIV7u@vger.kernel.org, AJvYcCW66kLPAwy2Rmhr5/0YhI2bG91A/CKCp1kj/tRUjIPp3r3U+zyjuqQhfwW8nYmS+OMb1cNfpAJMW9QPWw==@vger.kernel.org, AJvYcCWDIaxAZtHjy8TPJRNZEwuzAredARe01SEguBiy4AcPmxiMDPjrNGIcfbq2LswyTsnraxEDrMJTmD4ovOsi@vger.kernel.org, AJvYcCWpnwnRTKnPDhGt1ESxmxfhXCPVAd88MFLKqXW1K7/F6Pqqe7LKbRxjqOYO6U9uevQYTUau10iAgOQ=@vger.kernel.org, AJvYcCWqi9RGEnR1cwWYA5mVB9aLjD+YRRxGrmO1jsYQkA1Dt6iCQi5r5DaPAl+Z/XcI301hOYR4mMFKmZqHuDBavSY=@vger.kernel.org, AJvYcCXwmOUKuPi7uTUBiV3kNhozGqG07S/DIEPCHCvdz2Kv+/ckAh2w47HjEeBKZArXR9LsvR+lmK7A5p4B5ylfvSjHE9m/@vger.kernel.org
X-Received: by 2002:a05:690c:680b:b0:664:74cd:5548 with SMTP id
 00721157ae682-6db25f47819mr8680237b3.1.1725437566641; Wed, 04 Sep 2024
 01:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Sep 2024 10:12:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXC0ZBJibi=60VVG5mW1rwz=VgWxduph7SUxA4uyL5Mvw@mail.gmail.com>
Message-ID: <CAMuHMdXC0ZBJibi=60VVG5mW1rwz=VgWxduph7SUxA4uyL5Mvw@mail.gmail.com>
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

Hi Jiaxun,

Thanks for your patch!

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
> We have a union and a type both named after mips_instruction,
> rust bindgen is not happy with this kind of naming alias.
>
> Given that union mips_instruction is a part of UAPI, the only
> thing we can do is to rename mips_instruction type.
>
> Rename it as mips_insn, which is not conflicting with anything
> and fits the name of header.

Nit: the header is called inst.h, not insn.h.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/dsemul.h |  2 +-
>  arch/mips/include/asm/inst.h   |  6 +++---

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

