Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDB12EC978
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 05:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbhAGEl1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 23:41:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:35364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727341AbhAGEl1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 Jan 2021 23:41:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C74023118
        for <linux-mips@vger.kernel.org>; Thu,  7 Jan 2021 04:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609994446;
        bh=RB9n39LokbGAb+R9SZqA+9ymZbF8ZcdkjFTuOGSpoEs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nbTqYlCM24wKGIf0WigrJkRxZNnhFn2XccgH2c1/aNILVcaQrW2vD1ypk67rx9qPp
         MqyNigTbdRv9cnF/K8YEejirF7l+rNKugOuNk3t8lxbppDVGmy3D2WGnajcrJTw1cd
         fsS9z/j9Gyrie1r820yP095qQr+kYo1CLP+LpDYRUzN0VCYN6U2wJJYFS1CISXh4J6
         pTq2kjMAulUYyd8kt4mxw36ChdpMufyczdyjQl7DqdXQl+CTkDxb/vGHSy8NuMc2ee
         yUXXeetiCj5HMt1bDG8a9qlIE4QjBIWvbW9QdKYcBLrnhOjxiMgWRgwGVbin7N1G2c
         sysVEJ1BIH4Gg==
Received: by mail-io1-f42.google.com with SMTP id w18so5027389iot.0
        for <linux-mips@vger.kernel.org>; Wed, 06 Jan 2021 20:40:46 -0800 (PST)
X-Gm-Message-State: AOAM531cd0541pUawQzB1BQNkbm9t75JPGJQHl8PrQt/JPblKShyBNQb
        GNPrg0PsVz7S4fENmp8eSROeMAKmCUZgBarAaC4=
X-Google-Smtp-Source: ABdhPJxvqwiDmBCHKeMZUxYu09i9XQvkQr2fFw/a7hmJbLb13QlmmyktpXAxKHdExj4V0N39i6bJjz25FzGRlKRc+Yg=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr5332707ioq.13.1609994445805;
 Wed, 06 Jan 2021 20:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20210107030645.1844215-1-siyanteng@loongson.cn>
In-Reply-To: <20210107030645.1844215-1-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 7 Jan 2021 12:40:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6tfwCL+d+UbtPLZUp7xgDaESueTc5btA8SJxLCrxD08A@mail.gmail.com>
Message-ID: <CAAhV-H6tfwCL+d+UbtPLZUp7xgDaESueTc5btA8SJxLCrxD08A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: init: move externs to header file
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Thu, Jan 7, 2021 at 11:06 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>
>     This commit fixes the following checkpatch warnings:
>
>     WARNING: externs should be avoided in .c files
>
>     This is a warning for placing declarations in a ".c" file.
>     This fix removes the declaration in ".c" and adds it to
>     the common header file.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/include/asm/traps.h       | 1 +
>  arch/mips/loongson2ef/common/init.c | 1 -
>  arch/mips/loongson64/init.c         | 1 -
>  arch/mips/mti-malta/malta-init.c    | 1 -
>  arch/mips/pistachio/init.c          | 1 -
>  5 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6a0864bb604d..6aa8f126a43d 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -24,6 +24,7 @@ extern void (*board_ebase_setup)(void);
>  extern void (*board_cache_error_setup)(void);
>
>  extern int register_nmi_notifier(struct notifier_block *nb);
> +extern char except_vec_nmi[];
>
>  #define nmi_notifier(fn, pri)                                          \
>  ({                                                                     \
> diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
> index ce3f02f75e2a..1469a03c0953 100644
> --- a/arch/mips/loongson2ef/common/init.c
> +++ b/arch/mips/loongson2ef/common/init.c
> @@ -19,7 +19,6 @@ unsigned long __maybe_unused _loongson_addrwincfg_base;
>  static void __init mips_nmi_setup(void)
>  {
>         void *base;
> -       extern char except_vec_nmi[];
>
>         base = (void *)(CAC_BASE + 0x380);
>         memcpy(base, except_vec_nmi, 0x80);
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index e13f704bef80..cd8e0e0a6104 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -25,7 +25,6 @@ u32 node_id_offset;
>  static void __init mips_nmi_setup(void)
>  {
>         void *base;
> -       extern char except_vec_nmi[];
>
>         base = (void *)(CAC_BASE + 0x380);
>         memcpy(base, except_vec_nmi, 0x80);
> diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
> index 893af377aacc..b03cac5fdc02 100644
> --- a/arch/mips/mti-malta/malta-init.c
> +++ b/arch/mips/mti-malta/malta-init.c
> @@ -90,7 +90,6 @@ static void __init console_config(void)
>  static void __init mips_nmi_setup(void)
>  {
>         void *base;
> -       extern char except_vec_nmi[];
>
>         base = cpu_has_veic ?
>                 (void *)(CAC_BASE + 0xa80) :
> diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
> index 558995ed6fe8..48bb4ab8839d 100644
> --- a/arch/mips/pistachio/init.c
> +++ b/arch/mips/pistachio/init.c
> @@ -83,7 +83,6 @@ phys_addr_t mips_cdmm_phys_base(void)
>  static void __init mips_nmi_setup(void)
>  {
>         void *base;
> -       extern char except_vec_nmi[];
>
>         base = cpu_has_veic ?
>                 (void *)(CAC_BASE + 0xa80) :
> --
> 2.27.0
>
