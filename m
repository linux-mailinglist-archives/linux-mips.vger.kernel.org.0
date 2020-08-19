Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35058249ABA
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 12:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgHSKry (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 06:47:54 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36001 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbgHSKrn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 06:47:43 -0400
Received: by mail-il1-f193.google.com with SMTP id z3so20254637ilh.3;
        Wed, 19 Aug 2020 03:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kag/C6BLvwPbPiCq6syzURWI48YRwCfCVVcw53S19XM=;
        b=dbvnQtR3IqSxRoUhROBpz+3KPnbHq5orMgeO6lkOslow51I4Ig+aayn9+RBRCVbHTw
         frEt+RbFYaqY4yh67CsjhdZ1g4vnrY4ocN5ctH9YRRfjkmWQk1LSQm2rTlgZkhMJryFS
         rhPYrmhEz7DhSaxElONeVTp+ZvSv20Ip8X+IWktCfEjKVrHpogj89CUSxLqYmhEnWvD1
         oFMODXaPS/S96Xa3Aj/WsZOeFmAnd4lRx+SEyJz3vCdzHFEQXWIwVbkBSJ6Se64ilMlO
         OjuI1sCkWXSbpx7z9G8wYEfjcOrgxH+UGDsLaRoUB4byPSmZTe5nXlGyTYDAUcH2k2Rk
         /fTw==
X-Gm-Message-State: AOAM531k1Rc287P5iLexUdCbSEQNmbumUkKBjX1MZj4K6KPnVXxdSApj
        0TleU1x3YnlM61JM6rApBSbPYpUhl6zkQbaB/dNuaYDlwKWJiCLa
X-Google-Smtp-Source: ABdhPJzfkBxqoXzAxToa2EkMk00dqE+haQfFIYG/EYYLFFgaZlE1quHjJsyWBWAAdjld6Vi0W6Q0Ke21pEo59UzsHdY=
X-Received: by 2002:a05:6e02:cb0:: with SMTP id 16mr9996793ilg.147.1597834061939;
 Wed, 19 Aug 2020 03:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200819060722.2267677-1-git@xen0n.name>
In-Reply-To: <20200819060722.2267677-1-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 19 Aug 2020 18:47:29 +0800
Message-ID: <CAAhV-H5L0g53=1KngKyi1DA7sO6i0hXrPBDGKSHFMb53YRoRKw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson64: Remove unnecessary inclusion of boot_param.h
To:     WANG Xuerui <git@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Wed, Aug 19, 2020 at 2:08 PM WANG Xuerui <git@xen0n.name> wrote:
>
> The couple of #includes are unused by now; remove to prevent namespace
> pollution.
>
> This fixes e.g. build of dm_thin, which has a VIRTUAL symbol that
> conflicted with the newly-introduced one in mach-loongson64/boot_param.h.
>
> Fixes: 39c1485c8baa ("MIPS: KVM: Add kvm guest support for Loongson-3")
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/mips/include/asm/mach-loongson64/irq.h    | 2 --
>  arch/mips/include/asm/mach-loongson64/mmzone.h | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
> index f5e362f79701..bf2480923154 100644
> --- a/arch/mips/include/asm/mach-loongson64/irq.h
> +++ b/arch/mips/include/asm/mach-loongson64/irq.h
> @@ -2,8 +2,6 @@
>  #ifndef __ASM_MACH_LOONGSON64_IRQ_H_
>  #define __ASM_MACH_LOONGSON64_IRQ_H_
>
> -#include <boot_param.h>
> -
>  /* cpu core interrupt numbers */
>  #define NR_IRQS_LEGACY         16
>  #define NR_MIPS_CPU_IRQS       8
> diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
> index 3a25dbd3b3e9..5eaca4fe3f92 100644
> --- a/arch/mips/include/asm/mach-loongson64/mmzone.h
> +++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
> @@ -9,7 +9,6 @@
>  #ifndef _ASM_MACH_LOONGSON64_MMZONE_H
>  #define _ASM_MACH_LOONGSON64_MMZONE_H
>
> -#include <boot_param.h>
>  #define NODE_ADDRSPACE_SHIFT 44
>  #define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
>  #define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
> --
> 2.25.1
>
