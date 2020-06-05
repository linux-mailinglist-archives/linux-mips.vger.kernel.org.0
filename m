Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7A51EF428
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2020 11:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgFEJ3c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Jun 2020 05:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgFEJ3Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Jun 2020 05:29:25 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEA5C08C5C3
        for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2020 02:29:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z206so5387502lfc.6
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2020 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qb5i5S7Ns35Vv05O7mYhY79MD4dxIqCBdFi2UFa13QI=;
        b=mh97t9IPnfjAxVLg4EJK2qxfrHLuVzpQ/RXmTbjxbPYmJXLpE83e8oGFnnj4K1LPpn
         IAHjA6/6/hGJIkjmUKGRwGZXTqtITsEInBgTWY2/z78fkCydE+8H5GNGCJEANSWUuG7p
         oi8XrK+h8/48lP9s6dCqeTRJ12yOzWoU9X/oRw3GwjDuyxq80gwZLT1Doy1gBPbZFogT
         8e8cQ7VL5wIsDsuh0F0xuabd2umx41PP9CBh952Q39fJ82rUaeW8RpvOWmekw6oStrh4
         y66G1DcMenoowDJ0inFavrVfi6LmQ3MFNae8fLw7zkM/ExGEsEH7pfwmdzTagdWN2G77
         MoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qb5i5S7Ns35Vv05O7mYhY79MD4dxIqCBdFi2UFa13QI=;
        b=Bhby9eLx1eZowxfBlcFZQgWJ+pt43di+W/vswebjX5RNexrOQezlgxgqZJevwiymZU
         SBN1/UZRF/2UFeUp7fBPsk6NRNyI4FsvPLwAT2fXfylrBjB7zDBMqdenxXjRXgBUC4EH
         3vz0/HQedxI00oN9jh0JC1/flVQHY7KwKtKevS/9n60Kk4IbjOPhiCMS1XLBCF5OZ4uz
         KOCSfZ1o32afXEx9seUcaE2bkE19zTlTcAeNN0YUFl9+UkfUxD5da5TuMGiKPe9KC7sE
         soDCkIsfGu1YXE5elC1cUcOApRvxWUmB2svr9iVgCt91qfk9tjhB1QHX6+uN9Jv2BHL2
         wQ0w==
X-Gm-Message-State: AOAM530kd9tQ1BbQs/19rhA0FDFD1Ugt+mYsOjUFv8EWY6fqvuPbI5I4
        UNEOSGCGvuI2RNjzSOTDeAN33A==
X-Google-Smtp-Source: ABdhPJyuOkWZ2lIZrIUUy6Qto/474E0BvqsSny/+dy29/wNJ6dy+yuzLdVXOysL5CGETrEfv9sonvQ==
X-Received: by 2002:ac2:4569:: with SMTP id k9mr4914991lfm.105.1591349361719;
        Fri, 05 Jun 2020 02:29:21 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id a1sm746471lfi.36.2020.06.05.02.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 02:29:21 -0700 (PDT)
From:   john mathew <john.mathew@unikie.com>
X-Google-Original-From: john mathew <John.Mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com,
        srikar@linux.vnet.ibm.com, John Mathew <john.mathew@unikie.com>,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: [RFC PATCH v7 2/3] docs: scheduler: Add scheduler overview documentation
Date:   Fri,  5 Jun 2020 12:29:05 +0300
Message-Id: <20200605092906.29478-3-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605092906.29478-1-John.Mathew@unikie.com>
References: <20200605092906.29478-1-John.Mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: John Mathew <john.mathew@unikie.com>

Add documentation for
 -scheduler overview
 -scheduler state transtion
 -CFS overview
 -scheduler data structs

Add rst for scheduler APIs and modify sched/core.c
to add kernel-doc comments.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
Co-developed-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
Signed-off-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/cfs-overview.rst      |  59 ++++
 Documentation/scheduler/index.rst             |   2 +
 Documentation/scheduler/overview.rst          | 285 ++++++++++++++++++
 Documentation/scheduler/sched-cas.rst         |  92 ++++++
 .../scheduler/sched-data-structs.rst          | 176 +++++++++++
 Documentation/scheduler/sched-features.rst    |   1 +
 Documentation/scheduler/scheduler-api.rst     |  25 ++
 kernel/sched/core.c                           |  21 +-
 kernel/sched/sched.h                          |  61 ++++
 9 files changed, 718 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/scheduler/cfs-overview.rst
 create mode 100644 Documentation/scheduler/sched-cas.rst
 create mode 100644 Documentation/scheduler/sched-data-structs.rst
 create mode 100644 Documentation/scheduler/scheduler-api.rst

diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/scheduler/cfs-overview.rst
new file mode 100644
index 000000000000..41b1a30dbfd5
--- /dev/null
+++ b/Documentation/scheduler/cfs-overview.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=============
+CFS Overview
+=============
+
+Linux 2.6.23 introduced a modular scheduler core and a Completely Fair
+Scheduler (CFS) implemented as a scheduling module. A brief overview of the
+CFS design is provided in :doc:`sched-design-CFS`
+
+In addition there have been many improvements to the CFS, a few of which are
+
+Tracking available capacity
+---------------------------
+Scale CPU capacity mechanism for CFS so it knows how much CPU capacity is left
+for its use after higher priority sched classes (RT, DL), IRQs and
+'Thermal Pressure' have reduced the 'original' CPU capacity.
+Thermal pressure on a CPU means the maximum possible capacity is
+unavailable due to thermal events.
+
+NUMA balancing
+--------------
+Attempt to migrate tasks to the NUMA Node where the frequently accessed memory
+pages belongs. The scheduler gets information about memory placement through the
+paging mechanism. Scheduler periodically scans the virtual memory of the tasks
+and make them inaccessible by changing the memory protection. The flag
+MM_CP_PROT_NUMA indicates this purpose. When the task attempts to access
+the memory again a page fault occurs. Scheduler traps the fault and increments
+the counters in a task specific array corresponding to the NUMA node id.
+There array is divided in to four regions: faults_memory, faults_cpu,
+faults_memory_buffer and faults_cpu_buffer, where faults_memory is the
+exponential decaying average of faults on a per-node basis. The 'preferred
+node' is found by looping through the array and finding the node with the
+highest number of faults. Migration to the preferred node is done periodically
+by either swapping two tasks tasks between their respective CPUs or
+just moving a task to its preferred node CPU. It the migration or move fails
+it will be retried.
+
+Energy Aware Scheduling
+-----------------------
+For asymmetric CPU capacity topologies, an Energy Model is used to figure out
+which of the CPU candidates is the most energy-efficient. Capacity is the
+amount of work which a CPU can perform at its highest frequency which is
+calculated by the Per-Entity Load Tracking (PELT) mechanism.
+EAS is described at :doc:`sched-energy`
+
+Capacity Aware Scheduling
+--------------------------
+Migrate a task to a CPU which meets its compute demand. In asymmetric CPU
+capacity topologies CFS scheduler frequently updates the 'Misfit' status of
+tasks and migrate them to CPU's of higher capacity. Also during wakeups the
+a CPU with sufficient capacity is found for executing the task. CAS is
+described at :doc:`sched-cas`
+
+
+
+
+
+
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 9bdccea74af9..f311abe5b711 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -17,6 +17,8 @@ specific implementation differences.
     :maxdepth: 2
 
     overview
+    sched-data-structs
+    cfs-overview
     sched-design-CFS
     sched-features
     arch-specific
diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
index aee16feefc61..f9c671197def 100644
--- a/Documentation/scheduler/overview.rst
+++ b/Documentation/scheduler/overview.rst
@@ -3,3 +3,288 @@
 ====================
 Scheduler overview
 ====================
+
+Linux kernel implements priority-based scheduling. More than one process are
+allowed to run at any given time and each process is allowed to run as if it
+were the only process on the system. The process scheduler coordinates which
+process runs when. In that context, it has the following tasks:
+
+  - share CPUs equally among all currently running processes.
+  - pick appropriate process to run next if required, considering scheduling
+    class/policy and process priorities.
+  - balance processes between multiple CPUs in SMP systems.
+
+The scheduler attempts to be responsive for I/O bound processes and efficient
+for CPU bound processes. The scheduler uses different scheduling policies
+for real time and normal processes based on their respective policy
+enumerations. Scheduler adds support for each policy through scheduling class
+implementations for each. The five scheduling classes which scheduler provides
+are:
+
+  - stop_sched_class:
+    It is a per-cpu maximum priority CPU monopolization mechanism. It is
+    exposed as a SCHED_FIFO task ('migration/X') with static priority of 99
+    in the user space. This is done to make it compatible with user space and
+    thus to avoid growing the ABI. It is used by one CPU to stop another
+    in order to run a specific function, so it is only available on SMP
+    systems. This class is used by the scheduler for task migration between
+    CPUs.
+
+  - dl_sched_class:
+    Implements the SCHED_DEADLINE scheduling policy. It has static priority
+    of -1 in kernel space. This policy schedules each task according to the
+    task's deadline. The task with the earliest deadline will be served first.
+
+  - rt_sched_class:
+    Implements the SCHED_RR and SCHED_FIFO policies. Real time static
+    priorities range from 1(low)..99 in the user space. (priority is inverted
+    in kernel space). It is the only scheduling class that makes use of the
+    static priority of the task. SCHED_FIFO is a simple scheduling algorithm
+    without time slicing. A SCHED_FIFO thread runs until either it is blocked
+    by an I/O request, it is preempted by a higher priority thread, or it
+    calls sched_yield(). SCHED_RR is a simple enhancement of SCHED_FIFO where
+    a thread is allowed to run only for a maximum time quantum.
+
+  - fair_sched_class:
+    Implements the SCHED_NORMAL SCHED_BATCH and SCHED_IDLE  policies. Static
+    priority is always 0 in the user space. A dynamic priority based on
+    'nice' value is used to schedule these tasks. This priority increases each
+    time the the task  is scheduled to run but denied to run by scheduler.
+    This ensures fair scheduling between these tasks. Nice value is an
+    attribute which can be set by the user to influence scheduler to favour
+    a particular task. SCHED_BATCH is similar to SCHED_NORMAL with the
+    difference that the policy causes the scheduler to assume that the task
+    is CPU-intensive. SCHED_IDLE policy also has static priority 0. Nice
+    value has no effect on this policy. Weight mapping is not done, instead
+    weight is set at a constant minimal weight WEIGHT_IDLEPRIO. Used to
+    run tasks at extremely low priority.
+
+  - idle_sched_class:
+    Priority for idle task is irrelevant. This class is not related to
+    SCHED_IDLE policy. Idle tasks run when there are no other runnable tasks
+    on a CPU. The execute the idle loop which is responsible to put a CPU
+    in one of its idle states.
+
+
+Process Management
+==================
+
+Each process in the system is represented by struct task_struct. When a
+process/thread is created, the kernel allocates a new task_struct for it.
+The kernel then stores this task_struct in an RCU list. Macro next_task()
+allows a process to obtain its next task and for_each_process() macro enables
+traversal of the list.
+
+Frequently used fields of the task struct are:
+ - state: The running state of the task. The possible states are:
+    - TASK_RUNNING: The task is currently running or in a run queue waiting
+      to run.
+    - TASK_INTERRUPTIBLE: The task is sleeping waiting for some event to occur.
+      This task can be interrupted by signals. On waking up the task transitions
+      to TASK_RUNNING.
+    - TASK_UNINTERRUPTIBLE: Similar to TASK_INTERRUPTIBLE but does not wake
+      up on signals. Needs an explicit wake-up call to be woken up. Contributes
+      to loadavg.
+    - __TASK_TRACED: Task is being traced by another task like a debugger.
+    - __TASK_STOPPED: Task execution has stopped and not eligible to run.
+      SIGSTOP, SIGTSTP etc causes this state.  The task can be continued by
+      the signal SIGCONT.
+    - TASK_PARKED: State to support kthread parking/unparking.
+    - TASK_DEAD: If a task dies, then it sets TASK_DEAD in tsk->state and calls
+      schedule one last time. The task will be never ran again.
+    - TASK_WAKEKILL: It works like TASK_UNINTERRUPTIBLE with the bonus that it
+      can respond to fatal signals.
+    - TASK_WAKING: To handle concurrent waking of the same task for SMP.
+      Indicates that someone is already waking the task.
+    - TASK_NOLOAD: To be used along with TASK_UNINTERRUPTIBLE to indicate
+      an idle task which does not contribute to loadavg.
+    - TASK_NEW: Set during fork(), to guarantee that no one will run the task,
+      a signal or any other wake event cannot wake it up and insert it on
+      the runqueue.
+
+ - exit_state : The exiting state of the task. The possible states are:
+    - EXIT_ZOMBIE: The task is terminated and waiting for parent to collect
+      the exit information of the task.
+    - EXIT_DEAD: After collecting the exit information the task is put to
+      this state and removed from the system.
+
+ - static_prio: Used by the fair scheduling class to encode the nice level.
+   It does not have any effect on the SCHED_DEADLINE, SCHED_FIFO or SCHED_RR
+   policy tasks.
+
+ - prio: The value of this field is used to:
+    - distinguish scheduling classes.
+    - in the RR/FIFO static priority scheduler.
+
+ - normal_prio: Expected priority of a task. The value of static_prio
+   and normal_prio are the same for non-real-time processes. For real time
+   processes value of prio is used.
+
+ - rt_priority: Field used to set priority of real time tasks. Not used by the
+   rt_sched_class.
+
+ - sched_class: Pointer to sched_class structure of the policy that the task
+   belongs to.
+
+ - sched_entity: Pointer to sched_entity CFS structure.
+
+ - policy: scheduling policy of the task. See above.
+
+ - nr_cpus_allowed: Hamming weight of the bitmask retrieved from cpumask pointer.
+
+New tasks are created using the fork() system call which is described
+at manpage `FORK(2)` or the clone system call described at manpage `CLONE(2)`.
+Users can create threads within a process to achieve parallelism. Threads
+share address space, open files and other resources of the process. Threads
+are created like normal tasks with their unique task_struct, but clone()
+is provided with flags that enable the sharing of resources such as address
+space ::
+
+	clone(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, 0);
+
+The scheduler schedules task_structs so from scheduler perspective there is
+no difference between threads and processes. Threads are created using
+the system call pthread_create described at its manpage `PTHREAD_CREATE(3)`
+POSIX threads creation is described at its manpage `PTHREADS(7)`
+
+The Scheduler Entry Point
+=========================
+
+The main scheduler entry point is an architecture independent schedule()
+function defined in kernel/sched/core.c. Its objective is to find a process in
+the runqueue list and then assign the CPU to it. It is invoked, directly
+or in a lazy (deferred) way from many different places in the kernel. A lazy
+invocation does not call the function by its name, but gives the kernel a
+hint by setting a flag TIF_NEED_RESCHED. The flag is a message to the kernel
+that the scheduler should be invoked as soon as possible because another
+process deserves to run. The flag should not be modified directly.
+
+Following are some places that notify the kernel to schedule which can be
+classified based on the type of operations:
+
+  - Blocking operations: Suspends the current task and directly call into
+    the scheduler to find something else to do. Some blocking operations are:
+    - mutex_lock()
+    - wait_event()
+    - do_exit()
+    - preempt_schedule_irq()
+
+  - Co-operative or voluntary preemptions: Allows another task to run at that
+    point subject to preemption model. Voluntary preemption model can be
+    set through the kernel config option: CONFIG_PREEMPT_VOLUNTARY. The
+    operations are:
+    - cond_resched()
+    - cond_resched_lock()
+    - yield()
+    - preempt_enable()
+
+  - Involuntary preemption: Marks TIF_NEED_RESCHED and wait for action
+    depending on preemption model. Involuntary preemption operations are:
+    - scheduler_tick()
+    - wake_up_process()
+
+Calling functions mentioned above leads to a call to __schedule(). Note
+that preemption must be disabled before it is called and enabled after
+the call using preempt_disable and preempt_enable functions family.
+
+
+The steps during invocation are:
+--------------------------------
+1. Disable preemption to avoid another task preempting the scheduling
+   thread itself.
+2. Retrieve the runqueue of current processor and its lock is obtained to
+   allow only one thread to modify the runqueue at a time.
+3. The state of the previously executed task when the schedule()
+   was called is examined. If it is not runnable and has not been
+   preempted in kernel mode, it is removed from the runqueue. If the
+   previous task has non-blocked pending signals, its state is set to
+   TASK_RUNNING and left in the runqueue.
+4. Scheduler classes are iterated and the corresponding class hook to
+   pick the next suitable task to be scheduled on the CPU is called.
+   Since most tasks are handled by the sched_fair class, a shortcut to this
+   class is implemented in the beginning of the function.
+5. TIF_NEED_RESCHED and architecture specific need_resched flags are cleared.
+6. If the scheduler class picks a different task from what was running
+   before, a context switch is performed by calling context_switch().
+   Internally, context_switch() switches to the new task's memory map and
+   swaps the register state and stack. If scheduler class picked the same
+   task as the previous task, no task switch is performed and the current
+   task keeps running.
+7. Balance callback list is processed. Each scheduling class can migrate tasks
+   between CPUs to balance load. These load balancing operations are queued
+   on a Balance callback list which get executed when balance_callback() is
+   called.
+8. The runqueue is unlocked and preemption is re-enabled. In case
+   preemption was requested during the time in which it was disabled,
+   schedule() is run again right away.
+
+Scheduler State Transition
+==========================
+
+A very high level scheduler state transition flow with a few states can
+be depicted as follows. ::
+
+                                       *
+                                       |
+                                       | task
+                                       | forks
+                                       v
+                        +------------------------------+
+                        |           TASK_NEW           |
+                        |        (Ready to run)        |
+                        +------------------------------+
+                                       |
+                                       |
+                                       v
+                     +------------------------------------+
+                     |            TASK_RUNNING            |
+   +---------------> |           (Ready to run)           | <--+
+   |                 +------------------------------------+    |
+   |                   |                                       |
+   |                   | schedule() calls context_switch()     | task is preempted
+   |                   v                                       |
+   |                 +------------------------------------+    |
+   |                 |            TASK_RUNNING            |    |
+   |                 |             (Running)              | ---+
+   | event occurred  +------------------------------------+
+   |                   |
+   |                   | task needs to wait for event
+   |                   v
+   |                 +------------------------------------+
+   |                 |         TASK_INTERRUPTIBLE         |
+   |                 |        TASK_UNINTERRUPTIBLE        |
+   +-----------------|           TASK_WAKEKILL            |
+                     +------------------------------------+
+                                       |
+                                       | task exits via do_exit()
+                                       v
+                        +------------------------------+
+                        |          TASK_DEAD           |
+                        |         EXIT_ZOMBIE          |
+                        +------------------------------+
+
+
+Scheduler provides trace events tracing all major events of the scheduler.
+The trace events are defined in ::
+
+  include/trace/events/sched.h
+
+Using these trace events it is possible to model the scheduler state transition
+in an automata model. The following journal paper discusses such modeling:
+
+Daniel B. de Oliveira, Rômulo S. de Oliveira, Tommaso Cucinotta, **A thread
+synchronization model for the PREEMPT_RT Linux kernel**, *Journal of Systems
+Architecture*, Volume 107, 2020, 101729, ISSN 1383-7621,
+https://doi.org/10.1016/j.sysarc.2020.101729.
+
+To model the scheduler efficiently the system was divided in to generators
+and specifications. Some of the generators used were "need_resched",
+"sleepable" and "runnable", "thread_context" and "scheduling context".
+The specifications are the necessary and sufficient conditions to call
+the scheduler. New trace events were added to specify the generators
+and specifications. In case a kernel event referred to more than one
+event, extra fields of the kernel event was used to distinguish between
+automation events. The final model was generated from parallel composition
+of all generators and specifications which composed of 34 events,
+12 generators and 33 specifications. This resulted in 9017 states, and
+20103 transitions.
diff --git a/Documentation/scheduler/sched-cas.rst b/Documentation/scheduler/sched-cas.rst
new file mode 100644
index 000000000000..0bce484c872e
--- /dev/null
+++ b/Documentation/scheduler/sched-cas.rst
@@ -0,0 +1,92 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=========================
+Capacity-Aware Scheduling
+=========================
+
+Scheduling load balancing on Asymmetric Multiprocessor systems was improved
+through the introduction of Capacity-Aware Scheduling. It identifies the
+most efficient CPU to assign a task based on its capacity. This capacity
+may be asymmetric due to heterogeneous computing architecture such
+as ARM big.LITTLE. Scheduler gets information about asymmetric capacities
+when the scheduler domain hierarchy is built using build_sched_domains().
+CPU capacities are provided to the scheduler topology code through the
+architecture specific implementation of the arch_scale_cpu_capacity().
+The SD_ASYM_CPUCAPACITY flag is set by the scheduler topology for a domain
+in the hierarchy where all CPU capacities are visible for any cpu's point
+of view on asymmetric CPU capacity systems. The scheduler can then take
+capacity asymmetry into account when load balancing.
+
+Initial CPU capacities are derived from the Device Tree and CPU frequency.
+For RISC-V & ARM64 it is done in drivers/base/arch_topology.c. A cpu-map
+device tree is parsed to obtain the cpu topology and the initial CPU capacity
+is set using the CPUFreq subsystem. A callback is registered to the CPUFreq
+subsystem to rebuild sched_domains once the CPUFreq is loaded, which is when
+a complete view of the capacities of the CPUs (which is a mix of µarch and
+frequencies) is available.
+
+Asymmetric CPU capacity information is used in
+
+ - Energy Aware Scheduling: The scheduler is  able to predict the impact of
+   its decisions on the energy consumed by CPUs. Described in :doc:`sched-energy` .
+ - Optimized task wakeup load balancing by finding idle CPU with enough capacity.
+
+The different scheduler classes asymmetric use the Asymmetric CPU capacity
+information differently.
+
+CFS Capacity Awareness
+======================
+
+Used to identify misfit tasks:
+A load intensive task on a CPU which doesn't meet its compute demand is
+identified as a misfit task. 'Misfit' tasks are migrated to CPUs with
+higher compute capacity to ensure better throughput. CFS frequently updates
+the misfit status of the current task by comparing its utilization vs the
+CPU capacity using task_fits_capacity(). If the utilization is more than the
+CPU capacity the calculated misfit load is updated to the runqueue
+rq->misfit_task_load. This misfit load is then checked by the load
+balancing operations to migrate the task to a CPU of higher capacity.
+
+Modified wakeup logic to support DynamIQ systems:
+When the scheduler class calls select_task_rq_fair to select a runqueue for
+a waking task, load balancing is performed by selecting the idlest CPU in
+the idlest group, or under certain conditions an idle sibling CPU if the
+domain has SD_WAKE_AFFINE set. In DynamIQ systems Last Level Cache (LLC)
+domain of a CPU spans all CPUs in the system. This may include CPU's of
+different capacities. So in select_idle_sibling() an idle sibling is picked
+based on CPU capacity for asymmetric CPU capacity systems and for symmetric
+systems use LLC domain is used. The policy is to pick the first idle CPU
+which is big enough for the task (task_util * margin < cpu_capacity).
+If no idle CPU is big enough, the idle CPU with the highest capacity is
+picked. For asymmetric CPU capacity systems select_idle_sibling() operates
+on the sd_asym_cpucapacity sched_domain pointer, which is guaranteed to span
+all known CPU capacities in the system. This works for both "legacy"
+big.LITTLE (LITTLEs & bigs split at MC, joined at DIE) and for newer
+DynamIQ systems (e.g. LITTLEs and bigs in the same MC domain).
+
+
+RT Capacity Awareness
+=====================
+
+Since RT tasks doesn't have a per task utilization signal RT tasks uses uclamp
+to guarantee a minimum performance point. Utilization clamping is a mechanism
+which allows to "clamp" (i.e. filter) the utilization generated by RT and
+FAIR tasks within a range defined by user-space. It exposes to user-space a
+new set of per-task attributes the scheduler can use as hints about the
+expected/required utilization for a task. RT is made capacity aware
+by ensuring that the capacity of the CPU is >= uclamp_min value. This check
+is done in the rt_task_fits_capacity()
+
+DL Capacity Awareness
+=====================
+
+TBD
+
+
+
+
+
+
+
+
+
diff --git a/Documentation/scheduler/sched-data-structs.rst b/Documentation/scheduler/sched-data-structs.rst
new file mode 100644
index 000000000000..b8d968c70bfc
--- /dev/null
+++ b/Documentation/scheduler/sched-data-structs.rst
@@ -0,0 +1,176 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=========================
+Scheduler Data Structures
+=========================
+
+The main parts of the Linux scheduler are:
+
+Runqueue
+~~~~~~~~
+
+struct rq is the central data structure of process scheduling. It keeps track
+of tasks that are in a runnable state assigned for a particular processor.
+Each CPU has its own run queue and stored in a per CPU array::
+
+    DEFINE_PER_CPU(struct rq, runqueues);
+
+Access to the queue requires locking and lock acquire operations must be
+ordered by ascending runqueue. Macros for accessing and locking the runqueue
+are provided in::
+
+    kernel/sched/sched.h
+
+The runqueue contains scheduling class specific queues and several scheduling
+statistics.
+
+Scheduling entity
+~~~~~~~~~~~~~~~~~
+Scheduler uses scheduling entities which contain sufficient information to
+actually accomplish the scheduling job of a task or a task-group. The
+scheduling entity may be a group of tasks or a single task. Every task is
+associated with a sched_entity structure. CFS adds support for nesting of
+tasks and task groups. Each scheduling entity may be run from its parents
+runqueue. The scheduler traverses the sched_entity hierarchy to pick the
+next task to run on the CPU. The entity gets picked up from the cfs_rq on
+which it is queued and its time slice is divided among all the tasks on its my_q.
+
+Scheduler classes
+~~~~~~~~~~~~~~~~~
+It is an extensible hierarchy of scheduler modules. The modules encapsulate
+scheduling policy details. They are called from the core code which is
+independent. Scheduling classes are implemented through the sched_class
+structure. The five scheduling classes are stop_sched_class, dl_sched_class,
+rt_sched_class, fair_sched_class and idle_sched_class. The important methods
+of scheduler class are:
+
+  - sched_class::enqueue_task()
+  - sched_class::dequeue_task()
+    These functions are used to put and remove tasks from the runqueue
+    respectively to change a property of a task. This is referred to as
+    change pattern. Change is defined as the following sequence of calls:
+
+      - dequeue_task()
+      - put_prev_task()
+      - change a property
+      - enqueue_task()
+      - set_next_task()
+
+    The enqueue_task function takes the runqueue, the task which needs to
+    be enqueued/dequeued and a bit mask of flags as parameters. The main
+    purpose of the flags is to describe why the enqueue or dequeue is being
+    called. The different flags used are described in ::
+
+        kernel/sched/sched.h
+
+    Some places where the enqueue_task and dequeue_task are called for
+    changing task properties are:
+
+      - When migrating a task from one CPU's runqueue to another.
+      - When changing a tasks CPU affinity.
+      - When changing the priority of a task.
+      - When changing the nice value of the task.
+      - When changing the scheduling policy and/or RT priority of a thread.
+
+  - sched_class::pick_next_task()
+    Called by the scheduler to pick the next best task to run. The scheduler
+    iterates through the corresponding functions of the scheduler classes
+    in priority order to pick up the next best task to run. Since tasks
+    belonging to the idle class and fair class are frequent, the scheduler
+    optimizes the picking of next task to call the pick_next_task_fair()
+    if the previous task was of the similar scheduling class.
+
+  - sched_class::put_prev_task()
+    Called by the scheduler when a running task is being taken off a CPU.
+    The behavior of this function depends on individual scheduling classes.
+    In CFS class this function is used to put the currently running task back
+    into the CFS RB tree. When a task is running it is dequeued from the tree.
+    This is to prevent redundant enqueue's and dequeue's for updating its
+    vruntime. vruntime of tasks on the tree needs to be updated by update_curr()
+    to keep the tree in sync. In SCHED_DEADLINE and RT classes additional tree
+    is maintained to push tasks from the current CPU to another CPU where the
+    task can preempt and start executing. Task will be added to this queue
+    if it is present on the scheduling class rq and the task has affinity
+    to more than one CPU. set_next_task() is called on the task returned from
+    this function.
+
+  - sched_class::set_next_task()
+    Pairs with the put_prev_task(), this function is called when the next
+    task is set to run on the CPU. This function is called in all the places
+    where put_prev_task is called to complete the 'change pattern'. In case
+    of CFS scheduling class, it will set current scheduling entity to the
+    picked task and accounts bandwidth usage on the cfs_rq. In addition it
+    will also remove the current entity from the CFS runqueue for the vruntime
+    update optimization, opposite to what was done in put_prev_task.
+    For the SCHED_DEADLINE and RT classes it will remove the task from the
+    tree of pushable tasks trigger the balance callback to push another task
+    which is non running on the current CPU for execution on another CPU.
+
+      - dequeue the picked task from the tree of pushable tasks.
+      - update the load average in case the previous task belonged to another
+        class.
+      - queues the function to push tasks from current runqueue to other CPUs
+        which can preempt and start execution. Balance callback list is used.
+
+  - sched_class::task_tick()
+    Called from scheduler_tick(), hrtick() and sched_tick_remote() to update
+    the current task statistics and load averages. Also restarting the high
+    resolution tick timer is done if high resolution timers are enabled.
+    scheduler_tick() runs at 1/HZ and is called from the timer interrupt
+    handler of the Kernel internal timers.
+    hrtick() is called from high resolution timers to deliver an accurate
+    preemption tick as the regular scheduler tick that runs at 1/HZ can be
+    too coarse when nice levels are used.
+    sched_tick_remote() gets called by the offloaded residual 1Hz scheduler
+    tick. In order to reduce interruptions to bare metal tasks, it is possible
+    to outsource these scheduler ticks to the global workqueue so that a
+    housekeeping CPU handles those remotely.
+
+  - sched_class::select_task_rq()
+    Called by scheduler to get the CPU to assign a task to and migrating
+    tasks between CPUs. Flags describe the reason the function was called.
+    Called by try_to_wake_up() with SD_BALANCE_WAKE flag which wakes up a
+    sleeping task.
+    Called by wake_up_new_task() with SD_BALANCE_FORK flag which wakes up a
+    newly forked task.
+    Called by sched_exec() with SD_BALANCE_EXEC which is called from execv
+    syscall.
+    SCHED_DEADLINE class decides the CPU on which the task should be woken
+    up based on the deadline. RT class decides based on the RT priority. Fair
+    scheduling class balances load by selecting the idlest CPU in the
+    idlest group, or under certain conditions an idle sibling CPU if the
+    domain has SD_WAKE_AFFINE set.
+
+  - sched_class::balance()
+    Called by pick_next_task() from scheduler to enable scheduling classes
+    to pull tasks from runqueues of other CPUs for balancing task execution
+    between the CPUs.
+
+  - sched_class::task_fork()
+    Called from sched_fork() of scheduler which assigns a task to a CPU.
+    Fair scheduling class updates runqueue clock, runtime statistics and
+    vruntime for the scheduling entity.
+
+  - sched_class::yield_task()
+    Called from SYSCALL sched_yield to yield the CPU to other tasks.
+    SCHED_DEADLINE class forces the runtime of the task to zero using a special
+    flag and dequeues the task from its trees. RT class requeues the task
+    entities to the end of the run list. Fair scheduling class implements
+    the buddy mechanism. This allows skipping onto the next highest priority
+    scheduling entity at every level in the CFS tree, unless doing so would
+    introduce gross unfairness in CPU time distribution.
+
+  - sched_class::check_preempt_curr()
+    Check whether the task that woke up should preempt the currently
+    running task. Called by scheduler
+
+      - when moving queued task to new runqueue
+      - ttwu()
+      - when waking up newly created task for the first time.
+
+    SCHED_DEADLINE class compares the deadlines of the tasks and calls
+    scheduler function resched_curr() if the preemption is needed. In case
+    the deadlines are equal, migratability of the tasks is used a criteria
+    for preemption.
+    RT class behaves the same except it uses RT priority for comparison.
+    Fair class sets the buddy hints before calling resched_curr() to preempt.
diff --git a/Documentation/scheduler/sched-features.rst b/Documentation/scheduler/sched-features.rst
index 1afbd9cc8d52..e576c7d9e556 100644
--- a/Documentation/scheduler/sched-features.rst
+++ b/Documentation/scheduler/sched-features.rst
@@ -17,4 +17,5 @@ Scheduler Features
    sched-energy
    sched-nice-design
    sched-rt-group
+   sched-cas
    completion
diff --git a/Documentation/scheduler/scheduler-api.rst b/Documentation/scheduler/scheduler-api.rst
new file mode 100644
index 000000000000..a86c4f805084
--- /dev/null
+++ b/Documentation/scheduler/scheduler-api.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=============================
+Scheduler related functions
+=============================
+
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: scheduler_tick
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: try_to_wake_up
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: do_task_dead
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: preempt_schedule_irq
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: prepare_task_switch
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: finish_task_switch
+
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8298b2c240ce..8812eff7aede 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3639,9 +3639,13 @@ void arch_set_thermal_pressure(struct cpumask *cpus,
 		WRITE_ONCE(per_cpu(thermal_pressure, cpu), th_pressure);
 }
 
-/*
+/**
+ * scheduler_tick - sched tick timer handler
+ *
  * This function gets called by the timer code, with HZ frequency.
  * We call it with interrupts disabled.
+ *
+ * Return: 0.
  */
 void scheduler_tick(void)
 {
@@ -4032,8 +4036,10 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	BUG();
 }
 
-/*
- * __schedule() is the main scheduler function.
+/**
+ * __schedule() - the main scheduler function.
+ *
+ * @preempt: preemption enabled/disabled
  *
  * The main means of driving the scheduler and thus entering this function are:
  *
@@ -4162,6 +4168,12 @@ static void __sched notrace __schedule(bool preempt)
 	balance_callback(rq);
 }
 
+/**
+ * do_task_dead - handle task exit
+ *
+ * Changes the the task state to TASK_DEAD and calls
+ * schedule to pick next task to run.
+ */
 void __noreturn do_task_dead(void)
 {
 	/* Causes final put_task_struct in finish_task_switch(): */
@@ -4393,7 +4405,8 @@ EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
 
 #endif /* CONFIG_PREEMPTION */
 
-/*
+/**
+ * preempt_schedule_irq - schedule from irq context
  * This is the entry point to schedule() from kernel preemption
  * off of irq context.
  * Note, that this is called and return with irqs disabled. This will
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1d4e94c1e5fe..b0e9ab977eeb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -881,16 +881,25 @@ struct rq {
 	 */
 	unsigned int		nr_running;
 #ifdef CONFIG_NUMA_BALANCING
+	/* Number of tasks running that care about their NUMA placement */
 	unsigned int		nr_numa_running;
+	/* Number of tasks that are optimally NUMA placed */
 	unsigned int		nr_preferred_running;
+	/*
+	 * Per runqueue variable to check if NUMA-balance is active on the
+	 * run-queue
+	 */
 	unsigned int		numa_migrate_on;
 #endif
 #ifdef CONFIG_NO_HZ_COMMON
 #ifdef CONFIG_SMP
+	/* Tick stamp for decay of blocked load */
 	unsigned long		last_blocked_load_update_tick;
+	/* Idle CPU has blocked load */
 	unsigned int		has_blocked_load;
 	call_single_data_t	nohz_csd;
 #endif /* CONFIG_SMP */
+	/* CPU is going idle with tick stopped */
 	unsigned int		nohz_tick_stopped;
 	atomic_t		nohz_flags;
 #endif /* CONFIG_NO_HZ_COMMON */
@@ -907,13 +916,17 @@ struct rq {
 #define UCLAMP_FLAG_IDLE 0x01
 #endif
 
+	/* Fair scheduling class runqueue */
 	struct cfs_rq		cfs;
+	/* RT scheduling class runqueue */
 	struct rt_rq		rt;
+	/* Deadline scheduing class runqueue */
 	struct dl_rq		dl;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	/* list of leaf cfs_rq on this CPU: */
 	struct list_head	leaf_cfs_rq_list;
+	/* Reference to add child before its parent in leaf_cfs_rq_list */
 	struct list_head	*tmp_alone_branch;
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 
@@ -925,19 +938,28 @@ struct rq {
 	 */
 	unsigned long		nr_uninterruptible;
 
+	/* Currently running task of this rq */
 	struct task_struct __rcu	*curr;
+	/* Idle task of this rq */
 	struct task_struct	*idle;
+	/* Stop task of this rq */
 	struct task_struct	*stop;
 	unsigned long		next_balance;
 	struct mm_struct	*prev_mm;
 
+	/* RQCF clock_update_flags bits */
 	unsigned int		clock_update_flags;
+	/* sched_clock() value for the queue */
 	u64			clock;
 	/* Ensure that all clocks are in the same cache line */
 	u64			clock_task ____cacheline_aligned;
 	u64			clock_pelt;
 	unsigned long		lost_idle_time;
 
+	/*
+	 * Account the idle time that we could have spend running if it were
+	 * not for IO
+	 */
 	atomic_t		nr_iowait;
 
 #ifdef CONFIG_MEMBARRIER
@@ -946,9 +968,18 @@ struct rq {
 
 #ifdef CONFIG_SMP
 	struct root_domain		*rd;
+	/* A domain heirarchy of CPU groups to balance process load among them */
 	struct sched_domain __rcu	*sd;
 
+	/*
+	 * Information about CPUs heterogeneity used for CPU performance
+	 * scaling
+	 */
 	unsigned long		cpu_capacity;
+	/*
+	 * Original capacity of a CPU before being altered by rt tasks
+	 * and/or IRQ
+	 */
 	unsigned long		cpu_capacity_orig;
 
 	struct callback_head	*balance_callback;
@@ -956,6 +987,11 @@ struct rq {
 	unsigned char		nohz_idle_balance;
 	unsigned char		idle_balance;
 
+	/*
+	 * Set whenever the current running task has a utilization greater
+	 * than 80% of rq->cpu_capacity. A non-zero value in this field
+	 * enables misfit load balancing
+	 */
 	unsigned long		misfit_task_load;
 
 	/* For active balancing */
@@ -967,16 +1003,41 @@ struct rq {
 	int			cpu;
 	int			online;
 
+	/*
+	 * An MRU list used for load balancing, sorted (except
+	 * woken tasks) starting from recently given CPU time tasks
+	 * toward tasks with max wait time in a run-queue
+	 */
 	struct list_head cfs_tasks;
 
+	/*
+	 * Track the utilization of RT tasks for a more accurate
+	 * view of the utilization of the CPU when overloaded by CFS and
+	 * RT tasks
+	 */
 	struct sched_avg	avg_rt;
+	/*
+	 * Track the utilization of DL tasks as CFS tasks can be preempted
+	 * by DL tasks and the CFS's utilization might no longer describe
+	 * the real utilization level
+	 */
 	struct sched_avg	avg_dl;
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
+	/*
+	 * Track the the utilization of interrupt to give a more accurate
+	 * level of utilization of CPU taking into account the time spent
+	 * under interrupt context when rq's clock is updated
+	 */
 	struct sched_avg	avg_irq;
 #endif
 #ifdef CONFIG_SCHED_THERMAL_PRESSURE
+	/*
+	 * Tracks thermal pressure which is the reduction in maximum
+	 * possible capacity due to thermal events
+	 */
 	struct sched_avg	avg_thermal;
 #endif
+	/* Time stamp at which idle load balance started for this rq */
 	u64			idle_stamp;
 	u64			avg_idle;
 
-- 
2.17.1

