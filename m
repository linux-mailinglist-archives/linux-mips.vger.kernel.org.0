Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA9F1D16EC
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 16:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388895AbgEMOD2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 13 May 2020 10:03:28 -0400
Received: from foss.arm.com ([217.140.110.172]:47444 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388783AbgEMOD1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 10:03:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E5D31B;
        Wed, 13 May 2020 07:03:27 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E06D3F71E;
        Wed, 13 May 2020 07:03:24 -0700 (PDT)
References: <20200513134338.19688-1-John.Mathew@unikie.com> <20200513134338.19688-4-John.Mathew@unikie.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     john mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: Re: [RFC PATCH v4 2/3] docs: scheduler: Add scheduler overview documentation
In-reply-to: <20200513134338.19688-4-John.Mathew@unikie.com>
Date:   Wed, 13 May 2020 15:03:17 +0100
Message-ID: <jhjy2pwq6e2.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 13/05/20 14:43, john mathew wrote:
> +=========================
> +Capacity-Aware Scheduling
> +=========================
> +

Thanks for taking a jab at this. At a glance it looks okay, with one
comment below.

FWIW I still intend to write a more pamphlet-sized thing, I'll toss
something out in the coming weeks - depending on where this goes, I might
base it on this.

> +Scheduling load balancing on Asymmetric Multiprocessor systems was improved
> +through the introduction of Capacity-Aware Scheduling. It identifies the
> +most efficient CPU to assign a task based on its capacity. This capacity
> +may be asymmetric due to heterogeneous computing architecture such
> +as ARM big.LITTLE. Scheduler gets information about asymmetric capacities
> +when the scheduler domain hierarchy is built using build_sched_domains().
> +CPU capacities are provided to the scheduler topology code through the
> +architecture specific implementation of the arch_scale_cpu_capacity().
> +The SD_ASYM_CPUCAPACITY flag is set by the scheduler topology for a domain
> +in the hierarchy where all CPU capacities are visible for any cpu's point
> +of view on asymmetric CPU capacity systems. The scheduler can then take
> +capacity asymmetry into account when load balancing.
> +
> +Initial CPU capacities are derived from the Device Tree and CPU frequency.
> +For RISC-V & ARM64 it is done in drivers/base/arch_topology.c. A cpu-map
> +device tree is parsed to obtain the cpu topology and the initial CPU capacity
> +is set using the CPUFreq subsystem. A callback is registered to the CPUFreq
> +subsystem to rebuild sched_domains when CPU frequency changes.
> +

We don't rebuild domains on frequency changes (that would be ludicrous!),
rather we do that on policy changes. It's mostly because we need to wait
for cpufreq to be loaded before having a complete view over the capacities
of the CPUs (which is a mix of µarch and frequencies), i.e. we need to
rebuild the SD's again once cpufreq comes up.
