Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867084083A1
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 07:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhIMFCS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 13 Sep 2021 01:02:18 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:33528 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhIMFCS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Sep 2021 01:02:18 -0400
Received: by mail-ua1-f47.google.com with SMTP id r8so5390503uap.0
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 22:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FEEcoIFaMthzL5ahPAsF76+MZZNTgkmIDwTxSplCBWE=;
        b=AHBbIpoaiSm9YCgJUbjYK1CnyqiQKBot36rhQtHoJ6NHXbJhKDANExzMyOxHiOf/eR
         ruOaxFt8GdtEXMd9IrACsrEclOT6+edi2E0R6yFBeL3ZUYGwLtNc0ngtaG8UX4QCE47a
         kpMUQBDYxoSbENL9jKVfgO57YqTZu424TGOtBZ51Z/lkVWmCfMjDgLlvDdUZKplbk8S5
         XZU/zU3NnNY799GmezZeaQH42Ghj29Rfeb7ugfYuI8Ht88nc8XqbucIYkxPfL+Z2Hb5K
         yEA8yPdh+aSCd7vqsN7fYKiexWppcBWPtWkFgky/nSi/kW5tuvy3A7HSFk30TisMVMqv
         q4EA==
X-Gm-Message-State: AOAM531Xw+mindoRCgJnJjmUVFdT9OcZC2s4iRE/rWKNRMIG9lIZdeTK
        KRFtab1tIY07FVdBo4/56SULfWYku6/SCXjL0tfpLC5+sqU=
X-Google-Smtp-Source: ABdhPJzuSZMTtBv+EN+gmUHT+LAY2crDZgyEnpfSQzcJCyyEyc7R0A4NNJ3hwsYKfJ4uxQAsOXmfmSzGSQaBsf1Ts84=
X-Received: by 2002:ab0:6145:: with SMTP id w5mr3872620uan.65.1631509262819;
 Sun, 12 Sep 2021 22:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210913044139.549459-1-liu.yun@linux.dev>
In-Reply-To: <20210913044139.549459-1-liu.yun@linux.dev>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 13 Sep 2021 13:00:50 +0800
Message-ID: <CAAhV-H4xoPJG1PFbOEJd3V5DFvB5wgzLGLXXJ-su66Rp8ZWMLw@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Please update my e-mail: Huacai Chen <chenhuacai@kernel.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Mon, Sep 13, 2021 at 12:42 PM Jackie Liu <liu.yun@linux.dev> wrote:
>
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> mach/loongson64 fails to build when the FPU support is disabled:
>
> arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
> arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’
>
> Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
> Suggested-by: Huacai Chen <chenhc@lemote.com>
> Reported-by: k2ci robot <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>
> ---
>  v1->v2:
>  move MIPS_FP_SUPPORT from MACH_LOONGSON64 to CPU_LOONGSON64
>
>  v2->v3:
>  add Huacai Chen <chenhc@lemote.com>'s suggest label.
>
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 24e374266fdc..aea3aa16a38e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1408,6 +1408,7 @@ config CPU_LOONGSON64
>         select MIPS_ASID_BITS_VARIABLE
>         select MIPS_PGD_C0_CONTEXT
>         select MIPS_L1_CACHE_SHIFT_6
> +       select MIPS_FP_SUPPORT
>         select GPIOLIB
>         select SWIOTLB
>         select HAVE_KVM
> --
> 2.25.1
>
