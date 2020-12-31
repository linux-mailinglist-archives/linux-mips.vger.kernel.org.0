Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954922E7D7D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 01:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgLaAeJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 19:34:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:57034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbgLaAeI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Dec 2020 19:34:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0BE522227;
        Thu, 31 Dec 2020 00:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609374807;
        bh=YvoZijVIuexSHAs+IQ8IRrUPZpDueM3kvQ5ZKWpPiJI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=omcCgltDx5ErCq/0sQtz1GNADqmso4RNI28oKTSL1Hoki4/hEa5JWncgLvHtTtepx
         UfBtRZL/hIADf1E787YyT2rgpQpKxB0ei2Mei7ETkAI4ZEmIf2NEEda7PMzmpZguzc
         rP8cYaFlLq7ONbO+tjalbao4ZEZl6L7yXP1eFE/O34HxzBaWive0/I5iSI5iNRvsGp
         melPelPzHpQE9iBqUBmVlVfXPRoPRnIQbYuoD35NDdfpVHdpbZPPJWWfyRe4TAc2lm
         lVm+y44IG9+rxLZcvr9CP6Hxs+TXvx6a3+fpKqFjumlQ39Z8PBI1IBWzZ+IEOjqBOb
         0I5DvRETGGfaw==
Received: by mail-io1-f53.google.com with SMTP id 81so15996545ioc.13;
        Wed, 30 Dec 2020 16:33:27 -0800 (PST)
X-Gm-Message-State: AOAM531QvtZwCTrUzRymWTTfG1kYYt7Z2O7+hXoGFcWIhsY53uBeYdEc
        RqbDI3a/oX0qcQGBxLhlW43D/uIuuhDN1KgFCzY=
X-Google-Smtp-Source: ABdhPJyhpA3o1P+7/7e+hMYGgFckNbaoDACSne2mJpBt853SevP7XxuyDumv9fp5JoOQyQDhmXZ1BSVoSR9IedURhZU=
X-Received: by 2002:a02:c9cf:: with SMTP id c15mr47817173jap.57.1609374807095;
 Wed, 30 Dec 2020 16:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com> <20201230032314.10042-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20201230032314.10042-3-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 31 Dec 2020 08:33:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5JVAC4N6Pp6V7f9ZOGA6A=nZsQcYqc1S08ZaSOOazx1Q@mail.gmail.com>
Message-ID: <CAAhV-H5JVAC4N6Pp6V7f9ZOGA6A=nZsQcYqc1S08ZaSOOazx1Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: cpu-probe: Vulnerabilities for Loongson cores
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        WANG Xuerui <git@xen0n.name>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Wed, Dec 30, 2020 at 11:26 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Loongson64C is known to be vulnerable to meltdown according to
> PoC from Rui Wang <r@hev.cc>.
How about Loongson-3A1000/3B1500, and Loongson-2E/2F?

Huacai
>
> Loongson64G defended these side-channel attack by silicon.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/cpu-probe.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 2460783dbdb1..24b21f51353c 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -2092,6 +2092,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>                 c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>                         MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
>                 c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
> +               c->vulnerabilities |= MIPS_VULNBL_MELTDOWN;
> +               c->vulnerable |= MIPS_VULNBL_MELTDOWN;
>                 break;
>         case PRID_IMP_LOONGSON_64G:
>                 c->cputype = CPU_LOONGSON64;
> @@ -2100,6 +2102,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>                 set_isa(c, MIPS_CPU_ISA_M64R2);
>                 decode_cpucfg(c);
>                 c->writecombine = _CACHE_UNCACHED_ACCELERATED;
> +               c->vulnerabilities |= MIPS_VULNBL_MELTDOWN |
> +                             MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
>                 break;
>         default:
>                 panic("Unknown Loongson Processor ID!");
> --
> 2.30.0
>
