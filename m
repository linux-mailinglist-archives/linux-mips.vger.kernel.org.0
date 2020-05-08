Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80CE1CB263
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 16:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgEHO65 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 10:58:57 -0400
Received: from foss.arm.com ([217.140.110.172]:49730 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgEHO64 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 10:58:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2C01FB;
        Fri,  8 May 2020 07:58:56 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AC403F305;
        Fri,  8 May 2020 07:58:53 -0700 (PDT)
References: <20200507180553.9993-1-john.mathew@unikie.com> <20200507180553.9993-3-john.mathew@unikie.com> <jhjh7wrtpjk.mognet@arm.com> <b974b959-7b9a-2874-dca6-674b74ad5b42@arm.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     John Mathew <john.mathew@unikie.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
        tsbogend@alpha.franken.de, lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com, rdunlap@infradead.org,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: Re: [RFC PATCH v3 2/3] docs: scheduler: Add scheduler overview documentation
In-reply-to: <b974b959-7b9a-2874-dca6-674b74ad5b42@arm.com>
Date:   Fri, 08 May 2020 15:58:51 +0100
Message-ID: <jhjd07etqvo.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 08/05/20 11:58, Dietmar Eggemann wrote:
> On 07/05/2020 23:15, Valentin Schneider wrote:
>>
>> On 07/05/20 19:05, John Mathew wrote:
>
> [...]
>
>> It would also be an opportunity to have one place to (at least briefly)
>> describe what the different sched classes do wrt capacity asymmetry - CFS
>> does one thing, RT now does one thing (see Qais' work), and DL will
>> hopefully soon follow (see Dietmar's work).
>>
>> I'd be happy to contribute (some of) that, if it can be deemed useful (I
>> personally think it might).
>
> I like the idea.
>
> Essentially all the code which is guarded by the 'if
> (static_branch_unlikely(&sched_asym_cpucapacity)' condition or which
> sets it during bring-up.
>
> * 'Cpu capacity < SCHED_LOAD_SCALE for non-big' CPUs setting during
>    bringup (necessary dt binding, CPUfreq influence)
>
> * CFS capacity awareness:
>
>   * wakeup - select_idle_capacity() (replaced wake_cap() & slow path to
>              cover DynamIQ and classical big.LITTLE)
>
>   * load_balance - misfit handling
>
> * RT & DL capacity awareness
>
> * ... & the relation to EAS (Documentation/scheduler/sched-energy.rst)
>
> This is what we referred to (at least internally) as CAS (Capacity-Aware
> Scheduling).

Yeah, something like that. I'll sharpen my quill and have a go at it,
though it won't be for right now with OSPM and the other ongoing stuff.
