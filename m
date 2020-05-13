Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCD71D161B
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 15:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387791AbgEMNnv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 09:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbgEMNnu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 09:43:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C176C061A0C
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 06:43:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x73so13673943lfa.2
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PaJevbZIPR9cQWW6ZlOPEwmiiaqCW5xTfzjVVgbFkNY=;
        b=JlunmVgsPuOydJIlIkrLJ49YmyWYImJcQvMxBLLDW5hNYPxTJpiMIJCl/IZACnazRp
         vvD7pKfeL/1q8QtreuY0vDi4q3RRU6bM5NXvY3yXsuY5/g5Hy5KbuKvAa4IH4E8+VDDA
         MyY8yHhgpe/vgfcU+bZSUY/PFXzPtjAma2X0D/exNVlK2E08zBE/CCdtMYNMR78YIlzo
         ItLNk2R3bc6a9JS+c8ZBV8QpwLBI4dtgxEiIxKBVnO5PhPY7WSO6UoQtBPBEraQOXXIf
         +Q3lkztFuxP+LtlD56GQVa3ys0f5AN531DSQoWPh1iKKQj3cCZXSn146h7cwzlk/mZrC
         kwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PaJevbZIPR9cQWW6ZlOPEwmiiaqCW5xTfzjVVgbFkNY=;
        b=g746gGBM4ESlS8aAbym8/AB9t3VWm169BF0VIM8HxhJDT/BGlnirNg54z1oIlzIIeE
         hKKofiMo3TdZFrvPbDFeYnd8LLGUdANWdbjjc/yMsm+A5T+JICdoI7B7j2yl8Uy6WnqK
         GOJTQZaR+Fqs4rJ150dm9MtUY0K5Gmo8be9h+BSI72Jej7dTnKpyx35VsRqKMIvPw9l4
         6f/lxLYfAH7ZzwFKyE6vb7UD9bK8a8FhtKKW/MWJwk+qhOw4AHw4UjFh02lMH4dnA1SL
         QWjflWrDenH3+B5lhdzKYe2rj3tEZXUKSztHiszif1nWTR2t1opnR0eC+5Z7MhDoO/8A
         1asw==
X-Gm-Message-State: AOAM532Le2rK61bwldvAaJVo5uZKu8IdAATZnvIibSYZPxMeYRWSJ1gQ
        bjuYSnIgg23KWW1tHAbUIE2lmA==
X-Google-Smtp-Source: ABdhPJxDqfocFwIBA8KASncnF9+Zf2uyRFzOOXCODAlRVo7BwXxpoE8F25bB5SRjbyHZyZuLLXDmSQ==
X-Received: by 2002:a05:6512:3ea:: with SMTP id n10mr18217513lfq.127.1589377427954;
        Wed, 13 May 2020 06:43:47 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id t16sm17441367lff.72.2020.05.13.06.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 06:43:46 -0700 (PDT)
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
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, john mathew <John.Mathew@unikie.com>
Subject: [PATCH] Fixes
Date:   Wed, 13 May 2020 16:43:34 +0300
Message-Id: <20200513134338.19688-1-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

---
 Documentation/scheduler/cfs-overview.rst      | 113 ++++++------
 Documentation/scheduler/sched-cas.rst         |  74 ++++++++
 .../scheduler/sched-data-structs.rst          | 163 +++++-------------
 Documentation/scheduler/sched-design-CFS.rst  |  20 +++
 Documentation/scheduler/sched-features.rst    |   1 +
 5 files changed, 192 insertions(+), 179 deletions(-)
 create mode 100644 Documentation/scheduler/sched-cas.rst

diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/scheduler/cfs-overview.rst
index b717f2d3e340..3ce559f285f7 100644
--- a/Documentation/scheduler/cfs-overview.rst
+++ b/Documentation/scheduler/cfs-overview.rst
@@ -6,26 +6,26 @@ CFS Overview
 
 Linux 2.6.23 introduced a modular scheduler core and a Completely Fair
 Scheduler (CFS) implemented as a scheduling module. A brief overview of the
-CFS design is provided in :doc:`sched-design-CFS`
+CFS design is provided in :doc: `sched-design-CFS`
 
 In addition there have been many improvements to the CFS, a few of which are
 
 **Thermal Pressure**:
-cpu_capacity initially reflects the maximum possible capacity of a CPU.
-Thermal pressure on a CPU means this maximum possible capacity is
-unavailable due to thermal events. Average thermal pressure for a CPU
-is now subtracted from its maximum possible capacity so that cpu_capacity
-reflects the remaining maximum capacity.
-
-**Use Idle CPU for NUMA balancing**:
-Idle CPU is used as a migration target instead of comparing tasks.
-Information on an idle core is cached while gathering statistics
-and this is used to avoid a second scan of the node runqueues if load is
-not imbalanced. Preference is given to an idle core rather than an
-idle SMT sibling to avoid packing HT siblings due to linearly scanning
-the node cpumask. Multiple tasks can attempt to select an idle CPU but
-fail because a NUMA balance is active on that CPU, in this case instead of
-failing, an alternative idle CPU scanned.
+Scale CPU capacity mechanism for CFS so it knows how much CPU capacity is left
+for its use after higher priority sched classes (RT, DL), IRQs and
+'Thermal Pressure' have reduced the 'original' CPU capacity.
+Thermal pressure on a CPU means the maximum possible capacity is
+unavailable due to thermal events.
+
+** Optimizations to NUMA balancing**:
+When gathering NUMA statistics, information about whether a core is Idle
+is also cached. In case of an imbalance, instead of doing a second scan of
+the node runqueues, the idle core is used as the migration target. When
+doing so multiple tasks can attempt to select an idle CPU but fail, because
+a NUMA balance is active on that CPU. In this case an alternative idle CPU
+scanned. Another optimization is to terminate the search for swap candidate
+when a reasonable one is found instead of searching all the CPUs on the
+target domain.
 
 **Asymmetric CPU capacity wakeup scan**:
 Previous assumption that CPU capacities within an SD_SHARE_PKG_RESOURCES
@@ -38,34 +38,24 @@ If no idle CPU is big enough, the idle CPU with the highest capacity is
 picked.
 
 **Optimized idle core selection**:
-Previously all threads of a core were looped through to evaluate if the
-core is idle or not. This was unnecessary. If a thread of a core is not
-idle, skip evaluating other threads of a core. Also while clearing the
-cpumask, bits of all CPUs of a core can be cleared in one shot.
+Skipped looping through all the threads of a core to evaluate if the
+core is idle or not. If a thread of a core is not idle, evaluation of
+other threads of the core can be skipped.
 
 **Load balance aggressively for SCHED_IDLE CPUs**:
-The fair scheduler performs periodic load balance on every CPU to check
-if it can pull some tasks from other busy CPUs. The duration of this
-periodic load balance is set to scheduler domain's balance_interval and
-multiplied by a busy_factor (set to 32 by default) for the busy CPUs. This
-multiplication is done for busy CPUs to avoid doing load balance too
-often and rather spend more time executing actual task. While that is
-the right thing to do for the CPUs busy with SCHED_OTHER or SCHED_BATCH
-tasks, it may not be the optimal thing for CPUs running only SCHED_IDLE
-tasks. With the recent enhancements in the fair scheduler around SCHED_IDLE
-CPUs, it is now preferred to enqueue a newly-woken task to a SCHED_IDLE
-CPU instead of other busy or idle CPUs. The same reasoning is applied
-to the load balancer as well to make it migrate tasks more aggressively
-to a SCHED_IDLE CPU, as that will reduce the scheduling latency of the
-migrated (SCHED_OTHER) tasks. Fair scheduler now does the next
+Newly-woken task is preferred to be  enqueued on a SCHED_IDLE CPU instead
+of other busy or idle CPUs. Also load balancer is made to migrate tasks more
+aggressively to a SCHED_IDLE CPU. Fair scheduler now does the next
 load balance soon after the last non-SCHED_IDLE task is dequeued from a
-runqueue, i.e. making the CPU SCHED_IDLE.
+runqueue, i.e. making the CPU SCHED_IDLE. Also the the busy_factor
+used with the balance interval to prevent frequent load balancing
+is ignored for such CPU's.
 
 **Load balancing algorithm Reworked**:
-The load balancing algorithm contained some heuristics which became
-meaningless since the rework of the scheduler's metrics like the
-introduction of PELT. The new load balancing algorithm fixes several
-pending wrong tasks placement
+Some heuristics in the load balancing algorithm became meaningless because
+of the rework of the scheduler's metrics like the introduction of PELT.
+Those heuristics were removed. The new load balancing algorithm also fixes
+several pending wrong tasks placement
 
  * the 1 task per CPU case with asymmetric system
  * the case of CFS task preempted by other class
@@ -73,41 +63,40 @@ pending wrong tasks placement
 
 Also the load balance decisions have been consolidated in the 3 separate
 functions.
+* update_sd_pick_busiest() select the busiest sched_group.
+* find_busiest_group() checks if there is an imbalance between local and
+busiest group.
+* calculate_imbalance() decides what have to be moved.
 
 **Energy-aware wake-ups speeded up**:
-EAS computes the energy impact of migrating a waking task when deciding
-on which CPU it should run. However, the previous approach had high algorithmic
-complexity, which resulted in prohibitively high wake-up latencies on
-systems with complex energy models, such as systems with per-CPU DVFS. On
-such systems, the algorithm complexity was O(n^2). To address this,
-the EAS wake-up path was re-factored to compute the energy 'delta' on a
-per-performance domain basis, rather than system-wide, which brings the
-complexity down to O(n).
+Algorithmic complexity of the EAS was reduced from O(n^2) to O(n).
+Previous algorithm resulted in prohibitively high wake-up latencies on
+systems with complex energy models, such as systems with per-CPU DVFS.
+The EAS wake-up path was re-factored to compute the energy 'delta' on a
+per-performance domain basis, rather than the whole system.
 
 **Selection of an energy-efficient CPU on task wake-up**:
-If an Energy Model (EM) is available and if the system isn't overutilized,
-waking tasks are re-routed into an energy-aware placement algorithm.
-The selection of an energy-efficient CPU for a task is achieved by estimating
-the impact on system-level active energy resulting from the placement of the
-task on the CPU with the highest spare capacity in each performance domain.
-This strategy spreads tasks in a performance domain and avoids overly
+An Energy efficient CPU is found by estimating the impact on system-level
+active energy resulting from the placement of the task on the CPU with the
+highest spare capacity in each performance domain. Energy Model (EM) is
+used for this. This strategy spreads tasks in a performance domain and avoids overly
 aggressive task packing. The best CPU energy-wise is then selected if it
 saves a large enough amount of energy with respect to prev_cpu.
 
 **Consider misfit tasks when load-balancing**:
-On asymmetric CPU capacity systems load intensive tasks can end up on
-CPUs that don't suit their compute demand. In this scenario 'misfit'
-tasks are migrated to CPUs with higher compute capacity to ensure better
-throughput. A new group_type: group_misfit_task is added and indicates this
+A task which ends up on a CPU which doesn't suit its compute demand is
+identified as a misfit task in asymmetric CPU capacity systems. These
+'misfit' tasks are migrated to CPUs with higher compute capacity to ensure
+better throughput. A new group_type: group_misfit_task is added and indicates this
 scenario. Tweaks to the load-balance code are done to make the migrations
 happen. Misfit balancing is done between a source group of lower per-CPU
 capacity and destination group of higher compute capacity. Otherwise, misfit
 balancing is ignored.
 
+
 **Make schedstats a runtime tunable that is disabled by default**:
-schedstats is very useful during debugging and performance tuning but it
-incurred overhead to calculate the stats. A kernel command-line and sysctl
-tunable was added to enable or disable schedstats on demand (when it's built in).
-It is disabled by default. The benefits are dependent on how
-scheduler-intensive the workload is.
+A kernel command-line and sysctl tunable was added to enable or disable
+schedstats on demand (when it's built in). It is disabled by default.
+The benefits are dependent on how scheduler-intensive the workload is.
+
 
diff --git a/Documentation/scheduler/sched-cas.rst b/Documentation/scheduler/sched-cas.rst
new file mode 100644
index 000000000000..ab2cabedd2c0
--- /dev/null
+++ b/Documentation/scheduler/sched-cas.rst
@@ -0,0 +1,74 @@
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
+subsystem to rebuild sched_domains when CPU frequency changes.
+
+Asymmetric CPU capacity information is used in
+
+* Energy Aware Scheduling: The scheduler is  able to predict the impact of
+  its decisions on the energy consumed by CPUs. Described in :doc: `sched-energy` .
+* Optimized task wakeup load balancing by finding idle CPU with enough capacity.
+
+The different scheduler classes asymmetric use the Asymmetric CPU capacity
+information differently.
+
+**CFS capacity awareness**
+
+Used to identify misfit tasks:
+A load intensive task on a CPU which doesn't meet its compute demand is
+identified as a misfit task. 'Misfit' tasks are migrated to CPUs with
+higher compute capacity to ensure better throughput. CFS periodically updates
+the misfit status of the current task by comparing its load vs the CPU capacity
+using task_fits_capacity(). If the load is more than the CPU capacity the
+calculated misfit load is updated to the runqueue rq->misfit_task_load.
+This load is then considered by the load balancing operations to migrate
+the task to a CPU of higher capacity.
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
+** RT & DL capacity awareness **
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
index ec900367cc0c..a16408676b71 100644
--- a/Documentation/scheduler/sched-data-structs.rst
+++ b/Documentation/scheduler/sched-data-structs.rst
@@ -36,36 +36,6 @@ runqueue. The scheduler traverses the sched_entity hierarchy to pick the
 next task to run on the CPU. The entity gets picked up from the cfs_rq on
 which it is queued and its time slice is divided among all the tasks on its my_q.
 
-Virtual Runtime
-~~~~~~~~~~~~~~~~~
-Virtual Run Time or vruntime is the amount of time a task has spent running
-on the CPU. It is updated periodically by scheduler_tick(). Tasks are stored
-in the CFS scheduling class rbtree sorted by vruntime. scheduler_tick() calls
-corresponding hook of CFS which first updates the runtime statistics of the
-currently running task and checks if the current task needs to be preempted.
-vruntime of the task based on the formula ::
-
-    vruntime += delta_exec * (NICE_0_LOAD/curr->load.weight);
-
-where:
-
-* delta_exec is the time in nanoseconds spent by the task since the last time
-  vruntime was updated.
-* NICE_0_LOAD is the load of a task with normal priority.
-* curr is the shed_entity instance of the cfs_rq struct of the currently
-  running task.
-* load.weight: sched_entity load_weight. load_weight is the encoding of
-  the tasks priority and vruntime. The load of a task is the metric
-  indicating the number of CPUs needed to make satisfactory progress on its
-  job. Load of a task influences the time a task spends on the CPU and also
-  helps to estimate the overall CPU load which is needed for load balancing.
-  Priority of the task is not enough for the scheduler to estimate the
-  vruntime of a process. So priority value must be mapped to the capacity of
-  the standard CPU which is done in the array :c:type:`sched_prio_to_weight[]`.
-  The array contains mappings for the nice values from -20 to 19. Nice value
-  0 is mapped to 1024. Each entry advances by approximately 1.25 which means
-  for every increment in nice value the task gets 10% less CPU and vice versa.
-
 Scheduler classes
 ~~~~~~~~~~~~~~~~~
 It is an extensible hierarchy of scheduler modules. The modules encapsulate
@@ -78,109 +48,68 @@ The important methods of scheduler class are:
 
 enqueue_task and dequeue_task
     These functions are used to put and remove tasks from the runqueue
-    respectively. The function takes the runqueue, the task which needs to
-    be enqueued/dequeued and a bit mask of flags. The main purpose of the
-    flags is to describe why the enqueue or dequeue is being called.
-    The different flags used are described in ::
+    respectively to change a property of a task. This is referred to as
+    change pattern.  Change is defined as the following sequence of calls::
+
+         * dequeue_task()
+         * put_prev_task()
+         * change a property
+         * enqueue_task()
+         * set_next_task()
+
+    The enqueue_task function takes the runqueue, the task which needs to
+    be enqueued/dequeued and a bit mask of flags as parameters. The main
+    purpose of the flags is to describe why the enqueue or dequeue is being
+    called. The different flags used are described in ::
 
         kernel/sched/sched.h
 
-    enqueue_task and dequeue_task are called for following purposes.
-
-    - When waking a newly created task for the first time. Called with
-      ENQUEUE_NOCLOCK
-    - When migrating a task from one CPU's runqueue to another. Task will be
-      first dequeued from its old runqueue, new CPU will be added to the
-      task struct,  runqueue of the new CPU will be retrieved and task is
-      then enqueued on this new runqueue.
-    - When do_set_cpus_allowed() is called to change a tasks CPU affinity. If
-      the task is queued on a runqueue, it is first dequeued with the
-      DEQUEUE_SAVE and DEQUEUE_NOCLOCK flags set. The set_cpus_allowed()
-      function of the corresponding scheduling class will be called.
-      enqueue_task() is then called with ENQUEUE_RESTORE and ENQUEUE_NOCLOCK
-      flags set.
-    - When changing the priority of a task using rt_mutex_setprio(). This
-      function implements the priority inheritance logic of the RT mutex
-      code. This function changes the effective priority of a task which may
-      in turn change the scheduling class of the task. If so enqueue_task is
-      called with flags corresponding to each class.
-    - When user changes the nice value of the task. If the task is queued on
-      a runqueue, it first needs to be dequeued, then its load weight and
-      effective priority needs to be set. Following which the task is
-      enqueued with ENQUEUE_RESTORE and ENQUEUE_NOCLOCK flags set.
-    - When __sched_setscheduler() is called. This function enables changing
-      the scheduling policy and/or RT priority of a thread. If the task is
-      on a runqueue, it will be first dequeued, changes will be made and
-      then enqueued.
-    - When moving tasks between scheduling groups. The runqueue of the tasks
-      is changed when moving between groups. For this purpose if the task
-      is running on a queue, it is first dequeued with DEQUEUE_SAVE, DEQUEUE_MOVE
-      and DEQUEUE_NOCLOCK flags set, followed by which scheduler function to
-      change the tsk->se.cfs_rq and tsk->se.parent and then task is enqueued
-      on the runqueue with the same flags used in dequeue.
+    Some places where the enqueue_task and dequeue_task are called for
+    changing task properties are
+
+    * When migrating a task from one CPU's runqueue to another.
+    * When changing a tasks CPU affinity.
+    * When changing the priority of a task.
+    * When changing the nice value of the task.
+    * When changing the scheduling policy and/or RT priority of a thread.
 
 pick_next_task
-    Called by __schedule() to pick the next best task to run.
-    Scheduling class structure has a pointer pointing to the next scheduling
-    class type and each scheduling class is linked using a singly linked list.
-    The __schedule() function iterates through the corresponding
-    functions of the scheduler classes in priority order to pick up the next
-    best task to run. Since tasks belonging to the idle class and fair class
-    are frequent, the scheduler optimizes the picking of next task to call
-    the pick_next_task_fair() if the previous task was of the similar
-    scheduling class.
+    Called by the scheduler to pick the next best task to run. The scheduler
+    iterates through the corresponding functions of the scheduler classes
+    in priority order to pick up the next best task to run. Since tasks
+    belonging to the idle class and fair class are frequent, the scheduler
+    optimizes the picking of next task to call the pick_next_task_fair()
+    if the previous task was of the similar scheduling class.
 
 put_prev_task
     Called by the scheduler when a running task is being taken off a CPU.
-    The behavior of this function depends on individual scheduling classes
-    and called in the following cases.
-
-    - When do_set_cpus_allowed() is called and if the task is currently running.
-    - When scheduler pick_next_task() is called, the put_prev_task() is
-      called with the previous task as function argument.
-    - When rt_mutex_setprio() is called and if the task is currently running.
-    - When user changes the nice value of the task and if the task is
-      currently running.
-    - When __sched_setscheduler() is called and if the task is currently
-      running.
-    - When moving tasks between scheduling groups through the sched_move_task()
-      and if the task is ćurrently running.
-
+    The behavior of this function depends on individual scheduling classes.
     In CFS class this function is used to put the currently running task back
     into the CFS RB tree. When a task is running it is dequeued from the tree.
     This is to prevent redundant enqueue's and dequeue's for updating its
     vruntime. vruntime of tasks on the tree needs to be updated by update_curr()
-    to keep the tree in sync. In DL(deadline) and RT classes additional tree is
-    maintained for facilitating task migration between CPUs through push
-    operation between runqueues for load balancing. Task will be added to
-    this queue if it is present on the scheduling class rq and the task has
-    affinity to more than one CPU.
+    to keep the tree in sync. In SCHED_DEADLINE and RT classes additional tree
+    is maintained to push tasks from the current CPU to another CPU where the
+    task can preempt and start executing. Task will be added to this queue
+    if it is present on the scheduling class rq and the task has affinity
+    to more than one CPU.
 
 set_next_task
     Pairs with the put_prev_task(), this function is called when the next
     task is set to run on the CPU. This function is called in all the places
-    where put_prev_task is called to complete the 'change'. Change is defined
-    as the following sequence of calls::
-
-         - dequeue task
-         - put task
-         - change the property
-         - enqueue task
-         - set task as current task
-
-    It resets the run time statistics for the entity with
-    the runqueue clock.
-    In case of CFS scheduling class, it will set the pointer to the current
-    scheduling entity to the picked task and accounts bandwidth usage on
-    the cfs_rq. In addition it will also remove the current entity from the
-    CFS runqueue for vruntime update optimization opposite to what was done
-    in put_prev_task.
-    For the SCHED_DEADLINE and RT classes it will
-
-    - dequeue the picked task from the tree of pushable tasks.
-    - update the load average in case the previous task belonged to another
+    where put_prev_task is called to complete the 'change pattern'. In case
+    of CFS scheduling class, it will set current scheduling entity to the
+    picked task and accounts bandwidth usage on the cfs_rq. In addition it
+    will also remove the current entity from the CFS runqueue for the vruntime
+    update optimization, opposite to what was done in put_prev_task.
+    For the SCHED_DEADLINE and RT classes it will remove the task from the
+    tree of pushable tasks trigger the balance callback to push another task
+    which is non running on the current CPU for execution on another CPU.
+
+    * dequeue the picked task from the tree of pushable tasks.
+    * update the load average in case the previous task belonged to another
       class.
-    - queues the function to push tasks from current runqueue to other CPUs
+    * queues the function to push tasks from current runqueue to other CPUs
       which can preempt and start execution. Balance callback list is used.
 
 task_tick
@@ -192,7 +121,7 @@ task_tick
     hrtick() is called from high resolution timers to deliver an accurate
     preemption tick as the regular scheduler tick that runs at 1/HZ can be
     too coarse when nice levels are used.
-    sched_tick_remote() Gets called by the offloaded residual 1Hz scheduler
+    sched_tick_remote() gets called by the offloaded residual 1Hz scheduler
     tick. In order to reduce interruptions to bare metal tasks, it is possible
     to outsource these scheduler ticks to the global workqueue so that a
     housekeeping CPU handles those remotely.
diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
index a96c72651877..0556783019cf 100644
--- a/Documentation/scheduler/sched-design-CFS.rst
+++ b/Documentation/scheduler/sched-design-CFS.rst
@@ -44,6 +44,26 @@ value (i.e., the task which executed least so far).  CFS always tries to split
 up CPU time between runnable tasks as close to "ideal multitasking hardware" as
 possible.
 
+vruntime of the task based on the formula ::
+
+    vruntime += delta_exec * (NICE_0_LOAD/se->load);
+
+where:
+
+* delta_exec is the time in nanoseconds spent by the task since the last time
+  vruntime was updated.
+* NICE_0_LOAD is the load of a task with default priority.
+* se->load: sched_entity load_weight. load_weight is the obtained by mapping
+  of priority value to the capacity of the standard CPU which is done in
+  the array :c:type:`sched_prio_to_weight[]`. The array contains mappings
+  for the nice values from -20 to 19. Nice value 0 is mapped to 1024. Each
+  entry advances by approximately 1.25 which means for every increment in
+  nice value the task gets 10% less CPU and vice versa.
+  When the se->load is updated the se->avg is also updated for SMP
+  configurations. Load balancing decisions are based (amongst other things)
+  on the sums of se.avg.load_avg, which is the 'load' signal generated via
+  PELT. PELT(Per-entity load tracking) is described in :doc: `sched-pelt`.
+
 Most of the rest of CFS's design just falls out of this really simple concept,
 with a few add-on embellishments like nice levels, multiprocessing and various
 algorithm variants to recognize sleepers.
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
-- 
2.17.1

