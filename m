Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656A12EB6DF
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 01:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbhAFA2P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 19:28:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:47246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbhAFA2P (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Jan 2021 19:28:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F30E622D71;
        Wed,  6 Jan 2021 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609892855;
        bh=EhHtSCuSPYj5dtSE3+uDH0W6SrC70iqfIJBtkXxe1m0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WYW96riWieaw6DUzOueMGvA+A6V0lwvgGE/eKp5EHxA3cEqD7aVYWSw+aDXUFWjIa
         CEzMEJPfRJ4UiDUocIiNjT63it8zvZKN/C8QuRbSGZni8+dyZIjo21ZKbg0IoVrl7S
         9Bl3FMkJykmLA/YVo5SkqHUt8Ezj19Y0Z3ArdpO8HSOxapzYw1yjNGmqTWXIL6fLda
         7caVXEClJ75/14aDQ06ZRIdWruP9SOzBEUyygl7N3MEYZkrsIoCwxHH/FywmAl3PQx
         dDEiyRxNTaGKoWnpegCVHroAyWmHTWsZU+JyYXHlVzpqn6usI4fjNXJi5rjaCtEU1Q
         kxtJj27OkOs7Q==
Received: by mail-io1-f46.google.com with SMTP id q137so1115127iod.9;
        Tue, 05 Jan 2021 16:27:34 -0800 (PST)
X-Gm-Message-State: AOAM530zDNcKarbP64ylFW3+MAkroyAt9p/7z6msHc66WA11IZryDSis
        5VQSXHsS7TpmdZyNrm/erDV0RWhiu3s+rDEgr9o=
X-Google-Smtp-Source: ABdhPJxxOw3+r6LUww9FLwOHUdSowujBCz35eZ9oxX+ztI8VxRvujIjLP41YmRmaGgYWVDljYHISiec7BxvtcupNzCY=
X-Received: by 2002:a5e:db4b:: with SMTP id r11mr1238435iop.148.1609892854494;
 Tue, 05 Jan 2021 16:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20210105203456.98148-1-natechancellor@gmail.com>
In-Reply-To: <20210105203456.98148-1-natechancellor@gmail.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Wed, 6 Jan 2021 08:27:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6g92UYVpncKJ8v7PnVPpvCTUEeeSyBrXdopGm6uNFGHg@mail.gmail.com>
Message-ID: <CAAhV-H6g92UYVpncKJ8v7PnVPpvCTUEeeSyBrXdopGm6uNFGHg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: c-r4k: Fix section mismatch for loongson2_sc_init
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Wed, Jan 6, 2021 at 7:01 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with clang, the following section mismatch warning occurs:
>
> WARNING: modpost: vmlinux.o(.text+0x24490): Section mismatch in
> reference from the function r4k_cache_init() to the function
> .init.text:loongson2_sc_init()
>
> This should have been fixed with commit ad4fddef5f23 ("mips: fix Section
> mismatch in reference") but it was missed. Remove the improper __init
> annotation like that commit did.
>
> Fixes: 078a55fc824c ("MIPS: Delete __cpuinit/__CPUINIT usage from MIPS code")
> Link: https://github.com/ClangBuiltLinux/linux/issues/787
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/mips/mm/c-r4k.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 4f976d687ab0..f67297b3175f 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -1593,7 +1593,7 @@ static int probe_scache(void)
>         return 1;
>  }
>
> -static void __init loongson2_sc_init(void)
> +static void loongson2_sc_init(void)
>  {
>         struct cpuinfo_mips *c = &current_cpu_data;
>
>
> base-commit: 36bbbd0e234d817938bdc52121a0f5473b3e58f5
> --
> 2.30.0
>
