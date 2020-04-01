Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19DC419A91C
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732219AbgDAKC4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 06:02:56 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43003 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732183AbgDAKCz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 06:02:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id s13so8750144lfb.9
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2020 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g0coiFUpbIgd5A4GwoifwrGDwSK7rsUcfd9ga2B3bnM=;
        b=XEnMkOM4uI/+u6X1UU143PPLPYUJuo5TLjuCvNWgz+vFuSw529vDuKbkiTN2wQceFv
         FMvOIA5TqWcPKjG+UrZvO8t+5B5g/R9/H3sW3Ahm+iw2tjTM+5R+4Mxbm5BwJNcfRsUJ
         XJiKf4xI/AENrwLX+bku3kCHqYVjoHQTqnv6EuWCv0i58PqQqsFEyh5DAwNcRky3XIha
         uvspzp0zNc2tkT30yQCBWx85am2qkNDNpo5EM9X0ARNFqh931gwS1ISzUJxXbvpO5+1B
         feyD/DQbaYe/sJ2wpRqH9tAHvXCG0RhDtp5+rlrEygTYoPpzigUvQf/wrNjdjYX8ImCa
         Ralg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g0coiFUpbIgd5A4GwoifwrGDwSK7rsUcfd9ga2B3bnM=;
        b=DMNy6kMW1nmkvXAS268Y4iN0MaJFGX3Vg+HuoMEZmiTEiOrYQMD6RykKleoGjuHfH4
         YbM6wZz2cCIcSqoiSngVBWgHxiHNc+RbIh6F5OHfhlS1UuA0q1G4HQIefTgE05QlvYvG
         5+lEcgBfw4yDudBhTu1r/OkS1HmvfnoQDL+Zh71JooiWY3BuGurKaal7g1VENpBFpG5s
         k7nGRnMaY8eWlr2kRAQVxyU/L2tuFZPON2+zdI8bntxN+KQEMe4FurMxDFWO0Fpm0DwU
         f8J74yF9v9xUZwfMhEshFBZgQA8ac+0up3Puq5ybAG8az0TECEWBdRAhZhIlQf+k90c6
         WlMQ==
X-Gm-Message-State: AGi0Pubetp1aPGzQYdA1WVeT45lA+wy/E18QENMeu0+DwOO4smzbDMSH
        VD3+VYoLzfrRn7+HQOSsIdv+rQ==
X-Google-Smtp-Source: APiQypJIScHSWPvyeCyZPkDVfosLmL7X54BjEC5PakWh+hj2RkgTZfxA1QyKDzzf/MszAlIvIpSTWg==
X-Received: by 2002:a19:ed1:: with SMTP id 200mr1982681lfo.80.1585735371849;
        Wed, 01 Apr 2020 03:02:51 -0700 (PDT)
Received: from localhost.localdomain (dyvyn9m99j8s7-9xsphjt-4.rev.dnainternet.fi. [2001:14bb:440:beab:bd3f:1fbf:f66f:618f])
        by smtp.googlemail.com with ESMTPSA id n14sm862986ljm.104.2020.04.01.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 03:02:51 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview documentation
Date:   Wed,  1 Apr 2020 13:00:28 +0300
Message-Id: <20200401100029.1445-3-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401100029.1445-1-john.mathew@unikie.com>
References: <20200401100029.1445-1-john.mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation for
 -scheduler overview
 -scheduler state transtion
 -CFS overview
 -CFS data structs

Add rst for scheduler APIs and modify sched/core.c
to add kernel-doc comments.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/cfs-data-structs.rst  | 208 ++++++++++++++
 Documentation/scheduler/cfs-overview.rst      |  46 ++++
 .../scheduler/cfs-sched-overview.rst          |   2 +
 Documentation/scheduler/index.rst             |   1 +
 Documentation/scheduler/overview.rst          | 255 ++++++++++++++++++
 Documentation/scheduler/scheduler-api.rst     |  34 +++
 kernel/sched/core.c                           |  36 ++-
 7 files changed, 574 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/scheduler/cfs-data-structs.rst
 create mode 100644 Documentation/scheduler/cfs-overview.rst
 create mode 100644 Documentation/scheduler/scheduler-api.rst

diff --git a/Documentation/scheduler/cfs-data-structs.rst b/Documentation/scheduler/cfs-data-structs.rst
new file mode 100644
index 000000000000..53b978e9676d
--- /dev/null
+++ b/Documentation/scheduler/cfs-data-structs.rst
@@ -0,0 +1,208 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+====================
+CFS Data Structures
+====================
+
+Main parts of the Linux scheduler are:
+
+**Running Queue:** This is the central data structure of process scheduling. It
+manages tasks that are in a runnable state waiting for a processor. Each CPU has
+its own run queue. The scheduler picks a task from the queue and assigns it to
+the CPU core. The main members of the :c:type:`struct rq <rq>` are:
+
+:c:member:`nr_running`
+    Total number of tasks on the runqueue.
+
+:c:member:`nr_switches`
+    Number of context switches.
+
+:c:member:`cfs`
+    Running queue structure for cfs scheduler.
+
+:c:member:`rt`
+    running queue structure for rt scheduler
+
+:c:member:`next_balance`
+    Timestamp to next load balance check.
+
+:c:member:`curr`
+    Points to currently running task of this running queue.
+
+:c:member:`idle`
+    Points to currently idle task of this running queue.
+
+:c:member:`lock`
+    Spin lock of running queue. task_rq_lock() and task_rq_unlock() can be
+    used to lock running queue which a specific task runs on.
+
+:c:member:`clock`
+    Clock value for the queue set to time now.
+
+Each rq struct points to a cfs_rq struct which represents the rb tree. The main
+members of the :c:type:`struct cfs_rq <cfs_rq>` are:
+
+:c:member:`nr_running`
+    Number of runnable tasks on this queue.
+
+:c:member:`min_vruntime`
+    Smallest vruntime of the queue.
+
+:c:member:`curr`
+    scheduling entity of the current process.
+
+:c:member:`next`
+    scheduling entity of the next process.
+
+:c:member:`load`
+    Cumulative load_weight of tasks for load balancing.
+    load_weight is the encoding of the tasks priority and vruntime. The load of a
+    task is the metric indicating the number of cpus needed to make satisfactory
+    progress on its job. Load of a task influences the time a task spends on the cpu
+    and also helps to estimate the overall cpu load which is needed for load balancing.
+    Priority of the task is not enough for the scheduler to estimate the vruntime
+    of a process. So priority value must be mapped to the capacity of the standard cpu
+    which is done in the array :c:type:`sched_prio_to_weight[]`. The array contains
+    mappings for the nice values from -20 to 19. Nice value 0 is mapped to 1024.
+    Each entry advances by ~1.25 which means if for every increment in nice value
+    the task gets 10% less cpu and vice versa. The load_weight derived is stored in a
+    :c:type:`struct load_weight <load_weight>` which contains both the value and its
+    inverse. Inverse value enables arithmetic speed up by changing divisions in to
+    multiplications. The cfs_rq stores the cumulative load_weight of all the tasks in
+    the runqueue.
+
+**Scheduling entity** : Scheduler uses scheduling entities which contain
+sufficient information to actually accomplish the scheduling job of a task or a
+task-group. The scheduling entity may be a group of tasks or a single task.
+Every task is associated with a sched_entity structure. CFS adds support for nesting
+of tasks and task groups. The  main members of the  :c:type:`struct sched_entity <sched_entity>`
+are :
+
+:c:member:`load`
+    load_weight of the scheduling entity. This is different from the cfs_rq
+    load. This value is also calculated differently between group and task entities.
+    If group scheduling is enabled the sched_entity load is calculated in the
+    :c:func:`calc_group_shares` else it is the maximum allowed load for the task group.
+
+:c:member:`run_node`
+    Node of the CFS RB tree.
+
+:c:member:`on_rq`
+    If entity is currently on a runqueue.
+
+:c:member:`exec_start`
+    Timestamp of a task when it starts running.
+
+:c:member:`sum_exec_runtime`
+    To store the time a task has been running in total.
+
+:c:member:`vruntime`
+    vruntime of the task explained below.
+
+Few members are added when CFS is enabled.
+
+:c:member:`parent`
+    parent of this scheduling entity. Enables hierarchy of scheduling entities.
+
+:c:member:`cfs_rq`
+    runqueue on which this entity is to be queued.
+
+:c:member:`my_q`
+    runqueue owned by this entity/group.
+
+Each scheduling entity may be run from its parents runqueue. Scheduler traverses
+the sched_entity hierarchy to pick the next task to run on the cpu. The entity
+gets picked up from the cfs_rq on which it is queued and its time slice is divided
+among all the tasks on its my_q.
+
+vruntime is the value by which tasks are ordered on the red-black tree. Tasks are
+arranged in increasing order of vruntime which is the amount of time a task has
+spent running on the cpu.vruntime of a task is updated periodically based on the
+:c:func:`scheduler_tick` function. scheduler_tick() calls task_tick() hook of CFS.
+This hook calls :c:func:`task_tick_fair` which internally calls :c:func:`entity_tick`.
+:c:func:`entity_tick` does two main steps. First it updates the runtime statistics of
+the currently running task. Then it checks if the current task needs to be pre-empted.
+Within :c:func:`entity_tick` the :c:func:`update_curr` is responsible for updating the
+current task's runtime statistics including the vruntime. The function first gets
+the scheduled task from the runqueue and the clock value of the main runqueue : struct rq.
+The difference between the start time of the task and the clock value is
+calculated and stored in a variable. Next the vruntime of the task is calculated
+in the calc_delta_fair() function. This function calls __calc_delta() to calculate
+the vruntime of the task based on the formula ::
+
+	vruntime += delta_exec * (NICE_0_LOAD/curr->load.weight);
+
+where:
+
+* delta_exec is the time spent by the task since the last time vruntime was
+  updated.
+* NICE_0_LOAD is the load of a task with normal priority.
+* curr is the shed_entity instance of the cfs_rq struct of the currently-running
+  task.
+* load.weight: sched_entity load_weight. It is described above.
+
+vruntime progresses slowly for tasks of higher priority. update_curr() then
+calls update_min_vruntime() to update the min_vruntime of the queue. In
+:c:func:`update_min_vruntime` the kernel gets the vruntimes
+for leftmost element in the tree  *cfs_rq->rb_leftmost* if it exists and the
+scheduled process. The smallest of the two is chosen. The maximum of the current
+min_vruntime and previously chosen vruntime is taken as the min_vruntime for the
+queue to ensure that the the vruntime keeps increasing and never decreases.
+min_vruntime maintains the time of the task which has run the least on the cpu.
+This value is used to compare against all the tasks in a runqueue. A task with
+the least difference between its vruntime and min_runtime will get the cpu sooner.
+
+After returning from the update_curr() the  entity_tick() then calls
+:c:func:`check_preempt_tick`  to ensure fairness of scheduling. The vruntime of
+the current process is checked against the left most task in the RB tree to
+decide if a task switch is necessary.
+
+**Schedule class:** It is an extensible hierarchy of scheduler modules. The
+modules encapsulate scheduling policy details.
+They are called from the core code which is independent. Scheduling classes are
+implemented through the sched_class structure.
+fair_sched_class and rt_sched_class class are implementations of this class. The
+main members of the :c:type:`struct sched_class <sched_class>` are :
+
+For the fair_sched_class the hooks (implemented as <function name>_fair)
+does the following:
+
+:c:member:`enqueue_task`
+    Update the fair scheduling stats and puts scheduling entity in
+    to rb tree and increments the nr_running variable.
+
+:c:member:`dequeue_task`
+    Moves the entity out of the rb tree when entity no longer runnable
+    and decrements the nr_running variable. Also update the fair scheduling stats.
+
+:c:member:`yield_task`
+    Use the buddy mechanism to skip onto the next highest priority se at
+    every level in the CFS tree, unless doing so would introduce gross unfairness
+    in CPU time distribution.
+
+:c:member:`check_preempt_curr`
+    Check whether the task that woke up should pre-empt the
+    running task.
+
+:c:member:`pick_next_task`
+    Pick the next eligible task. This may not be the left most task
+    in the rbtree. Instead a buddy system is used which provides benefits of
+    cache locality and group scheduling.
+
+:c:member:`task_tick`
+    Called from scheduler_tick(). Updates the runtime statistics of the
+    currently running task and checks if this task needs to be pre-empted.
+
+:c:member:`task_fork`
+    scheduler setup for newly forked task.
+
+:c:member:`task_dead`
+    A task struct has one reference for the use as "current". If a task
+    dies, then it sets TASK_DEAD in tsk->state and calls schedule one last time.
+    The schedule call will never return, and the scheduled task must drop that
+    reference.
+
+Kernel forwards the tasks to each class based on the scheduling policy assigned
+to each task. Tasks assigned with SCHED_NORMAL, SCHED_IDLE and SCHED_BATCH
+go to fair_sched_class and tasks assigned with SCHED_RR and SCHED_FIFO go to
+rt_sched_class
diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/scheduler/cfs-overview.rst
new file mode 100644
index 000000000000..10a15aa50fcd
--- /dev/null
+++ b/Documentation/scheduler/cfs-overview.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=============
+CFS Overview
+=============
+
+History
+-------
+
+Linux 2.6.23 introduced a modular scheduler core and a Completely Fair Scheduler
+(CFS) implemented as a scheduling module. Scheduler has been improving since
+kernel version 2.4. In kernel 2.4  there was one running queue for all processes.
+During every schedule the queue was locked and every task time-slice was update.
+This implementation caused interactivity issues. A re-write in kernel version 2.5
+assigned a running queue for each processor a running queue and was able to
+achieve a O(1) run time irrespective of the number of tasks in the system. This
+scheduler did good until the Rotating Staircase Deadline (RSDL) scheduler was
+introduced. The RDSL scheduler attempted to reduce the scheduler complexity. The
+CFS scheduler was inspired from the RDSL scheduler and the current CFS scheduler
+originated. The improvements were not only in performance and interactivity but
+also simplicity of the scheduling logic and modularized scheduler code. Since
+kernel 2.6.23, there has been improvements to the CFS scheduler in the areas of
+optimization, load balancing and group scheduling features.
+
+RDSL scheduler removed the interactivity estimation code from the previous linux
+scheduler. RDSL was fair by giving equal time slices to all processes. There was
+no classification of IO bound or CPU bound processes. CFS adopts this concept of
+fairness. CFS takes in to use the length of the sleep time in the interactive
+process so processes which sleep less will get more CPU time.
+
+CFS uses a time ordered red-black tree for each CPU. The red-black tree is a type
+of self-balancing binary search tree. Every running process, has a node in the
+red-black tree. The process at the left-most position of the red-black tree is
+the one to be scheduled next. The red-black tree is complex, but it has a good
+worst-case running time for its operations and is efficient in practice: it can
+search, insert, and delete in O(log n) time, where n is the number of elements in
+the tree. The leaf nodes are not relevant and do not contain data. The red-black
+tree is always balanced. Because the red-black tree is a binary tree, the time
+complexities of lookup operations are logarithmic. However, non-left-most lookup
+is hardly ever done and the left-most node pointer is always cached.A red-black
+tree can be implemented with internal storage—that is, no external allocations
+are needed to maintain the data structure.
+
+The implementation of the rb tree is at ::
+
+    include/linux/rbtree.h
diff --git a/Documentation/scheduler/cfs-sched-overview.rst b/Documentation/scheduler/cfs-sched-overview.rst
index 44dac92d9462..c6eef7372d4e 100644
--- a/Documentation/scheduler/cfs-sched-overview.rst
+++ b/Documentation/scheduler/cfs-sched-overview.rst
@@ -12,4 +12,6 @@ This documentation describes the linux CFS scheduler.
 .. toctree::
    :maxdepth: 2
 
+   cfs-overview
+   cfs-data-structs
    sched-design-CFS
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 83c718d05b9d..9772cf81fd96 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -21,6 +21,7 @@ specific implementation differences.
     sched-features
     arch-specific.rst
     sched-debugging.rst
+    scheduler-api.rst
 
 .. only::  subproject and html
 
diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
index aee16feefc61..5ead8885250e 100644
--- a/Documentation/scheduler/overview.rst
+++ b/Documentation/scheduler/overview.rst
@@ -3,3 +3,258 @@
 ====================
 Scheduler overview
 ====================
+
+Linux kernel implements priority based scheduling. Therefore, more than one
+process are allowed to run at any given time and each process is allowed to run
+as if it were the only process on the system. The process scheduler coordinate
+which process runs when. In that context, it has the following tasks:
+
+- share CPU cores equally among all currently running processes
+- pick appropriate process to run next if required, considering scheduling
+  class/policy and process priorities
+- balance processes between multiple cores in SMP systems
+
+
+Scheduler attempts to be responsive for I/O bound processes and efficient for
+CPU bound processes. Scheduler also applies different scheduling policies for
+real time and normal processes based on their respective priorities.
+Higher priorities in the kernel have a numerical smaller value. Real time
+priorities range from 1 (highest) – 99 whereas normal priorities range from
+100 – 139 (lowest).
+
+
+Process
+=======
+
+Processes are the most fundamental abstraction in a Unix system, after files.
+Its consists of object code, data, resources, and state.
+
+Each process in the system is represented by  :c:type:`struct task_struct <task_struct>`.
+Since task_struct data type must be able to capture all information of a process,
+it is relatively large. When a process/thread is created, the kernel allocates a
+new task_struct for it. The kernel then stores this task_struct in a circular
+linked list call task_list. Macro next_task and prev_task allow a process to
+obtain its next task and its previous task respectively. The frequently used
+fields of the task struct are:
+
+*state:* The running state of the task. The possible states are:
+
+- TASK_RUNNING: The task is currently running or in a run queue waiting to run.
+- TASK_INTERRUPTIBLE: The task is sleeping waiting for some event to occur. This
+  task can be interrupted by signals. On waking up the task transitions to
+  TASK_RUNNING.
+- TASK_UNINTERRUPTIBLE: Similar to  TASK_INTERRUPTIBLE but does not wake up on
+  signals. Needs an explicit wake-up call to be woken up. Contributes to loadavg.
+- __TASK_TRACED: Task is being traced by another task like a debugger.
+- __TASK_STOPPED: Task execution has stopped and not eligible to run. SIGSTOP,
+  SIGTSTP etc causes this state. The task can be continued by the signal SIGCONT.
+- TASK_PARKED: state to support kthread parking/unparking.
+- TASK_DEAD: If a task  dies, then it sets TASK_DEAD in tsk->state and calls
+  schedule one last time. The schedule call will never return.
+- TASK_WAKEKILL: It works like TASK_UNINTERRUPTIBLE with the bonus that it
+  can respond to fatal signals.
+- TASK_WAKING: To handle concurrent waking of the same task for SMP. Indicates that
+  someone is already waking the task.
+- TASK_NOLOAD: To be used along with TASK_UNINTERRUPTIBLE to indicate an idle task
+  which does not contribute to loadavg.
+- TASK_NEW: set during fork(), to guarantee that no one will run the task,
+  a signal or any other wake event cannot wake it up and insert it on the
+  runqueue.
+
+*exit_state* : The exiting state of the task. The possible states are:
+
+- EXIT_ZOMBIE: The task is terminated and waiting for parent to collect the exit
+  information of the task.
+- EXIT_DEAD: After collecting the exit information the task is put to this state
+  and removed from the system.
+
+*static_prio:* Nice value of a task. The value of this field does not change.
+ Value ranges from -20 to 19. This value is mapped to nice value and used in the
+ scheduler.
+
+*prio:* Dynamic priority of a task. Previously a function of static priority and
+ tasks interactivity. Value not used by CFS scheduler but used by the rt scheduler.
+ Might be boosted by interactivity modifiers. Changes upon fork, setprio syscalls,
+ and whenever the interactivity estimator recalculates.
+
+*normal_prio:* Expected priority of a task. The value of static_prio and normal_prio
+ are the same for non real time processes. For real time processes value of prio
+ is used.
+
+*rt_priority:* Field used by real time tasks. Real time tasks are prioritized
+ based on this value.
+
+*sched_class:* Pointer to sched_class CFS structure.
+
+*sched_entity:* pointer to sched_entity CFS structure.
+
+*poicy:* Value for scheduling policy. The possible values are:
+
+* SCHED_NORMAL: Regular tasks use this policy.
+
+* SCHED_BATCH:  Tasks which need to run longer  without pre-emption use this
+  policy. Suitable for batch jobs.
+* SCHED_IDLE: Policy used by background tasks.
+
+* SCHED_FIFO & SCHED_RR: These policies for real time tasks. Handled by real
+  time scheduler.
+
+*nr_cpus_allowed:* bit field containing tasks affinity towards a set of cpu cores.
+ Set using sched_setaffinity() system call.
+
+
+Thread
+=======
+
+From a process context, thread is an execution context or flow of execution in a
+process. Every process consists of at least one thread.
+In a multiprocessor system multiple threads in a process enables parallelism.
+Each thread has its own task_struct.  Threads are created like normal tasks but
+the clone() is provided with flags that enable the sharing of resources such as
+address space ::
+
+	clone(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, 0);
+
+The scheduler schedules task_structs. So Linux doesn't differentiate between
+thread and process.
+
+The Scheduler Entry Point
+=========================
+
+The main scheduler entry point is arch independent schedule() function defined
+in kernel/sched.c. It implements the scheduler and its objective is to find a
+process in the runqueue list and then assign the CPU to it. It is invoked,
+directly or in a lazy(deferred) way from many different places in the kernel.
+A lazy invocation does not call the function by its name, but gives the kernel
+a hint(by setting a flag) that the scheduler needs to be called soon. The
+need_resched flag is a message to the kernel that the scheduler should be invoked
+as soon as possible because another process deserves to run.
+
+Following are some places that notify the kernel to schedule:
+
+* scheduler_tick() : This function is called on every timer interrupt
+  with HZ frequency and calls scheduler on any task that has used up its quantum
+  of CPU time.
+
+* Running task goes to sleep state : Right before a task goes to sleep ,
+  schedule() will be called to pick the next task to run and the change its state
+  to either TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE. For instance,
+  prepare_to_wait() is one of the functions that makes the task go to the sleep
+  state
+
+* try_to_wake_up() : This function awakens a sleeping process by setting
+  the task’s state to TASK_RUNNING and putting it back on the run queue of the
+  local CPU, for example, the function is invoked to wake up processes included
+  in a wait queue or to resume execution of processes waiting for a signal.
+
+* yield() : A process voluntarily yields the CPU by calling this function, it directly calls schedule() but it is strongly
+  recommended not to use it.
+
+* wait_event() : The process is put to sleep (TASK_UNINTERRUPTIBLE)
+  until the condition evaluates to true. The condition is checked each time the
+  wait-queue wq is woken up.
+
+* _cond_resched() : It gives the scheduler a chance to run a
+  higher-priority process.
+
+* __cond_resched_lock() :  if a reschedule is pending, drop the given
+  lock, call schedule, and on return reacquire the lock.
+
+* do_task_dead() : Changes the the task state to TASK_DEAD and calls
+  schedule to pick next task to run.
+
+* preempt_schedule() : The function checks whether local interrupts are
+  enabled and the preempt_count field of current is zero; if both conditions are
+  true, it invokes schedule() to select another process to run.
+
+* preempt_schedule_irq() : It sets the PREEMPT_ACTIVE flag in the
+  preempt_count field, temporarily sets the big kernel lock counter to -1, enables
+  the local interrupts, and invokes schedule() to select another process to run.
+  When the former process will resume, preempt_schedule_irq() restores the previous
+  value of the big kernel lock counter, clears the PREEMPT_ACTIVE flag, and
+  disables local interrupts. The schedule() function will continue to be invoked
+  as long as the TIF_NEED_RESCHED flag of the current process is set.
+
+Calling functions mentioned above leads to a call to __schedule(), note
+that preemption must be disabled before it is called and enabled after the call
+using preempt_disable and preempt_enable functions family.
+
+
+The steps during invocation are:
+--------------------------------
+1. Disables pre-emption to avoid another task pre-empting the scheduling thread
+   as the linux kernel is pre-emptive.
+2. Retrieves running queue based on current processor and obtain the lock of
+   current rq, to allow only one thread to modify the runqueue at a time.
+3. Examine the state of the previously executed task when the schedule() was called.
+   If it is not runnable and has not been pre-empted in kernel mode, then it
+   should be removed from the runqueue. However, if it has non-blocked pending
+   signals, its state is set to TASK_RUNNING and it is left in the runqueue.
+4. The next action is to check if any runnable tasks exist in the CPU's runqueue.
+   If not, idle_balance() is called to get some runnable tasks from other CPUs.
+5. Next the corresponding class is asked to pick the next suitable task to be
+   scheduled on the CPU by calling the hook pick_next_task(). This is followed
+   by clearing the need_resched flag which might have been set previously to
+   invoke  the schedule() function call in the first place. pick_next_task()
+   is also implemented in core.c. It iterates through the list of scheduling
+   classes to find the class with the highest priority that has a runnable task.
+   If the class is found, the scheduling class hook is called. Since most tasks
+   are handled by the sched_fair class, a short cut to this class is implemented
+   in the beginning of the function.
+6. schedule() checks if pick_next_task() found a new task or if it picked the same
+   task again that was running before. If the latter is the case, no task switch
+   is performed and the current task just keeps running. If a new task is found,
+   which is the more likely case, the actual task switch is executed by calling
+   context_switch(). Internally, context_switch() switches to the new task's
+   memory map and swaps register state and stack.
+7. To finish up, the runqueue is unlocked and pre-emption is re-enabled. In case
+   pre-emption was requested during the time in which it was disabled, schedule()
+   is run again right away.
+
+Scheduler State Transition
+==========================
+
+A very high level scheduler state transition flow with a few states can be
+depicted as follows.
+
+.. kernel-render:: DOT
+   :alt: DOT digraph of Scheduler state transition
+   :caption: Scheduler state transition
+
+   digraph sched_transition {
+      node [shape = point,  label="exisiting task\n calls fork()"]; fork
+      node [shape = box, label="TASK_NEW\n(Ready to run)"] tsk_new;
+      node [shape = box, label="TASK_RUNNING\n(Ready to run)"] tsk_ready_run;
+      node [shape = box, label="TASK_RUNNING\n(Running)"] tsk_running;
+      node [shape = box, label="TASK_DEAD\nEXIT_ZOMBIE"] exit_zombie;
+      node [shape = box, label="TASK_INTERRUPTIBLE\nTASK_UNINTERRUPTIBLE\nTASK_WAKEKILL"] tsk_int;
+      fork -> tsk_new [ label = "task\nforks" ];
+      tsk_new -> tsk_ready_run;
+      tsk_ready_run -> tsk_running [ label = "schedule() calls context_switch()" ];
+      tsk_running -> tsk_ready_run [ label = "task is pre-empted" ];
+      subgraph int {
+         tsk_running -> tsk_int [ label = "task needs to wait for event" ];
+         tsk_int ->  tsk_ready_run [ label = "event occurred" ];
+      }
+      tsk_int ->  exit_zombie [ label = "task exits via do_exit()" ];
+   }
+
+Scheduler provides trace points tracing all major events of the scheduler.
+The tracepoints are defined in ::
+
+  include/trace/events/sched.h
+
+Using these treacepoints it is possible to model the scheduler state transition
+in an automata model. The following conference paper discusses such modeling.
+
+https://www.researchgate.net/publication/332440267_Modeling_the_Behavior_of_Threads_in_the_PREEMPT_RT_Linux_Kernel_Using_Automata
+
+To model the scheduler efficiently the system was divided in to generators and
+specifications. Some of the generators used were "need_resched", "sleepable" and
+"runnable" , "thread_context" and "scheduling context".
+The specifications are the necessary and sufficient conditions to call the scheduler.
+New trace events were added to specify the generators and specifications. In case a
+kernel event referred to more then one event,extra fields of the kernel event was
+used to distinguish between automation events. The final model was done parallel
+composition of all generators and specifications composed of 15 events, 7 generators
+and 10 specifications. This resulted in 149 states and 327 transitions.
diff --git a/Documentation/scheduler/scheduler-api.rst b/Documentation/scheduler/scheduler-api.rst
new file mode 100644
index 000000000000..5fea0eb0f1ff
--- /dev/null
+++ b/Documentation/scheduler/scheduler-api.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=============================
+Scheduler related functions
+=============================
+
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: __schedule
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: scheduler_tick
+
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: try_to_wake_up
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: __cond_resched_lock
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: do_task_dead
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: preempt_schedule
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: preempt_schedule_irq
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: prepare_task_switch
+
+.. kernel-doc:: kernel/sched/core.c
+	:functions: finish_task_switch
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a9983da4408..ccefc820557f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3578,8 +3578,12 @@ unsigned long long task_sched_runtime(struct task_struct *p)
 	return ns;
 }
 
-/*
- * This function gets called by the timer code, with HZ frequency.
+/**
+ * scheduler_tick -
+ *
+ * This function is called on every timer interrupt with HZ frequency and
+ * calls scheduler on any task that has used up its quantum of CPU time.
+ *
  * We call it with interrupts disabled.
  */
 void scheduler_tick(void)
@@ -3958,8 +3962,8 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	BUG();
 }
 
-/*
- * __schedule() is the main scheduler function.
+/**
+ * __schedule() - The main scheduler function.
  *
  * The main means of driving the scheduler and thus entering this function are:
  *
@@ -4086,6 +4090,12 @@ static void __sched notrace __schedule(bool preempt)
 	balance_callback(rq);
 }
 
+/**
+ * do_task_dead - Final step of task exit
+ *
+ *  Changes the the task state to TASK_DEAD and calls schedule to pick next
+ *  task to run.
+ */
 void __noreturn do_task_dead(void)
 {
 	/* Causes final put_task_struct in finish_task_switch(): */
@@ -4244,7 +4254,9 @@ static void __sched notrace preempt_schedule_common(void)
 }
 
 #ifdef CONFIG_PREEMPTION
-/*
+/**
+ * preempt_schedule -
+ *
  * This is the entry point to schedule() from in-kernel preemption
  * off of preempt_enable.
  */
@@ -4316,7 +4328,9 @@ EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
 
 #endif /* CONFIG_PREEMPTION */
 
-/*
+/**
+ * preempt_schedule_irq -
+ *
  * This is the entry point to schedule() from kernel preemption
  * off of irq context.
  * Note, that this is called and return with irqs disabled. This will
@@ -5614,6 +5628,11 @@ SYSCALL_DEFINE0(sched_yield)
 }
 
 #ifndef CONFIG_PREEMPTION
+/**
+ * _cond_resched -
+ *
+ * gives the scheduler a chance to run a higher-priority process
+ */
 int __sched _cond_resched(void)
 {
 	if (should_resched(0)) {
@@ -5626,9 +5645,10 @@ int __sched _cond_resched(void)
 EXPORT_SYMBOL(_cond_resched);
 #endif
 
-/*
- * __cond_resched_lock() - if a reschedule is pending, drop the given lock,
+/**
+ * __cond_resched_lock - if a reschedule is pending, drop the given lock,
  * call schedule, and on return reacquire the lock.
+ * @lock: target lock
  *
  * This works OK both with and without CONFIG_PREEMPTION. We do strange low-level
  * operations here to prevent schedule() from being called twice (once via
-- 
2.17.1

