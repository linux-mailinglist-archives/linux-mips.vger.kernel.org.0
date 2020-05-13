Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6921D1584
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 15:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgEMNef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 09:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388107AbgEMNdT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 09:33:19 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9AEC061A0E
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 06:33:18 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id x20so10653314ejb.11
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCJkPg1POYxdi9/ybidUH9nhdf0Eeg1CJiOLCs59jEo=;
        b=HZmGU9S0mJ7ixwqNEEluVx6wEA7Xhg/y/HUGrLDhhDfoa+MKUEtWuMFZu7x3/mcKsU
         DlMv9pq8d9/F5Eyehe6sJlrOljF1oKKYRFREmZ/RiapHA/b8Ok9Z3SKYzraALHEg84uH
         RsAIjt3xl+nOIdCExJ0NBlZTgPbbd1IMYqC8cuSOzZxS1fx2/Vns1ApKR42rlPLs8QCw
         AV1cDkz2iMPNeiZRR1ck9o9V0A8VFR4UfJ5epZEgsC84NG1rEZy/0hi7ir4oP+hazckj
         L81TneqoOJVrwesToGydd+IZE8k3OUxeMiAYEVYB0F4iaw65nyn2CYXHXWUJcAKHhyXa
         p7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCJkPg1POYxdi9/ybidUH9nhdf0Eeg1CJiOLCs59jEo=;
        b=nXC0MiNV3A2Y2yoivtZW+NpE+vGFVXTA/7C6GXPkU4mUFEqoo10FH7OfMWpnYmpYkW
         mSF2GGR3wXmLCB6Aetqsb+EqLphxrv3FmBJRjOuoZKGGx1M3zcLkZov/NevQcxPjAZL/
         orzqP7hZLo1dlmqE5c/f96ajh7EskntpQPOy+/SIXDOk8HFtbPjrSgZe8wQfnnascGdw
         eEF7IUJTb4Lk2NVSCoK1yaPQDxcReDjxw5iML1gPQ3a4h/QfJqF11TWuEd4GxTW3Z6IX
         krJoMWjb7KzdWN3PQJCaMzsm0A6+O4NtdJG3p+K17u2RJRIgvx5vdKptvOJ+JRiYdAjE
         fT2Q==
X-Gm-Message-State: AGi0Puaa2mipzeTQrSXWYL75M/ggnk3L/+DAA0XlClp0EAxbFcOr6JXr
        vdicr1gQgCYJ2g3aMxwR+xuXtCMI++z17dmUxF9WcQ==
X-Google-Smtp-Source: APiQypIvLGmKSaC9EwXZW0WPt4DEjPC+zw/HUuZUBU/F6gNIpOcG1Rb+UaHqPOcmw2LDneUscZcRznp2GBYLG3In0V0=
X-Received: by 2002:a17:906:4e8a:: with SMTP id v10mr21749340eju.63.1589376796915;
 Wed, 13 May 2020 06:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200507180553.9993-1-john.mathew@unikie.com> <20200507180553.9993-3-john.mathew@unikie.com>
 <jhjh7wrtpjk.mognet@arm.com>
In-Reply-To: <jhjh7wrtpjk.mognet@arm.com>
From:   John Mathew <john.mathew@unikie.com>
Date:   Wed, 13 May 2020 16:33:05 +0300
Message-ID: <CAJz2qXnKb5vP92+7CUjRjtzxg9gj6nsnWgZXwtNP10WzmD8euw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] docs: scheduler: Add scheduler overview documentation
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        dietmar.eggemann@arm.com, rostedt@goodmis.org,
        Benjamin Segall <bsegall@google.com>, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 8, 2020 at 12:15 AM Valentin Schneider
<valentin.schneider@arm.com> wrote:
>
>
> On 07/05/20 19:05, John Mathew wrote:
> > Add documentation for
> >  -scheduler overview
> >  -scheduler state transtion
> >  -CFS overview
> >  -scheduler data structs
> >
> > Add rst for scheduler APIs and modify sched/core.c
> > to add kernel-doc comments.
> >
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> > Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> > Co-developed-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
> > Signed-off-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
> > Signed-off-by: John Mathew <john.mathew@unikie.com>
> > ---
> >  Documentation/scheduler/cfs-overview.rst      | 113 ++++++++
> >  Documentation/scheduler/index.rst             |   7 +-
> >  Documentation/scheduler/overview.rst          | 266 ++++++++++++++++++
> >  .../scheduler/sched-data-structs.rst          | 253 +++++++++++++++++
> >  Documentation/scheduler/scheduler-api.rst     |  31 ++
> >  kernel/sched/core.c                           |  28 +-
> >  kernel/sched/sched.h                          | 169 ++++++++++-
> >  7 files changed, 858 insertions(+), 9 deletions(-)
> >  create mode 100644 Documentation/scheduler/cfs-overview.rst
> >  create mode 100644 Documentation/scheduler/sched-data-structs.rst
> >  create mode 100644 Documentation/scheduler/scheduler-api.rst
> >
> > diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/scheduler/cfs-overview.rst
> > new file mode 100644
> > index 000000000000..b717f2d3e340
> > --- /dev/null
> > +++ b/Documentation/scheduler/cfs-overview.rst
> > @@ -0,0 +1,113 @@
> > +.. SPDX-License-Identifier: GPL-2.0+
> > +
> > +=============
> > +CFS Overview
> > +=============
> > +
> > +Linux 2.6.23 introduced a modular scheduler core and a Completely Fair
> > +Scheduler (CFS) implemented as a scheduling module. A brief overview of the
> > +CFS design is provided in :doc:`sched-design-CFS`
> > +
> > +In addition there have been many improvements to the CFS, a few of which are
>
> <snip>
>
> > +**Consider misfit tasks when load-balancing**:
> > +On asymmetric CPU capacity systems load intensive tasks can end up on
> > +CPUs that don't suit their compute demand. In this scenario 'misfit'
> > +tasks are migrated to CPUs with higher compute capacity to ensure better
> > +throughput. A new group_type: group_misfit_task is added and indicates this
> > +scenario. Tweaks to the load-balance code are done to make the migrations
> > +happen. Misfit balancing is done between a source group of lower per-CPU
> > +capacity and destination group of higher compute capacity. Otherwise, misfit
> > +balancing is ignored.
> > +
>
> I'm not sure how useful this cherry-picked git history is, but that's
> making me think we may want to have an asymmetric CPU capacity scheduling
> section somewhere - I've had to explain what we do here a few times
> already, and it's true that unless you look at the git history or at the
> code it isn't laid out for you (with the exception of EAS that was blessed
> with Quentin's writings).
Added a new rst for Capacity Aware scheduling. It contains a brief description
according to Dietmar. That will be a good place for you to contribute.
>
> It would also be an opportunity to have one place to (at least briefly)
> describe what the different sched classes do wrt capacity asymmetry - CFS
> does one thing, RT now does one thing (see Qais' work), and DL will
> hopefully soon follow (see Dietmar's work).
>
> I'd be happy to contribute (some of) that, if it can be deemed useful (I
> personally think it might).
>
> > +=========================
> > +Scheduler Data Structures
> > +=========================
> > +
> > +The main parts of the Linux scheduler are:
> > +
> > +Runqueue
> > +~~~~~~~~
> > +
> > +:c:type:`struct rq <rq>` is the central data structure of process
> > +scheduling. It keeps track of tasks that are in a runnable state assigned
> > +for a particular processor. Each CPU has its own run queue and stored in a
> > +per CPU array::
> > +
> > +    DEFINE_PER_CPU(struct rq, runqueues);
> > +
> > +Access to the queue requires locking and lock acquire operations must be
> > +ordered by ascending runqueue. Macros for accessing and locking the runqueue
> > +are provided in::
> > +
> > +    kernel/sched/sched.h
> > +
> > +The runqueue contains scheduling class specific queues and several scheduling
> > +statistics.
> > +
> > +Scheduling entity
> > +~~~~~~~~~~~~~~~~~
> > +Scheduler uses scheduling entities which contain sufficient information to
> > +actually accomplish the scheduling job of a task or a task-group. The
> > +scheduling entity may be a group of tasks or a single task. Every task is
> > +associated with a sched_entity structure. CFS adds support for nesting of
> > +tasks and task groups. Each scheduling entity may be run from its parents
> > +runqueue. The scheduler traverses the sched_entity hierarchy to pick the
> > +next task to run on the CPU. The entity gets picked up from the cfs_rq on
> > +which it is queued and its time slice is divided among all the tasks on its my_q.
> > +
> > +Virtual Runtime
> > +~~~~~~~~~~~~~~~~~
>
> That probably should be under CFS specific stuff.
Agree, infact this is already described in sched-design-CFS.rst.
>
> > +Virtual Run Time or vruntime is the amount of time a task has spent running
> > +on the CPU. It is updated periodically by scheduler_tick(). Tasks are stored
> > +in the CFS scheduling class rbtree sorted by vruntime. scheduler_tick() calls
> > +corresponding hook of CFS which first updates the runtime statistics of the
> > +currently running task and checks if the current task needs to be preempted.
> > +vruntime of the task based on the formula ::
> > +
> > +    vruntime += delta_exec * (NICE_0_LOAD/curr->load.weight);
> > +
> > +where:
> > +
> > +* delta_exec is the time in nanoseconds spent by the task since the last time
> > +  vruntime was updated.
>
> There's the whole task_clock() shenanigans there, i.e. depending on your
> config knobs that delta may not include IRQ or paravirt time; though that
> doesn't necessarily help in understanding vruntime, so it might be best to
> leave it at that.
>
> > +* NICE_0_LOAD is the load of a task with normal priority.
>
> s/normal/default/
>
> > +* curr is the shed_entity instance of the cfs_rq struct of the currently
> > +  running task.
> > +* load.weight: sched_entity load_weight. load_weight is the encoding of
> > +  the tasks priority and vruntime. The load of a task is the metric
> > +  indicating the number of CPUs needed to make satisfactory progress on its
> > +  job. Load of a task influences the time a task spends on the CPU and also
> > +  helps to estimate the overall CPU load which is needed for load balancing.
>
> Careful not to mix up se.load and se.avg.load_avg. Load balancing decisions
> are based (amongst other things) on (sums of) se.avg.load_avg, i.e. the
> 'load' signal generated via PELT. It is indeed weighted by priority, but
> se.load is *not* that load signal.
>
> It's also the first time I see that bit about load being ~how many CPUs
> that task needs. That's peculiar; you can't really split a task up to
> schedule it on other CPUs, so how would that help? And, again, the load
> signal being weighted by priority makes this even weirder.
This section was removed as sched-design-CFS.rst describes it.
>
> > +  Priority of the task is not enough for the scheduler to estimate the
> > +  vruntime of a process. So priority value must be mapped to the capacity of
> > +  the standard CPU which is done in the array :c:type:`sched_prio_to_weight[]`.
> > +  The array contains mappings for the nice values from -20 to 19. Nice value
> > +  0 is mapped to 1024. Each entry advances by approximately 1.25 which means
> > +  for every increment in nice value the task gets 10% less CPU and vice versa.
> > +
> > +Scheduler classes
> > +~~~~~~~~~~~~~~~~~
> > +It is an extensible hierarchy of scheduler modules. The modules encapsulate
> > +scheduling policy details. They are called from the core code which is
> > +independent. Scheduling classes are implemented through the sched_class
> > +structure. dl_sched_class for deadline scheduler, fair_sched_class for CFS
> > +and rt_sched_class for RT are implementations of this class.
>
> There's stop (at the top) and idle (at the bottom), but admittedly they
> are somewhat special.
Added in v4 patch version.
>
> > +
> > +The important methods of scheduler class are:
> > +
> > +enqueue_task and dequeue_task
> > +    These functions are used to put and remove tasks from the runqueue
> > +    respectively. The function takes the runqueue, the task which needs to
> > +    be enqueued/dequeued and a bit mask of flags. The main purpose of the
> > +    flags is to describe why the enqueue or dequeue is being called.
> > +    The different flags used are described in ::
> > +
> > +        kernel/sched/sched.h
> > +
> > +    enqueue_task and dequeue_task are called for following purposes.
> > +
> > +    - When waking a newly created task for the first time. Called with
> > +      ENQUEUE_NOCLOCK
> > +    - When migrating a task from one CPU's runqueue to another. Task will be
> > +      first dequeued from its old runqueue, new CPU will be added to the
> > +      task struct,  runqueue of the new CPU will be retrieved and task is
> > +      then enqueued on this new runqueue.
>
>
> > +    - When do_set_cpus_allowed() is called to change a tasks CPU affinity. If
> > +      the task is queued on a runqueue, it is first dequeued with the
> > +      DEQUEUE_SAVE and DEQUEUE_NOCLOCK flags set. The set_cpus_allowed()
> > +      function of the corresponding scheduling class will be called.
> > +      enqueue_task() is then called with ENQUEUE_RESTORE and ENQUEUE_NOCLOCK
> > +      flags set.
> > +    - When changing the priority of a task using rt_mutex_setprio(). This
> > +      function implements the priority inheritance logic of the RT mutex
> > +      code. This function changes the effective priority of a task which may
> > +      in turn change the scheduling class of the task. If so enqueue_task is
> > +      called with flags corresponding to each class.
> > +    - When user changes the nice value of the task. If the task is queued on
> > +      a runqueue, it first needs to be dequeued, then its load weight and
> > +      effective priority needs to be set. Following which the task is
> > +      enqueued with ENQUEUE_RESTORE and ENQUEUE_NOCLOCK flags set.
> > +    - When __sched_setscheduler() is called. This function enables changing
> > +      the scheduling policy and/or RT priority of a thread. If the task is
> > +      on a runqueue, it will be first dequeued, changes will be made and
> > +      then enqueued.
> > +    - When moving tasks between scheduling groups. The runqueue of the tasks
> > +      is changed when moving between groups. For this purpose if the task
> > +      is running on a queue, it is first dequeued with DEQUEUE_SAVE, DEQUEUE_MOVE
> > +      and DEQUEUE_NOCLOCK flags set, followed by which scheduler function to
> > +      change the tsk->se.cfs_rq and tsk->se.parent and then task is enqueued
> > +      on the runqueue with the same flags used in dequeue.
> > +
>
> Those are all what Peter dubs the "change pattern", you may want to just
> explain the principle (we need to dequeue tasks to do some operations; and
> ofc we need to put them back as they were once that's done) & pick just one
> rather than exhaustively list them all.
Removed describing change pattern in multiple places.
>
> This still applies to a lot of other places IMO - I think you need less
> exhaustive listings and more "what's the gist of that".
>
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index db3a57675ccf..21f2953b72c7 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -865,12 +865,175 @@ struct uclamp_rq {
> >  };
> >  #endif /* CONFIG_UCLAMP_TASK */
> >
> > -/*
> > - * This is the main, per-CPU runqueue data structure.
> > +/**
> > + * struct rq - This is the main, per-CPU runqueue data structure.
> >   *
> >   * Locking rule: those places that want to lock multiple runqueues
> >   * (such as the load balancing or the thread migration code), lock
> >   * acquire operations must be ordered by ascending &runqueue.
> > + *
> > + * @lock:
> > + *   lock to be acquired while modifying the runqueue
> > + * @nr_running:
> > + *   number of runnable tasks on this queue
> > + * @nr_numa_running:
> > + *   number of tasks running that care about their placement
> > + * @nr_preferred_running:
> > + *   number of tasks that are optimally NUMA placed
> > + * @numa_migrate_on:
> > + *   per run-queue variable to check if NUMA-balance is
> > + *   active on the run-queue
> > + * @last_blocked_load_update_tick:
> > + *   tick stamp for decay of blocked load
> > + * @has_blocked_load:
> > + *   idle CPU has blocked load
> > + * @nohz_tick_stopped:
> > + *   CPU is going idle with tick stopped
> > + * @nohz_flags:
> > + *   flags indicating NOHZ idle balancer actions
> > + * @nr_load_updates:
> > + *   unused
> > + * @nr_switches:
> > + *   number of context switches
> > + * @uclamp:
> > + *   utilization clamp values based on CPU's RUNNABLE tasks
> > + * @uclamp_flags:
> > + *   flags for uclamp actions, currently one flag for idle.
> > + * @cfs:
> > + *   fair scheduling class runqueue
> > + * @rt:
> > + *   rt scheduling class runqueue
> > + * @dl:
> > + *   dl scheduing class runqueue
> > + * @leaf_cfs_rq_list:
> > + *   list of leaf cfs_rq on this CPU
> > + * @tmp_alone_branch:
> > + *   reference to add child before its parent in leaf_cfs_rq_list
> > + * @nr_uninterruptible:
> > + *   global counter where the total sum over all CPUs matters. A task
> > + *      can increase this counter on one CPU and if it got migrated
> > + *   afterwards it may decrease it on another CPU. Always updated under
> > + *   the runqueue lock
> > + * @curr:
> > + *   points to the currently running task of this rq.
> > + * @idle:
> > + *   points to the idle task of this rq
> > + * @stop:
> > + *   points to the stop task of this rq
> > + * @next_balance:
> > + *   shortest next balance before updating nohz.next_balance
> > + * @prev_mm:
> > + *   real address space of the previous task
> > + * @clock_update_flags:
> > + *   RQCF clock_update_flags bits
> > + * @clock:
> > + *   sched_clock() value for the queue
> > + * @clock_task:
> > + *   clock value minus irq handling time
> > + * @clock_pelt:
> > + *   clock which scales with current capacity when something is
> > + *   running on rq and synchronizes with clock_task when rq is idle
> > + * @lost_idle_time:
> > + *   idle time lost when utilization of a rq has reached the
> > + *   maximum value
> > + * @nr_iowait:
> > + *   account the idle time that we could have spend running if it
> > + *   were not for IO
> > + * @membarrier_state:
> > + *   copy of membarrier_state from the mm_struct
> > + * @rd:
> > + *   root domain, each exclusive cpuset essentially defines an island
> > + *   domain by fully partitioning the member CPUs from any other cpuset
> > + * @sd:
> > + *   a domain heirarchy of CPU groups to balance process load among them
> > + * @cpu_capacity:
> > + *   information about CPUs heterogeneity used for CPU performance
> > + *   scaling
> > + * @cpu_capacity_orig:
> > + *   original capacity of a CPU before being altered by
> > + *   rt tasks and/or IRQ
> > + * @balance_callback:
> > + *   queue to hold load balancing push and pull operations
> > + * @idle_balance:
> > + *   flag to do the nohz idle load balance
> > + * @misfit_task_load:
> > + *   set whenever the current running task has a utilization
> > + *   greater than 80% of rq->cpu_capacity. A non-zero value
> > + *   in this field enables misfit load balancing
> > + * @active_balance:
> > + *   synchronizes accesses to ->active_balance_work
> > + * @push_cpu:
> > + *   idle cpu to push the running task on to during active load
> > + *   balancing.
> > + * @active_balance_work:
> > + *   callback scheduled to run on one or multiple cpus
> > + *   with maximum priority monopolozing those cpus.
> > + * @cpu:
> > + *   CPU of this runqueue
> > + * @online:
> > + *   Used by scheduling classes to support CPU hotplug
> > + * @cfs_tasks:
> > + *   an MRU list used for load balancing, sorted (except
> > + *   woken tasks) starting from recently given CPU time tasks
> > + *   toward tasks with max wait time in a run-queue
> > + * @avg_rt:
> > + *   track the utilization of RT tasks for a  more accurate
> > + *   view of the utilization of the CPU when overloaded by CFS and
> > + *   RT tasks
> > + * @avg_dl:
> > + *   track the utilization of DL tasks as CFS tasks can be preempted
> > + *   by DL tasks and the CFS's utilization might no longer describe
> > + *   the real utilization level
> > + * @avg_irq:
> > + *   track the the utilization of interrupt to give a more accurate
> > + *   level of utilization of CPU taking into account the time spent
> > + *   under interrupt context when rqs' clock is updated
> > + * @avg_thermal:
> > + *   tracks thermal pressure which is the reduction in maximum
> > + *   possible capacity due to thermal events
> > + * @idle_stamp:
> > + *   time stamp at which idle load balance started for this rq.
> > + *   Used to find the idlest CPU, when multiple idle CPUs are in
> > + *   the same state
> > + * @avg_idle:
> > + *   average idle time for this rq
> > + * @max_idle_balance_cost:
> > + *   used to determine avg_idle's max value
> > + * @prev_irq_time:
> > + *   updated to account time consumed when a previous
> > + *   update_rq_clock() happened inside a {soft,}irq region
> > + * @prev_steal_time:
> > + *   to account how much elapsed time was spent in steal
> > + * @prev_steal_time_rq:
> > + *   for fine granularity task steal time accounting by
> > + *   making update_rq_clock() aware of steal time
> > + * @calc_load_update:
> > + *   sample window for global load-average calculations
> > + * @calc_load_active:
> > + *   fold any nr_active delta into a global accumulate
> > + * @hrtick_csd:
> > + *   call_single_data used to set hrtick timer state on a specific CPU
> > + * @hrtick_timer:
> > + *   HR-timer to deliver an accurate preemption tick
> > + * @rq_sched_info:
> > + *   runqueue specific latency stats
> > + * @rq_cpu_time:
> > + *   runqueue specific accumulated per-task cpu runtime
> > + * @yld_count:
> > + *   runqueue specific sys_sched_yield() stats
> > + * @sched_count:
> > + *   runqueue specific __schedule() stats
> > + * @sched_goidle:
> > + *   runqueue specific idle scheduling class stats
> > + * @ttwu_count:
> > + *   runqueue specific idle ttwu stats , both remote and local
> > + * @ttwu_local:
> > + *   ttwu count for the CPU of the rq
> > + * @wake_list:
> > + *   list which stores tasks being woken up remotely by ttwu
> > + * @idle_state:
> > + *   cpuidle state pointer of the CPU of this rq used to make a
> > + *   better decision when balancing tasks
>
> Holy moly! I appreciate the effort, but I'm thinking the targeted audience
> might prefer this under the form of comments within the struct definition...
This was done based on review comments to move describing the rq struct
from documentation for kernel-doc comments so that documentation will
be updated when parameters are changed/removed.
>
> >   */
> >  struct rq {
> >       /* runqueue lock: */
> > @@ -1136,7 +1299,7 @@ static inline u64 rq_clock_task(struct rq *rq)
> >       return rq->clock_task;
> >  }
> >
> > -/**
> > +/*
> >   * By default the decay is the default pelt decay period.
> >   * The decay shift can change the decay period in
> >   * multiples of 32.

Thanks for your review
