Return-Path: <linux-mips+bounces-8874-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD32AA43A2
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 09:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50D334E354B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 07:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EC91E1A16;
	Wed, 30 Apr 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LE3wSJ7E"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74AB1E9B3D;
	Wed, 30 Apr 2025 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996987; cv=none; b=SNeIUqHJ80Z766GE3ZcBOX/BVVMC4sBJnQ37zYMY+sie1bjg0tVC7y0oukugYC/xsJ+h0O4xQkxq9+lr60QZ5y3Ah9O+gFuZjrALQxI7PmkoxJgzqnC4WcAzZTb41yXWFG0plsE4AEhFpr3OyM6sd+H9tkMWU7HIWLu851/1LAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996987; c=relaxed/simple;
	bh=DSjUXtPY0IMmDn9ERQ+ei4/8C3se/S9dpG852ERauxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LmV4b7/RpgTKdhiXps2tjbbcRiW9hIX1o3ALUMjmF4PYk4syinP0kfrxYlvP3mttJKTJc0zoGtAEZSKHSjQ4xsppGae7ARKxDt6KfahUHNcAxeaxGrkl55Y1DeE99bJOEfuUCs6iXlgIAVXKNHHZQMef8Yzryh3pE3p0zrFGSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LE3wSJ7E; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FE3344330;
	Wed, 30 Apr 2025 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745996982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAJ4WtJKLrVZd0SdvQUHGBiYWBYcBFlgYk+Jn80meNY=;
	b=LE3wSJ7E+jYPJOEhYQNWr0JYf7yXPPC4n4yFmj2V/V5o5KjbHrzSyyaPlZ5cYbMOdPXzbA
	gToOWNPm4Z3vMjPGAvR/IFoTTHXWcpzqIEjKE23Th+VcmaRioIonsieCAN4yL1orJlIUyx
	dtVVqgC1qXtDgQ9hivM04aLEWGzqDjmUrbnnM77Z5f2d0S6/M933/kREF4Q4S2UEHHrKpC
	cM+UxwpyVxbT+ZRjdvPhkZ6LyA4J8kaQZWlkh5GcUgZN/t/q/w8a5u6WhCubvmSvYao8p9
	GJv9N1fM6okwxNfdUqbI8jgZzsWT2bXLECwPbKbXOBvgbhkpO3lUm1WE0gdQnQ==
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
In-Reply-To: <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com>
References: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>
 <CAAhV-H6JSKwWvLwPSK7Bu6jZixRn4U+xtpxGL4KBtsmjhc3PVA@mail.gmail.com>
 <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com>
Date: Wed, 30 Apr 2025 09:09:40 +0200
Message-ID: <87wmb2ceh7.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeitdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueetgfffueeivdeitdeuhedtteffueffjedthfevvdegvdevgeduhfektdfhleeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegvrgegfhemieguiegvmeeifheitgemheefudgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegvrgegfhemieguiegvmeeifheitgemheefudgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrt
 ghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Huacai,

> Hi, Gregory,
>
> On Sun, Apr 27, 2025 at 6:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
>>
>> Hi, Gregory and Thomas,
>>
>> I'm sorry I'm late, but I have some questions about this patch.
>>
>> On Mon, Apr 14, 2025 at 3:12=E2=80=AFAM Gregory CLEMENT
>> <gregory.clement@bootlin.com> wrote:
>> >
>> > Added support for starting CPUs in parallel on EyeQ to speed up boot t=
ime.
>> >
>> > On EyeQ5, booting 8 CPUs is now ~90ms faster.
>> > On EyeQ6, booting 32 CPUs is now ~650ms faster.
>> >
>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> > ---
>> > Hello,
>> >
>> > This patch allows CPUs to start in parallel. It has been tested on
>> > EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. These
>> > systems use CPS to support SMP.
>> >
>> > As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
>> > faster.
>> >
>> > Currently, this support is only for EyeQ SoC. However, it should also
>> > work for other CPUs using CPS. I am less sure about MT ASE support,
>> > but this patch can be a good starting point. If anyone wants to add
>> > support for other systems, I can share some ideas, especially for the
>> > MIPS_GENERIC setup that needs to handle both types of SMP setups.
>> >
[...]
>> >   * A logical cpu mask containing only one VPE per core to
>> > @@ -74,6 +76,8 @@ static cpumask_t cpu_core_setup_map;
>> >
>> >  cpumask_t cpu_coherent_mask;
>> >
>> > +struct cpumask __cpu_primary_thread_mask __read_mostly;
>> > +
>> >  unsigned int smp_max_threads __initdata =3D UINT_MAX;
>> >
>> >  static int __init early_nosmt(char *s)
>> > @@ -374,10 +378,15 @@ asmlinkage void start_secondary(void)
>> >         set_cpu_core_map(cpu);
>> >
>> >         cpumask_set_cpu(cpu, &cpu_coherent_mask);
>> > +#ifdef CONFIG_HOTPLUG_PARALLEL
>> > +       cpuhp_ap_sync_alive();
>> This is a "synchronization point" due to the description from commit
>> 9244724fbf8ab394a7210e8e93bf037abc, which means things are parallel
>> before this point and serialized after this point.
>>
>> But unfortunately, set_cpu_sibling_map() and set_cpu_core_map() cannot
>> be executed in parallel. Maybe you haven't observed problems, but in
>> theory it's not correct.

I am working on it. To address your remark, I have a few options that I
evaluate.

> I don't know whether you have done reboot tests (for ~1000 times),
> Jiaxun Yang submitted similar patches for LoongArch [1], but during
> reboot tests we encountered problems that I have described in my
> previous reply.
>
> [1] https://lore.kernel.org/loongarch/20240716-loongarch-hotplug-v3-0-af5=
9b3bb35c8@flygoat.com/

I saw that series and I wondered why the last patch was not merged.

I performed around 100 tests so far without encountering any issues; I
plan to automate them further to gather more data.

Gregpory

>
> Huacai
>
>>
>> Huacai
>>
>> > +#endif
>> >         notify_cpu_starting(cpu);
>> >
>> > +#ifndef CONFIG_HOTPLUG_PARALLEL
>> >         /* Notify boot CPU that we're starting & ready to sync counter=
s */
>> >         complete(&cpu_starting);
>> > +#endif
>> >
>> >         synchronise_count_slave(cpu);
>> >
>> > @@ -386,11 +395,13 @@ asmlinkage void start_secondary(void)
>> >
>> >         calculate_cpu_foreign_map();
>> >
>> > +#ifndef CONFIG_HOTPLUG_PARALLEL
>> >         /*
>> >          * Notify boot CPU that we're up & online and it can safely re=
turn
>> >          * from __cpu_up
>> >          */
>> >         complete(&cpu_running);
>> > +#endif
>> >
>> >         /*
>> >          * irq will be enabled in ->smp_finish(), enabling it too early
>> > @@ -447,6 +458,12 @@ void __init smp_prepare_boot_cpu(void)
>> >         set_cpu_online(0, true);
>> >  }
>> >
>> > +#ifdef CONFIG_HOTPLUG_PARALLEL
>> > +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *ti=
dle)
>> > +{
>> > +       return mp_ops->boot_secondary(cpu, tidle);
>> > +}
>> > +#else
>> >  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>> >  {
>> >         int err;
>> > @@ -466,6 +483,7 @@ int __cpu_up(unsigned int cpu, struct task_struct =
*tidle)
>> >         wait_for_completion(&cpu_running);
>> >         return 0;
>> >  }
>> > +#endif
>> >
>> >  #ifdef CONFIG_PROFILING
>> >  /* Not really SMP stuff ... */
>> >
>> > ---
>> > base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> > change-id: 20250411-parallel-cpu-bringup-78999a9235ea
>> >
>> > Best regards,
>> > --
>> > Gr=C3=A9gory CLEMENT, Bootlin
>> > Embedded Linux and Kernel engineering
>> > https://bootlin.com
>> >
>> >

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

