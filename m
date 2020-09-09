Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB50F262DE3
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 13:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgIILdx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 07:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbgIILcO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Sep 2020 07:32:14 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E37CC061573;
        Wed,  9 Sep 2020 04:23:57 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id u21so3007059eja.2;
        Wed, 09 Sep 2020 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=xBn2IivnSIXyZ2yjwhhqI+ueXZKhD8RZqXQ1DLHtfo4=;
        b=A4G/9wYwKeiwLgE/K9lFkHE5+vDWevrN0HPFS8XY8qrA9uYfUTQUyNwKjSP1emuaqp
         +tuYslOO+DkXrJvdkbtF70UFcz1hWd0vrS4/cbusmTNg1EwJ5cWv0LXOE3fw/MNMoOhk
         Igp8XEVfJTzBBOd3aQoEb7X7px5MWiEq4+QFvHdKxuSUs10eW8nPIWM0IKD8wx1FyBc1
         jju/+ebr8+Cb70E7vhTIC1x+CJFaCq/uHmkrolDvuohQ/u+MzIKVmSDQjIAGiVWH+dAL
         91FiFdQnVsmnQF6HpV6a4j3ECkoiR/jYA0mDGymrfcYEEzqpTWi3ELfoEuZk17RKnFqR
         vhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=xBn2IivnSIXyZ2yjwhhqI+ueXZKhD8RZqXQ1DLHtfo4=;
        b=Sr09Z4aFwlVV4nlcM1wNLe1v39RIiO8b8Nhu2EsHgH2tM1Rv0d4LoW9WdkNBM93WTY
         IKDf0Yv5ua1WuWRa3+koolv9QIUTwRnzytbITtnljYZXHDmzXfEOvafJMFuH+VZjt0nV
         9HA82kfVFjMcfiuADPh7sKj5K3q896Rh5vR/NGpMHGg+wljtATtpL8+1WiYRXCg5/uEx
         a7mtubz+wKaueMTGyTT+JRlqSdJINKWJC8Uh2YfHIwjFlQ+R6u3qqZ5p4cTMtxV68tOf
         NzgaaBmUKEZhi4ofbfWKQiqLO9tAZ02i4bQW+ytBO48/pjlbZl1LRo6qUDBjKDTIhzcV
         znCg==
X-Gm-Message-State: AOAM531N1/zy+TS0PQdspx2iKBIA8nt57/5SwZsVdaqH1pJbsJKqJ9CA
        VUSuiJ1MShRfOqPfS/fC7PE=
X-Google-Smtp-Source: ABdhPJwly6kMubaQMCovvgSQ8tfcE7NKK2gKW/iViD5zWU2GvQnCVLGlBve5SEKkgO1at7MsbpsBZg==
X-Received: by 2002:a17:906:54e:: with SMTP id k14mr3068728eja.59.1599650635992;
        Wed, 09 Sep 2020 04:23:55 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
        by smtp.gmail.com with ESMTPSA id q13sm1928889edr.27.2020.09.09.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 04:23:55 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 9 Sep 2020 13:23:53 +0200 (CEST)
X-X-Sender: lukas@felia
To:     John Mathew <john.mathew@unikie.com>
cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: Re: [RFC PATCH v8 2/3] docs: scheduler: Add scheduler overview 
 documentation
In-Reply-To: <20200902162632.10271-3-john.mathew@unikie.com>
Message-ID: <alpine.DEB.2.21.2009091230160.5622@felia>
References: <20200902162632.10271-1-john.mathew@unikie.com> <20200902162632.10271-3-john.mathew@unikie.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1002364590-1599650635=:5622"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1002364590-1599650635=:5622
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 2 Sep 2020, John Mathew wrote:

> Add documentation for
>  -scheduler overview
>  -scheduler state transtion
>  -CFS overview
>  -scheduler data structs
> 
> Add rst for scheduler APIs and modify sched/core.c
> to add kernel-doc comments.
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Co-developed-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
> Signed-off-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
> Signed-off-by: John Mathew <john.mathew@unikie.com>
> ---
>  Documentation/scheduler/cfs-overview.rst      |  59 ++++
>  Documentation/scheduler/index.rst             |   3 +
>  Documentation/scheduler/overview.rst          | 294 +++++++++++++++++-
>  .../scheduler/sched-data-structs.rst          | 176 +++++++++++
>  Documentation/scheduler/scheduler-api.rst     |  24 ++
>  kernel/sched/core.c                           |  21 +-
>  kernel/sched/sched.h                          |  63 +++-
>  7 files changed, 634 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/scheduler/cfs-overview.rst
>  create mode 100644 Documentation/scheduler/sched-data-structs.rst
>  create mode 100644 Documentation/scheduler/scheduler-api.rst
> 
> diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/scheduler/cfs-overview.rst
> new file mode 100644
> index 000000000000..1524c24da897
> --- /dev/null
> +++ b/Documentation/scheduler/cfs-overview.rst
> @@ -0,0 +1,59 @@
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

This can be shortened to:

In addition there have been many improvements to the CFS:

> +
> +Tracking available capacity
> +---------------------------

Capitalize title for local consistency with the sections below.

This below is not a full sentence:

> +Scale CPU capacity mechanism for CFS so it knows how much CPU capacity is left

The "it" here refers to what?

> +for its use after higher priority sched classes (RT, DL), IRQs and
> +'Thermal Pressure' have reduced the 'original' CPU capacity.

Why are putting thermal pressure and orginal in quotes?


> +Thermal pressure on a CPU means the maximum possible capacity is
> +unavailable due to thermal events.
> +
> +NUMA balancing
> +--------------

Capitalize.

Again, this below is not a full sentence:

> +Attempt to migrate tasks to the NUMA Node where the frequently accessed memory

why is Node capitalized here?

> +pages belongs. The scheduler gets information about memory placement through the

belongs? You mean is closest placed to, right?

s/through the paging mechanism/through paging/

> +paging mechanism. Scheduler periodically scans the virtual memory of the tasks

Maybe add: This works as follows:

1. The scheduler scans ...
s/Scheduler/The scheduler/

> +and make them inaccessible by changing the memory protection. The flag

s/make/makes/

> +MM_CP_PROT_NUMA indicates this purpose. When the task attempts to access

I think the detail on the flag is too much here for the overview.

2. When the task attempts to access the memory, this triggers a page fault 
and the scheduler reacts with recording some statistics on the use for the 
specific NUMA nodes.

3. On a periodic basis, the scheduler then migrates the task to the 
preffered node, i.e., the node that encountered the most memory faults.

> +the memory again a page fault occurs. Scheduler traps the fault and increments
> +the counters in a task specific array corresponding to the NUMA node id.
> +There array is divided in to four regions: faults_memory, faults_cpu,
> +faults_memory_buffer and faults_cpu_buffer, where faults_memory is the
> +exponential decaying average of faults on a per-node basis. The 'preferred
> +node' is found by looping through the array and finding the node with the
> +highest number of faults. Migration to the preferred node is done periodically
> +by either swapping two tasks tasks between their respective CPUs or
> +just moving a task to its preferred node CPU. It the migration or move fails
> +it will be retried.
> +
> +Energy Aware Scheduling
> +-----------------------
> +For asymmetric CPU capacity topologies, an Energy Model is used to figure out
> +which of the CPU candidates is the most energy-efficient. Capacity is the
> +amount of work which a CPU can perform at its highest frequency which is
> +calculated by the Per-Entity Load Tracking (PELT) mechanism.
> +EAS is described at :doc:`sched-energy`
> +
> +Capacity Aware Scheduling
> +--------------------------
> +Migrate a task to a CPU which meets its compute demand. In asymmetric CPU
> +capacity topologies CFS scheduler frequently updates the 'Misfit' status of

s/CFS scheduler/, the CFS scheduler/

> +tasks and migrate them to CPU's of higher capacity. Also during wakeups the

the a?

> +a CPU with sufficient capacity is found for executing the task. CAS is

I guess it is better to use active here, rather than passive. Who finds 
the CPU?

Do not use an abbreviation here.

> +described at :doc:`sched-capacity`
> +
> +
> +
> +
> +
> +
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 6e88a070c503..e3b1d4fc1604 100644
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
>      arch-specific
>      sched-debugging
> +    scheduler-api
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
> index a1d2d26629eb..f2fb8f419919 100644
> --- a/Documentation/scheduler/overview.rst
> +++ b/Documentation/scheduler/overview.rst
> @@ -2,4 +2,296 @@
>  
>  ====================
>  Scheduler overview
> -====================
> \ No newline at end of file
> +====================
> +
> +Linux kernel implements priority-based scheduling. More than one process are

s/Linux kernel/The Linux kernel/

> +allowed to run at any given time and each process is allowed to run as if it
> +were the only process on the system. The process scheduler coordinates which
> +process runs when. In that context, it has the following tasks:
> +
> +  - share CPUs equally among all currently running processes.

equally? That is not true, right?

> +  - pick appropriate process to run next if required, considering scheduling
> +    class/policy and process priorities.
> +  - balance processes between multiple CPUs in SMP systems.
> +
> +The scheduler attempts to be responsive for I/O bound processes and efficient
> +for CPU bound processes. The scheduler uses different scheduling policies
> +for real time and normal processes based on their respective policy
> +enumerations. Scheduler adds support for each policy through scheduling class

... for each policy through a scheduling class and a dedicated 
implementation for each scheduling class.

> +implementations for each. The five scheduling classes which scheduler provides
> +are:

This can be shortened to "The five scheduling classes are:"

> +
> +  - stop_sched_class:
> +    It is a per-cpu maximum priority CPU monopolization mechanism. It is
> +    exposed as a SCHED_FIFO task ('migration/X') with static priority of 99
> +    in the user space. This is done to make it compatible with user space and
> +    thus to avoid growing the ABI. It is used by one CPU to stop another
> +    in order to run a specific function, so it is only available on SMP
> +    systems. This class is used by the scheduler for task migration between
> +    CPUs.
> +
> +  - dl_sched_class:
> +    Implements the SCHED_DEADLINE scheduling policy. It has static priority

Here, you use "scheduling policy".

> +    of -1 in kernel space. This policy schedules each task according to the
> +    task's deadline. The task with the earliest deadline will be served first.
> +
> +  - rt_sched_class:
> +    Implements the SCHED_RR and SCHED_FIFO policies. Real time static

... and here only "policy". Be consistent.

> +    priorities range from 1(low)..99 in the user space. (priority is inverted
> +    in kernel space). It is the only scheduling class that makes use of the
> +    static priority of the task. SCHED_FIFO is a simple scheduling algorithm
> +    without time slicing. A SCHED_FIFO thread runs until either it is blocked
> +    by an I/O request, it is preempted by a higher priority thread, or it
> +    calls sched_yield(). SCHED_RR is a simple enhancement of SCHED_FIFO where
> +    a thread is allowed to run only for a maximum time quantum.
> +
> +  - fair_sched_class:
> +    Implements the SCHED_NORMAL SCHED_BATCH and SCHED_IDLE  policies. Static

double spacing before policies.

> +    priority is always 0 in the user space. A dynamic priority based on
> +    'nice' value is used to schedule these tasks. This priority increases each
> +    time the the task  is scheduled to run but denied to run by scheduler.

... the the... and then spacing.

> +    This ensures fair scheduling between these tasks. Nice value is an
> +    attribute which can be set by the user to influence scheduler to favour
> +    a particular task. SCHED_BATCH is similar to SCHED_NORMAL with the
> +    difference that the policy causes the scheduler to assume that the task
> +    is CPU-intensive. SCHED_IDLE policy also has static priority 0. Nice
> +    value has no effect on this policy. Weight mapping is not done, instead
> +    weight is set at a constant minimal weight WEIGHT_IDLEPRIO. Used to
> +    run tasks at extremely low priority.
> +
> +  - idle_sched_class:
> +    Priority for idle task is irrelevant. This class is not related to
> +    SCHED_IDLE policy. Idle tasks run when there are no other runnable tasks
> +    on a CPU. The execute the idle loop which is responsible to put a CPU
> +    in one of its idle states.
> +

This last sentence above is totally broken; I cannot parse it.

> +
> +Process Management
> +==================
> +
> +Each process in the system is represented by struct task_struct. When a
> +process/thread is created, the kernel allocates a new task_struct for it.

Each process or each thread?

> +The kernel then stores this task_struct in an RCU list. Macro next_task()
> +allows a process to obtain its next task and for_each_process() macro enables
> +traversal of the list.
> +

This is too much detail at this point of the overview.

> +Frequently used fields of the task struct are:
> +
> + - state: The running state of the task. The possible states are:
> +
> +    - TASK_RUNNING: The task is currently running or in a run queue waiting
> +      to run.
> +    - TASK_INTERRUPTIBLE: The task is sleeping waiting for some event to occur.
> +      This task can be interrupted by signals. On waking up the task transitions
> +      to TASK_RUNNING.
> +    - TASK_UNINTERRUPTIBLE: Similar to TASK_INTERRUPTIBLE but does not wake
> +      up on signals. Needs an explicit wake-up call to be woken up. Contributes
> +      to loadavg.
> +    - __TASK_TRACED: Task is being traced by another task like a debugger.
> +    - __TASK_STOPPED: Task execution has stopped and not eligible to run.
> +      SIGSTOP, SIGTSTP etc causes this state.  The task can be continued by
> +      the signal SIGCONT.
> +    - TASK_PARKED: State to support kthread parking/unparking.
> +    - TASK_DEAD: If a task dies, then it sets TASK_DEAD in tsk->state and calls
> +      schedule one last time. The task will be never ran again.
> +    - TASK_WAKEKILL: It works like TASK_UNINTERRUPTIBLE with the bonus that it
> +      can respond to fatal signals.
> +    - TASK_WAKING: To handle concurrent waking of the same task for SMP.
> +      Indicates that someone is already waking the task.
> +    - TASK_NOLOAD: To be used along with TASK_UNINTERRUPTIBLE to indicate
> +      an idle task which does not contribute to loadavg.
> +    - TASK_NEW: Set during fork(), to guarantee that no one will run the task,
> +      a signal or any other wake event cannot wake it up and insert it on
> +      the runqueue.
> +
> + - exit_state : The exiting state of the task. The possible states are:
> +
> +    - EXIT_ZOMBIE: The task is terminated and waiting for parent to collect
> +      the exit information of the task.
> +    - EXIT_DEAD: After collecting the exit information the task is put to
> +      this state and removed from the system.
> +
> + - static_prio: Used by the fair scheduling class to encode the nice level.
> +   It does not have any effect on the SCHED_DEADLINE, SCHED_FIFO or SCHED_RR
> +   policy tasks.
> +
> + - prio: The value of this field is used to:
> +
> +    - distinguish scheduling classes.
> +    - in the RR/FIFO static priority scheduler.
> +
> + - normal_prio: Expected priority of a task. The value of static_prio
> +   and normal_prio are the same for non-real-time processes. For real time
> +   processes value of prio is used.
> +
> + - rt_priority: Field used to set priority of real time tasks. Not used by the
> +   rt_sched_class.
> +
> + - sched_class: Pointer to sched_class structure of the policy that the task
> +   belongs to.
> +
> + - sched_entity: Pointer to sched_entity CFS structure.
> +
> + - policy: scheduling policy of the task. See above.
> +
> + - nr_cpus_allowed: Hamming weight of the bitmask retrieved from cpumask pointer.
> +
> +New tasks are created using the fork() system call which is described
> +at manpage `FORK(2)` or the clone system call described at manpage `CLONE(2)`.

Is there a better way to refer to a manpage here? Maybe an URL?

> +Users can create threads within a process to achieve parallelism. Threads
> +share address space, open files and other resources of the process. Threads
> +are created like normal tasks with their unique task_struct, but clone()
> +is provided with flags that enable the sharing of resources such as address
> +space ::
> +
> +	clone(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, 0);
> +
> +The scheduler schedules task_structs so from scheduler perspective there is
> +no difference between threads and processes. Threads are created using
> +the system call pthread_create described at its manpage `PTHREAD_CREATE(3)`
> +POSIX threads creation is described at its manpage `PTHREADS(7)`
> +
> +The Scheduler Entry Point
> +=========================
> +
> +The main scheduler entry point is an architecture independent schedule()
> +function defined in kernel/sched/core.c. Its objective is to find a process in
> +the runqueue list and then assign the CPU to it. It is invoked, directly
> +or in a lazy (deferred) way from many different places in the kernel. A lazy
> +invocation does not call the function by its name, but gives the kernel a
> +hint by setting a flag TIF_NEED_RESCHED. The flag is a message to the kernel

s/a flag/the flag/
> +that the scheduler should be invoked as soon as possible because another
> +process deserves to run. The flag should not be modified directly.

Well, then let us know how to do that correctly.

> +
> +Following are some places that notify the kernel to schedule which can be
> +classified based on the type of operations:
> +

I cannot follow the jump from the previous explanation to this list now. 
You lost me here.

> +  - Blocking operations: Suspends the current task and directly call into
> +    the scheduler to find something else to do. Some blocking operations are:
> +
> +      - mutex_lock()
> +      - wait_event()
> +      - do_exit()
> +      - preempt_schedule_irq()
> +
> +  - Co-operative or voluntary preemptions: Allows another task to run at that
> +    point subject to preemption model. Voluntary preemption model can be
> +    set through the kernel config option: CONFIG_PREEMPT_VOLUNTARY. The
> +    operations are:
> +
> +      - cond_resched()
> +      - cond_resched_lock()
> +      - yield()
> +      - preempt_enable()
> +
> +  - Involuntary preemption: Marks TIF_NEED_RESCHED and wait for action
> +    depending on preemption model. Involuntary preemption operations are:
> +
> +      - scheduler_tick()
> +      - wake_up_process()
> +
> +Calling functions mentioned above leads to a call to __schedule(). Note
> +that preemption must be disabled before it is called and enabled after
> +the call using preempt_disable and preempt_enable functions family.
> +
> +
> +The steps during invocation are:
> +--------------------------------

I would not put the "half" sentence as subsection.

> +1. Disable preemption to avoid another task preempting the scheduling
> +   thread itself.
> +2. Retrieve the runqueue of current processor and its lock is obtained to
> +   allow only one thread to modify the runqueue at a time.

Okay, 1. and 2. are written in imperative.

> +3. The state of the previously executed task when the schedule()
> +   was called is examined. If it is not runnable and has not been
> +   preempted in kernel mode, it is removed from the runqueue. If the
> +   previous task has non-blocked pending signals, its state is set to
> +   TASK_RUNNING and left in the runqueue.

Now, passive?

> +4. Scheduler classes are iterated and the corresponding class hook to
> +   pick the next suitable task to be scheduled on the CPU is called.
> +   Since most tasks are handled by the sched_fair class, a shortcut to this
> +   class is implemented in the beginning of the function.

Now passive.

> +5. TIF_NEED_RESCHED and architecture specific need_resched flags are cleared.

Now passive, again.

> +6. If the scheduler class picks a different task from what was running
> +   before, a context switch is performed by calling context_switch().
> +   Internally, context_switch() switches to the new task's memory map and
> +   swaps the register state and stack. If scheduler class picked the same
> +   task as the previous task, no task switch is performed and the current
> +   task keeps running.

Passive.

> +7. Balance callback list is processed. Each scheduling class can migrate tasks
> +   between CPUs to balance load. These load balancing operations are queued
> +   on a Balance callback list which get executed when balance_callback() is
> +   called.

Passive.

> +8. The runqueue is unlocked and preemption is re-enabled. In case
> +   preemption was requested during the time in which it was disabled,
> +   schedule() is run again right away.
> +

Passive.

It should be consistent and I think writing it imperative is MUCH better, 
e.g., Process balance callback list, Unlock runqueue, etc.

> +Scheduler State Transition
> +==========================
> +
> +A very high level scheduler state transition flow with a few states can
> +be depicted as follows. ::
> +
> +                                       *
> +                                       |
> +                                       | task
> +                                       | forks
> +                                       v
> +                        +------------------------------+
> +                        |           TASK_NEW           |
> +                        |        (Ready to run)        |
> +                        +------------------------------+
> +                                       |
> +                                       |
> +                                       v
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

I hope we can refine this high-level description to Daniel's model.

> +Scheduler provides trace events tracing all major events of the scheduler.
> +The trace events are defined in ::
> +
> +  include/trace/events/sched.h
> +

John, can you explain the trace events that would occur for the 
transitions above in your high-level state transition?

> +Using these trace events it is possible to model the scheduler state transition
> +in an automata model. The following journal paper discusses such modeling:
> +
> +Daniel B. de Oliveira, Rômulo S. de Oliveira, Tommaso Cucinotta, **A thread
> +synchronization model for the PREEMPT_RT Linux kernel**, *Journal of Systems
> +Architecture*, Volume 107, 2020, 101729, ISSN 1383-7621,
> +https://doi.org/10.1016/j.sysarc.2020.101729.
> +
> +To model the scheduler efficiently the system was divided in to generators
> +and specifications. Some of the generators used were "need_resched",
> +"sleepable" and "runnable", "thread_context" and "scheduling context".
> +The specifications are the necessary and sufficient conditions to call
> +the scheduler. New trace events were added to specify the generators
> +and specifications. In case a kernel event referred to more than one
> +event, extra fields of the kernel event was used to distinguish between
> +automation events. The final model was generated from parallel composition
> +of all generators and specifications which composed of 34 events,
> +12 generators and 33 specifications. This resulted in 9017 states, and
> +20103 transitions.

That is how far I got with my first review round.

It reads nicely so far; I think a bit of stylistic improvement is needed 
but you did not make me tired within few minutes (so it is readable) and I 
think I learned something about the scheduler :)

Thanks,

Lukas
--8323329-1002364590-1599650635=:5622--
