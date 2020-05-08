Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7931CA830
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 12:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgEHKTt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 06:19:49 -0400
Received: from foss.arm.com ([217.140.110.172]:46210 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgEHKTt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 06:19:49 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56DD130E;
        Fri,  8 May 2020 03:19:47 -0700 (PDT)
Received: from [192.168.0.7] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 591CC3F71F;
        Fri,  8 May 2020 03:19:44 -0700 (PDT)
Subject: Re: [RFC PATCH v3 2/3] docs: scheduler: Add scheduler overview
 documentation
To:     John Mathew <john.mathew@unikie.com>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
        tsbogend@alpha.franken.de, lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com, rdunlap@infradead.org,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
References: <20200507180553.9993-1-john.mathew@unikie.com>
 <20200507180553.9993-3-john.mathew@unikie.com>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <9a41369c-8617-e80e-61e5-c659c51d631b@arm.com>
Date:   Fri, 8 May 2020 12:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507180553.9993-3-john.mathew@unikie.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/05/2020 20:05, John Mathew wrote:

[...]

> diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/scheduler/cfs-overview.rst
> new file mode 100644
> index 000000000000..b717f2d3e340
> --- /dev/null
> +++ b/Documentation/scheduler/cfs-overview.rst
> @@ -0,0 +1,113 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=============
> +CFS Overview
> +=============
> +
> +Linux 2.6.23 introduced a modular scheduler core and a Completely Fair
> +Scheduler (CFS) implemented as a scheduling module. A brief overview of the
> +CFS design is provided in :doc:`sched-design-CFS`
> +
> +In addition there have been many improvements to the CFS, a few of which are
> +
> +**Thermal Pressure**:
> +cpu_capacity initially reflects the maximum possible capacity of a CPU.
> +Thermal pressure on a CPU means this maximum possible capacity is
> +unavailable due to thermal events. Average thermal pressure for a CPU
> +is now subtracted from its maximum possible capacity so that cpu_capacity
> +reflects the remaining maximum capacity.
> +

I agree with what Valentin mentioned already. Instead of describing
recent patch-sets, the functionality which was added (or enhanced) by
them) should be depicted instead.

E.g. in case of 'Thermal Pressure' this would be the "scale CPU
capacity" mechanism for CFS so it knows how much CPU capacity is left
for its use after higher priority sched classes (RT, DL), IRQs and
'Thermal Pressure' have reduced the 'original' CPU capacity.

[...]

> +**Load balancing algorithm Reworked**:
> +The load balancing algorithm contained some heuristics which became
> +meaningless since the rework of the scheduler's metrics like the
> +introduction of PELT. The new load balancing algorithm fixes several
> +pending wrong tasks placement
> +
> + * the 1 task per CPU case with asymmetric system
> + * the case of CFS task preempted by other class
> + * the case of tasks not evenly spread on groups with spare capacity
> +
> +Also the load balance decisions have been consolidated in the 3 separate
> +functions.

What are those 3 separate functions? I guess you refer to the 3
(actually 4) migration types (migrate_task, migrate_util, migrate_load,
(migrate_misfit)).

[...]

> diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
> index aee16feefc61..f2cb0c901208 100644
> --- a/Documentation/scheduler/overview.rst
> +++ b/Documentation/scheduler/overview.rst
> @@ -3,3 +3,269 @@
>  ====================
>  Scheduler overview
>  ====================
> +
> +Linux kernel implements priority-based scheduling. More than one process are
> +allowed to run at any given time and each process is allowed to run as if it
> +were the only process on the system. The process scheduler coordinates which
> +process runs when. In that context, it has the following tasks:
> +
> +* share CPU cores equally among all currently running processes.
> +* pick appropriate process to run next if required, considering scheduling
> +  class/policy and process priorities.
> +* balance processes between multiple cores in SMP systems.
> +
> +The scheduler attempts to be responsive for I/O bound processes and efficient
> +for CPU bound processes. The scheduler also applies different scheduling
> +policies for real time and normal processes based on their respective
> +priorities. Higher priorities in the kernel have a numerical smaller
> +value. Real time priorities range from 1 (highest) – 99 whereas normal
> +priorities range from 100 – 139 (lowest). SCHED_DEADLINE tasks have negative
> +priorities, reflecting the fact that any of them has higher priority than
> +RT and NORMAL/BATCH tasks.

s/RT/SCHED_FIFO, SCHED_RR
s/NORMAL/SCHED_NORMAL
s/BATCH/SCHED_BATCH

SCHED_IDLE tasks can be set in the 100 – 139 range too but IMHO are
treated as 139 (nice 20). Their priority doesn't matter since they get
minimal weight WEIGHT_IDLEPRI=3 anyway.

And then there are the maintenance sched classes, idle sched class and
its idle tasks 'swapper/X' with priority 120 (was MAX_PRIO) as well as
the stop sched class and its stopper tasks 'migration/X' who disguise as
SCHED_FIFO with priority 139.
Might be that people might find this too detailed though but it helps
when you try to understand how it all works.

[...]

> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index ede1a30a6894..f311abe5b711 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -17,10 +17,13 @@ specific implementation differences.
>      :maxdepth: 2
>  
>      overview
> +    sched-data-structs
> +    cfs-overview
>      sched-design-CFS
>      sched-features
> -    arch-specific.rst
> -    sched-debugging.rst
> +    arch-specific
> +    sched-debugging
> +    scheduler-api
>  
>  .. only::  subproject and html
>  
> +                     +------------------------------------+
> +                     |            TASK_RUNNING            |
> +   +---------------> |           (Ready to run)           | <--+
> +   |                 +------------------------------------+    |
> +   |                   |                                       |
> +   |                   | schedule() calls context_switch()     | task is preempted
> +   |                   v                                       |
> +   |                 +------------------------------------+    |
> +   |                 |            TASK_RUNNING            |    |
> +   |                 |             (Running)              | ---+
> +   | event occurred  +------------------------------------+
> +   |                   |
> +   |                   | task needs to wait for event
> +   |                   v
> +   |                 +------------------------------------+
> +   |                 |         TASK_INTERRUPTIBLE         |
> +   |                 |        TASK_UNINTERRUPTIBLE        |
> +   +-----------------|           TASK_WAKEKILL            |
> +                     +------------------------------------+
> +                                       |
> +                                       | task exits via do_exit()
> +                                       v
> +                        +------------------------------+
> +                        |          TASK_DEAD           |
> +                        |         EXIT_ZOMBIE          |
> +                        +------------------------------+
> +
> +
> +Scheduler provides tracepoints tracing all major events of the scheduler.
> +The tracepoints are defined in ::
> +
> +  include/trace/events/sched.h
> +
> +Using these tracepoints it is possible to model the scheduler state transition

I would refer to them as trace events.

The scheduler started to export (bare) trace points for PELT and
overutilization (e.g. pelt_cfs_tp) (commit ba19f51fcb54 "sched/debug:
Add new tracepoints to track PELT at rq level"). They are not bound to a
trace event and so they don't expose any internal data structures.

[...]

> +Virtual Runtime
> +~~~~~~~~~~~~~~~~~
> +Virtual Run Time or vruntime is the amount of time a task has spent running
> +on the CPU. It is updated periodically by scheduler_tick(). Tasks are stored
> +in the CFS scheduling class rbtree sorted by vruntime. scheduler_tick() calls
> +corresponding hook of CFS which first updates the runtime statistics of the
> +currently running task and checks if the current task needs to be preempted.
> +vruntime of the task based on the formula ::
> +
> +    vruntime += delta_exec * (NICE_0_LOAD/curr->load.weight);
> +
> +where:
> +
> +* delta_exec is the time in nanoseconds spent by the task since the last time
> +  vruntime was updated.
> +* NICE_0_LOAD is the load of a task with normal priority.
> +* curr is the shed_entity instance of the cfs_rq struct of the currently
> +  running task.
> +* load.weight: sched_entity load_weight. load_weight is the encoding of
> +  the tasks priority and vruntime. The load of a task is the metric
> +  indicating the number of CPUs needed to make satisfactory progress on its
> +  job. Load of a task influences the time a task spends on the CPU and also
> +  helps to estimate the overall CPU load which is needed for load balancing.

load.weight is replaced by PELT in load balancing.

> +  Priority of the task is not enough for the scheduler to estimate the
> +  vruntime of a process. So priority value must be mapped to the capacity of
> +  the standard CPU which is done in the array :c:type:`sched_prio_to_weight[]`.
> +  The array contains mappings for the nice values from -20 to 19. Nice value
> +  0 is mapped to 1024. Each entry advances by approximately 1.25 which means
> +  for every increment in nice value the task gets 10% less CPU and vice versa.

SCHED_IDLE get minimal weight (WEIGHT_IDLEPRIO=3)

[...]
