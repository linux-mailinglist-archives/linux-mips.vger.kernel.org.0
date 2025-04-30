Return-Path: <linux-mips+bounces-8876-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F0AA4408
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 09:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD4418834E3
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 07:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6981EA7F1;
	Wed, 30 Apr 2025 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J21B68qh"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24211C5489;
	Wed, 30 Apr 2025 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998338; cv=none; b=twhQxVRjP+rjf74nAdMNg9XAW/e+Sn9JvTxaYIlmFe44+bEnH8Y5epxT+0SLMV0itGo5Ey6JEcM1SncXs0qyKYhQ5ZTkZzoLnGGaDZjjYblfGaB5jU1qVlaVeeuoo7W8PS24SyHC0px0+bHTo4vPmovDl1N/Jxvq3fRgc/5LKV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998338; c=relaxed/simple;
	bh=lh2NhYND5L/q7ZH7P7x1WitE03Jcl7OAEHOBZ1FPAZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YQ34QluPWm0QTJ9PF5BZxpKKi1qDME8x0cwaDAdyRAhnz665dWK+qk0vXMZ69V8+hQbgluBY5d6dR87OWft+bI1jt51zcZYt8NNmalgpWVTZu8M6rLhYp5g8OwM+VfVe6TL/NhJ5Zw5vJLWUdnEoVkh+tneazpp7sHlM0hv5fr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J21B68qh; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21CFA439C6;
	Wed, 30 Apr 2025 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745998320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvtHvuxI8loluQxLe+C+G5B6+CQYenOucGelx/9Ax2E=;
	b=J21B68qhK60h6vl70s/Jvn/Y4hzfmHFB72YsasijD39eGnzoehUUit9ePl0eRzduzoIoEu
	l7fBr3ntFz7vTXqvrSf+r/DzCnVFfdH28peNZ6uSnF+aYwVesTYEXBJnI6XVWXM2bmQgBK
	c3SFNscAq2Flojz8qZPSuoBz7YxhJDGIN7cnE93rNQEkJaywnDOfvsfnBxYqFNkgSjeHEM
	GCEMaxTfiF2SeGHiUJe5qeumV9z2R1ez8IrQBeC3SQK59kPxHI4GbUdpDYIzui1+kYuU+3
	8GdMFsduBRM92YRn7CzG6kWCYQoipE93gOxL1zoABU6aEpXlq6x0qsdBO2toIA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SMP: Implement parallel CPU bring up for EyeQ
In-Reply-To: <CAAhV-H65b5Ae-cCYYHTx0QBhYJ_fzSVLFGY0RH1PCq0XbvNPQA@mail.gmail.com>
References: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>
 <CAAhV-H6JSKwWvLwPSK7Bu6jZixRn4U+xtpxGL4KBtsmjhc3PVA@mail.gmail.com>
 <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com>
 <87wmb2ceh7.fsf@BLaptop.bootlin.com>
 <CAAhV-H65b5Ae-cCYYHTx0QBhYJ_fzSVLFGY0RH1PCq0XbvNPQA@mail.gmail.com>
Date: Wed, 30 Apr 2025 09:31:59 +0200
Message-ID: <87o6wecdg0.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeiuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueetgfffueeivdeitdeuhedtteffueffjedthfevvdegvdevgeduhfektdfhleeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegvrgegfhemieguiegvmeeifheitgemheefudgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegvrgegfhemieguiegvmeeifheitgemheefudgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrt
 ghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Huacai Chen <chenhuacai@kernel.org> writes:

> On Wed, Apr 30, 2025 at 3:09=E2=80=AFPM Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
>>
>> Hello Huacai,
>>
>> > Hi, Gregory,
>> >
>> > On Sun, Apr 27, 2025 at 6:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel=
.org> wrote:
>> >>
>> >> Hi, Gregory and Thomas,
>> >>
>> >> I'm sorry I'm late, but I have some questions about this patch.
>> >>
>> >> On Mon, Apr 14, 2025 at 3:12=E2=80=AFAM Gregory CLEMENT
>> >> <gregory.clement@bootlin.com> wrote:
>> >> >
>> >> > Added support for starting CPUs in parallel on EyeQ to speed up boo=
t time.
>> >> >
>> >> > On EyeQ5, booting 8 CPUs is now ~90ms faster.
>> >> > On EyeQ6, booting 32 CPUs is now ~650ms faster.
>> >> >
>> >> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> >> > ---
>> >> > Hello,
>> >> >
>> >> > This patch allows CPUs to start in parallel. It has been tested on
>> >> > EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. Th=
ese
>> >> > systems use CPS to support SMP.
>> >> >
>> >> > As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
>> >> > faster.
>> >> >
>> >> > Currently, this support is only for EyeQ SoC. However, it should al=
so
>> >> > work for other CPUs using CPS. I am less sure about MT ASE support,
>> >> > but this patch can be a good starting point. If anyone wants to add
>> >> > support for other systems, I can share some ideas, especially for t=
he
>> >> > MIPS_GENERIC setup that needs to handle both types of SMP setups.
>> >> >
>> [...]
>> >> >   * A logical cpu mask containing only one VPE per core to
>> >> > @@ -74,6 +76,8 @@ static cpumask_t cpu_core_setup_map;
>> >> >
>> >> >  cpumask_t cpu_coherent_mask;
>> >> >
>> >> > +struct cpumask __cpu_primary_thread_mask __read_mostly;
>> >> > +
>> >> >  unsigned int smp_max_threads __initdata =3D UINT_MAX;
>> >> >
>> >> >  static int __init early_nosmt(char *s)
>> >> > @@ -374,10 +378,15 @@ asmlinkage void start_secondary(void)
>> >> >         set_cpu_core_map(cpu);
>> >> >
>> >> >         cpumask_set_cpu(cpu, &cpu_coherent_mask);
>> >> > +#ifdef CONFIG_HOTPLUG_PARALLEL
>> >> > +       cpuhp_ap_sync_alive();
>> >> This is a "synchronization point" due to the description from commit
>> >> 9244724fbf8ab394a7210e8e93bf037abc, which means things are parallel
>> >> before this point and serialized after this point.
>> >>
>> >> But unfortunately, set_cpu_sibling_map() and set_cpu_core_map() cannot
>> >> be executed in parallel. Maybe you haven't observed problems, but in
>> >> theory it's not correct.
>>
>> I am working on it. To address your remark, I have a few options that I
>> evaluate.
> I suggest to revert this patch temporary in mips-next.


As I previously mentioned, I haven't observed any issues until now. What
I'm evaluating is whether there is a real problem with this
implementation. Let's examine whether we need a new patch or if this one
is sufficient.

I will have the resutls at the end of the week.

Gregory

>
> Huacai
>
>>
>> > I don't know whether you have done reboot tests (for ~1000 times),
>> > Jiaxun Yang submitted similar patches for LoongArch [1], but during
>> > reboot tests we encountered problems that I have described in my
>> > previous reply.
>> >
>> > [1] https://lore.kernel.org/loongarch/20240716-loongarch-hotplug-v3-0-=
af59b3bb35c8@flygoat.com/
>>
>> I saw that series and I wondered why the last patch was not merged.
>>
>> I performed around 100 tests so far without encountering any issues; I
>> plan to automate them further to gather more data.
>>
>> Gregpory
>>
>> >
>> > Huacai
>> >
>> >>
>> >> Huacai
>> >>
>> >> > +#endif
>> >> >         notify_cpu_starting(cpu);
>> >> >
>> >> > +#ifndef CONFIG_HOTPLUG_PARALLEL
>> >> >         /* Notify boot CPU that we're starting & ready to sync coun=
ters */
>> >> >         complete(&cpu_starting);
>> >> > +#endif
>> >> >
>> >> >         synchronise_count_slave(cpu);
>> >> >
>> >> > @@ -386,11 +395,13 @@ asmlinkage void start_secondary(void)
>> >> >
>> >> >         calculate_cpu_foreign_map();
>> >> >
>> >> > +#ifndef CONFIG_HOTPLUG_PARALLEL
>> >> >         /*
>> >> >          * Notify boot CPU that we're up & online and it can safely=
 return
>> >> >          * from __cpu_up
>> >> >          */
>> >> >         complete(&cpu_running);
>> >> > +#endif
>> >> >
>> >> >         /*
>> >> >          * irq will be enabled in ->smp_finish(), enabling it too e=
arly
>> >> > @@ -447,6 +458,12 @@ void __init smp_prepare_boot_cpu(void)
>> >> >         set_cpu_online(0, true);
>> >> >  }
>> >> >
>> >> > +#ifdef CONFIG_HOTPLUG_PARALLEL
>> >> > +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct =
*tidle)
>> >> > +{
>> >> > +       return mp_ops->boot_secondary(cpu, tidle);
>> >> > +}
>> >> > +#else
>> >> >  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>> >> >  {
>> >> >         int err;
>> >> > @@ -466,6 +483,7 @@ int __cpu_up(unsigned int cpu, struct task_stru=
ct *tidle)
>> >> >         wait_for_completion(&cpu_running);
>> >> >         return 0;
>> >> >  }
>> >> > +#endif
>> >> >
>> >> >  #ifdef CONFIG_PROFILING
>> >> >  /* Not really SMP stuff ... */
>> >> >
>> >> > ---
>> >> > base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> >> > change-id: 20250411-parallel-cpu-bringup-78999a9235ea
>> >> >
>> >> > Best regards,
>> >> > --
>> >> > Gr=C3=A9gory CLEMENT, Bootlin
>> >> > Embedded Linux and Kernel engineering
>> >> > https://bootlin.com
>> >> >
>> >> >
>>
>> --
>> Gr=C3=A9gory CLEMENT, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

