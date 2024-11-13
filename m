Return-Path: <linux-mips+bounces-6734-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E19C66D2
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 02:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 464D2B235BA
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 01:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943082D05E;
	Wed, 13 Nov 2024 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scKa9uGK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2B18654;
	Wed, 13 Nov 2024 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731462015; cv=none; b=AYzT8HBdr9pZd5fev7PFp+txsYlL74dTDnuODesR4edCxoIBKogV2304eiEGcTHFqHStV2p5bbFpxoLou4AxUPQdFVpqFgqP9+Efq6Y3D1vaV7mAf1MCuJV33aUk1yKabix8HATcOaG9Nlyaj0A7R9V13DRliuBRIEcj22+/2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731462015; c=relaxed/simple;
	bh=rHxJ2TVuYJsLYC5DVhiZWFutshm4j5P4xFxzX6RTNLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjlnvpS6wgsRTj4ep7fUr6t/gy/AbEqi4hIvrzg8YmL5IE9Wp9kU8+QrLJT0jEZC/bZ9K655hUwMCDy/QdDWKo13zIgOkc8w/pelFddZnQMxroBASXV0OJ9ju6h/0CKvgyqqGxACanKknj9S3KQTKL/fi32dRXn/3JGl8zSuPZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scKa9uGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EBDC4CECD;
	Wed, 13 Nov 2024 01:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731462015;
	bh=rHxJ2TVuYJsLYC5DVhiZWFutshm4j5P4xFxzX6RTNLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=scKa9uGKbi3jLr0+jtsLg5B4th/qTqmSxYVO2mRy3vZEuBByg/J2pNjfP5BKhX6LN
	 laLHfk4KQzekCZBE+1Q3NKOwTV0YDs5CRDmkffl9aGXB5jpZueQZqwl7JMgXX92xB8
	 PjzFESBNFqBrUCooA2UvBxOPAaX0HS8Sd8P8yrm8YgnAxsdMOccpUhdpr+AV4VgNiH
	 c98vqIDiAiia8ti2gia4OnO+k+Nk1ScFzar5JZqaBX8seqyRc9nf5sMF6PvKalwFF2
	 BA9G+TJOCo5VIs7QAJu6bEhLsYVHatf+y3aBm7jPriA2IzEAu8qElyAhpCAiJvHq1R
	 tPovBy3aFSJDg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so55823931fa.2;
        Tue, 12 Nov 2024 17:40:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvDViofV1+1B2ugSDJje1EcI9xC27F7K7WaBycxdQk2U+oFqG+slFIwh5LE7uHLSzjwaeTvLcHtXI0q8g=@vger.kernel.org, AJvYcCXLcI7YZPF1Pnggz0ifrOmxHQI7XgaEQDYdCRLpqU2jqu0RguM2lYLTTzwd8nTaONWdiaOzyVAOtsUBkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQE9q5dwSzQfJ64JLTShdEbtn9DJl1BMmttcXI1L9/Yhk5r9u8
	Vy4h9ZuCsNl3bU8owJfegEsVgEmM1YDJ+ag42RLHgvVkIZ3Cs1/kmLyr+u48mUmilaxQWv+K+wW
	uvAuCsPA32tg3F+xqffnUVHatWgE=
X-Google-Smtp-Source: AGHT+IHyNcZmOt+6MvM9q43LvITnp9G9hEJq1I2YZXEyO3rQ6xssCrv5UCPQZSwfF12QjNCz87JIW/nXkz768gFR2Lg=
X-Received: by 2002:a05:651c:554:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2ff20209f08mr88327041fa.23.1731462013662; Tue, 12 Nov 2024
 17:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112200827.2594291-1-xur@google.com>
In-Reply-To: <20241112200827.2594291-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 Nov 2024 10:39:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_Si3feoaHujiWF0nHCu_kqb=3rrQf=OX1CoTDdZtjVA@mail.gmail.com>
Message-ID: <CAK7LNAQ_Si3feoaHujiWF0nHCu_kqb=3rrQf=OX1CoTDdZtjVA@mail.gmail.com>
Subject: Re: [PATCH] vmlinux.lds.S: Explicitly set _stext for mips
To: Rong Xu <xur@google.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Klara Modin <klarasmodin@gmail.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please use "MIPS:" for the subject prefix
because this patch only affects MIPS.



On Wed, Nov 13, 2024 at 5:08=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> With commit 622240ea8d71 ("vmlinux.lds.h: Adjust symbol ordering in
> text output section"), symobls in sections .text.unlikely will be
> placed before symbols in .text. This can lead to the misplacement
> of _stext, which resides in the .text section, and result in a boot
> hang.
>
> Explicitly set _stext to the beginning of text output section.


I will insert this patch before 622240ea8d71 to avoid breakage.

Please rephrase the commit description without referring to
622240ea8d71.


For example, you can say as follows:

------------->-----------
MIPS: move _stext definition to vmlinux.lds.S

The _stext symbol is intended to reference the start of the text section.
However, it currently relies on a fragile link order because the existing
EXPORT(_stext) resides within the .text section, which is not guaranteed
to be placed first.

Move the _stext definition to the linker script to enforce an explicit
ordering.
------------->-----------


Please feel free to update the description, but this must be
fixed regardless of your patch set.

Even without your patch set, the .text section
comes after .text.hot. So, it is broken.

#define TEXT_TEXT                                                       \
                ALIGN_FUNCTION();                                       \
                *(.text.hot .text.hot.*)                                \
                *(TEXT_MAIN .text.fixup)                                \




> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Tested-by: Klara Modin <klarasmodin@gmail.com>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.ld=
s.S
> index 9ff55cb80a64..62c3db869a18 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -61,6 +61,11 @@ SECTIONS
>         /* read-only */
>         _text =3D .;      /* Text and read-only data */
>         .text : {
> +               /* Explicitly set _stext to the beginning of text output
> +                  section. _stext is in text section and might be matche=
d
> +                  after symbols in sections with a specific prefix (like
> +                  .text.unlikely).  */

I do not think this comment is necessary
because this is a common pattern.

The typical linker script example is documented.
https://github.com/torvalds/linux/blob/v6.11-rc7/include/asm-generic/vmlinu=
x.lds.h#L21




Many architectures define _stext in vmlinux.lds.S
without such verbose comments.

$ find . -name vmlinux.lds.S | xargs grep "_stext =3D"
./arch/mips/kernel/vmlinux.lds.S: _stext =3D . ;
./arch/openrisc/kernel/vmlinux.lds.S:          _stext =3D .;
./arch/xtensa/kernel/vmlinux.lds.S:  _stext =3D .;
./arch/s390/kernel/vmlinux.lds.S: _stext =3D .; /* Start of text section */
./arch/nios2/kernel/vmlinux.lds.S: _stext =3D .;
./arch/loongarch/kernel/vmlinux.lds.S: _stext =3D .;
./arch/x86/kernel/vmlinux.lds.S: _stext =3D .;
./arch/riscv/kernel/vmlinux.lds.S: _stext =3D .;
./arch/parisc/kernel/vmlinux.lds.S: _stext =3D .;
./arch/csky/kernel/vmlinux.lds.S: _stext =3D .;
./arch/arc/kernel/vmlinux.lds.S: _stext =3D .;
./arch/arm64/kernel/vmlinux.lds.S: _stext =3D .; /* Text and read-only data=
 */
./arch/arm/kernel/vmlinux.lds.S: _stext =3D .; /* Text and read-only data *=
/
./arch/hexagon/kernel/vmlinux.lds.S: _stext =3D .;
./arch/powerpc/kernel/vmlinux.lds.S: _stext =3D .;
./arch/microblaze/kernel/vmlinux.lds.S: _stext =3D . ;




> +               _stext =3D .;

_etext is defined outside the .text {} block.

If you want "_stext" and "_etext" to look symmetrical,
perhaps you might want to change like this?


diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.=
S
index 9ff55cb80a64..d575f945d422 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -60,6 +60,7 @@ SECTIONS
        . =3D LINKER_LOAD_ADDRESS;
        /* read-only */
        _text =3D .;      /* Text and read-only data */
+       _stext =3D .;
        .text : {
                TEXT_TEXT
                SCHED_TEXT




If you move the _stext definition to the linker script,
you can remove EXPORT(_stext) from
arch/mips/kernel/head.S







--
Best Regards
Masahiro Yamada

