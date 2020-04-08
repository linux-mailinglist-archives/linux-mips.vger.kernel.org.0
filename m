Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC9E1A286E
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 20:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730625AbgDHSXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 14:23:20 -0400
Received: from foss.arm.com ([217.140.110.172]:41994 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729672AbgDHSXU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Apr 2020 14:23:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30FAE1FB;
        Wed,  8 Apr 2020 11:23:19 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC083F73D;
        Wed,  8 Apr 2020 11:23:14 -0700 (PDT)
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com> <20200408113505.2528103-4-jiaxun.yang@flygoat.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmpp?= =?utf-8?B?ZSk=?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Peter Xu <peterx@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 03/12] arch_topology: Make it avilable for MIPS
In-reply-to: <20200408113505.2528103-4-jiaxun.yang@flygoat.com>
Date:   Wed, 08 Apr 2020 19:23:04 +0100
Message-ID: <jhjr1wxj0qf.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


(+ Dietmar)

On 08/04/20 12:34, Jiaxun Yang wrote:
> @@ -275,7 +224,64 @@ static void parsing_done_workfn(struct work_struct *work)
>  core_initcall(free_raw_capacity);
>  #endif
>
> -#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +#if defined(CONFIG_OF) && !defined(CONFIG_ARM)
> +#if defined(CONFIG_COMMON_CLK)
> +bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)

We actually use this for arm:

  arch/arm/kernel/topology.o: In function `init_cpu_topology':
  topology.c:(.init.text+0xc8): undefined reference to `topology_parse_cpu_capacity'

So that doesn't work. TBH I'd be quite happy to see the ifdef(ARCH) go away
entirely; it's shame that arm is using some of those names already. I think
some of that is due to the CPU efficiency faff, if we can't get rid of it /
align those then perhaps the next best thing is to make some of those
definitions __weak.

> +{
> +	struct clk *cpu_clk;
> +	static bool cap_parsing_failed;
> +	int ret;
> +	u32 cpu_capacity;
> +
> +	if (cap_parsing_failed)
> +		return false;
> +
> +	ret = of_property_read_u32(cpu_node, "capacity-dmips-mhz",
> +				   &cpu_capacity);
> +	if (!ret) {
> +		if (!raw_capacity) {
> +			raw_capacity = kcalloc(num_possible_cpus(),
> +					       sizeof(*raw_capacity),
> +					       GFP_KERNEL);
> +			if (!raw_capacity) {
> +				cap_parsing_failed = true;
> +				return false;
> +			}
> +		}
> +		raw_capacity[cpu] = cpu_capacity;
> +		pr_debug("cpu_capacity: %pOF cpu_capacity=%u (raw)\n",
> +			cpu_node, raw_capacity[cpu]);
> +
> +		/*
> +		 * Update freq_factor for calculating early boot cpu capacities.
> +		 * For non-clk CPU DVFS mechanism, there's no way to get the
> +		 * frequency value now, assuming they are running at the same
> +		 * frequency (by keeping the initial freq_factor value).
> +		 */
> +		cpu_clk = of_clk_get(cpu_node, 0);
> +		if (!PTR_ERR_OR_ZERO(cpu_clk)) {
> +			per_cpu(freq_factor, cpu) =
> +				clk_get_rate(cpu_clk) / 1000;
> +			clk_put(cpu_clk);
> +		}
> +	} else {
> +		if (raw_capacity) {
> +			pr_err("cpu_capacity: missing %pOF raw capacity\n",
> +				cpu_node);
> +			pr_err("cpu_capacity: partial information: fallback to 1024 for all CPUs\n");
> +		}
> +		cap_parsing_failed = true;
> +		free_raw_capacity();
> +	}
> +
> +	return !ret;
> +}
> +#else
> +bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
> +{
> +		return false;
> +}
> +#endif /* CONFIG_COMMON_CLK */
>  /*
>   * This function returns the logic cpu number of the node.
>   * There are basically three kinds of return values:
