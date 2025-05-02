Return-Path: <linux-mips+bounces-8903-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0BAA7BF7
	for <lists+linux-mips@lfdr.de>; Sat,  3 May 2025 00:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256C91B67AF1
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 22:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBDD21764B;
	Fri,  2 May 2025 22:03:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E6321579C;
	Fri,  2 May 2025 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223434; cv=none; b=jzhlxKfwGMhSEGqWWEfBmPYOGVCDCboPqv2956PIeI+qJPHuh34nR+fgzBOIIpsjzNbRQDUB97i0Wc7hMp1X8OQn94syJs/iLBwfVngzOeBCtYgesCueXGGeMXap9iWFBYIuc/B6fBRqqT7uujFtE1kzdFL8MWmkoquHqsA0EtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223434; c=relaxed/simple;
	bh=DpP+88hJLy7CP597o93+6YUD+p4vmlKs4pFy5wAegVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHeICr53qlBROZGNs7nZsNh+h+aSb/2NdAILW/5fEaKYhF4+jf0RciBEtOQkI2YSLexnBJzeDq56MEbrnY1k5GrA8xE/eGIbX3SVM9ppJ+syp2Aw9vsGUmxSToET706BPMVaVSmEcQOOMzSVpQbd0WnhO1fMT6f4hmS0CRGXMWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uAyTu-0001Wu-00; Sat, 03 May 2025 00:03:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 00C67C01A2; Sat,  3 May 2025 00:03:08 +0200 (CEST)
Date: Sat, 3 May 2025 00:03:08 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SMP: Implement parallel CPU bring up for EyeQ
Message-ID: <aBVBHFGH2kICjnT3@alpha.franken.de>
References: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>
 <CAAhV-H6JSKwWvLwPSK7Bu6jZixRn4U+xtpxGL4KBtsmjhc3PVA@mail.gmail.com>
 <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com>
 <87wmb2ceh7.fsf@BLaptop.bootlin.com>
 <CAAhV-H65b5Ae-cCYYHTx0QBhYJ_fzSVLFGY0RH1PCq0XbvNPQA@mail.gmail.com>
 <87o6wecdg0.fsf@BLaptop.bootlin.com>
 <87cycrc9jt.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cycrc9jt.fsf@BLaptop.bootlin.com>

On Fri, May 02, 2025 at 05:32:54PM +0200, Gregory CLEMENT wrote:
> Hello, 
> 
> > Huacai Chen <chenhuacai@kernel.org> writes:
> >
> >> On Wed, Apr 30, 2025 at 3:09 PM Gregory CLEMENT
> >> <gregory.clement@bootlin.com> wrote:
> >>>
> >>> Hello Huacai,
> >>>
> >>> > Hi, Gregory,
> >>> >
> >>> > On Sun, Apr 27, 2025 at 6:13 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >>> >>
> >>> >> Hi, Gregory and Thomas,
> >>> >>
> >>> >> I'm sorry I'm late, but I have some questions about this patch.
> >>> >>
> >>> >> On Mon, Apr 14, 2025 at 3:12 AM Gregory CLEMENT
> >>> >> <gregory.clement@bootlin.com> wrote:
> >>> >> >
> >>> >> > Added support for starting CPUs in parallel on EyeQ to speed up boot time.
> >>> >> >
> >>> >> > On EyeQ5, booting 8 CPUs is now ~90ms faster.
> >>> >> > On EyeQ6, booting 32 CPUs is now ~650ms faster.
> >>> >> >
> >>> >> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> >>> >> > ---
> >>> >> > Hello,
> >>> >> >
> >>> >> > This patch allows CPUs to start in parallel. It has been tested on
> >>> >> > EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. These
> >>> >> > systems use CPS to support SMP.
> >>> >> >
> >>> >> > As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
> >>> >> > faster.
> >>> >> >
> >>> >> > Currently, this support is only for EyeQ SoC. However, it should also
> >>> >> > work for other CPUs using CPS. I am less sure about MT ASE support,
> >>> >> > but this patch can be a good starting point. If anyone wants to add
> >>> >> > support for other systems, I can share some ideas, especially for the
> >>> >> > MIPS_GENERIC setup that needs to handle both types of SMP setups.
> >>> >> >
> >>> [...]
> >>> >> >   * A logical cpu mask containing only one VPE per core to
> >>> >> > @@ -74,6 +76,8 @@ static cpumask_t cpu_core_setup_map;
> >>> >> >
> >>> >> >  cpumask_t cpu_coherent_mask;
> >>> >> >
> >>> >> > +struct cpumask __cpu_primary_thread_mask __read_mostly;
> >>> >> > +
> >>> >> >  unsigned int smp_max_threads __initdata = UINT_MAX;
> >>> >> >
> >>> >> >  static int __init early_nosmt(char *s)
> >>> >> > @@ -374,10 +378,15 @@ asmlinkage void start_secondary(void)
> >>> >> >         set_cpu_core_map(cpu);
> >>> >> >
> >>> >> >         cpumask_set_cpu(cpu, &cpu_coherent_mask);
> >>> >> > +#ifdef CONFIG_HOTPLUG_PARALLEL
> >>> >> > +       cpuhp_ap_sync_alive();
> >>> >> This is a "synchronization point" due to the description from commit
> >>> >> 9244724fbf8ab394a7210e8e93bf037abc, which means things are parallel
> >>> >> before this point and serialized after this point.
> >>> >>
> >>> >> But unfortunately, set_cpu_sibling_map() and set_cpu_core_map() cannot
> >>> >> be executed in parallel. Maybe you haven't observed problems, but in
> >>> >> theory it's not correct.
> >>>
> >>> I am working on it. To address your remark, I have a few options that I
> >>> evaluate.
> >> I suggest to revert this patch temporary in mips-next.
> >
> >
> > As I previously mentioned, I haven't observed any issues until now. What
> > I'm evaluating is whether there is a real problem with this
> > implementation. Let's examine whether we need a new patch or if this one
> > is sufficient.
> >
> > I will have the resutls at the end of the week.
> 
> After hundreds of reboots on the EyeQ5, I did not encounter any failures
> during boot. However, while executing the set_cpu_core_map() and
> set_cpu_sibling_map() functions in parallel, modifications to shared
> resources could result in issues. To address this, I proposed the
> following fix:
> 
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 1726744f2b2ec..5f30611f45a1c 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -374,13 +377,13 @@ asmlinkage void start_secondary(void)
>         calibrate_delay();
>         cpu_data[cpu].udelay_val = loops_per_jiffy;
>  
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +       cpuhp_ap_sync_alive();
> +#endif
>         set_cpu_sibling_map(cpu);
>         set_cpu_core_map(cpu);
>  
>         cpumask_set_cpu(cpu, &cpu_coherent_mask);
> -#ifdef CONFIG_HOTPLUG_PARALLEL
> -       cpuhp_ap_sync_alive();
> -#endif
>         notify_cpu_starting(cpu);
>  
>  #ifndef CONFIG_HOTPLUG_PARALLEL
> 
> It moved these two functions back in the serialized part of the boot. I
> was concerned about potential slowdowns during the boot process, but I
> didn't notice any issues during my test on EyeQ5. Therefore, we can make
> this change.
> 
> 
> Thomas,
> 
> how would you like to proceed? Do you want to squash this patch
> into the current commit, or do you prefere I create a separate patch for
> it, or a new version of the patch including this change?

please send a seperate patch with just the fix

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

