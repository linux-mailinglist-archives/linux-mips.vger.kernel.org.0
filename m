Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35EBC273854
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 04:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgIVCGi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 22:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgIVCGi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 22:06:38 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A47C061755
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 19:06:38 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id a19so15793417ilq.10
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9VSIniuosVUcGxg46RB89VQ5kzCnZyazzw6xIC0FvG0=;
        b=dKqUVZl17Q3kXAgcr06p4UlY1N6qTV2Mue4anb6tYFurZL0W6gu6FrERYn/jWXURKI
         HZUpdRbohepVE4ybVVLE/7ocnbYZKp99WmpKbf99i0E5FhqYJ9kzZdicze56GanbI0AL
         acKRNySDxzdd4v54NWeBwSnudm5QL+GOoUguYA/95v0rCV3k2iWcq83Qz6Jwnyl0JSbq
         l+k4GnZp39V3yTpU3V/KJAxoG/X2+9znpQSwp3uJh52bx7Hh0VzUOe6WgTctuuI1iuQM
         9rgkuZFG+LkRWnOZx5BmqmWlry0Y//TI99/gZhCX8ffEXDp7efUB9cVU4lhXXabhZIGK
         iekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9VSIniuosVUcGxg46RB89VQ5kzCnZyazzw6xIC0FvG0=;
        b=NLEvsHFQqt+dEb1LhCI4FC7sbo0cbPdNedMHI1WIGJIr+gFV2vMQUiPCv2loImkMXv
         HPLMm2zehLykFRXVVzwa21EaoN+BlxwSZ3LV1qgOYyZSjKMAo4E3LvFmuvwVDm0mI5mp
         AE81O2LkeV7hmtAEZkoJ3zKGS/OqNBN2ois4yEcJmdE5lckEr9ojx9h7WCb1VvxPG1Fm
         HSwB7kbXRC4MoSsUVmvSpNR+zCzWLv3ejVF1OlgVPFH8PtXH9HXNH9cg80s8Sl0Kl26R
         ZerVSQbZ+QTvvzh3CamyX2rPpF32YojASKrsw/8sA8DvLCxmpfoxb5lW58RLl16RIkFW
         kAzA==
X-Gm-Message-State: AOAM532+IkeSTYEI5uSeQn+VDE1isTXojI7za10O5pDTVYRo59GCXbXt
        jDBbC8jetiCLTVdZm1Kmml1lPbieCXqPYFzfXw1y6bnAAZI=
X-Google-Smtp-Source: ABdhPJxYMY3R3rzyd8AI/wmA2DQvsTMSYgMk2YHaa52XOOSipOwoZC5rW47WICFMomXDDFe0hOJ9/Vd40FHIta2qRco=
X-Received: by 2002:a05:6e02:13ae:: with SMTP id h14mr2533166ilo.208.1600740397007;
 Mon, 21 Sep 2020 19:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <1598255043-11839-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1598255043-11839-1-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Tue, 22 Sep 2020 10:06:24 +0800
Message-ID: <CAAhV-H7hzoO6OfunBZ4R0dUDRNX=jyjhdurV6VdGhdtXZ4Mj5g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson-3: Fix fp register access if MSA enabled
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Pei Huang <huangpei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ping?

On Mon, Aug 24, 2020 at 3:40 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> If MSA is enabled, FPU_REG_WIDTH is 128 rather than 64, then get_fpr64()
> /set_fpr64() in the original unaligned instruction emulation code access
> the wrong fp registers. This is because the current code doesn't specify
> the correct index field, so fix it.
>
> Fixes: f83e4f9896eff614d0f2547a ("MIPS: Loongson-3: Add some unaligned instructions emulation")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Pei Huang <huangpei@loongson.cn>
> ---
>  arch/mips/loongson64/cop2-ex.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/mips/loongson64/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
> index f130f62..00055d4 100644
> --- a/arch/mips/loongson64/cop2-ex.c
> +++ b/arch/mips/loongson64/cop2-ex.c
> @@ -95,10 +95,8 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
>                         if (res)
>                                 goto fault;
>
> -                       set_fpr64(current->thread.fpu.fpr,
> -                               insn.loongson3_lswc2_format.rt, value);
> -                       set_fpr64(current->thread.fpu.fpr,
> -                               insn.loongson3_lswc2_format.rq, value_next);
> +                       set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rt], 0, value);
> +                       set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rq], 0, value_next);
>                         compute_return_epc(regs);
>                         own_fpu(1);
>                 }
> @@ -130,15 +128,13 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
>                                 goto sigbus;
>
>                         lose_fpu(1);
> -                       value_next = get_fpr64(current->thread.fpu.fpr,
> -                                       insn.loongson3_lswc2_format.rq);
> +                       value_next = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rq], 0);
>
>                         StoreDW(addr + 8, value_next, res);
>                         if (res)
>                                 goto fault;
>
> -                       value = get_fpr64(current->thread.fpu.fpr,
> -                                       insn.loongson3_lswc2_format.rt);
> +                       value = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rt], 0);
>
>                         StoreDW(addr, value, res);
>                         if (res)
> @@ -204,8 +200,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
>                         if (res)
>                                 goto fault;
>
> -                       set_fpr64(current->thread.fpu.fpr,
> -                                       insn.loongson3_lsdc2_format.rt, value);
> +                       set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0, value);
>                         compute_return_epc(regs);
>                         own_fpu(1);
>
> @@ -221,8 +216,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
>                         if (res)
>                                 goto fault;
>
> -                       set_fpr64(current->thread.fpu.fpr,
> -                                       insn.loongson3_lsdc2_format.rt, value);
> +                       set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0, value);
>                         compute_return_epc(regs);
>                         own_fpu(1);
>                         break;
> @@ -286,8 +280,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
>                                 goto sigbus;
>
>                         lose_fpu(1);
> -                       value = get_fpr64(current->thread.fpu.fpr,
> -                                       insn.loongson3_lsdc2_format.rt);
> +                       value = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0);
>
>                         StoreW(addr, value, res);
>                         if (res)
> @@ -305,8 +298,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
>                                 goto sigbus;
>
>                         lose_fpu(1);
> -                       value = get_fpr64(current->thread.fpu.fpr,
> -                                       insn.loongson3_lsdc2_format.rt);
> +                       value = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0);
>
>                         StoreDW(addr, value, res);
>                         if (res)
> --
> 2.7.0
>
