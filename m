Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25402E7D7B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 01:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgLaAce (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 19:32:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:56484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgLaAce (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Dec 2020 19:32:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AD4C2220B;
        Thu, 31 Dec 2020 00:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609374713;
        bh=Tn0LiqPnpZnHJamEQGERGFpUWOzDz5GQlr6Pt8wUPYc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TnGQQBdaVNnXzj9xTIlosUAuwZEXGzXri++IBQZ9fJgXtNcJNMUmjRe1CujIooEv8
         QqeKaovIqguHkar6jB8/2arK++Ltn1wsQ05hxIkuXNE/ex2qdSfp0o6GZsr4BTllvZ
         RbQYX6bRcTCWIbh+VaIO+bDa/rQrWI4DnyG16hWb6VI0CRc5e7InP5C4bgJOxvJeSP
         drpBrQk0JLxfX/VJ8oOnTt+ojfNgNF2ni8Q7xs5Pi0JF2Nc1N8iC0tiR7TQiLXlS0p
         IClTgGHTHusWwslXYE8HuOHpozoSuyE7nrY9g/zVH+Sjy2rBkHRiCtjtWDzb47UDO8
         jL0Ar5U7k49tg==
Received: by mail-io1-f42.google.com with SMTP id 81so15994390ioc.13;
        Wed, 30 Dec 2020 16:31:53 -0800 (PST)
X-Gm-Message-State: AOAM532EaJ9KbzEK7q29Q+3v8AjvJdJvUcIhFDT9ODtOcIxwcqDL2bN4
        QA+54Rmv454W0W6TqKtkSuO+YV6eBra6oORJfSw=
X-Google-Smtp-Source: ABdhPJzIjJpm5QsBn/zml9Qapxd/6diA1nlzLqh48RfiUxx4riPMkXnEBkMIPvuVbr1hEeOxSG/4BvkRYmojqaN0iYY=
X-Received: by 2002:a5e:db4b:: with SMTP id r11mr44848340iop.148.1609374712729;
 Wed, 30 Dec 2020 16:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com> <20201230032314.10042-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20201230032314.10042-2-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 31 Dec 2020 08:31:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7xP03NnpQPiP7jH3DH3DnoRnZqLWdtCm9eun7B_ems=A@mail.gmail.com>
Message-ID: <CAAhV-H7xP03NnpQPiP7jH3DH3DnoRnZqLWdtCm9eun7B_ems=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: cpu-probe: Vulnerabilities for MIPS cores
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Cercueil <paul@crapouillou.net>,
        YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Wed, Dec 30, 2020 at 11:25 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Accorading to MIPS's announcement[1], only P5600 and P6600 is
> affected by spectre v1 and v2, other cores are not affected.
>
> So we mark vulnerabilities states for MIPS cores as known and
> set P5600 and P6600 as vulnerable.
>
> [1]: https://www.mips.com/blog/mips-response-on-speculative-execution-and-side-channel-vulnerabilities/
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/cpu-probe.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 03adeed58efb..2460783dbdb1 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1688,6 +1688,9 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>  static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
>  {
>         c->writecombine = _CACHE_UNCACHED_ACCELERATED;
> +       c->vulnerabilities |= MIPS_VULNBL_MELTDOWN |
> +                             MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
> +
>         switch (c->processor_id & PRID_IMP_MASK) {
>         case PRID_IMP_QEMU_GENERIC:
>                 c->writecombine = _CACHE_UNCACHED;
> @@ -1794,10 +1797,12 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
>         case PRID_IMP_P5600:
>                 c->cputype = CPU_P5600;
>                 __cpu_name[cpu] = "MIPS P5600";
> +               c->vulnerable |= MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
>                 break;
>         case PRID_IMP_P6600:
>                 c->cputype = CPU_P6600;
>                 __cpu_name[cpu] = "MIPS P6600";
> +               c->vulnerable |= MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
>                 break;
>         case PRID_IMP_I6400:
>                 c->cputype = CPU_I6400;
> --
> 2.30.0
>
