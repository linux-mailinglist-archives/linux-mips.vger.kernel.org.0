Return-Path: <linux-mips+bounces-4670-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E926945B81
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 11:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E7D1C2175B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433361DB429;
	Fri,  2 Aug 2024 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl+Imx3P"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A21DB420;
	Fri,  2 Aug 2024 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722592418; cv=none; b=GVTzEy/qXpVqJ+cuNeclwO3RpmMNQDAi8404nghMc3wWnTek0SGPwObYUxpOpkM3IJvG44K+Q6s7AgiIxEEYXYnCMaParE7W69TukatWl2WOF0aKIuI1mCmUJiQjdWaAS+QaZmq5eOa2hMGyyzXPf3kYoPanBonHW2QRlJAun60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722592418; c=relaxed/simple;
	bh=5RvnCkZ0f1ayRqEQOxie5tQpkKjmPmBFSqlVw4+5+r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDrGVfcOJW6wub1p5zCc882a4kRi6VDNdMJLaO7vGXzf3xV0CRJepZlgP23pqTEaNU1WlYLEc+O3uOvq79YYj9bHy7NdF2Mt1k8sg1kpT1tnpiH4/knPtdgUCs3eVqjwuiaJqamQbbySKiI5/DkQpQVGc5QwdciA3PrrFrP82u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl+Imx3P; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f035ae0fe0so91884341fa.3;
        Fri, 02 Aug 2024 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722592414; x=1723197214; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Tb6hNqed3D3MjkcK+637mlvJhN7REA1/kHYwr9JxhE=;
        b=Sl+Imx3PlvARmD18H/7P4PYb+Gd/dnE92yXIiE32YjH9MkdqHp/nRVbVXZn05uH5Ju
         kEuHh9VIR33vH6RY+3Eg8XDLn80rAMN9eef5RaEU5urR/bV9cHqeZoP1uH8hHFMRGGxl
         AhgqizHXHDLIiHGw0yJ6DbG+AAHQf+ErTwcg5w5hdET/MjJNgtLaLF9MUujDEFeob4W5
         tQzo3nkC0YxoM1JtPVBD7E8HpxbULR3OC7ojELomJ0DBax9OaWxc5/DXZ1gmBwXGVh6c
         y/3TCQsSQN4t00qIT0c/GWgtX51yT7QMAUKOLz1cm8+kMJRCvCezwnWR59BX3NR08kSU
         RjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722592414; x=1723197214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Tb6hNqed3D3MjkcK+637mlvJhN7REA1/kHYwr9JxhE=;
        b=DNdejBGO4JobfRbJ/2HGQWHm9qpAKMIKiKj4Vf3tcm4s9B4zycMMXuudU0SWt0Iqga
         MdurYMNSYyUtoWEeXcnN4DfevRkbJ8hf0unY4l1D3kHX8RPWLRHfj1dnBFHsEFodBBb2
         FESYWHa4LnVDhzIvNUNppqKGz4b0mHmi8BraWFPiaTUzdqMqnfr4LqiBLSPHf3kTyIyE
         xnapxinSsWc1bzDPl1FzQpZ3Jd+UGpdSE4Bm6mbuGuHoKk3OxVqv7QSJMX1OyCykQEeR
         hH4eMCpq7BvvFsElvWeGXSHBtAWK7QdQvNAhFaFSFi0goTcOMhJVIf2GT32aiDv05iFK
         F7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWBoZTqUfaFAJEeVhLPE3EopFYAEvHcZzYsSOB0cd2sSQoM7QoTTBxmrndjyDb6Ii0E+i1sH70BVa8sEtSAS1II3f+wijR9qSx6DSbW1wvm72I4LZsTBBmaglLkVfk4+2b5XI8rXpkqnw==
X-Gm-Message-State: AOJu0Yxur0OB6Fy9wE2euI4Ri/izF54c4mEqp2A36LVw6er7L0wMTNHI
	nrgsNcE8Fw8LWKtED43KdaBGdpUcB54cx+hPdALp0tThQ1tOvibP
X-Google-Smtp-Source: AGHT+IGIJa4lEFO4v8BJthZbIlTXCR9ztB/aZbScUnLAX3MagCa18fvttKtAKb4h7EmhveTwMuCBPw==
X-Received: by 2002:a2e:9e15:0:b0:2ef:2dac:9076 with SMTP id 38308e7fff4ca-2f15aa95dbcmr19378721fa.11.1722592414004;
        Fri, 02 Aug 2024 02:53:34 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e273818sm1222841fa.130.2024.08.02.02.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 02:53:33 -0700 (PDT)
Date: Fri, 2 Aug 2024 12:53:30 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Kelvin Cheung <keguang.zhang@gmail.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Huacai Chen <chenhuacai@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] MIPS: smp: Sleeping func called from start_secondary()
Message-ID: <utfmb7mxm6emxditrq7fwalatnhszzcztu4gnqs5mf44umvfwa@k4i7gamaj5mw>
References: <6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k>
 <8d875eb0-d236-46f3-a417-08bff3c0087d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d875eb0-d236-46f3-a417-08bff3c0087d@app.fastmail.com>

Hi Jiaxun

On Fri, Aug 02, 2024 at 05:43:45PM +0800, Jiaxun Yang wrote:
> 
> 
> 在2024年8月2日八月 下午4:45，Serge Semin写道：
> > Hi folks,
> >
> > To debug some another problem I recently enabled the
> > CONFIG_DEBUG_ATOMIC_SLEEP config for my SoC based on the 2xP5600 cores
> > with MIPS GIC as IRQ-controller. That caused the next BUG backtrace
> > started being printed to the system log during the device boot-up:
> 
> Hi Serge,
> 
> Thanks for reporting the problem!
> 
> I actually have a patch lying around somewhere to convert cevt-r4k to use CPUHP
> interface and avoid requesting interrupt on secondary CPUs.
> 
> Will post after getting more platform tests.

Great! Thanks. I'll test it out upon submission.

* Although I doubt that such (presumably) complicated change might be
considered as a backportable fix. But at least it shall fix the problem for the
mainline kernel.

Thanks,
-Serge(y)

> 
> Thanks
> - Jiaxun
> 
> >
> > [    0.118053] BUG: sleeping function called from invalid context at 
> > kernel/locking/mutex.c:283
> > [    0.118062] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 
> > 0, name: swapper/1
> > [    0.118069] preempt_count: 1, expected: 0
> > [    0.118074] RCU nest depth: 0, expected: 0
> > [    0.118078] Preemption disabled at:
> > [    0.118082] [<80105040>] arch_dup_task_struct+0x20/0x118
> > [    0.118116] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 
> > 6.11.0-rc1-bt1-00312-gca6f9469050c-dirty #2460
> > [    0.118134] Stack : 816d0000 801b89bc 81870000 00000004 a02d0c08 
> > 00000000 84ae7dcc 801b84c0
> > [    0.118167]         00000000 00000002 00000000 00000000 00000000 
> > 00000001 84ae7d70 84aaf200
> > [    0.118195]         00000000 00000000 81115acc 00000000 00000059 
> > 84ae7bec 00000000 00000000
> > [    0.118222]         00000000 ffffffff ffffffea 00000020 816d0000 
> > 00000000 81115acc 00000002
> > [    0.118250]         00000000 04240021 a02d0c08 00000000 00000000 
> > 00000000 30400000 ac24242a
> > [    0.118277]         ...
> > [    0.118286] Call Trace:
> > [    0.118289] [<8010af2c>] show_stack+0x88/0x120
> > [    0.118309] [<80f09dfc>] dump_stack_lvl+0x78/0xb0
> > [    0.118323] [<801778d0>] __might_resched+0x190/0x1f0
> > [    0.118349] [<80f10f80>] mutex_lock+0x20/0x74
> > [    0.118365] [<801c8590>] irq_create_mapping_affinity+0x48/0x104
> > [    0.118390] [<801121ec>] r4k_clockevent_init+0x58/0x38c
> > [    0.118402] [<80116658>] start_secondary+0x34/0x134
> > [    0.118411] [<80f0b1e4>] smp_bootstrap+0x68/0x98
> > [    0.118424] 
> >
> > I managed to investigate the problem a bit and the reason turned out to be
> > in the irq_create_mapping() method eventually invoked in the framework of the
> > secondary CPU start-up procedure. The more detailed calls chain is:
> > start_secondary()
> > +-> mips_clockevent_init()
> >     +-> r4k_clockevent_init()
> >         +-> get_c0_compare_int()
> >             +-> gic_get_c0_compare_int()
> >                 +-> irq_create_mapping()
> >                     +-> irq_create_mapping_affinity()
> >                         +-> mutex_lock()
> >                             +-> might_sleep()
> >                                 +-> might_resched()
> >                                     +-> __might_resched()
> >                                         +-> Print the log above
> >
> > I currently lack of free time for further investigation in an attempt to
> > find a reasonable solution. So here is just a report and a short summary
> > of the problem. Should you have any idea of how to fix the problem I'll be
> > very glad to test it out on a short notice.
> >
> > -Serge(y)
> 
> -- 
> - Jiaxun

