Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 688FC1A2E76
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 06:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgDIEnm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 00:43:42 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46562 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgDIEnm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 00:43:42 -0400
Received: by mail-qk1-f193.google.com with SMTP id g74so2724255qke.13;
        Wed, 08 Apr 2020 21:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pN8K9d/smQkY93euWsuNdLo1V9nXef3pGDe94nCKaqQ=;
        b=Mc6FnAS+klN7smZGfVqOap4kiZv0TGeatZYBp/u+F9PhPcbX5MdxkHPVzu/caIxCDp
         NeedLyZmXFiPreVChc3EJrsRJma2NWQWmCK2oT4mqW4JW1EZn/deUaM87+dFyPUgVOVD
         8Bh1CrONLrvlk7LVNf7ysA2e8XrpDCnTPbMLnJXpZb4PTzPpg7gbXPv46ntu2qJupuay
         eDtWaIAhzWwfe2Zmmai2/iCpZFYx057ndhUOWXeke6oVI8Dw3WFBPeO6EB4/6cyAZ88x
         rg5/SC03PuvZojQUyOSTZMTn4G+yWJQ8b5ErtAXDZQJOhCOsk8XkHvzyMYYO28hEicV+
         rvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pN8K9d/smQkY93euWsuNdLo1V9nXef3pGDe94nCKaqQ=;
        b=jSzhxrG+iMJlPAlLHtTJ+odgA6qMaECxkLpB5C+Ymc3DjlulZyPHdRCUkVZKQtS8zI
         2uvuPGxfmgZArZWKJloJfH1s3ha9zJZ7M2HZjOsAJsi1+bFMytggVCtxBW2wtMenqI13
         Qp2htvui9Fk2WY5eMvTnfk4lqSNq+7Vw8NQ074ajatEPzmP4kkGJhZ+X7uZ1XSkmIq9O
         xNqYF04Ich4W066xWpriImKPgkWvU2xv6SA8yZMoaNnPRhbTKQR4LsElzXKyKTyQqovX
         dCksUGl9Mgfb8n19puU/c7vchfrclhsDAlu/gAYAowTD+fcO2xvpkIOWSMlVaYzAz6R3
         Ywxw==
X-Gm-Message-State: AGi0Pubzx1caf3U2Wn/L4TL3vwOqbM1axUlMW2hGZdHyPjT847BlBnz4
        0761J6s6849DgJgmjX3XtngmjHmOK/qQgfTRgVYmzLvp
X-Google-Smtp-Source: APiQypKYLGzhxXuX8MuHfg6Si17GeScaEyAH7T1yZU0LyD/Ro2p//Q/+XZvDiY3kZ7daOHh+o9bQ6CTUqwV3jI/U718=
X-Received: by 2002:a37:702:: with SMTP id 2mr10899730qkh.134.1586407419852;
 Wed, 08 Apr 2020 21:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Thu, 9 Apr 2020 12:43:28 +0800
Message-ID: <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tiezhu Yang <yangtiezhu@loongson.cn> =E4=BA=8E2020=E5=B9=B44=E6=9C=889=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=8811:10=E5=86=99=E9=81=93=EF=BC=9A
>
> There is no need to build and call check_bugs32() under CONFIG_64BIT,
> just limit it under CONFIG_32BIT.

Since 32bit is subset of 64bit, and due to the code, I think that the
initial purpose
of check_bugs32() is also willing to run even with CONFIG_64BIT.

For example, if we have a CPU which is 64bit, and work well on 64bit mode, =
while
has a bug only on 32bit mode, check_bugs32 should be used here.

Loongson's 3A 1000 is the example, I cannot support FP32 mode well.

>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/bugs.h | 4 +++-
>  arch/mips/kernel/cpu-probe.c | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
> index d72dc6e..5f8d2bf 100644
> --- a/arch/mips/include/asm/bugs.h
> +++ b/arch/mips/include/asm/bugs.h
> @@ -35,7 +35,9 @@ static inline void check_bugs(void)
>         unsigned int cpu =3D smp_processor_id();
>
>         cpu_data[cpu].udelay_val =3D loops_per_jiffy;
> -       check_bugs32();
> +
> +       if (IS_ENABLED(CONFIG_32BIT))
> +               check_bugs32();
>
>         if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
>                 check_bugs64();
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index f21a230..85d7273 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -461,6 +461,7 @@ static inline void cpu_set_mt_per_tc_perf(struct cpui=
nfo_mips *c)
>                 c->options |=3D MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
>  }
>
> +#ifdef CONFIG_32BIT
>  static inline void check_errata(void)
>  {
>         struct cpuinfo_mips *c =3D &current_cpu_data;
> @@ -484,6 +485,7 @@ void __init check_bugs32(void)
>  {
>         check_errata();
>  }
> +#endif /* CONFIG_32BIT */
>
>  /*
>   * Probe whether cpu has config register by trying to play with
> --
> 2.1.0
>


--=20
YunQiang Su
