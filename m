Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009BB1E7B1E
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 13:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgE2LBL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 07:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2LBG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 07:01:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEF3C03E969;
        Fri, 29 May 2020 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=5aMNrEfr5a5gWq3mV6Sw96CbBnyn29SIAhwgu0yFjDM=; b=UwB07gVgPyzqvLp8Z7uyBBYiRl
        WcpxmzVZ3QWke/VRM3lpVHhhJNv8+rEqrpRVc2tLQFwGmtHP3a0ozRJOQ9Z3YAB0GPCCyLfa+BcG6
        5zoUmXAUOzGlArnpf4Y1s37N91wTDxUePghD0RfLNZ6TJMWLGLf71A9QfY0HVzY+JflH1qQS5GgRD
        KgEuxpJb2ja8VKY2FMtlmwzxKVX4UK9KMLthi1OdH4xLZNEWsH9TP4JILThK0DQXHkvRwQIUCNKAm
        md8PrdbPU11k5p0ZddImJpdkBr8MYiSTJxwqYAAXxYvuk85zWQvlyrx19zAoZxm2gdVw7yM5tq7/W
        vUeF5hvg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jeckK-0003rl-ET; Fri, 29 May 2020 11:00:16 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 775AD3011FF;
        Fri, 29 May 2020 13:00:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6B2D320BD4F38; Fri, 29 May 2020 13:00:12 +0200 (CEST)
Date:   Fri, 29 May 2020 13:00:12 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     john mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, rdunlap@infradead.org,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: Re: [RFC PATCH v5 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200529110012.GJ706495@hirez.programming.kicks-ass.net>
References: <20200514092637.15684-1-John.Mathew@unikie.com>
 <20200514092637.15684-3-John.Mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514092637.15684-3-John.Mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 12:26:36PM +0300, john mathew wrote:

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

I find these attached headers really hard to read. And what's with the
** stuff ?

Other files in this same patch use a different style:

Header
------
test goes here,

Which I find a lot more readable. Use it here too?

> +Scale CPU capacity mechanism for CFS so it knows how much CPU capacity is left
> +for its use after higher priority sched classes (RT, DL), IRQs and
> +'Thermal Pressure' have reduced the 'original' CPU capacity.
> +Thermal pressure on a CPU means the maximum possible capacity is
> +unavailable due to thermal events.
> +
> +** Optimizations to NUMA balancing**:
     ^ iconsistent spacing (although I think it's more readable without
     the ** crap attached).

> +When gathering NUMA statistics, information about whether a core is Idle
> +is also cached. In case of an imbalance, instead of doing a second scan of
> +the node runqueues, the idle core is used as the migration target. When
> +doing so multiple tasks can attempt to select an idle CPU but fail, because
> +a NUMA balance is active on that CPU. In this case an alternative idle CPU
> +scanned. Another optimization is to terminate the search for swap candidate
> +when a reasonable one is found instead of searching all the CPUs on the
> +target domain.

^^ that makes no sense to me. That's very much not what numa balancing
is about.

> +
> +**Asymmetric CPU capacity wakeup scan**:
> +Previous assumption that CPU capacities within an SD_SHARE_PKG_RESOURCES
> +domain (sd_llc) are homogeneous didn't hold for newer generations of big.LITTLE
> +systems (DynamIQ) which can accommodate CPUs of different compute capacity
> +within a single LLC domain. A new idle sibling helper function was added
> +which took CPU capacity into account. The policy is to pick the first idle
> +CPU which is big enough for the task (task_util * margin < cpu_capacity).
> +If no idle CPU is big enough, the idle CPU with the highest capacity is
> +picked.
> +
> +**Optimized idle core selection**:
> +Skipped looping through all the threads of a core to evaluate if the
> +core is idle or not. If a thread of a core is not idle, evaluation of
> +other threads of the core can be skipped.
> +
> +**Load balance aggressively for SCHED_IDLE CPUs**:
> +Newly-woken task is preferred to be  enqueued on a SCHED_IDLE CPU instead
> +of other busy or idle CPUs. Also load balancer is made to migrate tasks more
> +aggressively to a SCHED_IDLE CPU. Fair scheduler now does the next
> +load balance soon after the last non-SCHED_IDLE task is dequeued from a
> +runqueue, i.e. making the CPU SCHED_IDLE. Also the the busy_factor
> +used with the balance interval to prevent frequent load balancing
> +is ignored for such CPU's.
> +
> +**Load balancing algorithm Reworked**:
> +Some heuristics in the load balancing algorithm became meaningless because
> +of the rework of the scheduler's metrics like the introduction of PELT.
> +Those heuristics were removed. The new load balancing algorithm also fixes
> +several pending wrong tasks placement
> +
> + * the 1 task per CPU case with asymmetric system
> + * the case of CFS task preempted by other class
> + * the case of tasks not evenly spread on groups with spare capacity
> +
> +Also the load balance decisions have been consolidated in the 3 separate
> +functions.
> +* update_sd_pick_busiest() select the busiest sched_group.
> +* find_busiest_group() checks if there is an imbalance between local and
> +busiest group.
> +* calculate_imbalance() decides what have to be moved.

This all reads like a changelog; why do we care about the old stuff?
That is, rephrase it to describe the current situation.

> +
> +**Energy-aware wake-ups speeded up**:
> +Algorithmic complexity of the EAS was reduced from O(n^2) to O(n).
> +Previous algorithm resulted in prohibitively high wake-up latencies on
> +systems with complex energy models, such as systems with per-CPU DVFS.
> +The EAS wake-up path was re-factored to compute the energy 'delta' on a
> +per-performance domain basis, rather than the whole system.

Idem; describe what EAS does and how. Nobody cares about what it once
might have been.

> +**Selection of an energy-efficient CPU on task wake-up**:
> +An Energy efficient CPU is found by estimating the impact on system-level
> +active energy resulting from the placement of the task on the CPU with the
> +highest spare capacity in each performance domain. Energy Model (EM) is
> +used for this. This strategy spreads tasks in a performance domain and avoids overly
> +aggressive task packing. The best CPU energy-wise is then selected if it
> +saves a large enough amount of energy with respect to prev_cpu.

That's EAS, not a separate thing.

> +
> +**Consider misfit tasks when load-balancing**:
> +A task which ends up on a CPU which doesn't suit its compute demand is
> +identified as a misfit task in asymmetric CPU capacity systems. These
> +'misfit' tasks are migrated to CPUs with higher compute capacity to ensure
> +better throughput. A new group_type: group_misfit_task is added and indicates this
> +scenario. Tweaks to the load-balance code are done to make the migrations
> +happen. Misfit balancing is done between a source group of lower per-CPU
> +capacity and destination group of higher compute capacity. Otherwise, misfit
> +balancing is ignored.

That's with the assymetric capacity thing, weird to be separate.

> +
> +
> +**Make schedstats a runtime tunable that is disabled by default**:
> +A kernel command-line and sysctl tunable was added to enable or disable
> +schedstats on demand (when it's built in). It is disabled by default.
> +The benefits are dependent on how scheduler-intensive the workload is.

So while I like the idea of an overview; this isn't one. An overview is
where we list current features, and explain (in short) why and what.

> +
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 9bdccea74af9..f311abe5b711 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -17,6 +17,8 @@ specific implementation differences.
>      :maxdepth: 2
>  
>      overview
> +    sched-data-structs
> +    cfs-overview
>      sched-design-CFS
>      sched-features
>      arch-specific
> diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
> index aee16feefc61..7536bec6afce 100644
> --- a/Documentation/scheduler/overview.rst
> +++ b/Documentation/scheduler/overview.rst
> @@ -3,3 +3,291 @@
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

indent the bullets at least one space, like:

 * share CPU cores...
 * pick ..

Write it like you want to read this as a text document. Ignore all that
RST bullshit.

Also, your terminology is ambiguous, what is a core?

> +The scheduler attempts to be responsive for I/O bound processes and efficient
> +for CPU bound processes. The scheduler also applies different scheduling
> +policies for real time and normal processes based on their respective
> +priorities.


> Higher priorities in the kernel have a numerical smaller
> +value. Real time priorities range from 1 (highest) – 99 whereas normal
> +priorities range from 100 – 139 (lowest).

The whole priorities thing is a mess; and you've missed some of it. -1
is actually the highest (static) priority. But even that doesn't
adequately describe things, since we have a dynamic priority scheduling
class these days.

Most everything that looks at the static priority of tasks these days;
and doesn't:

 - use it to distinguish classes
 - is the RR/FIFO static priority scheduler

is doing it wrong. Yes we have heaps of legacy, but it's not a main
feature anymore. Slowly but surely the ->prio field becomes less and
less relevant.

The fair class uses the static priority field to encode the nice level,
but is nice a priority? I think not.

> Scheduler implements many scheduling

1, 2, many, right? ;-) _5_ is the number: stop, deadline, rt, fair,
idle.

> +classes which encapsulate a particular scheduling policy. Each scheduling
> +policy implements scheduler handling of tasks that belong to a particular
> +priority. 

policy enumeration:

SCHED_DEADLINE goes here..

> SCHED_FIFO and SCHED_RR policies handle real time priorities tasks

They're both a static priority scheduling class. They're the only ones
for which the term priority actually has a sane meaning.

> +while SCHED_NORMAL and SCHED_BATCH policies handle tasks with normal priorities.

What's an abnormal priority? Both these are weighted proportionally fair
and encode the weight, as nice value, in the prio field, in a range not
overlapping the static prio range. But that doesn't make it a priority.

> +SCHED_IDLE is also a normal scheduling policy when means its priority can
> +be set between 100 – 139 range too but they are treated as priority 139.

Priority for SCHED_IDLE is meaningless, the only reason it 'has' one is
so that code that looks to do a prio->class mapping works.

> +Their priority doesn't matter since they get minimal weight WEIGHT_IDLEPRI=3.

This.

> +SCHED_DEADLINE policy tasks have negative priorities, reflecting
> +the fact that any of them has higher priority than RT and NORMAL/BATCH tasks.

Tada, you did find the -1!

> +And then there are the maintenance scheduler classes: idle sched class and
> +stop sched class. Idle class doesn't manage any user tasks and so doesn't

Ah, so you do want to treat those too; so perhaps then present it like a
double iteration:

 - stop_class:

 - dl_class:

   * SCHED_DEADLINE:

 - rt_class

   * SCHED_RR / SCHED_FIFO:

 - fair_class:

   * SCHED_NORMAL/SCHED_BATCH:
   * SCHED_IDLE:

 - idle_class:

That's far easier to read than a blob of words.

> +implement a policy. Its idle tasks 'swapper/X' has priority 120 and and aren't
> +visible to user space. Idle tasks are responsible for by putting the CPUs
> +into deep idle states when there is no work to do.

Priority for idle task is irrelevant, if they have a prio it is purely
by accident. Looking at ->prio for idle task would be a stright bug.
The "swapper" name is a historical accident. We do not in fact swap from
it.

> +Stop sched class is also used internally by the kernel doesn't implement any
> +scheduling policy. Stopper tasks 'migration/X' disguise as as a SCHED_FIFO
> +task with priority 139.

Really? I thought we exposed it as a FIFO-99 (userpsace 99, not kernel
99) task. Then again, I haven't actually looked at it recently. The
reason we disguise it is to present a 'known' class to userspace, to
avoid growing the ABI for this.

> Stopper tasks are a mechanism to force a CPU to stop
> +running everything else and perform a specific task. As this is the
> +highest-priority class, it can preempt everything else and nothing ever
> +preempts it. It is used by one CPU to stop another in order to run a specific
> +function, so it is only available on SMP systems. This class is used by the
> +kernel for task migration.



> +
> +
> +Process Management
> +==================
> +
> +Each process in the system is represented by struct task_struct. When a
> +process/thread is created, the kernel allocates a new task_struct for it.
> +The kernel then stores this task_struct in an RCU list. Macro next_task()
> +allows a process to obtain its next task and for_each_process() macro enables
> +traversal of the list.
> +
> +Frequently used fields of the task struct are:
> +
> +*state:* The running state of the task. The possible states are:
> +
> +* TASK_RUNNING: The task is currently running or in a run queue waiting
> +  to run.
> +* TASK_INTERRUPTIBLE: The task is sleeping waiting for some event to occur.
> +  This task can be interrupted by signals. On waking up the task transitions
> +  to TASK_RUNNING.
> +* TASK_UNINTERRUPTIBLE: Similar to TASK_INTERRUPTIBLE but does not wake
> +  up on signals. Needs an explicit wake-up call to be woken up. Contributes
> +  to loadavg.
> +* __TASK_TRACED: Task is being traced by another task like a debugger.
> +* __TASK_STOPPED: Task execution has stopped and not eligible to run.
> +  SIGSTOP, SIGTSTP etc causes this state.  The task can be continued by
> +  the signal SIGCONT.
> +* TASK_PARKED: State to support kthread parking/unparking.
> +* TASK_DEAD: If a task dies, then it sets TASK_DEAD in tsk->state and calls
> +  schedule one last time. The schedule call will never return.

return to this task; obviously the system keeps running so it must do
something.

Perhaps its clearer to state that the task will never be ran again.

> +* TASK_WAKEKILL: It works like TASK_UNINTERRUPTIBLE with the bonus that it
> +  can respond to fatal signals.
> +* TASK_WAKING: To handle concurrent waking of the same task for SMP.
> +  Indicates that someone is already waking the task.
> +* TASK_NOLOAD: To be used along with TASK_UNINTERRUPTIBLE to indicate
> +  an idle task which does not contribute to loadavg.
> +* TASK_NEW: Set during fork(), to guarantee that no one will run the task,
> +  a signal or any other wake event cannot wake it up and insert it on
> +  the runqueue.
> +
> +*exit_state* : The exiting state of the task. The possible states are:
> +
> +* EXIT_ZOMBIE: The task is terminated and waiting for parent to collect
> +  the exit information of the task.
> +* EXIT_DEAD: After collecting the exit information the task is put to
> +  this state and removed from the system.
> +
> +*static_prio:* Nice value of a task. The value of this field does
> + not change.  Value ranges from -20 to 19. This value is mapped to nice
> + value and used in the scheduler.
> +
> +*prio:* Dynamic priority of a task. Previously a function of static
> + priority and tasks interactivity. Value not used by CFS scheduler but used
> + by the RT scheduler. Might be boosted by interactivity modifiers. Changes

Again, no point in mentioning things that aren't there. Those can only
serve to confuse.

> + upon fork, setprio syscalls, and whenever the interactivity estimator
> + recalculates.

There is no interactivity estimator.

> +
> +*normal_prio:* Expected priority of a task. The value of static_prio
> + and normal_prio are the same for non-real-time processes. For real time
> + processes value of prio is used.
> +
> +*rt_priority:* Field used by real time tasks. Real time tasks are
> + prioritized based on this value.
> +
> +*sched_class:* Pointer to sched_class CFS structure.
> +
> +*sched_entity:* Pointer to sched_entity CFS structure.
> +
> +*policy:* Value for scheduling policy. The possible values are:
> +
> +* SCHED_NORMAL: Regular tasks use this policy.
> +* SCHED_BATCH: Tasks which need to run longer without preemption
> +  use this policy. Suitable for batch jobs.
> +* SCHED_IDLE: Policy used by background tasks.
> +* SCHED_FIFO & SCHED_RR: These policies for real time tasks. Handled by
> +  real time scheduler.
> +* SCHED_DEADLINE: Tasks which are activated on a periodic or sporadic fashion
> +  use this policy. This policy implements the Earliest Deadline First (EDF)
> +  scheduling algorithm. This policy is explained in detail in the
> +  :doc:`sched-deadline` documentation.
> +
> +*nr_cpus_allowed:* Bit field containing tasks affinity towards a set of
> + CPU cores.  Set using sched_setaffinity() system call.

nr_cpus_allowed it not a bitfield, it is the hamming weight of a
bitmap. The actual bitmap is found through cpus_ptr.

> +
> +New processes are created using the fork() system call which is described
> +at manpage :manpage:`FORK(2)` or the clone system call described at
> +:manpage:`CLONE(2)`.



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
> +the system call pthread_create described at :manpage:`PTHREAD_CREATE(3)`
> +POSIX threads creation is described at :manpage:`PTHREADS(7)`
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
> +that the scheduler should be invoked as soon as possible because another
> +process deserves to run.

Perhaps add a warning that direct manipulation of TIF_NEED_RESCHED is
unwise. You make it sound like a simple thing -- which I understand from
the PoV of explaining how it sort-of works, but might give people the
wrong impression.

> +
> +Following are some places that notify the kernel to schedule:
> +
> +* scheduler_tick()
> +
> +* Running task goes to sleep state : Right before a task goes to sleep,
> +  schedule() will be called to pick the next task to run and the change
> +  its state to either TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE. For
> +  instance, prepare_to_wait() is one of the functions that makes the
> +  task go to the sleep state.
> +
> +* try_to_wake_up()
> +
> +* yield()

it is likely that every single user of yield() is a bug.

> +* wait_event()
> +
> +* cond_resched() : It gives the scheduler a chance to run a higher-priority
> +  process.
> +
> +* cond_resched_lock() : If a reschedule is pending, drop the given lock,
> +  call schedule, and on return reacquire the lock.

voluntary preemption points

> +* do_task_dead()
> +
> +* preempt_schedule() : The function checks whether local interrupts are
> +  enabled and the preempt_count field of current is zero; if both
> +  conditions are true, it invokes schedule() to select another process
> +  to run.
> +
> +* preempt_schedule_irq()
> +
> +Calling functions mentioned above leads to a call to __schedule(). Note
> +that preemption must be disabled before it is called and enabled after
> +the call using preempt_disable and preempt_enable functions family.

It might be less confusing if you classify those:

 - blocking operations:

   * mutex_lock() / wait_event() / etc..

 - co-operative / voluntary preemption:

   * cond_resched*()
   * yield()
   * preempt_enable()

 - involuntary preemption:

   * scheduler_tick()
   * wake_up_process()

The blocking oeprations will suspend the current task and directly call
into the scheduler to find something else to do.

The co-operative/voluntary crud will allow another task to run at that
point (subject to preemption model).

The involuntary preemption things will mark TIF_NEED_RESCHED and wait
for action (again depending on preemption model).

> +
> +The steps during invocation are:
> +--------------------------------
> +1. Disable preemption to avoid another task preempting the scheduling
> +   thread itself.
> +2. Retrieve the runqueue of current processor and its lock is obtained to
> +   allow only one thread to modify the runqueue at a time.
> +3. The state of the previously executed task when the schedule()
> +   was called is examined. If it is not runnable and has not been
> +   preempted in kernel mode, it is removed from the runqueue. If the
> +   previous task has non-blocked pending signals, its state is set to
> +   TASK_RUNNING and left in the runqueue.
> +4. Scheduler classes are iterated and the corresponding class hook to
> +   pick the next suitable task to be scheduled on the CPU is called.
> +   Since most tasks are handled by the sched_fair class, a shortcut to this
> +   class is implemented in the beginning of the function.
> +5. TIF_NEED_RESCHED and architecture specific need_resched flags are cleared.
> +6. If the scheduler class picks a different task from what was running
> +   before, a context switch is performed by calling context_switch().
> +   Internally, context_switch() switches to the new task's memory map and
> +   swaps the register state and stack. If scheduler class picked the same
> +   task as the previous task, no task switch is performed and the current
> +   task keeps running.
> +7. Balance callback list is processed. Each scheduling class can migrate tasks
> +   between CPUs to balance load. These load balancing operations are queued
> +   on a Balance callback list which get executed when balance_callback() is
> +   called.
> +8. The runqueue is unlocked and preemption is re-enabled. In case
> +   preemption was requested during the time in which it was disabled,
> +   schedule() is run again right away.
> +
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
> +Scheduler provides trace events tracing all major events of the scheduler.
> +The trace events are defined in ::
> +
> +  include/trace/events/sched.h
> +
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
> diff --git a/Documentation/scheduler/sched-cas.rst b/Documentation/scheduler/sched-cas.rst
> new file mode 100644
> index 000000000000..fcebc5770803
> --- /dev/null
> +++ b/Documentation/scheduler/sched-cas.rst
> @@ -0,0 +1,92 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=========================
> +Capacity-Aware Scheduling
> +=========================
> +
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
> +subsystem to rebuild sched_domains once the CPUFreq is loaded, which is when
> +a complete view of the capacities of the CPUs (which is a mix of µarch and
> +frequencies) is available.
> +
> +Asymmetric CPU capacity information is used in
> +
> +* Energy Aware Scheduling: The scheduler is  able to predict the impact of
> +  its decisions on the energy consumed by CPUs. Described in :doc:`sched-energy` .
> +* Optimized task wakeup load balancing by finding idle CPU with enough capacity.
> +
> +The different scheduler classes asymmetric use the Asymmetric CPU capacity
> +information differently.
> +
> +CFS Capacity Awareness
> +======================
> +
> +Used to identify misfit tasks:
> +A load intensive task on a CPU which doesn't meet its compute demand is
> +identified as a misfit task. 'Misfit' tasks are migrated to CPUs with
> +higher compute capacity to ensure better throughput. CFS frequently updates
> +the misfit status of the current task by comparing its utilization vs the
> +CPU capacity using task_fits_capacity(). If the utilization is more than the
> +CPU capacity the calculated misfit load is updated to the runqueue
> +rq->misfit_task_load. This misfit load is then checked by the load
> +balancing operations to migrate the task to a CPU of higher capacity.
> +
> +Modified wakeup logic to support DynamIQ systems:
> +When the scheduler class calls select_task_rq_fair to select a runqueue for
> +a waking task, load balancing is performed by selecting the idlest CPU in
> +the idlest group, or under certain conditions an idle sibling CPU if the
> +domain has SD_WAKE_AFFINE set. In DynamIQ systems Last Level Cache (LLC)
> +domain of a CPU spans all CPUs in the system. This may include CPU's of
> +different capacities. So in select_idle_sibling() an idle sibling is picked
> +based on CPU capacity for asymmetric CPU capacity systems and for symmetric
> +systems use LLC domain is used. The policy is to pick the first idle CPU
> +which is big enough for the task (task_util * margin < cpu_capacity).
> +If no idle CPU is big enough, the idle CPU with the highest capacity is
> +picked. For asymmetric CPU capacity systems select_idle_sibling() operates
> +on the sd_asym_cpucapacity sched_domain pointer, which is guaranteed to span
> +all known CPU capacities in the system. This works for both "legacy"
> +big.LITTLE (LITTLEs & bigs split at MC, joined at DIE) and for newer
> +DynamIQ systems (e.g. LITTLEs and bigs in the same MC domain).
> +
> +
> +RT Capacity Awareness
> +=====================
> +
> +Since RT tasks doesn't have a per task utilization signal RT tasks uses uclamp
> +to guarantee a minimum performance point. Utilization clamping is a mechanism
> +which allows to "clamp" (i.e. filter) the utilization generated by RT and
> +FAIR tasks within a range defined by user-space. It exposes to user-space a
> +new set of per-task attributes the scheduler can use as hints about the
> +expected/required utilization for a task. RT is made capacity aware
> +by ensuring that the capacity of the CPU is >= uclamp_min value. This check
> +is done in the rt_task_fits_capacity()
> +
> +DL Capacity Awareness
> +=====================
> +
> +TBD
> +
> +
> +
> +
> +
> +
> +
> +
> +
> diff --git a/Documentation/scheduler/sched-data-structs.rst b/Documentation/scheduler/sched-data-structs.rst
> new file mode 100644
> index 000000000000..a16408676b71
> --- /dev/null
> +++ b/Documentation/scheduler/sched-data-structs.rst
> @@ -0,0 +1,182 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=========================
> +Scheduler Data Structures
> +=========================
> +
> +The main parts of the Linux scheduler are:
> +
> +Runqueue
> +~~~~~~~~
> +
> +:c:type:`struct rq <rq>` is the central data structure of process

I so hate that rst crap; John, can't we teach the thing that anything
called 'struct foo' or 'foo_t' is in fact a C type, just like we did
with foo() being a function?

> +scheduling. It keeps track of tasks that are in a runnable state assigned
> +for a particular processor. Each CPU has its own run queue and stored in a
> +per CPU array::
> +
> +    DEFINE_PER_CPU(struct rq, runqueues);
> +
> +Access to the queue requires locking and lock acquire operations must be
> +ordered by ascending runqueue. Macros for accessing and locking the runqueue
> +are provided in::
> +
> +    kernel/sched/sched.h
> +
> +The runqueue contains scheduling class specific queues and several scheduling
> +statistics.
> +
> +Scheduling entity
> +~~~~~~~~~~~~~~~~~
> +Scheduler uses scheduling entities which contain sufficient information to
> +actually accomplish the scheduling job of a task or a task-group. The
> +scheduling entity may be a group of tasks or a single task. Every task is
> +associated with a sched_entity structure. CFS adds support for nesting of
> +tasks and task groups. Each scheduling entity may be run from its parents
> +runqueue. The scheduler traverses the sched_entity hierarchy to pick the
> +next task to run on the CPU. The entity gets picked up from the cfs_rq on
> +which it is queued and its time slice is divided among all the tasks on its my_q.
> +
> +Scheduler classes
> +~~~~~~~~~~~~~~~~~
> +It is an extensible hierarchy of scheduler modules. The modules encapsulate
> +scheduling policy details. They are called from the core code which is
> +independent. Scheduling classes are implemented through the sched_class
> +structure. dl_sched_class for deadline scheduler, fair_sched_class for CFS
> +and rt_sched_class for RT are implementations of this class.

wrong order; also perhaps a reference to the earlier exposition of the
same.

> +The important methods of scheduler class are:
> +
> +enqueue_task and dequeue_task

You started an enumeration with ':' above, but have no bullet here,
perhaps:

 - sched_class::enqueue_task()

or somesuch?

> +    These functions are used to put and remove tasks from the runqueue
> +    respectively to change a property of a task. This is referred to as
> +    change pattern.  Change is defined as the following sequence of calls::
> +
> +         * dequeue_task()
> +         * put_prev_task()
> +         * change a property
> +         * enqueue_task()
> +         * set_next_task()
> +
> +    The enqueue_task function takes the runqueue, the task which needs to
> +    be enqueued/dequeued and a bit mask of flags as parameters. The main
> +    purpose of the flags is to describe why the enqueue or dequeue is being
> +    called. The different flags used are described in ::
> +
> +        kernel/sched/sched.h
> +
> +    Some places where the enqueue_task and dequeue_task are called for
> +    changing task properties are
> +
> +    * When migrating a task from one CPU's runqueue to another.
> +    * When changing a tasks CPU affinity.
> +    * When changing the priority of a task.
> +    * When changing the nice value of the task.
> +    * When changing the scheduling policy and/or RT priority of a thread.
> +
> +pick_next_task
> +    Called by the scheduler to pick the next best task to run. The scheduler
> +    iterates through the corresponding functions of the scheduler classes
> +    in priority order to pick up the next best task to run. Since tasks
> +    belonging to the idle class and fair class are frequent, the scheduler
> +    optimizes the picking of next task to call the pick_next_task_fair()
> +    if the previous task was of the similar scheduling class.

implies set_next_task() having been called on the task returned.

(the core-sched patches have some variants here, just in case you're
curious)

> +
> +put_prev_task
> +    Called by the scheduler when a running task is being taken off a CPU.
> +    The behavior of this function depends on individual scheduling classes.
> +    In CFS class this function is used to put the currently running task back
> +    into the CFS RB tree. When a task is running it is dequeued from the tree.
> +    This is to prevent redundant enqueue's and dequeue's for updating its
> +    vruntime. vruntime of tasks on the tree needs to be updated by update_curr()
> +    to keep the tree in sync. In SCHED_DEADLINE and RT classes additional tree
> +    is maintained to push tasks from the current CPU to another CPU where the
> +    task can preempt and start executing. Task will be added to this queue
> +    if it is present on the scheduling class rq and the task has affinity
> +    to more than one CPU.
> +
> +set_next_task
> +    Pairs with the put_prev_task(), this function is called when the next
> +    task is set to run on the CPU. This function is called in all the places
> +    where put_prev_task is called to complete the 'change pattern'. In case
> +    of CFS scheduling class, it will set current scheduling entity to the
> +    picked task and accounts bandwidth usage on the cfs_rq. In addition it
> +    will also remove the current entity from the CFS runqueue for the vruntime
> +    update optimization, opposite to what was done in put_prev_task.
> +    For the SCHED_DEADLINE and RT classes it will remove the task from the
> +    tree of pushable tasks trigger the balance callback to push another task
> +    which is non running on the current CPU for execution on another CPU.
> +
> +    * dequeue the picked task from the tree of pushable tasks.
> +    * update the load average in case the previous task belonged to another
> +      class.
> +    * queues the function to push tasks from current runqueue to other CPUs
> +      which can preempt and start execution. Balance callback list is used.
> +
> +task_tick
> +    Called from scheduler_tick(), hrtick() and sched_tick_remote() to update
> +    the current task statistics and load averages. Also restarting the high
> +    resolution tick timer is done if high resolution timers are enabled.
> +    scheduler_tick() runs at 1/HZ and is called from the timer interrupt
> +    handler of the Kernel internal timers.
> +    hrtick() is called from high resolution timers to deliver an accurate
> +    preemption tick as the regular scheduler tick that runs at 1/HZ can be
> +    too coarse when nice levels are used.
> +    sched_tick_remote() gets called by the offloaded residual 1Hz scheduler
> +    tick. In order to reduce interruptions to bare metal tasks, it is possible
> +    to outsource these scheduler ticks to the global workqueue so that a
> +    housekeeping CPU handles those remotely.
> +
> +select_task_rq
> +    Called by scheduler to get the CPU to assign a task to and migrating
> +    tasks between CPUs. Flags describe the reason the function was called.
> +    Called by try_to_wake_up() with SD_BALANCE_WAKE flag which wakes up a
> +    sleeping task.
> +    Called by wake_up_new_task() with SD_BALANCE_FORK flag which wakes up a
> +    newly forked task.
> +    Called by sched_exec() with SD_BALANCE_EXEC which is called from execv
> +    syscall.
> +    SCHED_DEADLINE class decides the CPU on which the task should be woken
> +    up based on the deadline. RT class decides based on the RT priority. Fair
> +    scheduling class balances load by selecting the idlest CPU in the
> +    idlest group, or under certain conditions an idle sibling CPU if the
> +    domain has SD_WAKE_AFFINE set.
> +
> +balance
> +    Called by pick_next_task() from scheduler to enable scheduling classes
> +    to pull tasks from runqueues of other CPUs for balancing task execution
> +    between the CPUs.
> +
> +task_fork
> +    Called from sched_fork() of scheduler which assigns a task to a CPU.
> +    Fair scheduling class updates runqueue clock, runtime statistics and
> +    vruntime for the scheduling entity.
> +
> +yield_task
> +    Called from SYSCALL sched_yield to yield the CPU to other tasks.
> +    SCHED_DEADLINE class forces the runtime of the task to zero using a special
> +    flag and dequeues the task from its trees. RT class requeues the task
> +    entities to the end of the run list. Fair scheduling class implements
> +    the buddy mechanism. This allows skipping onto the next highest priority
> +    scheduling entity at every level in the CFS tree, unless doing so would
> +    introduce gross unfairness in CPU time distribution.
> +
> +check_preempt_curr
> +    Check whether the task that woke up should preempt the currently
> +    running task. Called by scheduler,
> +
> +    * when moving queued task to new runqueue
> +    * ttwu()
> +    * when waking up newly created task for the first time.
> +
> +    SCHED_DEADLINE class compares the deadlines of the tasks and calls
> +    scheduler function resched_curr() if the preemption is needed. In case
> +    the deadlines are equal, migratability of the tasks is used a criteria
> +    for preemption.
> +    RT class behaves the same except it uses RT priority for comparison.
> +    Fair class sets the buddy hints before calling resched_curr() to preempt.
> +
> +Scheduler sets the scheduler class for each task based on its priority.
> +Tasks assigned with SCHED_NORMAL, SCHED_IDLE and SCHED_BATCH call
> +fair_sched_class hooks and tasks assigned with SCHED_RR and
> +SCHED_FIFO call rt_sched_class hooks. Tasks assigned with SCHED_DEADLINE
> +policy calls dl_sched_class hooks.

Nice!

> diff --git a/Documentation/scheduler/sched-features.rst b/Documentation/scheduler/sched-features.rst
> index 1afbd9cc8d52..e576c7d9e556 100644
> --- a/Documentation/scheduler/sched-features.rst
> +++ b/Documentation/scheduler/sched-features.rst
> @@ -17,4 +17,5 @@ Scheduler Features
>     sched-energy
>     sched-nice-design
>     sched-rt-group
> +   sched-cas
>     completion
> diff --git a/Documentation/scheduler/scheduler-api.rst b/Documentation/scheduler/scheduler-api.rst
> new file mode 100644
> index 000000000000..1fc6bd4c2908
> --- /dev/null
> +++ b/Documentation/scheduler/scheduler-api.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=============================
> +Scheduler related functions
> +=============================
> +
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: __schedule
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: scheduler_tick
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: try_to_wake_up
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: do_task_dead
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: preempt_schedule_irq
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: prepare_task_switch
> +
> +.. kernel-doc:: kernel/sched/core.c
> +	:functions: finish_task_switch
> +
> +.. kernel-doc:: kernel/sched/sched.h
> +	:functions: rq
> +
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9a2fbf98fd6f..b349ed9b4d92 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3576,9 +3576,13 @@ void arch_set_thermal_pressure(struct cpumask *cpus,
>  		WRITE_ONCE(per_cpu(thermal_pressure, cpu), th_pressure);
>  }
>  
> -/*
> +/**
> + * scheduler_tick - sched tick timer handler
> + *
>   * This function gets called by the timer code, with HZ frequency.
>   * We call it with interrupts disabled.
> + *
> + * Return: 0.
>   */
>  void scheduler_tick(void)
>  {
> @@ -3959,8 +3963,10 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>  	BUG();
>  }
>  
> -/*
> - * __schedule() is the main scheduler function.
> +/**
> + * __schedule() - the main scheduler function.
> + *
> + * @preempt: preemption enabled/disabled
>   *
>   * The main means of driving the scheduler and thus entering this function are:
>   *
> @@ -4089,6 +4095,12 @@ static void __sched notrace __schedule(bool preempt)
>  	balance_callback(rq);
>  }
>  
> +/**
> + * do_task_dead - handle task exit
> + *
> + * Changes the the task state to TASK_DEAD and calls
> + * schedule to pick next task to run.
> + */
>  void __noreturn do_task_dead(void)
>  {
>  	/* Causes final put_task_struct in finish_task_switch(): */
> @@ -4320,7 +4332,8 @@ EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
>  
>  #endif /* CONFIG_PREEMPTION */
>  
> -/*
> +/**
> + * preempt_schedule_irq - schedule from irq context
>   * This is the entry point to schedule() from kernel preemption
>   * off of irq context.
>   * Note, that this is called and return with irqs disabled. This will
> @@ -5618,6 +5631,13 @@ SYSCALL_DEFINE0(sched_yield)
>  }
>  
>  #ifndef CONFIG_PREEMPTION
> +/**
> + * _cond_resched - explicit rescheduling
> + *
> + * gives the scheduler a chance to run a higher-priority process
> + *
> + * Return: 1 if reschedule was done, 0 if reschedule not done.
> + */

This isn't a general API and should not have the kerneldoc on. Put it on
cond_resched*() in linux/sched.h instead.

>  int __sched _cond_resched(void)
>  {
>  	if (should_resched(0)) {
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index db3a57675ccf..21f2953b72c7 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -865,12 +865,175 @@ struct uclamp_rq {
>  };
>  #endif /* CONFIG_UCLAMP_TASK */
>  
> -/*
> - * This is the main, per-CPU runqueue data structure.
> +/**
> + * struct rq - This is the main, per-CPU runqueue data structure.
>   *
>   * Locking rule: those places that want to lock multiple runqueues
>   * (such as the load balancing or the thread migration code), lock
>   * acquire operations must be ordered by ascending &runqueue.
> + *
> + * @lock:
> + *	lock to be acquired while modifying the runqueue
> + * @nr_running:
> + *	number of runnable tasks on this queue
> + * @nr_numa_running:
> + *	number of tasks running that care about their placement
> + * @nr_preferred_running:
> + *	number of tasks that are optimally NUMA placed
> + * @numa_migrate_on:
> + *	per run-queue variable to check if NUMA-balance is
> + *	active on the run-queue
> + * @last_blocked_load_update_tick:
> + *	tick stamp for decay of blocked load
> + * @has_blocked_load:
> + *	idle CPU has blocked load
> + * @nohz_tick_stopped:
> + *	CPU is going idle with tick stopped
> + * @nohz_flags:
> + *	flags indicating NOHZ idle balancer actions
> + * @nr_load_updates:
> + *	unused
> + * @nr_switches:
> + *	number of context switches
> + * @uclamp:
> + *	utilization clamp values based on CPU's RUNNABLE tasks
> + * @uclamp_flags:
> + *	flags for uclamp actions, currently one flag for idle.
> + * @cfs:
> + *	fair scheduling class runqueue
> + * @rt:
> + *	rt scheduling class runqueue
> + * @dl:
> + *	dl scheduing class runqueue
> + * @leaf_cfs_rq_list:
> + *	list of leaf cfs_rq on this CPU
> + * @tmp_alone_branch:
> + *	reference to add child before its parent in leaf_cfs_rq_list
> + * @nr_uninterruptible:
> + *	global counter where the total sum over all CPUs matters. A task
> + *      can increase this counter on one CPU and if it got migrated
> + *	afterwards it may decrease it on another CPU. Always updated under
> + *	the runqueue lock
> + * @curr:
> + *	points to the currently running task of this rq.
> + * @idle:
> + *	points to the idle task of this rq
> + * @stop:
> + *	points to the stop task of this rq
> + * @next_balance:
> + *	shortest next balance before updating nohz.next_balance
> + * @prev_mm:
> + *	real address space of the previous task
> + * @clock_update_flags:
> + *	RQCF clock_update_flags bits
> + * @clock:
> + *	sched_clock() value for the queue
> + * @clock_task:
> + *	clock value minus irq handling time
> + * @clock_pelt:
> + *	clock which scales with current capacity when something is
> + *	running on rq and synchronizes with clock_task when rq is idle
> + * @lost_idle_time:
> + *	idle time lost when utilization of a rq has reached the
> + *	maximum value
> + * @nr_iowait:
> + *	account the idle time that we could have spend running if it
> + *	were not for IO
> + * @membarrier_state:
> + *	copy of membarrier_state from the mm_struct
> + * @rd:
> + *	root domain, each exclusive cpuset essentially defines an island
> + *	domain by fully partitioning the member CPUs from any other cpuset
> + * @sd:
> + *	a domain heirarchy of CPU groups to balance process load among them
> + * @cpu_capacity:
> + *	information about CPUs heterogeneity used for CPU performance
> + *	scaling
> + * @cpu_capacity_orig:
> + *	original capacity of a CPU before being altered by
> + *	rt tasks and/or IRQ
> + * @balance_callback:
> + *	queue to hold load balancing push and pull operations
> + * @idle_balance:
> + *	flag to do the nohz idle load balance
> + * @misfit_task_load:
> + *	set whenever the current running task has a utilization
> + *	greater than 80% of rq->cpu_capacity. A non-zero value
> + *	in this field enables misfit load balancing
> + * @active_balance:
> + *	synchronizes accesses to ->active_balance_work
> + * @push_cpu:
> + *	idle cpu to push the running task on to during active load
> + *	balancing.
> + * @active_balance_work:
> + *	callback scheduled to run on one or multiple cpus
> + *	with maximum priority monopolozing those cpus.
> + * @cpu:
> + *	CPU of this runqueue
> + * @online:
> + *	Used by scheduling classes to support CPU hotplug
> + * @cfs_tasks:
> + *	an MRU list used for load balancing, sorted (except
> + *	woken tasks) starting from recently given CPU time tasks
> + *	toward tasks with max wait time in a run-queue
> + * @avg_rt:
> + *	track the utilization of RT tasks for a  more accurate
> + *	view of the utilization of the CPU when overloaded by CFS and
> + *	RT tasks
> + * @avg_dl:
> + *	track the utilization of DL tasks as CFS tasks can be preempted
> + *	by DL tasks and the CFS's utilization might no longer describe
> + *	the real utilization level
> + * @avg_irq:
> + *	track the the utilization of interrupt to give a more accurate
> + *	level of utilization of CPU taking into account the time spent
> + *	under interrupt context when rqs' clock is updated
> + * @avg_thermal:
> + *	tracks thermal pressure which is the reduction in maximum
> + *	possible capacity due to thermal events
> + * @idle_stamp:
> + *	time stamp at which idle load balance started for this rq.
> + *	Used to find the idlest CPU, when multiple idle CPUs are in
> + *	the same state
> + * @avg_idle:
> + *	average idle time for this rq
> + * @max_idle_balance_cost:
> + *	used to determine avg_idle's max value
> + * @prev_irq_time:
> + *	updated to account time consumed when a previous
> + *	update_rq_clock() happened inside a {soft,}irq region
> + * @prev_steal_time:
> + *	to account how much elapsed time was spent in steal
> + * @prev_steal_time_rq:
> + *	for fine granularity task steal time accounting by
> + *	making update_rq_clock() aware of steal time
> + * @calc_load_update:
> + *	sample window for global load-average calculations
> + * @calc_load_active:
> + *	fold any nr_active delta into a global accumulate
> + * @hrtick_csd:
> + *	call_single_data used to set hrtick timer state on a specific CPU
> + * @hrtick_timer:
> + *	HR-timer to deliver an accurate preemption tick
> + * @rq_sched_info:
> + *	runqueue specific latency stats
> + * @rq_cpu_time:
> + *	runqueue specific accumulated per-task cpu runtime
> + * @yld_count:
> + *	runqueue specific sys_sched_yield() stats
> + * @sched_count:
> + *	runqueue specific __schedule() stats
> + * @sched_goidle:
> + *	runqueue specific idle scheduling class stats
> + * @ttwu_count:
> + *	runqueue specific idle ttwu stats , both remote and local
> + * @ttwu_local:
> + *	ttwu count for the CPU of the rq
> + * @wake_list:
> + *	list which stores tasks being woken up remotely by ttwu
> + * @idle_state:
> + *	cpuidle state pointer of the CPU of this rq used to make a
> + *	better decision when balancing tasks
>   */

OMG... I suppose I appreciate the effort, but that's unwieldy and 100%
likely to get bitrotten real quick.

Also, rq really isn't an exported API. So perhaps, if you really feel
the need, expand the comment on some of the fields inside the structure,
but I don't see this as anything other than a giant blob to ignore.

>  struct rq {
>  	/* runqueue lock: */
> @@ -1136,7 +1299,7 @@ static inline u64 rq_clock_task(struct rq *rq)
>  	return rq->clock_task;
>  }
>  
> -/**
> +/*
>   * By default the decay is the default pelt decay period.
>   * The decay shift can change the decay period in
>   * multiples of 32.
> -- 
> 2.17.1
> 
