Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAC32E7D73
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 01:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgLaA3B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 19:29:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:55420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbgLaA3B (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Dec 2020 19:29:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0110620758;
        Thu, 31 Dec 2020 00:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609374500;
        bh=sbeAcjuc8bZ/vBOncjm7RqNqCDmIMZWSvdjprPBrXA4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ukGo3LkxxlUZ3c2D9utqPD5txnu7AuzsP406lbkaISC3tO3oZ/h37ubAWaPLR8NJa
         EyzPHMWY9Z0QDrfbMzLF88az2MDfrOq7KdW9Hq8uGq6uAfiY7Xr3S5hKpIGRe0cpyJ
         ZG1ivjXZ9spftO+OoORqQV4djYcpQ0vwW2V921tG9LjFoier1/uEcJ/TZrat2SmSPv
         WXnem5hXvlPLIn75boy73mURqkTzHSwJZ+KzZdaetFgZVeGTcq0uJR4xTHf6RZb/y3
         JN4QiYyQGz1QlIazzyzFFgBJRuv8X2PU5fJTqduNHNag9zQGA/d+lHXNnpOsJz7oxi
         tjcflVopR9wlw==
Received: by mail-il1-f173.google.com with SMTP id e7so12490567ile.7;
        Wed, 30 Dec 2020 16:28:19 -0800 (PST)
X-Gm-Message-State: AOAM5328n+zT9CRtBNbPgnqkrFxURcd7GBfZtLB566gl/984vPWkWwga
        pISMg3jEgx0Z+f0uqo8ZBjgTZAPxvTAiOdow1iQ=
X-Google-Smtp-Source: ABdhPJxxT7N8NJ3aJdfJ7giXI+tLfFafbwnyiHS1S3ST3Fwq1SpiKSC7OOQ5GBQVNOAxTDq1CFM1hM841hU14CgEzWQ=
X-Received: by 2002:a05:6e02:f88:: with SMTP id v8mr53892631ilo.270.1609374499463;
 Wed, 30 Dec 2020 16:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20201230034723.17266-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20201230034723.17266-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 31 Dec 2020 08:28:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5dU=sTPPxyoDP13Q_heVBg=FyC6-5wYFySya7RWy4DCw@mail.gmail.com>
Message-ID: <CAAhV-H5dU=sTPPxyoDP13Q_heVBg=FyC6-5wYFySya7RWy4DCw@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: zboot: head.S clean up
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Wed, Dec 30, 2020 at 11:49 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> .cprestore is removed as we don't expect Position Independent
> zboot ELF.
>
> .noreorder is also removed and rest instructions are massaged
> to improve readability.
>
> t9 register is used for indirect jump as MIPS ABI requirement.
>
> start label is removed as it already defined in LEAF.
>
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> --
> v2: Remove start label (paul)
> ---
>  arch/mips/boot/compressed/head.S | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> index 409cb483a9ff..070b2fbabae4 100644
> --- a/arch/mips/boot/compressed/head.S
> +++ b/arch/mips/boot/compressed/head.S
> @@ -15,10 +15,7 @@
>  #include <asm/asm.h>
>  #include <asm/regdef.h>
>
> -       .set noreorder
> -       .cprestore
>         LEAF(start)
> -start:
>         /* Save boot rom start args */
>         move    s0, a0
>         move    s1, a1
> @@ -35,21 +32,20 @@ start:
>         PTR_LA  a0, (.heap)          /* heap address */
>         PTR_LA  sp, (.stack + 8192)  /* stack address */
>
> -       PTR_LA  ra, 2f
> -       PTR_LA  k0, decompress_kernel
> -       jr      k0
> -        nop
> +       PTR_LA  t9, decompress_kernel
> +       jalr    t9
> +
>  2:
>         move    a0, s0
>         move    a1, s1
>         move    a2, s2
>         move    a3, s3
> -       PTR_LI  k0, KERNEL_ENTRY
> -       jr      k0
> -        nop
> +       PTR_LI  t9, KERNEL_ENTRY
> +       jalr    t9
> +
>  3:
>         b       3b
> -        nop
> +
>         END(start)
>
>         .comm .heap,BOOT_HEAP_SIZE,4
> --
> 2.30.0
>
