Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5032C8F55
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 21:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgK3Uk6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 15:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbgK3Uk5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 15:40:57 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691F5C0613D2
        for <linux-mips@vger.kernel.org>; Mon, 30 Nov 2020 12:40:17 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id b23so7141711pls.11
        for <linux-mips@vger.kernel.org>; Mon, 30 Nov 2020 12:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I8qDHQ/jUJK0YpI0GEkFGscMHRpymFfegAxsOzmAN4o=;
        b=vKKvL0gSMSqXwlr7CWPakDN7FowAyRokdIheSsMlemhQVl6ts18545CislkpLSWysc
         sgYS2dBCHjC8OSmrGZd2P8cebt4X0r/HVzXh83fIgWpTjAGz2Zj79S4kQxGuKjkwv26d
         WtzZrOGUdUBGz/hAtog8jfPxxx4b63nZAY7RrL7gJ9KFqCZ/eDf16taoI7YaT3CR3FZ5
         W8fqG5uo28c1P3UfqbMsKlXfazJJrHo76qowhMJ4ctW5xb6Csp4wZ9AeP0ApKOlkJqaV
         tRRdJkGrdYui/pFCpMKiWhHOfG8rfZ1SQ0k08+2AVKZxQ/dsO4Aa7RGc2I65Hp5snHsS
         itNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8qDHQ/jUJK0YpI0GEkFGscMHRpymFfegAxsOzmAN4o=;
        b=Y+l3UGwuYlcmJFnxNuOf/ivG60e9iT/zpbfe0X4CkF4IGuzVgoAxMGJp3hu9bUi0hy
         gNWN/Yb6i8mn2sTznr6jzzW4dSQoYta8w400V6unls4gPSgYYcns610xNjifkn0NLs9I
         CJvHJ3ome4+euHQRiE+Z8lPv33qoEoZWKItTlELTUyTQRRygRFJdf5mPMpS5ZkAcql0e
         fJEky9e/Dfh5idP44F8ol9+J8l9YWqGGOMbvclHaVRkVHTUkM4PDtu7Zvu4DqEmVJ9VC
         S8lEk20FGI0eFiY5ugPBEOdbdbfNzbPvWJH5t2Hku1SFGcZ/rMtHrlHpFnyWbteSBkKI
         dZDg==
X-Gm-Message-State: AOAM5306iVMV77JL/A96tkg/XvTWLwBQlEjhAjKnaPXao0TT+FsQjmz0
        bODd3wWb5f28epNcNLiQDdnp4v3SrQzsxOj6+Xngog==
X-Google-Smtp-Source: ABdhPJxzHv3eSeulfLq4rj3g9oM3CQYlz4W3qtyz9ucpsFnsNiqD2Qg0/yPaLGZ7mbFt7YwEGQjlxLUGGJQ2dC90IHs=
X-Received: by 2002:a17:902:221:b029:d8:f938:b112 with SMTP id
 30-20020a1709020221b02900d8f938b112mr20664724plc.10.1606768816582; Mon, 30
 Nov 2020 12:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20201127083943.2666864-1-anders.roxell@linaro.org>
In-Reply-To: <20201127083943.2666864-1-anders.roxell@linaro.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 30 Nov 2020 12:40:05 -0800
Message-ID: <CAKwvOdmtT+DtK6Fs0TdGaObuSHY5C7Ssrx9-5nv+ZUB6uuz3+A@mail.gmail.com>
Subject: Re: [PATCH] mips: fix Section mismatch in reference
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        chenhc@lemote.com, taohl@lemote.com, yanh@lemote.com,
        alex.smith@imgtec.com, zhangfx@lemote.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 27, 2020 at 12:39 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building mips tinyconfig with clang the following error show up:
>
> WARNING: modpost: vmlinux.o(.text+0x1940c): Section mismatch in reference from the function r4k_cache_init() to the function .init.text:loongson3_sc_init()
> The function r4k_cache_init() references
> the function __init loongson3_sc_init().

Looks like loongson2_sc_init() might also have the same problem? (Both
loongson2_sc_init  and loongson3_sc_init are called from non-__init
setup_scache).  Trying to pinpoint a Fixes tag is tricky, it looks
like setup_scache used to be marked __init, then __cpuinit?

> This is often because r4k_cache_init lacks a __init
> annotation or the annotation of loongson3_sc_init is wrong.
>
> Remove marked __init from function loongson3_sc_init(),
> mips_sc_probe_cm3(), and mips_sc_probe().

mips_sc_probe_cm3() is only called from mips_sc_probe() which is
marked as __init.  mips_sc_probe is only called from mips_sc_init,
which is not marked __init.

So the patch is fine (and thanks for sending it):

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

though it looks like it might be worthwhile for the MIPS maintainer or
Loongson folks to see if they can lower the kernel image size in
memory post init by possibly re-adding __init to
setup_scache()/r4k_cache_init()/cpu_cache_init() and friends.

>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/mips/mm/c-r4k.c   | 2 +-
>  arch/mips/mm/sc-mips.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 99521764c75b..4f976d687ab0 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -1609,7 +1609,7 @@ static void __init loongson2_sc_init(void)
>         c->options |= MIPS_CPU_INCLUSIVE_CACHES;
>  }
>
> -static void __init loongson3_sc_init(void)
> +static void loongson3_sc_init(void)
>  {
>         struct cpuinfo_mips *c = &current_cpu_data;
>         unsigned int config2, lsize;
> diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
> index dd0a5becaabd..06ec304ad4d1 100644
> --- a/arch/mips/mm/sc-mips.c
> +++ b/arch/mips/mm/sc-mips.c
> @@ -146,7 +146,7 @@ static inline int mips_sc_is_activated(struct cpuinfo_mips *c)
>         return 1;
>  }
>
> -static int __init mips_sc_probe_cm3(void)
> +static int mips_sc_probe_cm3(void)
>  {
>         struct cpuinfo_mips *c = &current_cpu_data;
>         unsigned long cfg = read_gcr_l2_config();
> @@ -180,7 +180,7 @@ static int __init mips_sc_probe_cm3(void)
>         return 0;
>  }
>
> -static inline int __init mips_sc_probe(void)
> +static inline int mips_sc_probe(void)
>  {
>         struct cpuinfo_mips *c = &current_cpu_data;
>         unsigned int config1, config2;
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
