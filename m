Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8FD7E1EBC
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 11:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjKFKoS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 05:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjKFKoR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 05:44:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D4AAB
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 02:44:14 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74177C433C7
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699267454;
        bh=3Re9Tjq90U7m7+ILD1Gia2q1EyVaQwv16+ZpyE+MyP0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rZE7ODUZoYvGuwteKImXQfu9qVrK9ZC+9q49WPUsfcqExUy+xc0GLF4UA7pMPDAtd
         JFM7DUy8DZXNc5Ly+CkCVyiQucgS9HYTF9kxwGJ4a38Nm/r4GX4OGFaQlI1JNWV8Jr
         STSqXn4byvPLo6KjAe2wdjQf85F8C5Ny7FFuvMRCHIG5xHRtRqrA3XbCPHzndaxrzS
         Zav8okJYMMNMbuflxesxksFv5Cu+uAvtxoAZg2HkzQAUYy1tR+BtnG9WlHUpxZIhTw
         cAPXweg6BoNMtHnA4HXeIzvsCGU8PRnsVRTnzF+1B57wIVZPoybXkS1TPpxZdoUnXy
         RbtnX6z5KJ94g==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9dd98378a39so355270566b.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Nov 2023 02:44:14 -0800 (PST)
X-Gm-Message-State: AOJu0YwnOEgwKF+PwtbroegaYShoydmjb1K+CT1aNycjRhUROpWsayH2
        PsLsl2ZM2dp4TU/Z9bvV5pn6O/ytpvy0SnNZnSo=
X-Google-Smtp-Source: AGHT+IEy7zsKKnuIj0vktFSgKd5bSbykwftJGTj0HdUlbd3rG+6CI34Z/HK2PUZ8d/WKeQYszlymkMboNCrQpSxdgQs=
X-Received: by 2002:a17:907:2682:b0:9e0:4910:1666 with SMTP id
 bn2-20020a170907268200b009e049101666mr2601517ejc.35.1699267452931; Mon, 06
 Nov 2023 02:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20231106085140.58254-1-stefan.wiehler@nokia.com>
In-Reply-To: <20231106085140.58254-1-stefan.wiehler@nokia.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Mon, 6 Nov 2023 18:43:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5bsfO2uO5Hmvj+UUDQija5zEgRFydZLUpWc6Pp8iH9xw@mail.gmail.com>
Message-ID: <CAAhV-H5bsfO2uO5Hmvj+UUDQija5zEgRFydZLUpWc6Pp8iH9xw@mail.gmail.com>
Subject: Re: [PATCH] mips/smp: Call rcu_cpu_starting() earlier
To:     Stefan Wiehler <stefan.wiehler@nokia.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Stefan,

rcu_cpu_starting() has been renamed to rcutree_report_cpu_starting() now.

Huacai

On Mon, Nov 6, 2023 at 5:12=E2=80=AFPM Stefan Wiehler <stefan.wiehler@nokia=
.com> wrote:
>
> rcu_cpu_starting() must be called before clockevents_register_device() to=
 avoid
> the following lockdep splat triggered by calling list_add() when
> CONFIG_PROVE_RCU_LIST=3Dy:
>
>   WARNING: suspicious RCU usage
>   ...
>   -----------------------------
>   kernel/locking/lockdep.c:3680 RCU-list traversed in non-reader section!=
!
>
>   other info that might help us debug this:
>
>   RCU used illegally from offline CPU!
>   rcu_scheduler_active =3D 1, debug_locks =3D 1
>   no locks held by swapper/1/0.
>   ...
>   Call Trace:
>   [<ffffffff8012a434>] show_stack+0x64/0x158
>   [<ffffffff80a93d98>] dump_stack_lvl+0x90/0xc4
>   [<ffffffff801c9e9c>] __lock_acquire+0x1404/0x2940
>   [<ffffffff801cbf3c>] lock_acquire+0x14c/0x448
>   [<ffffffff80aa4260>] _raw_spin_lock_irqsave+0x50/0x88
>   [<ffffffff8021e0c8>] clockevents_register_device+0x60/0x1e8
>   [<ffffffff80130ff0>] r4k_clockevent_init+0x220/0x3a0
>   [<ffffffff801339d0>] start_secondary+0x50/0x3b8
>
> raw_smp_processor_id() is required in order to avoid calling into lockdep
> before RCU has declared the CPU to be watched for readers.
>
> See also commit 29368e093921 ("x86/smpboot:  Move rcu_cpu_starting() earl=
ier"),
> commit de5d9dae150c ("s390/smp: move rcu_cpu_starting() earlier") and com=
mit
> 99f070b62322 ("powerpc/smp: Call rcu_cpu_starting() earlier").
>
> Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
> ---
>  arch/mips/kernel/smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 8fbef537fb88..81f6c4f8fbc1 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -351,10 +351,11 @@ early_initcall(mips_smp_ipi_init);
>   */
>  asmlinkage void start_secondary(void)
>  {
> -       unsigned int cpu;
> +       unsigned int cpu =3D raw_smp_processor_id();
>
>         cpu_probe();
>         per_cpu_trap_init(false);
> +       rcu_cpu_starting(cpu);
>         mips_clockevent_init();
>         mp_ops->init_secondary();
>         cpu_report();
> @@ -366,7 +367,6 @@ asmlinkage void start_secondary(void)
>          */
>
>         calibrate_delay();
> -       cpu =3D smp_processor_id();
>         cpu_data[cpu].udelay_val =3D loops_per_jiffy;
>
>         set_cpu_sibling_map(cpu);
> --
> 2.31.0
>
