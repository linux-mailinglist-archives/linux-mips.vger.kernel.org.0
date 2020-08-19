Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F484249496
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 07:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgHSFsL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 01:48:11 -0400
Received: from [115.28.160.31] ([115.28.160.31]:58282 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725883AbgHSFsK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Aug 2020 01:48:10 -0400
Received: from hanazono.local (unknown [140.206.66.42])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 203536009E;
        Wed, 19 Aug 2020 13:47:48 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1597816068; bh=KRrHwfUQuKjAb85/oLK3ZUF0M9g04e+91BLM9g/wlMs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=tPi4mYXHmiuOAuKaFwBNtsdr5U02fwW3w1htFvAszZB68OljMlR04sbip5fMIv8Y7
         jFdHvcKj2WihUyCSoBgtKpkd3ZtUUiQo3oCzFhkMguYlK0DbUm9Pp2qDBu/73tj3CS
         ny1O4WJ1Y0YIWB+2yg1eJ/1IdVhNMBaf++j8c+yQ=
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error about redeclaration of
 enumerator 'VIRTUAL' and "CONFIG_DM_THIN_PROVISIONING"
To:     Youling Tang <tangyouling@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1597750368-14086-1-git-send-email-tangyouling@loongson.cn>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <a3a3dfc1-1148-e6db-9ea3-2405c3fe5329@xen0n.name>
Date:   Wed, 19 Aug 2020 13:47:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:81.0)
 Gecko/20100101 Thunderbird/81.0a1
MIME-Version: 1.0
In-Reply-To: <1597750368-14086-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Youling,


On 2020/8/18 19:32, Youling Tang wrote:
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
>  	LS7A = 1,
>  	RS780E = 2,
> -	VIRTUAL = 3
> +	VIRT = 3

I believe this is only masking the root cause, which is redundant
#include directives inside mach-specific headers. I'll send my version
of fix shortly.

Anyway, thanks for your help!

>  };
>  
>  struct loongson_system_configuration {
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 134cb8e..623b3f1 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -180,8 +180,8 @@ void __init prom_init_env(void)
>  		loongson_sysconf.early_config = rs780e_early_config;
>  		break;
>  	default:
> -		pr_info("The bridge chip is VIRTUAL\n");
> -		loongson_sysconf.bridgetype = VIRTUAL;
> +		pr_info("The bridge chip is VIRT\n");
> +		loongson_sysconf.bridgetype = VIRT;
>  		loongson_sysconf.early_config = virtual_early_config;
>  		loongson_fdt_blob = __dtb_loongson64v_4core_virtio_begin;
>  		break;
