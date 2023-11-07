Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E687E3B52
	for <lists+linux-mips@lfdr.de>; Tue,  7 Nov 2023 12:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjKGLtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Nov 2023 06:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbjKGLtO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Nov 2023 06:49:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1FF10A
        for <linux-mips@vger.kernel.org>; Tue,  7 Nov 2023 03:49:11 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38904C433C7
        for <linux-mips@vger.kernel.org>; Tue,  7 Nov 2023 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699357751;
        bh=zG1AG6s9H4mVUWEREHKyWLjEcAuuHQCGHsj0eiqoWjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cvWca5F7Y53oEf2uLuJyty+BZ1hmHcO+zzvwX/4Q7yNDAzRI7tWy4lYqPf6HyExsU
         e1hzr1wToEgt4cE9nCwW6TzgNNsMlIJwF3/tog7YLUNF+erADlqU6YN6DiXGfYrP4p
         ctvZkRF3mTWvYRRPPs8SvueBUngPhCneKMax8G2sWiZdWYTSUrKcj8K4o9mpG71Nd/
         Adkotxn0zE9Wpctat0FmphCxGHTe8Kr+nwIZF1gRF9bFc5kio3n1PtHpnVTSjouVWH
         5GCodX9YnMuIUoD66hV7A8k9NP1Mz9pI+uqEZNapZwG1HOPn/INE/gtRo3PgDjvYhq
         b+bzABR2vF+qQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9e2838bcb5eso70004466b.0
        for <linux-mips@vger.kernel.org>; Tue, 07 Nov 2023 03:49:11 -0800 (PST)
X-Gm-Message-State: AOJu0YxThIDQs5gjbm39z3okOT4/ERoixbInSHWIuL1p+e/y8dXs33Ki
        /3mhOQ3GNjDdGRfCulexIU6y+8eMIFvzI9DSYlc=
X-Google-Smtp-Source: AGHT+IEMFIJo0PX1nm5d6zO9FOaZgW3caWPL9frZMn/i8nvR3Adus6PZH+wE9M3bXY9q3O2rI0PNVe2N9Jqkgm0XNb8=
X-Received: by 2002:a17:907:783:b0:9b9:f980:8810 with SMTP id
 xd3-20020a170907078300b009b9f9808810mr18190379ejb.34.1699357749604; Tue, 07
 Nov 2023 03:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20231106121206.62650-1-stefan.wiehler@nokia.com>
In-Reply-To: <20231106121206.62650-1-stefan.wiehler@nokia.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 7 Nov 2023 19:48:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4V3t=f9r95kBROj37my0OYOsJ73X_7kJ7UkCOaJQNCnA@mail.gmail.com>
Message-ID: <CAAhV-H4V3t=f9r95kBROj37my0OYOsJ73X_7kJ7UkCOaJQNCnA@mail.gmail.com>
Subject: Re: [PATCH v2] mips/smp: Call rcutree_report_cpu_starting() earlier
To:     Stefan Wiehler <stefan.wiehler@nokia.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Mon, Nov 6, 2023 at 8:16=E2=80=AFPM Stefan Wiehler <stefan.wiehler@nokia=
.com> wrote:
>
> rcutree_report_cpu_starting() must be called before
> clockevents_register_device() to avoid the following lockdep splat trigge=
red by
> calling list_add() when CONFIG_PROVE_RCU_LIST=3Dy:
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
> - Rename rcu_cpu_starting() to rcutree_report_cpu_starting() due to commi=
t
> 448e9f34d91d ("rcu: Standardize explicit CPU-hotplug calls")
> ---
>  arch/mips/kernel/smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 8fbef537fb88..82e2e051b416 100644
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
> +       rcutree_report_cpu_starting(cpu);
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
