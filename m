Return-Path: <linux-mips+bounces-3721-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D770590C297
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 05:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A4FB1F24141
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 03:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFFD7F489;
	Tue, 18 Jun 2024 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpqRRuUj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F692AE6C;
	Tue, 18 Jun 2024 03:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718682699; cv=none; b=sFFTfmxGY6ikzISJLTWiQ5KYn7fo61h5mwCiMCj9/qR3CCeeO1FmXgp23t5E27kq9SEPBudDeVUut6RL7eLjmKPr3xpxSVJLw2qQoVA5gBVVwk81yKndDkoatDC8+Zxqz9z6Nvk8gOUSzxtUGQO/914GQKhdCLD+QjErF+gqqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718682699; c=relaxed/simple;
	bh=nociqtk3bSsE8kJMMRF+XlvqQ7nBr3Me0jO5JnaUARA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huIHS2rtHW2hIvobw9pKVYAu05d2oY9F+N1dy4MhNdx5nYZsGH6siZ5YE0kA/JJfIuyKEvSdhEVX5I5j2YegnvKAKwDQBYQSIa3xP2fueALEgRyzn5GFiYESLplZcaCjfaaODkMi0MFKcIyVOQdXDkygff4Yslo6MjDKy1zOWL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpqRRuUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DA0C3277B;
	Tue, 18 Jun 2024 03:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718682698;
	bh=nociqtk3bSsE8kJMMRF+XlvqQ7nBr3Me0jO5JnaUARA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RpqRRuUj84q3WV/qDrxDEUKr9893kHrhTYLZy99WTTwNiRvMRJM4VTEYpaUWTy3ln
	 zdmz7SXynDwewm3gFEQ/plaSuoUbSYXGoafWfQMXzzc53oyxhv5z8ngafIDl/YnOQx
	 eoOYvR1Y5ZwAWWJTs8tcEp5DNH6gMju+hwvu2b6dZIOuPCCPrMfJoqT3IOS5KjOq8m
	 FzGLEzilQsXW9FoGwImyjPJCk5KXievG+QoJwLwvQ79Ow2D49osCOZYafESIFR1moX
	 cHAbb5kfqBoRInuPgZb6hRNaHnBg34Hs6Vrnhprq1ZzFZUHGMQBUxOpTxs//MN0x+K
	 1m3h86jFcueVA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so56082741fa.2;
        Mon, 17 Jun 2024 20:51:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQsFUSZ7gMAtfqAb1pnHsk+DdmvVMiaMWC5xeMjJuvM6zgFoJAFFT6TDiCFbauZpsb+mU8Gk7opq0iq+W+qo8GzOGCwRoI9l+xflU93nHFta0//qpO3LrsC3kXMZdNtz/eVTKxVLh7wg==
X-Gm-Message-State: AOJu0YxVrp+4hIGZ+BlrDUty56krHw/mFRqFUOQQ4C5VrAEW1ZTkw0+R
	/lrDuW21HmN/zhuk5YZfiwU8ndpvaNd5rDOx9cBLl0c8LXJnFNIcbI8PhbY82sNki36uraGCObr
	tWR/SyF4js5nAtcEZ0Wj+zF1hfIQ=
X-Google-Smtp-Source: AGHT+IFaVVSBVOulKW48FnvJmKKkDbE+gEtF57GnFrkJQLztNJZHlO0dxBxd21B6cxjOkIOh3x8ql3Iyhs/qgNXKoes=
X-Received: by 2002:a2e:7c0e:0:b0:2ec:2c72:624d with SMTP id
 38308e7fff4ca-2ec2c726298mr31679261fa.50.1718682696824; Mon, 17 Jun 2024
 20:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
 <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com> <7cbf218e-d311-4c33-aabb-7208eac231ed@app.fastmail.com>
In-Reply-To: <7cbf218e-d311-4c33-aabb-7208eac231ed@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Jun 2024 11:51:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7RQu6wdBBjOBptZX6R63Ypw1qFCoJnZ335bFKd1f=XdA@mail.gmail.com>
Message-ID: <CAAhV-H7RQu6wdBBjOBptZX6R63Ypw1qFCoJnZ335bFKd1f=XdA@mail.gmail.com>
Subject: Re: [PATCH 04/10] MIPS: Move mips_smp_ipi_init call after prepare_cpus
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Serge Semin <fancer.lancer@gmail.com>, 
	"paulburton@kernel.org" <paulburton@kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 6:10=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> =E5=9C=A82024=E5=B9=B46=E6=9C=8817=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=882:53=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> > Hi, Jiaxun
> >
> > On Mon, Jun 17, 2024 at 5:03=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
> >>
> >> This will give platform code a genuine chance to setup
> >> IPI IRQ in prepare_cpus.
> >>
> >> This is the best place for platforms to setup IPI as smp_setup
> >> is too early for IRQ subsystem.
> > mips_smp_ipi_init() is an early_initcall() function, why do you say it
> > is in smp_setup()?
>
> Sorry, I was trying to say that smp_setup is not a good point so we shoul=
d
> go prepare_cpus.
It is not in smp_setup() now, then how do you move it from smp_setup()?

Huacai

>
> The intention of this patch is to move mips_smp_ipi_init to a certain poi=
nt
> so platform would gain control over it.
>
> Thanks
> - Jiaxun
>
> >
> >
> > Huacai
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  arch/mips/kernel/smp.c | 11 ++++++++++-
> >>  1 file changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> >> index fe053fe52147..ddf96c28e2f0 100644
> >> --- a/arch/mips/kernel/smp.c
> >> +++ b/arch/mips/kernel/smp.c
> >> @@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
> >>
> >>         return 0;
> >>  }
> >> -early_initcall(mips_smp_ipi_init);
> >>  #endif
> >>
> >>  /*
> >> @@ -460,12 +459,22 @@ void __init smp_cpus_done(unsigned int max_cpus)
> >>  /* called from main before smp_init() */
> >>  void __init smp_prepare_cpus(unsigned int max_cpus)
> >>  {
> >> +       int rc;
> >> +
> >>         init_new_context(current, &init_mm);
> >>         current_thread_info()->cpu =3D 0;
> >>         mp_ops->prepare_cpus(max_cpus);
> >>         set_cpu_sibling_map(0);
> >>         set_cpu_core_map(0);
> >>         calculate_cpu_foreign_map();
> >> +#ifdef CONFIG_GENERIC_IRQ_IPI
> >> +       rc =3D mips_smp_ipi_init();
> >> +       if (rc) {
> >> +               pr_err("Failed to initialize IPI - disabling SMP");
> >> +               init_cpu_present(cpumask_of(0));
> >> +               return;
> >> +       }
> >> +#endif
> >>  #ifndef CONFIG_HOTPLUG_CPU
> >>         init_cpu_present(cpu_possible_mask);
> >>  #endif
> >>
> >> --
> >> 2.43.0
> >>
>
> --
> - Jiaxun

