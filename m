Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906E52E7D60
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 01:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgLaA14 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 19:27:56 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:34525 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgLaA14 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Dec 2020 19:27:56 -0500
Received: by mail-il1-f177.google.com with SMTP id x15so16233135ilq.1;
        Wed, 30 Dec 2020 16:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/Ox5CnHjGfyTpyg7UknKoBBMvVDVteClM0MzbFDa/E=;
        b=SCgB9BFSNVD8g2iph8/jH8ZKlIHtaqZfN2S/lEAp8d53CEPh8MbRXObj6KXbOVK/gJ
         NBbuwApCdlx3Udc/62/k7XIvMK6iUEXrK2z+SyuT1X008gbbf+8b63ssYBmTL9mfsA1+
         zA4+LkL6Xq6cqSH7DfvyZ0AzSpioDXHz73ko9az/Uh4ObgGqRIRnddbR9oOvSgI6aWbk
         zI/EpZHWgzQD99YppIdvDojmPZX6ALACVWjn+doqAUJuOVQXpt9hZXNV9MFJvuAiE8rn
         EE0xXxLn4ozIV/xoFC5VRBN2nRtxzUaFm+JmlFnW683PTKUUTURQe3bZJCcbdOaqVAut
         RvDw==
X-Gm-Message-State: AOAM5318e0NgqLkmBdNxgIYpzq612Z0vGhKPKFkLuSAor86AElhe+Y6U
        cMm+OMHLrAe9i5NblmPq0sOuQaES2HOFiyEazLPQ8DKP
X-Google-Smtp-Source: ABdhPJx1rRjr5WlxBx3kMv/ah3JNsdLJjia17Q3t/W91t2+O47mJaAE6rqGUCnTiLKxjXOVMMArq2+AeMLW4NcS5olI=
X-Received: by 2002:a05:6e02:1187:: with SMTP id y7mr54327534ili.143.1609374435507;
 Wed, 30 Dec 2020 16:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20201230033950.13839-1-jiaxun.yang@flygoat.com> <20201230033950.13839-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20201230033950.13839-2-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 31 Dec 2020 08:27:03 +0800
Message-ID: <CAAhV-H58NOimxLCO7a48u5T2-kkpquJpyLveHrbKt00C756k8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Set cluster for cores
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Wed, Dec 30, 2020 at 11:43 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> cluster is required for cacheinfo to set shared_cpu_map correctly.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/loongson64/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index e744e1bee49e..fae3a97d853c 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -403,6 +403,8 @@ static void __init loongson3_smp_setup(void)
>                         __cpu_number_map[i] = num;
>                         __cpu_logical_map[num] = i;
>                         set_cpu_possible(num, true);
> +                       /* Loongson processors are always grouped by 4 */
> +                       cpu_set_cluster(&cpu_data[num], i / 4);
>                         num++;
>                 }
>                 i++;
> --
> 2.30.0
>
