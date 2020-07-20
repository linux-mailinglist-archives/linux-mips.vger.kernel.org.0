Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5076225C59
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 12:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgGTKDn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 06:03:43 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40977 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGTKDn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 06:03:43 -0400
Received: by mail-io1-f68.google.com with SMTP id p205so16911446iod.8;
        Mon, 20 Jul 2020 03:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LfMkjlve+umafu2b9kaq1QVtcg2fakCMAu1E0vZcPhc=;
        b=L1haK1uD9caSQVSsNJLCTSf+iLrUF4V7UD2uqcFTtjV5PoTzs/UZpJmgZido5cQ5iV
         6/awqHHcR2/ED85fYyjjvx+UWN5poE1Yf31Jwb7oUL+0l5Ni4c17ZKXBtorf03sDBean
         zZb4P8LEBIDjTNss69FaPW9m1ZKiFtHz4BKgIfOg+3s6h+XkcUDiYFJJPcaoB6Q6IQxG
         Bz0gKI7VXYFP0bJSSww5qAmCrWCE0LN8k9Kps04AXxmZ35fPnfq1Ygb9I9NKfUzTfkBi
         eCYdiQ/ADo3FRd4TTmOYSJITPyQkyu+j5CV5RgqLH9oM2fsaAZ8aAqvTQ6j9iR/ZdVIe
         jESg==
X-Gm-Message-State: AOAM530BYgWfgN8TwA9VMVFQclLz/7nqaGZKfcFcdR/rKKQByHdbrSTy
        zFYR1I5ep6uxYQCWjNCh1ljB5vJEZ0ZFm+HIPxU=
X-Google-Smtp-Source: ABdhPJwRZzzyScQp7O3xKTtSgAG6gq0krXRSgOszXlAIMTPuEofrPLkeLRuQhYQZDANrjByvsOVuFe155zXEsy/unbo=
X-Received: by 2002:a6b:ba03:: with SMTP id k3mr15176905iof.72.1595239422312;
 Mon, 20 Jul 2020 03:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com> <20200720074249.596364-4-jiaxun.yang@flygoat.com>
In-Reply-To: <20200720074249.596364-4-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 20 Jul 2020 18:03:30 +0800
Message-ID: <CAAhV-H5sYFUnzgdJwV1SUpfJeZPMTsUVP3i-R0sebi2y9oW_cg@mail.gmail.com>
Subject: Re: [PATCH 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Mon, Jul 20, 2020 at 3:45 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> It can be very big on LS7A PCH systems.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/io.h                     | 3 ++-
>  arch/mips/include/asm/mach-loongson64/spaces.h | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 346fffd9e972..0072489325fa 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -50,8 +50,9 @@
>  # define __relaxed_ioswabq ioswabq
>
>  /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
> -
> +#ifndef IO_SPACE_LIMIT
>  #define IO_SPACE_LIMIT 0xffff
> +#endif
>
>  /*
>   * On MIPS I/O ports are memory mapped, so we access them using normal
> diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
> index 3de0ac9d8829..b99b43854929 100644
> --- a/arch/mips/include/asm/mach-loongson64/spaces.h
> +++ b/arch/mips/include/asm/mach-loongson64/spaces.h
> @@ -11,8 +11,7 @@
>  #define PCI_IOSIZE     SZ_16M
>  #define MAP_BASE       (PCI_IOBASE + PCI_IOSIZE)
>
> -/* Reserved at the start of PCI_IOBASE for legacy drivers */
> -#define MMIO_LOWER_RESERVED    0x10000
> +#define IO_SPACE_LIMIT 0x00ffffff
Maybe using 0xffffff is better?

Huacai
>
>  #include <asm/mach-generic/spaces.h>
>  #endif
> --
> 2.28.0.rc1
>
