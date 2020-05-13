Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FEF1D15C3
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 15:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388076AbgEMNiU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 09:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgEMNiT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 09:38:19 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EC3C061A0C
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 06:38:19 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id s9so14246692eju.1
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3DFsZEfvrw3BH+2ixM4YHIIUn7edj79F5KLbeWrYfw0=;
        b=pkmq12p2AYwS1xbnL/ss80ANAURwtSoMCzZ+2vr2HAHDZptA0yjVIZ3MKAEG9XXtTs
         a5D1pomLLK/qWGN7AcTVA+e+6fEvZeNSyL1fNFiP3sDz3hqBGZerl2gd2fJFaQD5m4c3
         8Dl4IUnexnmyhoQKZgfjURs62bA8rAGiwdEKADBKKmw1YhVmtfsNvbGM4Mz0zhc7uDFs
         izilinfbpdmSUoDkA2vlHg41Gm/X9kL+iEtmfuLv0fJfOfKFO/LOeNMuiFXMhZ5Hogyg
         N/PnSftngBE519EcBeVS5BIW/7CqUtZRZG1AOMYPh0eeusyhfVdDVhj0hXDcQJPB2Anj
         j7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3DFsZEfvrw3BH+2ixM4YHIIUn7edj79F5KLbeWrYfw0=;
        b=Y6J3o09wLwJFZhGA89GMNbsxP7DZc/jZnFo7I+KQWUJKIrrt8HWHJe/OZwk9EfhoeT
         UVtHFSNL+8FvO2ZglTc5skr0pEyaLU0G4nhGiY9FWuL9AaNSC0aUuyyo+mopMz6D6iE/
         otHeMOnx6YbPOdD9qaxYHi7Si3F6eQ/WqT2X2V63FWGP1kC9vCgh6oJyu6pLft7AA2xH
         T4SO1Cb9jWS3DgbFfPkrGRmTIN2Y9IFK54PVrpdQwG2jn+X3WAtzW/43O++wn1CtUJn/
         YXbQv4zjwLyST9VqvVslSPuCst1Ccq1ooTqqCpaz08IEzGhUiBo6FnYesk1+UTRY7ZUu
         ePLg==
X-Gm-Message-State: AGi0Pubs2MESPxXscmeTWwHq3ZfVc1bxZIB16XuM7C2Cj3hBljlkzKfr
        6qMUF6210dClrzbjmK+dTDhxj89CVAJR2GDD6PSyNw==
X-Google-Smtp-Source: APiQypLNSNDd50H9T0CdFNNJKtQtXUYU+BUvk5DcczoVOBeRqJupVUm8/8uj4MDU66QWR24kpsdX5aPg+Bf1AuzizwY=
X-Received: by 2002:a17:906:4e8a:: with SMTP id v10mr21772736eju.63.1589377097865;
 Wed, 13 May 2020 06:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200507180553.9993-1-john.mathew@unikie.com> <20200507180553.9993-3-john.mathew@unikie.com>
 <9a41369c-8617-e80e-61e5-c659c51d631b@arm.com>
In-Reply-To: <9a41369c-8617-e80e-61e5-c659c51d631b@arm.com>
From:   John Mathew <john.mathew@unikie.com>
Date:   Wed, 13 May 2020 16:38:06 +0300
Message-ID: <CAJz2qX=qpN4-7fgCPC0KWFSZHDwi+0Z16RHQsRp6x4GjTZCTxA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] docs: scheduler: Add scheduler overview documentation
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        rostedt@goodmis.org, Benjamin Segall <bsegall@google.com>,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 8, 2020 at 1:19 PM Dietmar Eggemann
<dietmar.eggemann@arm.com> wrote:
>
> On 07/05/2020 20:05, John Mathew wrote:
>
> [...]
>
> > diff --git a/Documentation/scheduler/cfs-overview.rst b/Documentation/s=
cheduler/cfs-overview.rst
> > new file mode 100644
> > index 000000000000..b717f2d3e340
> > --- /dev/null
> > +++ b/Documentation/scheduler/cfs-overview.rst
> > @@ -0,0 +1,113 @@
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
>
> I agree with what Valentin mentioned already. Instead of describing
> recent patch-sets, the functionality which was added (or enhanced) by
> them) should be depicted instead.
>
> E.g. in case of 'Thermal Pressure' this would be the "scale CPU
> capacity" mechanism for CFS so it knows how much CPU capacity is left
> for its use after higher priority sched classes (RT, DL), IRQs and
> 'Thermal Pressure' have reduced the 'original' CPU capacity.
Changed in v4 patch version.
> [...]
>
> > +**Load balancing algorithm Reworked**:
> > +The load balancing algorithm contained some heuristics which became
> > +meaningless since the rework of the scheduler's metrics like the
> > +introduction of PELT. The new load balancing algorithm fixes several
> > +pending wrong tasks placement
> > +
> > + * the 1 task per CPU case with asymmetric system
> > + * the case of CFS task preempted by other class
> > + * the case of tasks not evenly spread on groups with spare capacity
> > +
> > +Also the load balance decisions have been consolidated in the 3 separa=
te
> > +functions.
>
> What are those 3 separate functions? I guess you refer to the 3
> (actually 4) migration types (migrate_task, migrate_util, migrate_load,
> (migrate_misfit)).

The three functions are
* update_sd_pick_busiest() select the busiest sched_group.
* find_busiest_group() checks if there is an imbalance between local and
busiest group.
* calculate_imbalance() decides what have to be moved.
Added them in v4 of patchset.
>
> [...]
>
> > diff --git a/Documentation/scheduler/overview.rst b/Documentation/sched=
uler/overview.rst
> > index aee16feefc61..f2cb0c901208 100644
> > --- a/Documentation/scheduler/overview.rst
> > +++ b/Documentation/scheduler/overview.rst
> > @@ -3,3 +3,269 @@
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  Scheduler overview
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Linux kernel implements priority-based scheduling. More than one proce=
ss are
> > +allowed to run at any given time and each process is allowed to run as=
 if it
> > +were the only process on the system. The process scheduler coordinates=
 which
> > +process runs when. In that context, it has the following tasks:
> > +
> > +* share CPU cores equally among all currently running processes.
> > +* pick appropriate process to run next if required, considering schedu=
ling
> > +  class/policy and process priorities.
> > +* balance processes between multiple cores in SMP systems.
> > +
> > +The scheduler attempts to be responsive for I/O bound processes and ef=
ficient
> > +for CPU bound processes. The scheduler also applies different scheduli=
ng
> > +policies for real time and normal processes based on their respective
> > +priorities. Higher priorities in the kernel have a numerical smaller
> > +value. Real time priorities range from 1 (highest) =E2=80=93 99 wherea=
s normal
> > +priorities range from 100 =E2=80=93 139 (lowest). SCHED_DEADLINE tasks=
 have negative
> > +priorities, reflecting the fact that any of them has higher priority t=
han
> > +RT and NORMAL/BATCH tasks.
>
> s/RT/SCHED_FIFO, SCHED_RR
> s/NORMAL/SCHED_NORMAL
> s/BATCH/SCHED_BATCH
>
Changed in patchset v4.

> SCHED_IDLE tasks can be set in the 100 =E2=80=93 139 range too but IMHO a=
re
> treated as 139 (nice 20). Their priority doesn't matter since they get
> minimal weight WEIGHT_IDLEPRI=3D3 anyway.
>
> And then there are the maintenance sched classes, idle sched class and
> its idle tasks 'swapper/X' with priority 120 (was MAX_PRIO) as well as
> the stop sched class and its stopper tasks 'migration/X' who disguise as
> SCHED_FIFO with priority 139.
> Might be that people might find this too detailed though but it helps
> when you try to understand how it all works.
>
Added in patchset v4.
> [...]
>
> > diff --git a/Documentation/scheduler/index.rst b/Documentation/schedule=
r/index.rst
> > index ede1a30a6894..f311abe5b711 100644
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
> > -    arch-specific.rst
> > -    sched-debugging.rst
> > +    arch-specific
> > +    sched-debugging
> > +    scheduler-api
> >
> >  .. only::  subproject and html
> >
> > +                     +------------------------------------+
> > +                     |            TASK_RUNNING            |
> > +   +---------------> |           (Ready to run)           | <--+
> > +   |                 +------------------------------------+    |
> > +   |                   |                                       |
> > +   |                   | schedule() calls context_switch()     | task =
is preempted
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
> > +Scheduler provides tracepoints tracing all major events of the schedul=
er.
> > +The tracepoints are defined in ::
> > +
> > +  include/trace/events/sched.h
> > +
> > +Using these tracepoints it is possible to model the scheduler state tr=
ansition
>
> I would refer to them as trace events.
Changed in patchset v4.
>
> The scheduler started to export (bare) trace points for PELT and
> overutilization (e.g. pelt_cfs_tp) (commit ba19f51fcb54 "sched/debug:
> Add new tracepoints to track PELT at rq level"). They are not bound to a
> trace event and so they don't expose any internal data structures.
>
> [...]
>
> > +Virtual Runtime
> > +~~~~~~~~~~~~~~~~~
> > +Virtual Run Time or vruntime is the amount of time a task has spent ru=
nning
> > +on the CPU. It is updated periodically by scheduler_tick(). Tasks are =
stored
> > +in the CFS scheduling class rbtree sorted by vruntime. scheduler_tick(=
) calls
> > +corresponding hook of CFS which first updates the runtime statistics o=
f the
> > +currently running task and checks if the current task needs to be pree=
mpted.
> > +vruntime of the task based on the formula ::
> > +
> > +    vruntime +=3D delta_exec * (NICE_0_LOAD/curr->load.weight);
> > +
> > +where:
> > +
> > +* delta_exec is the time in nanoseconds spent by the task since the la=
st time
> > +  vruntime was updated.
> > +* NICE_0_LOAD is the load of a task with normal priority.
> > +* curr is the shed_entity instance of the cfs_rq struct of the current=
ly
> > +  running task.
> > +* load.weight: sched_entity load_weight. load_weight is the encoding o=
f
> > +  the tasks priority and vruntime. The load of a task is the metric
> > +  indicating the number of CPUs needed to make satisfactory progress o=
n its
> > +  job. Load of a task influences the time a task spends on the CPU and=
 also
> > +  helps to estimate the overall CPU load which is needed for load bala=
ncing.
>
> load.weight is replaced by PELT in load balancing.
Removed this section as it is already described in sched-design-CFS
>
> > +  Priority of the task is not enough for the scheduler to estimate the
> > +  vruntime of a process. So priority value must be mapped to the capac=
ity of
> > +  the standard CPU which is done in the array :c:type:`sched_prio_to_w=
eight[]`.
> > +  The array contains mappings for the nice values from -20 to 19. Nice=
 value
> > +  0 is mapped to 1024. Each entry advances by approximately 1.25 which=
 means
> > +  for every increment in nice value the task gets 10% less CPU and vic=
e versa.
>
> SCHED_IDLE get minimal weight (WEIGHT_IDLEPRIO=3D3)

Thanks for your review.
>
> [...]
