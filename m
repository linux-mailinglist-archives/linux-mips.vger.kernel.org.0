Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07E72DCADB
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 03:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgLQCJf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 21:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgLQCJf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Dec 2020 21:09:35 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85EFC0617A6
        for <linux-mips@vger.kernel.org>; Wed, 16 Dec 2020 18:08:54 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b5so3158652pjl.0
        for <linux-mips@vger.kernel.org>; Wed, 16 Dec 2020 18:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eLKwGSpN1CIyR4Kd4zybrisCdZPTB+phRfHVeIVRLo=;
        b=frhvB+UsVAgIo3+VjtHXq3C6F2Vh8NZWIdF3ZC34I1OxFyPOl/MK2gMUGOv9oZomu1
         7ASJMsObwn6jcuWWQYh6ijoJ9+XXN6zDo2lYrOTdt5vc9fQO+5pKh3shKDZuH1EQ81zy
         eXozjgzjw7fegMSzt/ljyYbMYrbXobtVX9SB1Fa4rdqfafl83gtN9QcJQtS2aHi0481Q
         PpV62IwtPAOV+h23GiNXAw5L3oBOrJZQLg23D5IDOeZLNzHccE7flF4aXp2TsKQYw+D7
         t4Sdl0vBPfrAhLf2A5THCQH3AufaOgLUZUumivRQKcyPNFbkIuvi74QJdy6Y6JYFynJW
         rv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eLKwGSpN1CIyR4Kd4zybrisCdZPTB+phRfHVeIVRLo=;
        b=DdoZ6n4RHFcCHoCApG8DVJ4rp1j9YYis8OvlqWG7OZDengfhyeltcaUMW5R91tsl9H
         xAOW5ynYGV4P6Vf+d+5ItETBqWFy9wdb+h7PAWfJeisuM3/m2WRUzgANs1GeYCFpolQ4
         UKUFgkgFFEhdedWBQ0qzXRqKK+hFmY7U4dBBH4CAFULZsE3JBLsJvuZZQ9705kCSS5wg
         orcLGWQvPsc/SxhSjsw7oyWEyTnHruAngvwYxFTdVJ0w643ifvV3YQwvneDAaO9JFfoP
         aDbNGQLC+PtHFLrxLH/4v4CQARXhq0Y7fSAEXCKS7FcxMtkWcQbmJGsMT3iRqtpJFT9E
         9nPA==
X-Gm-Message-State: AOAM5304GHiq5Tt3Jh1if0DtwL+squT71V87wDlikMe75sEkPu0tVocB
        y84DfWxyRVjC573nROqQSRvqsry4DN+qT1Xga9n5TQ==
X-Google-Smtp-Source: ABdhPJyYAa4dCGGScl3comwtcPFfhEQus9OAPRGfcjasKlqBX0Jp6tUhcrNwRqTvB0iifU/UajVHGA3HBFklASpZjJ0=
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id
 b20-20020a170902ed14b02900da9da43091mr33856567pld.29.1608170934177; Wed, 16
 Dec 2020 18:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20201216233956.280068-1-paul@crapouillou.net>
In-Reply-To: <20201216233956.280068-1-paul@crapouillou.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 16 Dec 2020 18:08:42 -0800
Message-ID: <CAKwvOdnmt7v=+QdZbVYw9fDTeAhhHn0X++aLBa3uQVp7Gp=New@mail.gmail.com>
Subject: Re: [PATCH] MIPS: boot: Fix unaligned access with CONFIG_MIPS_RAW_APPENDED_DTB
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 16, 2020 at 3:40 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> The compressed payload is not necesarily 4-byte aligned, at least when
> compiling with Clang. In that case, the 4-byte value appended to the
> compressed payload that corresponds to the uncompressed kernel image
> size must be read using get_unaligned_le().

Should it be get_unaligned_le32()?

>
> This fixes Clang-built kernels not booting on MIPS (tested on a Ingenic
> JZ4770 board).
>
> Fixes: b8f54f2cde78 ("MIPS: ZBOOT: copy appended dtb to the end of the kernel")
> Cc: <stable@vger.kernel.org> # v4.7
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Hi Paul, thanks for the patch (and for testing with Clang)!
Alternatively, we could re-align __image_end to the next 4B multiple
via:

diff --git a/arch/mips/boot/compressed/ld.script
b/arch/mips/boot/compressed/ld.script
index 0ebb667274d6..349919eff5fb 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -27,6 +27,7 @@ SECTIONS
                /* Put the compressed image here */
                __image_begin = .;
                *(.image)
+               . = ALIGN(4);
                __image_end = .;
                CONSTRUCTORS
                . = ALIGN(16);

The tradeoff being up to 3 wasted bytes of padding in the compressed
image, vs fetching one value slower (assuming unaligned loads are
slower than aligned loads MIPS, IDK).  I doubt decompress_kernel is
called repeatedly, so let's take the byte saving approach of yours by
using unaligned loads!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/boot/compressed/decompress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
> index c61c641674e6..47c07990432b 100644
> --- a/arch/mips/boot/compressed/decompress.c
> +++ b/arch/mips/boot/compressed/decompress.c
> @@ -117,7 +117,7 @@ void decompress_kernel(unsigned long boot_heap_start)
>                 dtb_size = fdt_totalsize((void *)&__appended_dtb);
>
>                 /* last four bytes is always image size in little endian */
> -               image_size = le32_to_cpup((void *)&__image_end - 4);
> +               image_size = get_unaligned_le32((void *)&__image_end - 4);
>
>                 /* copy dtb to where the booted kernel will expect it */
>                 memcpy((void *)VMLINUX_LOAD_ADDRESS_ULL + image_size,
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
