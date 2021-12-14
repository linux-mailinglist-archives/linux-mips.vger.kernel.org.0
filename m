Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C808474C3B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Dec 2021 20:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237505AbhLNTqI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Dec 2021 14:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhLNTqI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Dec 2021 14:46:08 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA66CC061574
        for <linux-mips@vger.kernel.org>; Tue, 14 Dec 2021 11:46:07 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id bn20so29967576ljb.8
        for <linux-mips@vger.kernel.org>; Tue, 14 Dec 2021 11:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h0rTzffy35/5abt9w3+JNjuxLlxaRoxP3g+y8dZlZ1c=;
        b=Dlq1h6n6Nvy+Cx6orR+qAeWjN4UhGYRKo8AEJONU4Tl7IgPIn8A8bJVM4adjeHLG4o
         kFxaUYmqDuUNKExMHNZTQJyi80oZ17YmubLHrwMoCK/kYhPSIE9RSCSjVM+OGhDWOof0
         pgmONlQeQRIDyaZdfCQZ7bUCFiM99gbxQk/1p5vOeREwMpl3j0h7eDliXN9MgN7iO5Rv
         EWTyISbHCSBIQXoRj2ENRUSIPYykjbIx2OdgASRMr3ieT9d6I8FKOaNe83Kg8UUCzK/a
         OoY3PAtj5LYrfwBd+XQ5KAw6mLHP1qq4eXzYeRlYHEb98BmQxHQp28hMhpmvtutsK78q
         orZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h0rTzffy35/5abt9w3+JNjuxLlxaRoxP3g+y8dZlZ1c=;
        b=TZ19B21TIIVRYpb2Rs3BY6S4hIhv7ItRXZWKCvoNqULqVH30ncBBpXA/RhkRq04j7U
         /PUWA3kDHf01OmTNEx2ns0kHkb98u05Yl+A/TBQtB+y1DMvA0xhLbyfu52LrXW75aKl+
         hjMUzLG2Z23baBnkw8Hg2wlQdCraM1kLZrMrR5tzUcVLFkGPPcdkyTV+oeKTWdEa6eZP
         tCi7b8d2/AnwdZzcLFNWaMbnadFphJdK9L+MuzkdI6/YH5dQCK6J15yzjpklxNZElt2m
         dwnTgfwO3T+3XfABZdKh+Sbrudcky10Ppo+N7EFN5RX1N+geE+OHFPAEOSuXouDs+Gcs
         vxtQ==
X-Gm-Message-State: AOAM533a3QuLMNz51Co25EfWLIH4vPyPEl3P1Ae2Ap5jJVdIA2oOnFgb
        exRxwEsijrJ5azEgq6hDR7sIEr3niuKT+nyRLN0BLw==
X-Google-Smtp-Source: ABdhPJwGoGeLABVrt6BVPXO09ywkaWM8/03cuPwfU8AEYwOvgEoW4yq37S2fOhcW1EQgpnfA50ZiAqNLEEQ7cliL6qY=
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr6802646ljc.198.1639511165825;
 Tue, 14 Dec 2021 11:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20211213224914.1501303-1-paul@crapouillou.net> <20211213224914.1501303-4-paul@crapouillou.net>
In-Reply-To: <20211213224914.1501303-4-paul@crapouillou.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Dec 2021 11:45:54 -0800
Message-ID: <CAKwvOd=GRFJd63CN43RsCTg3_sJ3j2Ak4JNve-N+rtuksz-wMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: Add support for LTO
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 13, 2021 at 2:49 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Allow CONFIG_LTO_CLANG to be enabled. The ThinLTO variant is not yet
> supported.
>
> While this option allows to build a LTO'd kernel, the result kernel file
> ends up being *bigger* than the non-LTO variant (about 3.6 MiB with LTO
> vs. 3.1 MiB without with a ZSTD-compressed kernel).

LGTM but I think there's more work to be done first based on my
comments on the earlier patches.

In particular, we should be able to boot the result and not have to
modify any Makefiles outside of the series to get it to link.

Good to know we're close though!  Don't give up!

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 0215dc1529e9..6987db8d5f64 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -22,6 +22,7 @@ config MIPS
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_USE_QUEUED_SPINLOCKS
>         select ARCH_SUPPORTS_HUGETLBFS if CPU_SUPPORTS_HUGEPAGES
> +       select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select ARCH_WANT_LD_ORPHAN_WARN
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
