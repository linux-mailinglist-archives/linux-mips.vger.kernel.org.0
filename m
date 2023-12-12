Return-Path: <linux-mips+bounces-676-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3180E0F6
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 02:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983091C211ED
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 01:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94AD800;
	Tue, 12 Dec 2023 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PltCFNS/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85847F7;
	Tue, 12 Dec 2023 01:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593DC433D9;
	Tue, 12 Dec 2023 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345546;
	bh=56wbxeUhJYgDd2ytNEZT3Gt0S++vWDl2GvwKVQMXKFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PltCFNS/TgjuGa3bMyHlJxEbAN7+YF5rP7cO7n3jMXbZqNmXURtAx3mwQ5Ww6YgHs
	 mPRXNyDF4+zikSpybneacnUDGemxf31whe2ePlwk6W25RUZOrPM3OXE9C0S/WbiMqG
	 A0K02+gXWIFCoTJhGoqU5YuyzoBNSSr5EoHl2m20uPsYGc34bn06kfYT7kX7yC9yTv
	 9/FN87t+tom4eMXSui5jMnTcdo+HsuFqux9xdF86nSD/1hPGo+SKQv1bOsh5eiDjHS
	 E0MC23K7lnGiPEuMcOZBE0rMcm/8JLbMVuzQRmZaYu9vWe38/+qYl/vpt6ZzjubR6p
	 vNxhoKO1HJ7QA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54f4b31494fso7588441a12.1;
        Mon, 11 Dec 2023 17:45:46 -0800 (PST)
X-Gm-Message-State: AOJu0YxsawPmUZ4Y3M+JXWWESdvxapxDTe00ix+6jhsY5K5wRyxwq0MN
	xmmGqc7KPxNahiXupgGh5tnT7V4zxm5G0Ul5U9Q=
X-Google-Smtp-Source: AGHT+IE+myz1y+imUhih1WAbnotnpY7CT1VGSHXmSN82YiQ0JQNEnXZmKCzUD0Cmy82QNQ/UQ0/QTex1BuF3l9mUCK0=
X-Received: by 2002:a50:9357:0:b0:54c:553e:67f5 with SMTP id
 n23-20020a509357000000b0054c553e67f5mr5579304eda.8.1702345544702; Mon, 11 Dec
 2023 17:45:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211135147.380223-1-sashal@kernel.org> <20231211135147.380223-36-sashal@kernel.org>
In-Reply-To: <20231211135147.380223-36-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 12 Dec 2023 09:45:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5iwcSA7ASNknQZL3ozoMA=zPOWnEbZk9Ha1tT4io4-+A@mail.gmail.com>
Message-ID: <CAAhV-H5iwcSA7ASNknQZL3ozoMA=zPOWnEbZk9Ha1tT4io4-+A@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 36/47] mips/smp: Call rcutree_report_cpu_starting()
 earlier
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, peterz@infradead.org, jiaxun.yang@flygoat.com, 
	tglx@linutronix.de, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

The same with the LoongArch version, rcutree_report_cpu_starting()
only exists since 6.7.

Huacai

On Mon, Dec 11, 2023 at 9:53=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Stefan Wiehler <stefan.wiehler@nokia.com>
>
> [ Upstream commit 55702ec9603ebeffb15e6f7b113623fe1d8872f4 ]
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
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/mips/kernel/smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 8fbef537fb885..82e2e051b4161 100644
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
> 2.42.0
>

