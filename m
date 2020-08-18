Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC022484FF
	for <lists+linux-mips@lfdr.de>; Tue, 18 Aug 2020 14:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgHRMoX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 18 Aug 2020 08:44:23 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42464 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgHRMoW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Aug 2020 08:44:22 -0400
Received: by mail-il1-f193.google.com with SMTP id t13so17409265ile.9;
        Tue, 18 Aug 2020 05:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DbyHrIOxa4jcO2ErW1gwDHjx1vIFDqRvp0Kn9SISwcw=;
        b=XuyENUByL1JUnsF5zObVuGHKR7KROlOgpKRZCktZBAPPpV/KukmGJiYI7c73epJIbm
         x80t7OL2yfrA451ciL89jAW09Fu1z4Nf+4wS1Fh8BC6zv5RL2ozXC6qhqB7T6N2RG0HV
         ACd2H5QN4MseqK/DYssiiI8Z7f5uv/t+TG0GKSX9jc8e/Xbm5hjoVK1C74U9VD3ZNRVy
         mlDo6oxzzWkl4AUfqNWnwU4jqv7pLzSNGYnG5teUiTRWuaciD9cLHBWopQUFPBU0YHTS
         YtVjpcIcGGog0aCXA0rPYPYlUCq+Uo+hQF0jh/HKrCRmOF9U25c++0wVY7WtGhR9gmZO
         jibA==
X-Gm-Message-State: AOAM531QoPADDPZhGgYO+40Z3PPVt2VwwTHRJx1i3MKWOPalWVkzkgl/
        rpTa+5BVR1flFfB6SpbzspHXC3igsT0HqR11GeM=
X-Google-Smtp-Source: ABdhPJxWpu5n6piEUh6svMsCDBFsjQn4fo2xJvKgUOqpNv5S/bVOK6NyzvRqrLamhlzBRkHImAWk3CSE75v/MIZVCWk=
X-Received: by 2002:a92:d30a:: with SMTP id x10mr17872887ila.287.1597754661152;
 Tue, 18 Aug 2020 05:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <1597750368-14086-1-git-send-email-tangyouling@loongson.cn>
In-Reply-To: <1597750368-14086-1-git-send-email-tangyouling@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 18 Aug 2020 20:44:09 +0800
Message-ID: <CAAhV-H5mqDUndoX=mam8S9JKn0nEUHc=NXb7FQJ-0uau=OqoAQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error about redeclaration of
 enumerator 'VIRTUAL' and "CONFIG_DM_THIN_PROVISIONING"
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Youling,

On Tue, Aug 18, 2020 at 7:35 PM Youling Tang <tangyouling@loongson.cn> wrote:
>
> After commit 39c1485c8baa (MIPS: KVM: Add kvm guestsupport for Loongson-3)
>
> Fix the following build error:
>
> drivers/md/dm-thin.c:116:2: error: redeclaration of enumerator ‘VIRTUAL’
>   VIRTUAL,
>   ^
> In file included from ./arch/mips/include/asm/mach-loongson64/mmzone.h:12:0,
>                  from ./arch/mips/include/asm/mmzone.h:12,
>                  from ./include/linux/mmzone.h:962,
>                  from ./include/linux/gfp.h:6,
>                  from ./include/linux/slab.h:15,
>                  from ./include/linux/genhd.h:16,
>                  from ./include/linux/blkdev.h:8,
>                  from drivers/md/persistent-data/dm-block-manager.h:11,
>                  from drivers/md/dm-thin-metadata.h:10,
>                  from drivers/md/dm-thin.c:7:
> ./arch/mips/include/asm/mach-loongson64/boot_param.h:198:2: note: previous
> definition of ‘VIRTUAL’ was here VIRTUAL = 3
>                                  ^
> scripts/Makefile.build:283: recipe for target 'drivers/md/dm-thin.o' failed
> make[2]: *** [drivers/md/dm-thin.o] Error 1
>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/mips/include/asm/mach-loongson64/boot_param.h | 2 +-
>  arch/mips/loongson64/env.c                         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index afc92b7..a4ef4ac 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -195,7 +195,7 @@ struct boot_params {
>  enum loongson_bridge_type {
>         LS7A = 1,
>         RS780E = 2,
> -       VIRTUAL = 3
> +       VIRT = 3
>  };
Thank you for your patch, but I think this problem is because of
invalid .h file inclusion (arch-dependent .h file should not be
included in drivers), and Xuerui Wang has investigated it for some
time. He has a draft patch (haven't sent yet) which I think is a
better way. So, please wait some time.

Huacai
>
>  struct loongson_system_configuration {
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 134cb8e..623b3f1 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -180,8 +180,8 @@ void __init prom_init_env(void)
>                 loongson_sysconf.early_config = rs780e_early_config;
>                 break;
>         default:
> -               pr_info("The bridge chip is VIRTUAL\n");
> -               loongson_sysconf.bridgetype = VIRTUAL;
> +               pr_info("The bridge chip is VIRT\n");
> +               loongson_sysconf.bridgetype = VIRT;
>                 loongson_sysconf.early_config = virtual_early_config;
>                 loongson_fdt_blob = __dtb_loongson64v_4core_virtio_begin;
>                 break;
> --
> 2.1.0
>
