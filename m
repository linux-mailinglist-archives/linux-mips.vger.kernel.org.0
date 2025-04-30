Return-Path: <linux-mips+bounces-8875-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F326AA43C4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 09:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8439D4C5828
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 07:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EF21E9B14;
	Wed, 30 Apr 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1oNwzmK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59ED1DDC33;
	Wed, 30 Apr 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997696; cv=none; b=ArumE7hY53usVn4pD93OwXrHIyvZD9BAnqz4LQIp67bQMhHI3fKXDEXadNABd3XtsCXFLZqgTmSncEvFp4zbaW6T0D5T0mvFxy4DOukOQymbdm7NmToiusg6SFBVdIkg620Bvqp4fNuJYP0lYeGxIV1Fu9glFR1ud0g2/6QHn18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997696; c=relaxed/simple;
	bh=juKhsiXQlSlT1Py1/8cG1XBeIcd7V5ymi7OQysFDwFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leOpBkcOF2a5sTnoO73suEn1NLCjBxitxvLLyzz6vuiuR+hmwPQMQL5Apo3mi+QfkLku2Zs/7VBqbpQYqMweDSBt6uGd3N9kd+239g4nNJknyjwvwJCoeAfcY54zr2rSDqf2wUTUobM5nyVwpKqgLUX5ztbJPl04lUXF5A6bWCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1oNwzmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DD5C4CEEE;
	Wed, 30 Apr 2025 07:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745997696;
	bh=juKhsiXQlSlT1Py1/8cG1XBeIcd7V5ymi7OQysFDwFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V1oNwzmKcydgPBEBc0qNZt7sxiF1tcD13XRPywA2XF90XQ7L6ga34O2sP0VDZjWH/
	 PODW2+ixbJRA9zv8tjyzYvEQnaT4LmF/DumNwb3yT+olGAiBQFN8z7gj156qoAPml6
	 G5KaorVpvnUbMcx49EBN5NBKEZzATWfNy4C/76+BAjlMMJ+IMqfXsPtWy9zYdoonQm
	 ehqKaQcoWzWWKqpxA5YDXOP1STkHEP3o+9qvuLjna00Ob4iEKdOVSLKT/ne4E983n0
	 Y5Rn37EMJiI+Z9yGdQ/NaisPgIjr4sefRw/sHw9T/m21nRUXm1M1D58m2k3SVfNEsF
	 N7XsCkP93Vwng==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acec5b99052so298398466b.1;
        Wed, 30 Apr 2025 00:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxR1E8miMmx8D7yWP3NIvg1RjuIXZNRBXl6O2dPD//7XXBVhZ4Dt8j2X3eAkL62Rla2hMw9k9I3KbwCg==@vger.kernel.org, AJvYcCX7dHGPISl/nMUpTQFykL8mMPS0knvBcrBnoPfDMyvpGfFoipLWRG1TbVsAzeXu0NcJZJXEvq6R3S++iZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFMbXtE2a8fzJaxbZbqiZOliAZwHkRE8oFNOhrOWJQnMt7AjQ
	9cbcsdLClybWrl/qXFy1rgfFXB6MupyvPwvuHVHtqCEZpQhqpJaomwn3o8TeYnGhZffJa0wnC7q
	Q3WIlghlkDqcmWCyLvctidWUTWO0=
X-Google-Smtp-Source: AGHT+IHr2l0nJj4g3Hz9fIwIKkboVwKyqnOJZ6LXvUjPdN0cLX2sJSlvhw1AIgkfEEK/ZcTWyDdvUXnKe0tsC+a6ZVE=
X-Received: by 2002:a17:906:c10a:b0:ac3:f1dc:f3db with SMTP id
 a640c23a62f3a-acedc5df056mr166315866b.13.1745997694694; Wed, 30 Apr 2025
 00:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>
 <CAAhV-H6JSKwWvLwPSK7Bu6jZixRn4U+xtpxGL4KBtsmjhc3PVA@mail.gmail.com>
 <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com> <87wmb2ceh7.fsf@BLaptop.bootlin.com>
In-Reply-To: <87wmb2ceh7.fsf@BLaptop.bootlin.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Apr 2025 15:21:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H65b5Ae-cCYYHTx0QBhYJ_fzSVLFGY0RH1PCq0XbvNPQA@mail.gmail.com>
X-Gm-Features: ATxdqUGzV7f-2CwC7yRsezAmWVWybBRUfnsKeu9xHZLfH9zsa2vMx-GVzSn5-6U
Message-ID: <CAAhV-H65b5Ae-cCYYHTx0QBhYJ_fzSVLFGY0RH1PCq0XbvNPQA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: SMP: Implement parallel CPU bring up for EyeQ
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 3:09=E2=80=AFPM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Hello Huacai,
>
> > Hi, Gregory,
> >
> > On Sun, Apr 27, 2025 at 6:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> >>
> >> Hi, Gregory and Thomas,
> >>
> >> I'm sorry I'm late, but I have some questions about this patch.
> >>
> >> On Mon, Apr 14, 2025 at 3:12=E2=80=AFAM Gregory CLEMENT
> >> <gregory.clement@bootlin.com> wrote:
> >> >
> >> > Added support for starting CPUs in parallel on EyeQ to speed up boot=
 time.
> >> >
> >> > On EyeQ5, booting 8 CPUs is now ~90ms faster.
> >> > On EyeQ6, booting 32 CPUs is now ~650ms faster.
> >> >
> >> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> >> > ---
> >> > Hello,
> >> >
> >> > This patch allows CPUs to start in parallel. It has been tested on
> >> > EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. The=
se
> >> > systems use CPS to support SMP.
> >> >
> >> > As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
> >> > faster.
> >> >
> >> > Currently, this support is only for EyeQ SoC. However, it should als=
o
> >> > work for other CPUs using CPS. I am less sure about MT ASE support,
> >> > but this patch can be a good starting point. If anyone wants to add
> >> > support for other systems, I can share some ideas, especially for th=
e
> >> > MIPS_GENERIC setup that needs to handle both types of SMP setups.
> >> >
> [...]
> >> >   * A logical cpu mask containing only one VPE per core to
> >> > @@ -74,6 +76,8 @@ static cpumask_t cpu_core_setup_map;
> >> >
> >> >  cpumask_t cpu_coherent_mask;
> >> >
> >> > +struct cpumask __cpu_primary_thread_mask __read_mostly;
> >> > +
> >> >  unsigned int smp_max_threads __initdata =3D UINT_MAX;
> >> >
> >> >  static int __init early_nosmt(char *s)
> >> > @@ -374,10 +378,15 @@ asmlinkage void start_secondary(void)
> >> >         set_cpu_core_map(cpu);
> >> >
> >> >         cpumask_set_cpu(cpu, &cpu_coherent_mask);
> >> > +#ifdef CONFIG_HOTPLUG_PARALLEL
> >> > +       cpuhp_ap_sync_alive();
> >> This is a "synchronization point" due to the description from commit
> >> 9244724fbf8ab394a7210e8e93bf037abc, which means things are parallel
> >> before this point and serialized after this point.
> >>
> >> But unfortunately, set_cpu_sibling_map() and set_cpu_core_map() cannot
> >> be executed in parallel. Maybe you haven't observed problems, but in
> >> theory it's not correct.
>
> I am working on it. To address your remark, I have a few options that I
> evaluate.
I suggest to revert this patch temporary in mips-next.

Huacai

>
> > I don't know whether you have done reboot tests (for ~1000 times),
> > Jiaxun Yang submitted similar patches for LoongArch [1], but during
> > reboot tests we encountered problems that I have described in my
> > previous reply.
> >
> > [1] https://lore.kernel.org/loongarch/20240716-loongarch-hotplug-v3-0-a=
f59b3bb35c8@flygoat.com/
>
> I saw that series and I wondered why the last patch was not merged.
>
> I performed around 100 tests so far without encountering any issues; I
> plan to automate them further to gather more data.
>
> Gregpory
>
> >
> > Huacai
> >
> >>
> >> Huacai
> >>
> >> > +#endif
> >> >         notify_cpu_starting(cpu);
> >> >
> >> > +#ifndef CONFIG_HOTPLUG_PARALLEL
> >> >         /* Notify boot CPU that we're starting & ready to sync count=
ers */
> >> >         complete(&cpu_starting);
> >> > +#endif
> >> >
> >> >         synchronise_count_slave(cpu);
> >> >
> >> > @@ -386,11 +395,13 @@ asmlinkage void start_secondary(void)
> >> >
> >> >         calculate_cpu_foreign_map();
> >> >
> >> > +#ifndef CONFIG_HOTPLUG_PARALLEL
> >> >         /*
> >> >          * Notify boot CPU that we're up & online and it can safely =
return
> >> >          * from __cpu_up
> >> >          */
> >> >         complete(&cpu_running);
> >> > +#endif
> >> >
> >> >         /*
> >> >          * irq will be enabled in ->smp_finish(), enabling it too ea=
rly
> >> > @@ -447,6 +458,12 @@ void __init smp_prepare_boot_cpu(void)
> >> >         set_cpu_online(0, true);
> >> >  }
> >> >
> >> > +#ifdef CONFIG_HOTPLUG_PARALLEL
> >> > +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *=
tidle)
> >> > +{
> >> > +       return mp_ops->boot_secondary(cpu, tidle);
> >> > +}
> >> > +#else
> >> >  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
> >> >  {
> >> >         int err;
> >> > @@ -466,6 +483,7 @@ int __cpu_up(unsigned int cpu, struct task_struc=
t *tidle)
> >> >         wait_for_completion(&cpu_running);
> >> >         return 0;
> >> >  }
> >> > +#endif
> >> >
> >> >  #ifdef CONFIG_PROFILING
> >> >  /* Not really SMP stuff ... */
> >> >
> >> > ---
> >> > base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> >> > change-id: 20250411-parallel-cpu-bringup-78999a9235ea
> >> >
> >> > Best regards,
> >> > --
> >> > Gr=C3=A9gory CLEMENT, Bootlin
> >> > Embedded Linux and Kernel engineering
> >> > https://bootlin.com
> >> >
> >> >
>
> --
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

