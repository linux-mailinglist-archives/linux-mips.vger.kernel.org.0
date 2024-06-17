Return-Path: <linux-mips+bounces-3710-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47E90B2E2
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 16:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B66280CFE
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 14:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E2916E88D;
	Mon, 17 Jun 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORi7kl31"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06651D953A;
	Mon, 17 Jun 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632417; cv=none; b=H6m9TESLytwOSQSenTnq0LkI/unDdOUiZxLUkCGQvq+TPTZ8NJuqXt9QNxoCDaRgdWgonboQL/LEjNBfQQRdi3yRGTPsPP9SVDH62XDBJXTm67VWrQ8NSJwpur4oC5yec+OwAvC15NimItG3ZCg3V2OpZUBRoHPawSqdyGt7NyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632417; c=relaxed/simple;
	bh=d8J0BnSUrqs2/z/I5CpCqWjmj9DR+K/K4waYXR+Gu20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUdsBU3ygX/So9DVwVzhbT13YguF7ZujFOWDXeC2H11ioumpD/rHePB5irm8Fsg9eS3tVuQFPdApTf9Afh8M4KKqjD9c7GppOakoMGQxjqzg9A9f49oT/YwwCz+LHILFsF1pPYuaUp5MC3y1Csp7SlfeDjiIWSmxL1uIox9wqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORi7kl31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A794C4AF50;
	Mon, 17 Jun 2024 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718632416;
	bh=d8J0BnSUrqs2/z/I5CpCqWjmj9DR+K/K4waYXR+Gu20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ORi7kl31MXL+SUdQgt97Ww8UWLftfBFOv+eOxFrAqzwQREuch5fOG/fyzAPolYlwu
	 HZfGPO6V/NofZEto7JRv/dPIDkzStaxBLqhPtpoEagwWmpstLydM70gJFoga17nESE
	 /lyD/6jO5YVzYxbyzUlfgvv8wUmD1alKzq/1G6wpSawyIIUTEBGFOhQN0cKA0BB0bB
	 hlb1SOBDvw/WnlxPJE7V5Cja/t1Ah7IK0b/uBVEtYZEixFQcCNr/inLLqoG2gAXmLA
	 Ac/Pt0a4lnfHzpMNYq9BPdcf2xpJKRKFT4iBgn/2m5waksVIEwNMYfMehoCMK3l0GG
	 CYJJVDIp5muyQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso7648319a12.3;
        Mon, 17 Jun 2024 06:53:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEJGsiw+zMDyyoM26PJ+ob3CNJZMy4+y9r06OD2RNJZ4HjRa7xt1q0kuu3sTXnOaDtZXfWBl4AX4hKal6e8qUswED9/+78Olj38RV9Lz40veN27ugnhHRIPQWH1Rk55gESzYkZ+dxQsQ==
X-Gm-Message-State: AOJu0YwBOWOyzrEEXrBwkmFqaS/PplLwt9T7x5gfRE9nTGyRSm2Z7VwZ
	h0OhTs2+AcMDY91hKJT7VciSt5yr2t05HohAmVxVjgl6Tf7yYWsBKySxMUmlt0QFD+Gs3YV8grJ
	se9DkHDkQNM1UYOUHppUfhae3YbI=
X-Google-Smtp-Source: AGHT+IE74abFQ3fwm6GbmmB4GzzZArDYRVlIxiLGvFqKC0RlI/d5t4xtIcHy4urMVzI/C63DZ6+XJcywUPp733q+v5A=
X-Received: by 2002:a50:a454:0:b0:57c:5bdd:1c64 with SMTP id
 4fb4d7f45d1cf-57cbd6a5a6amr5459568a12.41.1718632414895; Mon, 17 Jun 2024
 06:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com> <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
In-Reply-To: <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Jun 2024 21:53:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com>
Message-ID: <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com>
Subject: Re: [PATCH 04/10] MIPS: Move mips_smp_ipi_init call after prepare_cpus
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiaxun

On Mon, Jun 17, 2024 at 5:03=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> This will give platform code a genuine chance to setup
> IPI IRQ in prepare_cpus.
>
> This is the best place for platforms to setup IPI as smp_setup
> is too early for IRQ subsystem.
mips_smp_ipi_init() is an early_initcall() function, why do you say it
is in smp_setup()?


Huacai
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/smp.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index fe053fe52147..ddf96c28e2f0 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
>
>         return 0;
>  }
> -early_initcall(mips_smp_ipi_init);
>  #endif
>
>  /*
> @@ -460,12 +459,22 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  /* called from main before smp_init() */
>  void __init smp_prepare_cpus(unsigned int max_cpus)
>  {
> +       int rc;
> +
>         init_new_context(current, &init_mm);
>         current_thread_info()->cpu =3D 0;
>         mp_ops->prepare_cpus(max_cpus);
>         set_cpu_sibling_map(0);
>         set_cpu_core_map(0);
>         calculate_cpu_foreign_map();
> +#ifdef CONFIG_GENERIC_IRQ_IPI
> +       rc =3D mips_smp_ipi_init();
> +       if (rc) {
> +               pr_err("Failed to initialize IPI - disabling SMP");
> +               init_cpu_present(cpumask_of(0));
> +               return;
> +       }
> +#endif
>  #ifndef CONFIG_HOTPLUG_CPU
>         init_cpu_present(cpu_possible_mask);
>  #endif
>
> --
> 2.43.0
>

