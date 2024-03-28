Return-Path: <linux-mips+bounces-2438-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2AF88E7F9
	for <lists+linux-mips@lfdr.de>; Wed, 27 Mar 2024 16:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD102E770D
	for <lists+linux-mips@lfdr.de>; Wed, 27 Mar 2024 15:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2060C139D1C;
	Wed, 27 Mar 2024 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="shW3wZmW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037312F5A6
	for <linux-mips@vger.kernel.org>; Wed, 27 Mar 2024 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711550181; cv=none; b=ChENMPEQWvzZNITk6BwSDlV3duwEhv236zqvh//w8XVm0YW/bAJLUP1RfLE1QyJG11wVXwU4pl37PTP8rubNaUSsCbWopEzaxXaFUjGXGtE0oSoVK/rcNrNrBx99EZcuPNtdHDFn+f2ZlYvK9dspN8LEOJxf9/qvk4JjhXyoy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711550181; c=relaxed/simple;
	bh=WC1PQtE6QOWGiqlnSQK96PKjlK5zr7IbaEoYk2geh7g=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=oWfCRvYe/X7+pCbwAtJcUYlCN/xcx+pptXUpn8yaq1rO5zKizzgoKcgnuyxFBlMxiWJ5uLTX8kYaSKVNwMt3LHGagTPuyACFYYxMUKvphZql/mzECzeTkJKTzyOIi6CbfaFGDrNHyWeKGABZO+XwVCRLP/QTNPEkTWCPNO5kkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=shW3wZmW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29dd91f3aaeso4827555a91.3
        for <linux-mips@vger.kernel.org>; Wed, 27 Mar 2024 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711550178; x=1712154978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpFxvHTXaRgOadbX9mzZ5uaOaEjiGzDAUYCRyVAS/i4=;
        b=shW3wZmWyAd6hGSOm0hunwiu8mYYPr/e6G3t8V+qu49fr3Us7xxqhNrhdtp/z57G5/
         KKck0CfwbLnmcLE6oURXPJFesVuaKlWOUEGeKP+6UYqdHfBbI1pKZHNTMAkyjZhBL4rI
         UV0GiUFf0G8gUUwD3jcN4MU40pKflNl5QPOOamSUDmT7fPyXFPfF2OvsIVWI76HZftql
         9oWoTwNDZHAbfZtfDYWSZ89kRHFqLZiaeeRRGgBdHRaF+igNeu5jerVMxVt1Clmavir3
         MC9Wx39Mp9PKg6iX9xE6XcvRKfi9/JjltkirQmL7JZ7i53thDBiph4n8zA6STQR4fE0e
         70RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550178; x=1712154978;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpFxvHTXaRgOadbX9mzZ5uaOaEjiGzDAUYCRyVAS/i4=;
        b=bs73Ovpvl32jIuVEt4lVzUnNggIluCGOzFhIpXT/ZtvNL6Zy1hid3j/KBsutw0qsr2
         3Ir9uJrgbZTHluWyeBVra9vSL3xj88KUXQfoBRJnc+gCdML+AkP8tX3ndJAxt1J+VbE9
         eoA3+kPipBvEy4DDIJY+mXZI6nznVtodNQypyB991Rosw82KSNihpb47omSO7DtJFiTv
         7kIxwWDdK0E4Drvc45aqQKQxhXtYCdWwtjRudriT+1V7nvaPInSoj0E9LJpH6/aH2fA3
         YnmsuLEnMEpWKt2QvTc1mEJzgVdggHX01Jh47RV88VJdrGIibhucz8zF8L77dtSq+6gE
         Mvtw==
X-Forwarded-Encrypted: i=1; AJvYcCWFJShDi+BzAzXFPLXajXlM+W4r0xMCXRw7IVuuOJ6cMH0HaSu0yGJZn2Yq5I7pCyagwoYreDqT5/nEp5BZBkQnsIQo6vs2oKgeKw==
X-Gm-Message-State: AOJu0Yx+eRzVIu8AarSGvLwTFkU7Qyb5/ne9tb4MIgn7RmtRfrKlHCJS
	yxavPOZM+63fy0ylkrEuagAoWbuMgR2W2g0n7fZnRC2PVE74PB+pVKeD0M0Qpk4=
X-Google-Smtp-Source: AGHT+IGLuMfOxHoUUSwMhDNHhwql3lBke6oQWy3bRJJ6cohj97NT5b6r2v+pJbgeqG89zEtueJAL5Q==
X-Received: by 2002:a17:90a:178c:b0:29d:dfae:4fac with SMTP id q12-20020a17090a178c00b0029ddfae4facmr1468543pja.23.1711550178089;
        Wed, 27 Mar 2024 07:36:18 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090b068300b002a0981a7af5sm1742902pjz.32.2024.03.27.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:36:17 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:36:17 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2024 07:36:15 PDT (-0700)
Subject:     Re: [PATCH v3] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
In-Reply-To: <20240126064451.5465-1-shijie@os.amperecomputing.com>
CC: Greg KH <gregkh@linuxfoundation.org>, patches@amperecomputing.com,
  rafael@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  yury.norov@gmail.com, kuba@kernel.org, vschneid@redhat.com, mingo@kernel.org,
  akpm@linux-foundation.org, vbabka@suse.cz, rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
  ndesaulniers@google.com, mikelley@microsoft.com, mhiramat@kernel.org, Arnd Bergmann <arnd@arndb.de>,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
  mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
  linux-mips@vger.kernel.org, cl@os.amperecomputing.com, shijie@os.amperecomputing.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: shijie@os.amperecomputing.com, akpm@linux-foundation.org
Message-ID: <mhng-13c5ed78-333f-4cfd-b1d5-828dabbe510c@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 25 Jan 2024 22:44:51 PST (-0800), shijie@os.amperecomputing.com wrote:
> During the kernel booting, the generic cpu_to_node() is called too early in
> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
>
> There are at least four places in the common code where
> the generic cpu_to_node() is called before it is initialized:
> 	   1.) early_trace_init()         in kernel/trace/trace.c
> 	   2.) sched_init()               in kernel/sched/core.c
> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   4.) workqueue_init_early()     in kernel/workqueue.c
>
> In order to fix the bug, the patch introduces early_numa_node_init()
> which is called after smp_prepare_boot_cpu() in start_kernel.
> early_numa_node_init will initialize the "numa_node" as soon as
> the early_cpu_to_node() is ready, before the cpu_to_node() is called
> at the first time.
>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
> v2 --> v3:
> 	Do not change the cpu_to_node to function pointer.
> 	Introduce early_numa_node_init() which initialize
> 	the numa_node at an early stage.
>
> 	v2: https://lore.kernel.org/all/20240123045843.75969-1-shijie@os.amperecomputing.com/
>
> v1 --> v2:
> 	In order to fix the x86 compiling error, move the cpu_to_node()
>        	from driver/base/arch_numa.c to driver/base/node.c.
>
> 	v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/896160.html
>
> 	An old different title patch:
> 	http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/895963.html
>
> ---
>  init/main.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..39efe5ed58a0 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -870,6 +870,19 @@ static void __init print_unknown_bootoptions(void)
>  	memblock_free(unknown_options, len);
>  }
>
> +static void __init early_numa_node_init(void)
> +{
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	int cpu;
> +
> +	/* The early_cpu_to_node() should be ready here. */
> +	for_each_possible_cpu(cpu)
> +		set_cpu_numa_node(cpu, early_cpu_to_node(cpu));
> +#endif
> +#endif
> +}
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -900,6 +913,7 @@ void start_kernel(void)
>  	setup_nr_cpu_ids();
>  	setup_per_cpu_areas();
>  	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +	early_numa_node_init();
>  	boot_cpu_hotplug_init();
>
>  	pr_notice("Kernel command line: %s\n", saved_command_line);

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

I don't really understand the init/main.c stuff all that well, I'm 
adding Andrew as it looks like he's been merging stuff here.

