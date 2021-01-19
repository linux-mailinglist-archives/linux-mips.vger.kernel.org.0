Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25302FAE49
	for <lists+linux-mips@lfdr.de>; Tue, 19 Jan 2021 02:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387803AbhASBVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 20:21:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:35454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387781AbhASBVH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 20:21:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEE852253A
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 01:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611019225;
        bh=R/Fj1Vk1Xi+5stQzYt+/etpTePiPRGG8wtnjWaBS6i8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jgnqSylV9ddfTNKDpgznlYTdnDZGMcKCs8wyXVj9Gh3luABF8sTpbv3z7gJY8Vf65
         n9UvFcX7SP8/FEODvx7milzLud52Z3vOK+sN+Ilx3E3qEyvA9n/gDQpjSR9wpf1Csm
         YkuzR86H5CSrZUp0J+OruyrqCfJOBsdEth6QXpp+pOqxKXFGA2DFeOU/s3rY23IkbZ
         6kgIy/5V/smtvaOjhK8gJOgb7cbnzpKJBGqIwgf5M2+ZvFTo1EZTpJSnwdsjuZTayb
         bFXgG0fMA5JYbE0c3e+4dMG1l3MRO6U3om+7J7oRT28bxQY3jDycUFfGFm2R3bHF3S
         dqAJ7xI3J2X/Q==
Received: by mail-io1-f52.google.com with SMTP id p72so11712994iod.12
        for <linux-mips@vger.kernel.org>; Mon, 18 Jan 2021 17:20:25 -0800 (PST)
X-Gm-Message-State: AOAM5321PBhZll+9tsxkcQC8CFDUULFirorVNz8GB3qDn2yoLKOA0xOy
        Dm4gzsC2NEmoHjsrSgM/h1dDoP7/it2uw82sfzs=
X-Google-Smtp-Source: ABdhPJyUEXo0lc6yP61Ea0S2GX+X2FR88YfUyY5SnKWiEFbpYIkprUUmrDHJ9/L0pkeIHsP0qyEBcNypaafXMITM+NM=
X-Received: by 2002:a5e:de41:: with SMTP id e1mr1196419ioq.135.1611019225276;
 Mon, 18 Jan 2021 17:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20210118132009.2642893-1-siyanteng@loongson.cn>
In-Reply-To: <20210118132009.2642893-1-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 19 Jan 2021 09:20:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4cUDs2X+NCzJhJ5Dm89F8Kvw+jCaNUWvY86jHnmNHxuA@mail.gmail.com>
Message-ID: <CAAhV-H4cUDs2X+NCzJhJ5Dm89F8Kvw+jCaNUWvY86jHnmNHxuA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: IRQ: Add prototype for function init_IRQ
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Mon, Jan 18, 2021 at 9:19 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> This commit adds a prototype to fix error at W=1:
>
> arch/mips/kernel/irq.c:52:13: error: no previous prototype for
> 'init_IRQ' [-Werror=missing-prototypes]
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/include/asm/irq.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
> index c5d351786416..f021de661c3a 100644
> --- a/arch/mips/include/asm/irq.h
> +++ b/arch/mips/include/asm/irq.h
> @@ -20,6 +20,7 @@
>  #define IRQ_STACK_SIZE                 THREAD_SIZE
>  #define IRQ_STACK_START                        (IRQ_STACK_SIZE - 16)
>
> +extern void __init init_IRQ(void);
>  extern void *irq_stack[NR_CPUS];
>
>  /*
> --
> 2.27.0
>
