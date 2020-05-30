Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7881E908A
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 12:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgE3K1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 06:27:49 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:38762 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgE3K1t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 06:27:49 -0400
Received: by mail-il1-f196.google.com with SMTP id q18so4958902ilm.5
        for <linux-mips@vger.kernel.org>; Sat, 30 May 2020 03:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIAsAfoh+xhEktVPQmfz2y7yoUPBGDd89DxTdGm9PSU=;
        b=s67/SWCd6uNF/aZWw142yBOdLf1+rcy7g/45NiJPMDeXsThOPxyFjbn+yCDish7YBv
         OS7L/AMSmr27owy1Poau1QhynK4hs//4B4Q3Br0iCnU4hm01lOViafL8HhXpO58W3bMq
         F3QBm4/WxGqqRgxtmaFfPTgDV38mo+jsOGKVXdEbuC018D9FEwMTUk8BEhbjbb2nT0bL
         RmEVL6HYCCthSEqg1H9xndsvIRZzw+Chhbp8J6fDVY1+osCa/v0kv25EsBbamH2hr7m7
         b81SYRKfKm2xCTcXmPhy4tVdxHOJom7p6wEIsB+K+vdW8P7geM7POgclSsP/mwUukXlQ
         PysQ==
X-Gm-Message-State: AOAM530ErCFU0/Vlhn7MLHpUzDnkmLbo1fbTBZNmaqjJsiEcpbdwn8Ib
        rLwYdr09S+80dFRTh9mW4UZ2/RFZbP/z3uWKbtYoBJYDXykv1g==
X-Google-Smtp-Source: ABdhPJx7XxDpKRiFFWoO2eEHB9Ct1M9dG+d/KD9G0KbU+Xe+d6WdLX7HU+u09pTWjZ5xn3v3r5x4N3+exerWPcwCATo=
X-Received: by 2002:a05:6e02:503:: with SMTP id d3mr11905007ils.208.1590834467269;
 Sat, 30 May 2020 03:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200530073243.16411-1-git@xen0n.name> <20200530073243.16411-4-git@xen0n.name>
In-Reply-To: <20200530073243.16411-4-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 30 May 2020 18:27:36 +0800
Message-ID: <CAAhV-H7cMBqVPVxeD7J16x9AsCjWujiyz7pG21y0bOz5VT9XWw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MIPS: Loongson64: Reorder CPUCFG model match arms
To:     WANG Xuerui <git@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Sat, May 30, 2020 at 3:34 PM WANG Xuerui <git@xen0n.name> wrote:
>
> Originally the match arms are ordered by model release date, however
> the LOONGSON_64R cores are even more reduced capability-wise. So put
> them at top of the switch block.
>
> Suggested-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/mips/loongson64/cpucfg-emul.c | 32 +++++++++++++++---------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
> index ca75f07252df..cd619b47ba1f 100644
> --- a/arch/mips/loongson64/cpucfg-emul.c
> +++ b/arch/mips/loongson64/cpucfg-emul.c
> @@ -137,6 +137,22 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>
>         /* Add CPUCFG features non-discoverable otherwise. */
>         switch (c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) {
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_0:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_1:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_2:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_3:
> +               decode_loongson_config6(c);
> +               probe_uca(c);
> +
> +               c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
> +                       LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LLSYNC |
> +                       LOONGSON_CFG1_TGTSYNC);
> +               c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
> +                       LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LPMP |
> +                       LOONGSON_CFG2_LPM_REV2);
> +               c->loongson3_cpucfg_data[2] = 0;
> +               break;
> +
>         case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R1:
>                 c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
>                         LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
> @@ -164,22 +180,6 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>                         LOONGSON_CFG3_LCAMVW_REV1);
>                 break;
>
> -       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_0:
> -       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_1:
> -       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_2:
> -       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_3:
> -               decode_loongson_config6(c);
> -               probe_uca(c);
> -
> -               c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
> -                       LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LLSYNC |
> -                       LOONGSON_CFG1_TGTSYNC);
> -               c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
> -                       LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LPMP |
> -                       LOONGSON_CFG2_LPM_REV2);
> -               c->loongson3_cpucfg_data[2] = 0;
> -               break;
> -
>         case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0:
>         case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_1:
>         case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_0:
> --
> 2.26.2
>
