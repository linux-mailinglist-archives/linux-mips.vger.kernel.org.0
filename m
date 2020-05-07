Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931531C9892
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 20:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgEGSBc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 14:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727092AbgEGSBa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 14:01:30 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A42C05BD43
        for <linux-mips@vger.kernel.org>; Thu,  7 May 2020 11:01:29 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w2so6197230edx.4
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2020 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mh+fo+/pCIXk0O/l6E1VB78wIJGzU3NJZRHfA04eMJU=;
        b=wTb9ky+0+7b9AJmDTVjVJfJAqQr+IyKw24ARASspVya3W2rz1yuRNZTMWgJPNHareO
         WiZaqk01dp75V2r4x609aLaxe3+wp6iBAlRCvjTSt7d3EaZdJnWCFs6AQDEpUfneKgMM
         yQP9EkzC2JG8B3rAQ3QkMZfk5mbdo12WKY+6dRqyynXqZgzrkzE5rt1PeAeS+tfVCW+y
         CGY6xFHx7n2tcxiqExZRBqqlghelwYHGo2yM5xxod/TmXeJv6P1l9YyneAQx2FAQivfl
         KNo8BWXImimaDmmuA1bCma4GVh9P1ER7oT4gd9EYiEd1pAvm6TdnB1uBkLY+a3WNgsQK
         rq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mh+fo+/pCIXk0O/l6E1VB78wIJGzU3NJZRHfA04eMJU=;
        b=dQRVR6Mm91KpedGCh0e3dB5eo6bzNj8JRUWcTNdiSv56h+6XPdIDQONhlGzrkSHoIJ
         q9B28/TMI7utXnUlKFtPXx/3M9i8fYQZ9o3FsCoZ1begBs+oIQ1voQBtDhxBUfMbHdyO
         v4/y87Iw7zKqFnlxWaZ1ZACMR0+8DitxGNRNZj3VQ+bYwcBAde2WLVmYy3XYElPnziYP
         NJBNPS9VXsdnOAceRIYC02R49vQytPxraPLafswN4ntXem0CpZJ+gWPq6AjpnZ+C81e4
         XbYGSruDgf1of9iSaRYKrQ4NRMa7zqP1td5GMWcNU99cRImgIreOkBnEJEIv2upWWM/W
         jQhQ==
X-Gm-Message-State: AGi0PuYbdeS0TEoT9FbzLJhI5+ZruBJjUp4d06sWFrQoIlmiLiptdA7e
        IjFVbJXIHxCRX4JrTkfT25mo9iotVqYaP+EViUWWtg==
X-Google-Smtp-Source: APiQypKaX6pWIFsawf6tPrJI7kG6s/2Lm6R8NN1FWtHoBcxJyAfEkn7ikq9vJPeNx94n0StgY4nubi2CNbajuL98hUQ=
X-Received: by 2002:aa7:ce0f:: with SMTP id d15mr12549684edv.290.1588874487290;
 Thu, 07 May 2020 11:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200506143931.23387-1-John.Mathew@partner.bmw.de>
 <20200506143931.23387-3-John.Mathew@partner.bmw.de> <004564a4-1d43-95c0-096d-7a2a823db5a3@infradead.org>
In-Reply-To: <004564a4-1d43-95c0-096d-7a2a823db5a3@infradead.org>
From:   John Mathew <john.mathew@unikie.com>
Date:   Thu, 7 May 2020 21:01:16 +0300
Message-ID: <CAJz2qX=P7b_Yv6yBhaqQmW7bsP0uEscC-mZRON5s30Cbgya7OA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] docs: scheduler: Add scheduler overview documentation
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        dietmar.eggemann@arm.com, rostedt@goodmis.org,
        Benjamin Segall <bsegall@google.com>, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>, willy@infradead.org,
        valentin.schneider@arm.com,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 7, 2020 at 6:41 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 5/6/20 7:39 AM, john mathew wrote:
> > From: John Mathew <john.mathew@unikie.com>
> >
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
> >  Documentation/scheduler/cfs-overview.rst      | 110 +++++++
> >  Documentation/scheduler/index.rst             |   3 +
> >  Documentation/scheduler/overview.rst          | 269 ++++++++++++++++++
> >  .../scheduler/sched-data-structs.rst          | 253 ++++++++++++++++
> >  Documentation/scheduler/scheduler-api.rst     |  30 ++
> >  kernel/sched/core.c                           |  28 +-
> >  kernel/sched/sched.h                          | 169 ++++++++++-
> >  7 files changed, 855 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/scheduler/cfs-overview.rst
> >  create mode 100644 Documentation/scheduler/sched-data-structs.rst
> >  create mode 100644 Documentation/scheduler/scheduler-api.rst
> >
> > Request review from Valentin Schneider <valentin.schneider@arm.com>
> > for the section describing Scheduler classes in:
> > .../scheduler/sched-data-structs.rst
> >
> > diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/s=
cheduler/cfs-overview.rst
> > new file mode 100644
> > index 000000000000..50d94b9bb60e
> > --- /dev/null
> > +++ b/Documentation/scheduler/cfs-overview.rst
> > @@ -0,0 +1,110 @@
> > +.. SPDX-License-Identifier: GPL-2.0+
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +CFS Overview
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Linux 2.6.23 introduced a modular scheduler core and a Completely Fair
> > +Scheduler (CFS) implemented as a scheduling module. A brief overview o=
f the
> > +CFS design is provided in :doc:`sched-design-CFS`
> > +
> > +In addition there have been many improvements to the CFS, a few of whi=
ch are
> > +
> > +**Thermal Pressure**:
> > +cpu_capacity initially reflects the maximum possible capacity of a CPU=
.
> > +Thermal pressure on a CPU means this maximum possible capacity is
> > +unavailable due to thermal events. Average thermal pressure for a CPU
> > +is now subtracted from its maximum possible capacity so that cpu_capac=
ity
> > +reflects the remaining maximum capacity.
> > +
> > +**Use Idle CPU for NUMA balancing**:
> > +Idle CPU is used as a migration target instead of comparing tasks.
> > +Information on an idle core is cached while gathering statistics
> > +and this is used to avoid a second scan of the node runqueues if load =
is
> > +not imbalanced. Preference is given to an idle core rather than an
> > +idle SMT sibling to avoid packing HT siblings due to linearly scanning
> > +the node cpumask.  Multiple tasks can attempt to select and idle CPU b=
ut
> > +fail, in this case instead of failing, an alternative idle CPU scanned=
.
>
> I'm having problems parsing that last sentence above.
Fixed as follows in v3:
Multiple tasks can attempt to select an idle CPU but
fail because a NUMA balance is active on that CPU, in this case instead of
failing, an alternative idle CPU scanned.
>
> > +
> > +**Asymmetric CPU capacity wakeup scan**:
> > +Previous assumption that CPU capacities within an SD_SHARE_PKG_RESOURC=
ES
> > +domain (sd_llc) are homogeneous didn't hold for newer generations of b=
ig.LITTLE
> > +systems (DynamIQ) which can accommodate CPUs of different compute capa=
city
> > +within a single LLC domain. A new idle sibling helper function was add=
ed
> > +which took CPU capacity in to account. The policy is to pick the first=
 idle
>
>                            into
Fixed in v3.
>
> > +CPU which is big enough for the task (task_util * margin < cpu_capacit=
y).
>
> why not <=3D ?
This is how it is implemented in fair.c
/*
* The margin used when comparing utilization with CPU capacity.
*
* (default: ~20%)
*/
#define fits_capacity(cap, max) ((cap) * 1280 < (max) * 1024)
>
> > +If no idle CPU is big enough, the idle CPU with the highest capacity w=
as
>
> s/was/is/
Fixed in v3.
>
> > +picked.
> > +
> > +**Optimized idle core selection**:
> > +Previously all threads of a core were looped through to evaluate if th=
e
> > +core is idle or not. This was unnecessary. If a thread of a core is no=
t
> > +idle, skip evaluating other threads of a core. Also while clearing the
> > +cpumask, bits of all CPUs of a core can be cleared in one-shot.
>
>                                                       in one shot.
Fixed in v3.
>
> > +
> > +**Load balance aggressively for SCHED_IDLE CPUs**:
> > +The fair scheduler performs periodic load balance on every CPU to chec=
k
> > +if it can pull some tasks from other busy CPUs. The duration of this
> > +periodic load balance is set to scheduler domain's balance_interval an=
d
> > +multiplied by a busy_factor (set to 32 by default) for the busy CPUs. =
This
> > +multiplication is done for busy CPUs to avoid doing load balance too
> > +often and rather spend more time executing actual task. While that is
> > +the right thing to do for the CPUs busy with SCHED_OTHER or SCHED_BATC=
H
> > +tasks, it may not be the optimal thing for CPUs running only SCHED_IDL=
E
> > +tasks. With the recent enhancements in the fair scheduler around SCHED=
_IDLE
> > +CPUs, it is now preferred to enqueue a newly-woken task to a SCHED_IDL=
E
> > +CPU instead of other busy or idle CPUs. The same reasoning is applied
> > +to the load balancer as well to make it migrate tasks more aggressivel=
y
> > +to a SCHED_IDLE CPU, as that will reduce the scheduling latency of the
> > +migrated (SCHED_OTHER) tasks. Fair scheduler now does the next
> > +load balance soon after the last non SCHED_IDLE task is dequeued from =
a
>
>                                     non-SCHED_IDLE
Fixed in v3.
>
> > +runqueue, i.e. making the CPU SCHED_IDLE.
> > +
> > +**Load balancing algorithm Reworked**:
> > +The load balancing algorithm contained some heuristics which became
> > +meaningless since the rework of the scheduler's metrics like the
> > +introduction of PELT. The new load balancing algorithm fixes several
> > +pending wrong tasks placement
> > +- the 1 task per CPU case with asymmetric system
> > +- the case of cfs task preempted by other class
>
> s/cfs/CFS/
Fixed in v3.
>
> > +- the case of tasks not evenly spread on groups with spare capacity
>
> Can you make that (above) a proper ReST list?
>
> > +Also the load balance decisions have been consolidated in the 3 separa=
te
> > +functions
>
> end with '.' period.
Fixed in v3.
>
> > +
> > +**Energy-aware wake-ups speeded up**:
> > +EAS computes the energy impact of migrating a waking task when decidin=
g
> > +on which CPU it should run. However, the previous approach had high al=
gorithmic
> > +complexity, which can resulted in prohibitively high wake-up latencies=
 on
>
>                drop: can
> or say         which can result
Fixed in v3.
>
> > +systems with complex energy models, such as systems with per-CPU DVFS.=
 On
> > +such systems, the algorithm complexity was O(n^2). To address this,
> > +the EAS wake-up path was re-factored to compute the energy 'delta' on =
a
> > +per-performance domain basis, rather than system-wide, which brings th=
e
> > +complexity down to O(n).
> > +
> > +**Selection of an energy-efficient CPU on task wake-up**:
> > +If an Energy Model (EM) is available and if the system isn't overutili=
zed,
> > +waking tasks are re-routed into an energy-aware placement algorithm.
> > +The selection of an energy-efficient CPU for a task is achieved by est=
imating
> > +the impact on system-level active energy resulting from the placement =
of the
> > +task on the CPU with the highest spare capacity in each performance do=
main.
> > +This strategy spreads tasks in a performance domain and avoids overly
> > +aggressive task packing. The best CPU energy-wise is then selected if =
it
> > +saves a large enough amount of energy with respect to prev_cpu.
> > +
> > +**Consider misfit tasks when load-balancing**:
> > +On asymmetric CPU capacity systems load intensive tasks can end up on
> > +CPUs that don't suit their compute demand. In this scenarios 'misfit'
>
>                                                       scenario
Fixed in v3.
>
> > +tasks are migrated to CPUs with higher compute capacity to ensure bett=
er
> > +throughput. A new group_type: group_misfit_task is added and indicates=
 this
> > +scenario. Tweaks to the load-balance code are done to make the migrati=
ons
> > +happen. Misfit balancing is done between a source group of lower per-C=
PU
> > +capacity and destination group of higher compute capacity. Otherwise, =
misfit
> > +balancing is ignored.
> > +
> > +**Make schedstats a runtime tunable that is disabled by default**:
> > +schedstats is very useful during debugging and performance tuning but =
it
> > +incurred overhead to calculate the stats. A kernel command-line and sy=
sctl
> > +tunable was added to enable or disable schedstats on demand (when it's=
 built in).
> > +It is disabled by default. The benefits are dependent on how
> > +scheduler-intensive the workload is.
> > +
> > diff --git a/Documentation/scheduler/index.rst b/Documentation/schedule=
r/index.rst
> > index ede1a30a6894..b952970d3565 100644
> > --- a/Documentation/scheduler/index.rst
> > +++ b/Documentation/scheduler/index.rst
> > @@ -17,10 +17,13 @@ specific implementation differences.
> >      :maxdepth: 2
> >
> >      overview
> > +    sched-data-structs
> > +    cfs-overview
> >      sched-design-CFS
> >      sched-features
> >      arch-specific.rst
> >      sched-debugging.rst
> > +    scheduler-api.rst
>
> Why do some of these end with ".rst" and others don't?
Removed the .rst for all the files in the index in v3.
>
> >
> >  .. only::  subproject and html
> >
> > diff --git a/Documentation/scheduler/overview.rst b/Documentation/sched=
uler/overview.rst
> > index aee16feefc61..284d6cf0b2f8 100644
> > --- a/Documentation/scheduler/overview.rst
> > +++ b/Documentation/scheduler/overview.rst
> > @@ -3,3 +3,272 @@
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  Scheduler overview
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Linux kernel implements priority based scheduling. More than one proce=
ss are
>
>                            priority-based
Fixed in v3.
>
> > +allowed to run at any given time and each process is allowed to run as=
 if it
> > +were the only process on the system. The process scheduler coordinates=
 which
> > +process runs when. In that context, it has the following tasks:
> > +
> > +- share CPU cores equally among all currently running processes
> > +- pick appropriate process to run next if required, considering schedu=
ling
> > +  class/policy and process priorities
> > +- balance processes between multiple cores in SMP systems
> > +
> > +The scheduler attempts to be responsive for I/O bound processes and ef=
ficient
> > +for CPU bound processes. The scheduler also applies different scheduli=
ng
> > +policies for real time and normal processes based on their respective
> > +priorities.  Higher priorities in the kernel have a numerical smaller
> > +value. Real time priorities range from 1 (highest) =E2=80=93 99 wherea=
s normal
> > +priorities range from 100 =E2=80=93 139 (lowest). SCHED_DEADLINE tasks=
 has negative
>
>
Fixed in v3.
        have
>
> > +priorities, reflecting the fact that any of them has higher priority t=
han
> > +RT and NORMAL/BATCH tasks.
> > +
> > +Process Management
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Each process in the system is represented by :c:type:`struct task_stru=
ct
> > +<task_struct>`. When a process/thread is created, the kernel allocates=
 a
> > +new task_struct for it. The kernel then stores this task_struct in a R=
CU
>
>                                                                       an =
RCU
Fixed in v3.
>
> > +list.  Macro next_task() allow a process to obtain its next task and
>
>                             allows
>
> > +for_each_process() macro enables traversal of the list.
> > +
> > +Frequently used fields of the task struct are:
> > +
> > +| *state:*  The running state of the task. The possible states are:
> > +
> > +- TASK_RUNNING: The task is currently running or in a run queue waitin=
g
> > +  to run.
> > +- TASK_INTERRUPTIBLE: The task is sleeping waiting for some event to o=
ccur.
> > +  This task can be interrupted by signals. On waking up the task trans=
itions
> > +  to TASK_RUNNING.
> > +- TASK_UNINTERRUPTIBLE: Similar to TASK_INTERRUPTIBLE but does not wak=
e
> > +  up on signals. Needs an explicit wake-up call to be woken up.  Contr=
ibutes
> > +  to loadavg.
> > +- __TASK_TRACED: Task is being traced by another task like a debugger.
> > +- __TASK_STOPPED: Task execution has stopped and not eligible to run.
> > +  SIGSTOP, SIGTSTP etc causes this state.  The task can be continued b=
y
> > +  the signal SIGCONT.
> > +- TASK_PARKED: State to support kthread parking/unparking.
> > +- TASK_DEAD: If a task dies, then it sets TASK_DEAD in tsk->state and =
calls
> > +  schedule one last time. The schedule call will never return.
> > +- TASK_WAKEKILL: It works like TASK_UNINTERRUPTIBLE with the bonus tha=
t it
> > +  can respond to fatal signals.
> > +- TASK_WAKING: To handle concurrent waking of the same task for SMP.
> > +  Indicates that someone is already waking the task.
> > +- TASK_NOLOAD:  To be used along with TASK_UNINTERRUPTIBLE to indicate
> > +  an idle task which does not contribute to loadavg.
> > +- TASK_NEW: Set during fork(), to guarantee that no one will run the t=
ask,
> > +  a signal or any other wake event cannot wake it up and insert it on
> > +  the runqueue.
> > +
> > +| *exit_state* : The exiting state of the task. The possible states ar=
e:
> > +
> > +- EXIT_ZOMBIE:  The task is terminated and waiting for parent to colle=
ct
> > +  the exit information of the task.
> > +- EXIT_DEAD:  After collecting the exit information the task is put to
> > +  this state and removed from the system.
> > +
> > +| *static_prio:*  Nice value of a task. The value of this field does
> > +   not change.  Value ranges from -20 to 19.  This value is mapped
> > +   to nice value and used in the scheduler.
> > +
> > +| *prio:*  Dynamic priority of a task. Previously a function of static
> > +   priority and tasks interactivity. Value not used by CFS scheduler b=
ut used
> > +   by the rt scheduler. Might be boosted by interactivity modifiers.  =
Changes
>
>              RT
>
> > +   upon fork, setprio syscalls, and whenever the interactivity estimat=
or
> > +   recalculates.
> > +
> > +| *normal_prio:* Expected priority of a task.  The value of static_pri=
o
> > +   and normal_prio are the same for non real time processes.  For real=
 time
>
>                                        non-real-time
>
> > +   processes value of prio is used.
> > +
> > +| *rt_priority:* Field used by real time tasks. Real time tasks are
> > +   prioritized based on this value.
> > +
> > +| *sched_class:* Pointer to sched_class CFS structure.
> > +
> > +| *sched_entity:* Pointer to sched_entity CFS structure.
> > +
> > +| *policy:* Value for scheduling policy.  The possible values are:
> > +
> > +* SCHED_NORMAL: Regular tasks use this policy.
> > +
> > +* SCHED_BATCH: Tasks which need to run longer without pre-emption
>
> overwhelmingly the kernel spells this as                 preemption
Fixed in all places in v3.
>
> > +  use this policy. Suitable for batch jobs.
> > +
> > +* SCHED_IDLE:  Policy used by background tasks.
> > +
> > +* SCHED_FIFO & SCHED_RR: These policies for real time tasks.  Handled
> > +  by real time scheduler.
> > +
> > +* SCHED_DEADLINE: Tasks which are activated on a periodic or sporadic =
fashion
> > +  use this policy. This policy implements the Earliest Deadline First =
(EDF)
> > +  scheduling algorithm. This policy is explained in detail in the
> > +  :doc:`sched-deadline` documentation.
> > +
> > +| *nr_cpus_allowed:*  Bit field containing tasks affinity towards a se=
t of
> > +   cpu cores.  Set using sched_setaffinity() system call.
>
>       CPU
Fixed in all places in v3.
>
> > +
> > +New processes are created using the fork() system call which is descri=
bed
> > +at manpage :manpage:`FORK(2)` or the clone system call described at
> > +:manpage:`CLONE(2)`.
> > +Users can create threads within a process to achieve parallelism. Thre=
ads
> > +share address space, open files and other resources of the process. Th=
reads
> > +are created like normal tasks with their unique task_struct, but the c=
lone()
>
>                                                                 but clone=
()
>
> > +is provided with flags that enable the sharing of resources such as ad=
dress
> > +space ::
> > +
> > +     clone(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, 0);
> > +
> > +The scheduler schedules task_structs so from scheduler perspective the=
re is
> > +no difference between threads and processes. Threads are created using
> > +the system call pthread_create described at :manpage:`PTHREAD_CREATE(3=
)`
> > +POSIX threads creation is described at :manpage:`PTHREADS(7)`
> > +
> > +The Scheduler Entry Point
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The main scheduler entry point is an architecture independent schedule=
()
> > +function defined in kernel/sched.c. Its objective is to find a process=
 in
> > +the runqueue list and then assign the CPU to it. It is invoked, direct=
ly
> > +or in a lazy(deferred) way from many different places in the kernel. A=
 lazy
>
>            lazy (deferred)
Fixed in v3.
>
> > +invocation does not call the function by its name, but gives the kerne=
l a
> > +hint by setting a flag TIF_NEED_RESCHED. The flag is a message to the =
kernel
> > +that the scheduler should be invoked as soon as possible because anoth=
er
> > +process deserves to run.
> > +
> > +Following are some places that notify the kernel to schedule:
> > +
> > +* scheduler_tick()
> > +
> > +* Running task goes to sleep state : Right before a task goes to sleep=
,
> > +  schedule() will be called to pick the next task to run and the chang=
e
> > +  its state to either TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE.  For
> > +  instance, prepare_to_wait() is one of the functions that makes the
> > +  task go to the sleep state.
> > +
> > +* try_to_wake_up()
> > +
> > +* yield()
> > +
> > +* wait_event()
> > +
> > +* cond_resched() : It gives the scheduler a chance to run a
> > +  higher-priority process
>
> end with '.' period.
Fixed in v3.
>
> > +
> > +* cond_resched_lock() : If a reschedule is pending, drop the given loc=
k,
> > +  call schedule, and on return reacquire the lock.
> > +
> > +* do_task_dead()
> > +
> > +* preempt_schedule() : The function checks whether local interrupts ar=
e
> > +  enabled and the preempt_count field of current is zero; if both
> > +  conditions are true, it invokes schedule() to select another process
> > +  to run.
> > +
> > +* preempt_schedule_irq()
> > +
> > +Calling functions mentioned above leads to a call to __schedule(), not=
e
>
>                                                         __schedule(). Not=
e
>
> > +that preemption must be disabled before it is called and enabled after
> > +the call using preempt_disable and preempt_enable functions family.
> > +
> > +
> > +The steps during invocation are:
> > +--------------------------------
> > +1. Disable pre-emption to avoid another task pre-empting the schedulin=
g
>
>               preemption                        preempting
>
> > +   thread itself.
> > +2. Retrieve the runqueue of current processor and its lock is obtained=
 to
> > +   allow only one thread to modify the runqueue at a time.
> > +3. The state of the previously executed task when the schedule()
> > +   was called is examined.  If it is not runnable and has not been
> > +   pre-empted in kernel mode, it is removed from the runqueue. If the
>
>       preempted
>
> > +   previous task has non-blocked pending signals, its state is set to
> > +   TASK_RUNNING and left in the runqueue.
> > +4. Scheduler classes are iterated and the corresponding class hook to
> > +   pick the next suitable task to be scheduled on the CPU is called.
> > +   Since most tasks are handled by the sched_fair class, a short cut t=
o this
>
>                                                               shortcut
>
> > +   class is implemented in the beginning of the function.
> > +5. TIF_NEED_RESCHED and architecture specific need_resched flags are c=
leared.
> > +6. If the scheduler class picks a different task from what was running
> > +   before, a context switch is performed by calling context_switch().
> > +   Internally, context_switch() switches to the new task's memory map =
and
> > +   swaps the register state and stack. If scheduler class picked the s=
ame
> > +   task as the previous task, no task switch is performed and the curr=
ent
> > +   task keeps running.
> > +7. Balance callback list is processed. Each scheduling class can migra=
te tasks
> > +   between CPU's to balance load. These load balancing operations are =
queued
>
>               CPUs
>
> > +   on a Balance callback list which get executed when the balance_call=
back()
>
> either                                              when balance_callback=
()
> or                                                  when the balanace_cal=
lback() function
Fixed in v3.
>
> > +   is called.
> > +8. The runqueue is unlocked and pre-emption is re-enabled. In case
>
>                                    preemption
>
> > +   pre-emption was requested during the time in which it was disabled,
>
>       preemption
>
> > +   schedule() is run again right away.
> > +
> > +Scheduler State Transition
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +A very high level scheduler state transition flow with a few states ca=
n
> > +be depicted as follows. ::
> > +
> > +                                       *
> > +                                       |
> > +                                       | task
> > +                                       | forks
> > +                                       v
> > +                        +------------------------------+
> > +                        |           TASK_NEW           |
> > +                        |        (Ready to run)        |
> > +                        +------------------------------+
> > +                                       |
> > +                                       |
> > +                                       v
> > +                     +------------------------------------+
> > +                     |            TASK_RUNNING            |
> > +   +---------------> |           (Ready to run)           | <--+
> > +   |                 +------------------------------------+    |
> > +   |                   |                                       |
> > +   |                   | schedule() calls context_switch()     | task =
is pre-empted
>
>                                                                          =
   preempted
Fixed in v3.
>
> > +   |                   v                                       |
> > +   |                 +------------------------------------+    |
> > +   |                 |            TASK_RUNNING            |    |
> > +   |                 |             (Running)              | ---+
> > +   | event occurred  +------------------------------------+
> > +   |                   |
> > +   |                   | task needs to wait for event
> > +   |                   v
> > +   |                 +------------------------------------+
> > +   |                 |         TASK_INTERRUPTIBLE         |
> > +   |                 |        TASK_UNINTERRUPTIBLE        |
> > +   +-----------------|           TASK_WAKEKILL            |
> > +                     +------------------------------------+
> > +                                       |
> > +                                       | task exits via do_exit()
> > +                                       v
> > +                        +------------------------------+
> > +                        |          TASK_DEAD           |
> > +                        |         EXIT_ZOMBIE          |
> > +                        +------------------------------+
> > +
> > +
> > +Scheduler provides trace points tracing all major events of the schedu=
ler.
> > +The tracepoints are defined in ::
>
> Can the document be consistent with (2 lines above:) "trace points" and
> (1 line above) "tracepoints"?
Fixed to tracepoints in v3.
>
> > +
> > +  include/trace/events/sched.h
> > +
> > +Using these treacepoints it is possible to model the scheduler state t=
ransition
>
>                spello
>
> > +in an automata model. The following journal paper discusses such model=
ing:
> > +
> > +Daniel B. de Oliveira, R=C3=B4mulo S. de Oliveira, Tommaso Cucinotta, =
**A thread
> > +synchronization model for the PREEMPT_RT Linux kernel**, *Journal of S=
ystems
> > +Architecture*, Volume 107, 2020, 101729, ISSN 1383-7621,
> > +https://doi.org/10.1016/j.sysarc.2020.101729.
> > +
> > +To model the scheduler efficiently the system was divided in to genera=
tors
> > +and specifications. Some of the generators used were "need_resched",
> > +"sleepable" and "runnable", "thread_context" and "scheduling context".
> > +The specifications are the necessary and sufficient conditions to call
> > +the scheduler.       New trace events were added to specify the genera=
tors
>
> Change tab above to space.
Fixed in v3
>
> > +and specifications.  In case a kernel event referred to more then one
> > +event,extra fields of the kernel event was used to distinguish between
>
>    event, extra
>
> > +automation events.  The final model was done parallel composition of a=
ll
>
> eh? parse error.
Fixed in v3.
>
> > +generators and specifications composed of 15 events, 7 generators and
> > +10 specifications.  This resulted in 149 states and 327 transitions.
> > diff --git a/Documentation/scheduler/sched-data-structs.rst b/Documenta=
tion/scheduler/sched-data-structs.rst
> > new file mode 100644
> > index 000000000000..52fe95140a8f
> > --- /dev/null
> > +++ b/Documentation/scheduler/sched-data-structs.rst
> > @@ -0,0 +1,253 @@
> > +.. SPDX-License-Identifier: GPL-2.0+
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +Scheduler Data Structures
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The main parts of the Linux scheduler are:
> > +
> > +Runqueue
> > +~~~~~~~~
> > +
> > +:c:type:`struct rq <rq>` is the central data structure of process
> > +scheduling. It keeps track of tasks that are in a runnable state assig=
ned
> > +for a particular processor. Each CPU has its own run queue and stored =
in a
> > +per CPU array::
> > +
> > +    DEFINE_PER_CPU(struct rq, runqueues);
> > +
> > +Access to the queue requires locking and lock acquire operations must =
be
> > +ordered by ascending runqueue. Macros for accessing and locking the ru=
nqueue
> > +is provided in::
>
>    are provided
>
> > +
> > +    kernel/sched/sched.h
> > +
> > +The runqueue contains scheduling class specific queues and several sch=
eduling
> > +statistics.
> > +
> > +Scheduling entity
> > +~~~~~~~~~~~~~~~~~
> > +Scheduler uses scheduling entities which contain
> > +sufficient information to actually accomplish the scheduling job of a
> > +task or a task-group. The scheduling entity may be a group of tasks or=
 a
> > +single task.  Every task is associated with a sched_entity structure. =
CFS
> > +adds support for nesting of tasks and task groups. Each scheduling ent=
ity
> > +may be run from its parents runqueue. The scheduler traverses the
> > +sched_entity hierarchy to pick the next task to run on
> > +the cpu.  The entity gets picked up from the cfs_rq on which it is que=
ued
>
>        CPU.
>
> > +and its time slice is divided among all the tasks on its my_q.
> > +
> > +Virtual Runtime
> > +~~~~~~~~~~~~~~~~~
> > +Virtual Run Time or vruntime is the amount of time a task has spent ru=
nning
> > +on the cpu. It is updated periodically by scheduler_tick(). Tasks are =
stored
>
>           CPU.
>
> > +in the CFS scheduling class rbtree sorted by vruntime. scheduler_tick(=
) calls
> > +corresponding hook of CFS which first updates the runtime statistics o=
f the
> > +currently running task and checks if the current task needs to be pre-=
empted.
>
>                                                                      pree=
mpted.
>
> > +vruntime of the task based on the formula ::
> > +
> > +    vruntime +=3D delta_exec * (NICE_0_LOAD/curr->load.weight);
> > +
> > +where:
> > +
> > +* delta_exec is the time spent by the task since the last time vruntim=
e
> > +  was updated.
>
> What unit is the time in?
Fixed to nanoseconds in v3.
>
> > +* NICE_0_LOAD is the load of a task with normal priority.
> > +* curr is the shed_entity instance of the cfs_rq struct of the current=
ly
> > +  running task.
> > +* load.weight: sched_entity load_weight.  load_weight is the encoding =
of
> > +  the tasks priority and vruntime. The load of a task is the metri
>
>                                                                 metric
>
> > +  indicating the number of CPUs needed to make satisfactory progress o=
n its
> > +  job. Load of a task influences the time a task spends on the cpu and=
 also
>
>                                                                   CPU
>
> > +  helps to estimate the overall cpu load which is needed for load bala=
ncing.
>
>                                    CPU
>
> > +  Priority of the task is not enough for the scheduler to estimate the
> > +  vruntime of a process. So priority value must be mapped to the capac=
ity of
> > +  the standard cpu which is done in the array :c:type:`sched_prio_to_w=
eight[]`.
>
>                   CPU
>
> > +  The array contains mappings for the nice values from -20 to 19. Nice=
 value
> > +  0 is mapped to 1024. Each entry advances by ~1.25 which means if for=
 every
>
> Please use "about" or "approximately" etc. instead of "~" (if that is wha=
t is meant here).
Fixed to approximately in v3.
>
> > +  increment in nice value the task gets 10% less cpu and vice versa.
>
>                                                     CPU
>
> > +
> > +Scheduler classes
> > +~~~~~~~~~~~~~~~~~
> > +It is an extensible hierarchy of scheduler modules. The
> > +modules encapsulate scheduling policy details.
> > +They are called from the core code which is independent. Scheduling cl=
asses
> > +are implemented through the sched_class structure. dl_sched_class,
> > +fair_sched_class and rt_sched_class class are implementations of this =
class.
> > +
> > +The important methods of scheduler class are:
> > +
> > +enqueue_task and dequeue_task
> > +    These functions are used to put and remove tasks from the runqueue
> > +    respectively. The function takes the runqueue, the task which need=
s to
> > +    be enqueued/dequeued and a bit mask of flags. The main purpose of =
the
> > +    flags describe why the enqueue or dequeue is being called.
>
>        flags is to describe why
>
> > +    The different flags used are described in ::
> > +
> > +        kernel/sched/sched.h
> > +
> > +    enqueue_task and dequeue_task is called for following purposes.
>
>                                      are called
>
> > +Fixed in v3.
> > +    - When waking a newly created task for the first time. Called with
> > +      ENQUEUE_NOCLOCK
> > +    - When migrating a task from one CPU's runqueue to another. Task w=
ill be
> > +      first dequeued from its old runqueue, new cpu will be added to t=
he
>
>                                                    CPU
>
> > +      task struct,  runqueue of the new CPU will be retrieved and task=
 is
> > +      then enqueued on this new runqueue.
> > +    - When do_set_cpus_allowed() is called to change a tasks CPU affin=
ity. If
> > +      the task is queued on a runqueue, it is first dequeued with the
> > +      DEQUEUE_SAVE and DEQUEUE_NOCLOCK flags set. The set_cpus_allowed=
()
> > +      function of the corresponding scheduling class will be called.
> > +      enqueue_task() is then called with ENQUEUE_RESTORE and ENQUEUE_N=
OCLOCK
> > +      flags set.
> > +    - When changing the priority of a task using rt_mutex_setprio(). T=
his
> > +      function implements the priority inheritance logic of the rt mut=
ex
>
>                                                        preferably: RT
>
> > +      code. This function changes the effective priority of a task whi=
ch may
> > +      inturn change the scheduling class of the task. If so enqueue_ta=
sk is
>
>          in turn
>
> > +      called with flags corresponding to each class.
> > +    - When user changes the nice value of the task. If the task is que=
ued on
> > +      a runqueue, it first needs to be dequeued, then its load weight =
and
> > +      effective priority needs to be set. Following which the task is
> > +      enqueued with ENQUEUE_RESTORE and ENQUEUE_NOCLOCK flags set.
> > +    - When __sched_setscheduler() is called. This function enables cha=
nging
> > +      the scheduling policy and/or RT priority of a thread. If the tas=
k is
> > +      on a runqueue, it will be first dequeued, changes will be made a=
nd
> > +      then enqueued.
> > +    - When moving tasks between scheduling groups. The runqueue of the=
 tasks
> > +      is changed when moving between groups. For this purpose if the t=
ask
> > +      is running on a queue, it is first dequeued with DEQUEUE_SAVE, D=
EQUEUE_MOVE
> > +      and DEQUEUE_NOCLOCK flags set, followed by which scheduler funct=
ion to
> > +      change the tsk->se.cfs_rq and tsk->se.parent and then task is en=
queued
> > +      on the runqueue with the same flags used in dequeue.
> > +
> > +pick_next_task
> > +    Called by __schedule() to pick the next best task to run.
> > +    Scheduling class structure has a pointer pointing to the next sche=
duling
> > +    class type and each scheduling class is linked using a singly link=
ed list.
> > +    The __schedule() function iterates through the corresponding
> > +    functions of the scheduler classes in priority order to pick up th=
e next
> > +    best task to run. Since tasks belonging to the idle class and fair=
 class
> > +    are frequent, the scheduler optimizes the picking of next task to =
call
> > +    the pick_next_task_fair() if the previous task was of the similar
> > +    scheduling class.
> > +
> > +put_prev_task
> > +    Called by the scheduler when a running task is being taken off a C=
PU.
> > +    The behavior of this function depends on individual scheduling cla=
sses
> > +    and called in the following cases.
> > +
> > +    - When do_set_cpus_allowed() is called and if the task is currentl=
y running.
> > +    - When scheduler pick_next_task() is called, the put_prev_task() i=
s
> > +      called with the previous task as function argument.
> > +    - When rt_mutex_setprio() is called and if the task is currently r=
unning.
> > +    - When user changes the nice value of the task and if the task is
> > +      currently running.
> > +    - When __sched_setscheduler() is called and if the task is current=
ly
> > +      running.
> > +    - When moving tasks between scheduling groups through the sched_mo=
ve_task()
> > +      and if the task is =C4=87urrently running.
> > +
> > +    In CFS class this function is used put the currently running task =
back
>
>                                      used to put
>
> > +    in to the CFS RB tree. When a task is running it is dequeued from =
the tree
>
>        into                                                              =
    tree.
>
>
> > +    This is to prevent redundant enqueue's and dequeue's for updating =
its
> > +    vruntime. vruntime of tasks on the tree needs to be updated by upd=
ate_curr()
> > +    to keep the tree in sync. In DL and RT classes additional tree is
>
> None of the current sched documentation uses "DL" for deadline.
> It is used in some of the source code.  Anyway, if you keep using it, you
> should tell what it means somewhere.
Fixed to SCHED_DEADLINE in v3
>
> > +    maintained for facilitating task migration between CPUs through pu=
sh
> > +    operation between runqueues for load balancing. Task will be added=
 to
> > +    this queue if it is present on the scheduling class rq and task ha=
s
> > +    affinity to more than one CPU.
> > +
> > +set_next_task
> > +    Pairs with the put_prev_task(), this function is called when the n=
ext
> > +    task is set to run on the CPU. This function is called in all the =
places
> > +    where put_prev_task is called to complete the 'change'. Change is =
defined
> > +    as the following sequence of calls::
> > +
> > +         - dequeue task
> > +         - put task
> > +         - change the property
> > +         - enqueue task
> > +         - set task as current task
> > +
> > +    It resets the run time statistics for the entity with
> > +    the runqueue clock.
> > +    In case of CFS scheduling class, it will set the pointer to the cu=
rrent
> > +    scheduling entity to the picked task and accounts bandwidth usage =
on
> > +    the cfs_rq. In addition it will also remove the current entity fro=
m the
> > +    CFS runqueue for vruntime update optimization opposite to what was=
 done
> > +    in put_prev_task.
> > +    For the DL and RT classes it will
> > +
> > +    - dequeue the picked task from the tree of pushable tasks
> > +    - update the load average in case the previous task belonged to an=
other
> > +      class
> > +    - queues the function to push tasks from current runqueue to other=
 CPUs
> > +      which can preempt and start execution. Balance callback list is =
used.
> > +
> > +task_tick
> > +    Called from scheduler_tick(), hrtick() and sched_tick_remote() to =
update
> > +    the current task statistics and load averages. Also restarting the=
 HR
> > +    tick timer is done if HR timers are enabled.
>
> Likewise, "HR" is not currently used in any scheduler documentation.
Fixed to high resoution timer in v3
> At a minimum it needs a brief explanation.
>
> > +    scheduler_tick() runs at 1/HZ and is called from the  timer interr=
upt
>
>                                             drop one space ^^
>
> > +    handler of the Kernel internal timers.
> > +    hrtick() is called from HR Timers to deliver an accurate preemptio=
n tick.
>
>                                                             drop ending p=
eriod ^^
>
> > +    as the regular scheduler tick that runs at 1/HZ can be too coarse =
when
> > +    nice levels are used.
> > +    sched_tick_remote() Gets called by the offloaded residual 1Hz sche=
duler
> > +    tick. In order to reduce interruptions to bare metal tasks, it is =
possible
> > +    to outsource these scheduler ticks to the global workqueue so that=
 a
> > +    housekeeping CPU handles those remotely
>
> end with '.' period.
>
> > +
> > +select_task_rq
> > +    Called by scheduler to get the CPU to assign a task to and migrati=
ng
> > +    tasks between CPUs. Flags describe the reason the function was cal=
led.
> > +
> > +    Called by try_to_wake_up() with SD_BALANCE_WAKE flag which wakes u=
p a
> > +    sleeping task.
> > +    Called by wake_up_new_task() with SD_BALANCE_FORK flag which wakes=
 up a
> > +    newly forked task.
> > +    Called by sched_exec() wth  SD_BALANCE_EXEC which is called from e=
xecv
>
>                               with SD_BALANCE_EXEC (one less space there)
>
> > +    syscall.
> > +    DL class decides the CPU on which the task should be woken up base=
d on
> > +    the deadline. and RT class decides based on the RT priority. Fair
>
>        the deadline. RT class decides
>
> > +    scheduling class     balances load by selecting the idlest CPU in =
the
>
>        fewer spaces  ^^^^^^
fixed in v3.
>
> > +    idlest group, or under certain conditions an idle sibling CPU if t=
he
> > +    domain has SD_WAKE_AFFINE set.
> > +
> > +balance
> > +    Called by pick_next_task() from scheduler to enable scheduling cla=
sses
> > +    to pull tasks from runqueues of other CPUs for balancing task exec=
ution
> > +    between the CPUs.
> > +
> > +task_fork
> > +    Called from sched_fork() of scheduler which assigns a task to a CP=
U.
> > +    Fair scheduling class updates runqueue clock, runtime statistics a=
nd
> > +    vruntime for the scheduling entity.
> > +
> > +yield_task
> > +    Called from SYSCALL sched_yield to yield the CPU to other tasks.
> > +    DL class forces the runtime of the task to zero using a special fl=
ag
> > +    and dequeues the task from its trees. RT class requeues the task e=
ntities
> > +    to the end of the run list. Fair scheduling class implements the b=
uddy
> > +    mechanism.  This allows skipping onto the next highest priority se=
 at
>
>                                                                        se=
??
>
> > +    every level in the CFS tree, unless doing so would introduce gross
> > +    unfairness in CPU time distribution.
> > +
> > +check_preempt_curr
> > +    Check whether the task that woke up should pre-empt the currently
>
>                                                   preempt
>
> > +    running task. Called by scheduler,
> > +    - when moving queued task to new runqueue
> > +    - ttwu()
> > +    - when waking up newly created task for the first time.
> > +
> > +    DL class compare the deadlines of the tasks and calls scheduler fu=
nction
>
>                 compares
>
> > +    resched_curr() if the preemption is needed. In case the deadliines=
 are
>
>                                                                deadlines
>
> > +    equal migratilbility of the tasks is used a criteria for preemptio=
n.
>
>              migratability
>
> > +    RT class behaves the same except it uses RT priority for compariso=
n.
> > +    Fair class sets the buddy hints before calling resched_curr() to p=
reemempt.
>
>                                                                         p=
reempt.
>
> > +
> > +Scheduler sets the scheduler class for each task based on its priority=
.
> > +Tasks assigned with SCHED_NORMAL, SCHED_IDLE and SCHED_BATCH call
> > +fair_sched_class hooks and tasks assigned with SCHED_RR and
> > +SCHED_FIFO call rt_sched_class hooks. Tasks assigned with SCHED_DEADLI=
NE
> > +policy calls dl_sched_class hooks.
> > diff --git a/Documentation/scheduler/scheduler-api.rst b/Documentation/=
scheduler/scheduler-api.rst
> > new file mode 100644
> > index 000000000000..068cdbdbdcc6
> > --- /dev/null
> > +++ b/Documentation/scheduler/scheduler-api.rst
> > @@ -0,0 +1,30 @@
> > +.. SPDX-License-Identifier: GPL-2.0+
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +Scheduler related functions
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: __schedule
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: scheduler_tick
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: try_to_wake_up
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: do_task_dead
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: preempt_schedule_irq
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: prepare_task_switch
> > +
> > +.. kernel-doc:: kernel/sched/core.c
> > +     :functions: finish_task_switch
> > +
> > +.. kernel-doc:: kernel/sched/sched.h
> > +     :functions: rq
> > \ No newline at end of file
>
fixed in v3.
> Please fix that warning.
>
> Thanks. This looks helpful.
>
> --
> ~Randy
>

-John
