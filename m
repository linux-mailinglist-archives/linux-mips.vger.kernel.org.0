Return-Path: <linux-mips+bounces-6741-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2C9C7D92
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 22:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34B49B2C336
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 21:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A31A20968F;
	Wed, 13 Nov 2024 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0RIeqY6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7415A13B2A9;
	Wed, 13 Nov 2024 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532554; cv=none; b=QnJ5U94oNeyYAq7MBOe3WU8ua98RKveVhNiiYlDkV8+S2o94vKpt8J6u6jZA60XZSsdl5o/O3fe4YjxKFQX4HrKexJKFTHv3rk1X7/YXI6xCe7BP8nEiUm15H5fVJnvl2cJAi6gGlciXsctAnTh/Q806hMixDBw5R/sbmMTLk5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532554; c=relaxed/simple;
	bh=s/XqLUZymfSw8IEs2DsLGme06ewzOU94IVjTyVlQslI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kG/lk6q4yb4iL+Gjmgt4OBwxVEX9/edG9GapBMgCW15KmEmBXmD9kiqASYts5qcWKApczx4J9YT0I7tOGxMZ/0i/4/0J8/9BmLw8tCQnzFv9IkoCBnukJsb9mSckCz/gTt+8eAosY81I55eIDKj2G4HYx8GAa+zVRizGK6XrgoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0RIeqY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1382EC4CED5;
	Wed, 13 Nov 2024 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731532554;
	bh=s/XqLUZymfSw8IEs2DsLGme06ewzOU94IVjTyVlQslI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C0RIeqY6OrdQEwLG3uctHvZeLy9Y1/+jig+0qRYePxip2jOW7/V9pXtLZMNHf4F75
	 /4rzPUqvdCHcnS0ahDTFX5oKqhZpJsdz4FGY3SdtoiTYfJuSI1Yk6F1HVvNi8PUvSg
	 KAJa29vPTfW69lnAXvkQvcDG8PhImDN4sLoaG536QhrzDHKOWYvCJFd3E67lvh4jQC
	 uJXF1yS/LB5aJQubSOUNMy/0VLrVqKf3hmHmOTyGXcTYpCrSiT0FSEGpq5y9LrlyzT
	 zND5wMIJuC/7nUYhOOKCT5TZXjc8afPq3QwFeaKcyMaPivNgGFxUYEhwnYP/+W3oF/
	 VMzmXEH8kktGw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53da4fd084dso110687e87.0;
        Wed, 13 Nov 2024 13:15:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1IDhbVFkh6MQ2Zx9bojqK/rs/lqGFzWDxm1jW6+yqGcvVaXBtkWWpoRwh2LDpTNJ02YdLe103hiJyAZk=@vger.kernel.org, AJvYcCXiEFZ+I0AcD1rKYqbC323AZOnMghznFvEKsrcrw9TG0fpH9DxjSRrvtXruhBM+GXqnbOS+ZfyTYRHpiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhCJnk1x60BkSNMLgjn8/ZvE1GNH1FBG2PSwcOSRliwj/YMtba
	cTh+ZRgdGxWM46e9k94Tj3ZOH7lNlIB6y3qxyfTyeN3edmGh6mQ+a8XcYWi+izn8VwCECp8zbuL
	NyjqaWicOilXtsaurLvhrzhOEpXA=
X-Google-Smtp-Source: AGHT+IGAXpxw9mkdTHGUVikiAd4rmF0lrtiDZf0/kaxpMD1vRn8C16zBWsM5S50Vgqa4R7kSuOUxxn3LsbwASEypL+I=
X-Received: by 2002:a05:6512:12ca:b0:53d:a1f2:5d4d with SMTP id
 2adb3069b0e04-53da47cbfe4mr310801e87.22.1731532552697; Wed, 13 Nov 2024
 13:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113064028.2795128-1-xur@google.com> <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 14 Nov 2024 06:15:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+-SCOHORKqA0S=ec8-ziFhkSVgKUY7EN6qEWXePouJQ@mail.gmail.com>
Message-ID: <CAK7LNAR+-SCOHORKqA0S=ec8-ziFhkSVgKUY7EN6qEWXePouJQ@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Rong Xu <xur@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Klara Modin <klarasmodin@gmail.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 12:55=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
> On Tue, 12 Nov 2024, Rong Xu wrote:
>
> > The _stext symbol is intended to reference the start of the text sectio=
n.
> > However, it currently relies on a fragile link order because the existi=
ng
> > EXPORT(_stext) resides within the .text section, which is not guarantee=
d
> > to be placed first.
>
>  Umm, arch/mips/kernel/head.S does mean to be linked first.  We rely on i=
t
> for environments where there's no entry point is available and execution
> starts from the beginning of the image.  See the comment right below your
> change.
>
> > Move the _stext definition to the linker script to enforce an explicit
> > ordering.
>
>  So if you say that the link order is fragile (which it may well be), the=
n
> that problem has to be fixed instead, likely with the linker script too,
> and then perhaps an ASSERT placed there to verify that it has worked and
> `_stext' refers to the beginning, taking into account what follows too.


arch/mips/kernel/head.S is always passed as the first object
in the link command because it is listed in scripts/head-object-list.txt

What you missed to understand is, the .text section of the first object
is NOT guaranteed to be placed at the start of the image.


Assume, we pass 3 objects, head.o, foo.o, bar.o to the linker
in this order.

- head.o  contains a .text section
- foo.o contains .text and .text.hot sections
- bar.o contains .text and .text.hot sections


The output will contain the sections in this order:
   foo.o#.text.hot
   bar.o#.text.hot
   head.o#.text
   foo.o#.text
   bar.o#.text


This result comes from the fact that TEXT_MAIN
is not necessarily placed first.

See the macro in include/asm-generic/vmlinux.lds.h

#define TEXT_TEXT                                                       \
                ALIGN_FUNCTION();                                       \
                *(.text.hot .text.hot.*)                                \
                *(TEXT_MAIN .text.fixup)                                \
                *(.text.unlikely .text.unlikely.*)                      \
                *(.text.unknown .text.unknown.*)                        \




BTW, "head.o must be passed to the linker as the first object"
is a bad convention in old days.
If you expect the entry point at the beginning of the kernel image,
it must be marked as __HEAD, which is placed in the .head.text section.

See commit ce697ccee1a8

Well-maintained architectures got rid of
stupid "head.o must be passed first" requirement:

 - 2348e6bf4421
 - 994b7ac1697b
 - 5353fff29e42

If MIPS migrates to the cleaner __HEAD solution,
it will be appreciated, but this is another story.




>  Also note that `_stext' currently points beyond the space reserved for
> exception handlers.  Have you analysed what the consequences would be if
> it was moved ahead of it, which your change does AFAICT?
>
>   Maciej







--=20
Best Regards
Masahiro Yamada

