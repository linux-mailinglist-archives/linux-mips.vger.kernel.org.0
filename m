Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7592319F005
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 07:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgDFFIE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 01:08:04 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35196 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgDFFIE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 01:08:04 -0400
Received: by mail-ed1-f67.google.com with SMTP id c7so9933208edl.2
        for <linux-mips@vger.kernel.org>; Sun, 05 Apr 2020 22:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TaGET+/4z6vtcUcADx2roZuk5xA0YvUz0qdcO3HDz7U=;
        b=cQrC1J4q6DGSEnsc1PYchw3rFK/hhxFCpMrw0rDqyvxGCw9cITjgiXf/vEEBBGW6E+
         ezxSCul4V4hiBB8O7YTfRNRSJ8BzAbWN+gWQy/emhbLJUuWS8WQa6y7WcsBb93v8vstm
         eiWisutf4z67KXjarz9wedkTW+xm+rimMhiNdn7G6vUCN3Bm2pmbZ+xOi7KNnt5WT68V
         +pEdsJhmUscu9v+vZjueLBuHPvJg8FfmbPGsn51PzKOvS8b+Xecx/uSNPUSpsec9ni3x
         Z2+zUbPda4pC6kzwbmL1GiK7xaKfgHcSIA+qNaec9dKtM7AMkSn60hCO9hOR603EkT1E
         PCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TaGET+/4z6vtcUcADx2roZuk5xA0YvUz0qdcO3HDz7U=;
        b=Zrm5Xz1Yov4IKFb30IPpyPmz6zjPPEwUZsnX2dYmP1fBzHZzw+SPBjQGISWaFKmbRq
         k7TFooMJZhP1LVIWPHItLqbMF9jQzr++9GwaZY0kc/9kNCvXKJ3+6vhZ1vinfl2C0A1q
         LeI1qxFT1lp5Thp7mdOhLRilcHQChpSvnSMl2/2CRXCduy6Xt7bFUBe0bMwrYVFpks+k
         CLnWrTubAmCkkjifpk2RaYe2tM9MaVR41ENs5IhSMXyAO2qm4odIrbZqkos5L0ncytH2
         8YmQYxRWZeTIutLhlZR/LeE9otnG1qOTKdpI/WocRdGZcpfeO4PTuFGuw0pnS9f7NCQG
         /xoA==
X-Gm-Message-State: AGi0PuaA4FN57kuoP9ggs7BM55JE5UiGmoL5AaAKSLOHsjGy0bRTtKO8
        ewOp5vVlprx+lzlo/MYF5XRkS5qiiNTd8KlHm9D+RQ==
X-Google-Smtp-Source: APiQypIPNXu+Bp44UG2XShCRIR9hQ+N1rn9NygifaPNoEDJHQ8+eIRrhH08/FHBQXb7RzZ5i9BA29siDSfUXZFIWdI8=
X-Received: by 2002:a17:906:ce4c:: with SMTP id se12mr19019601ejb.153.1586149681044;
 Sun, 05 Apr 2020 22:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200401100029.1445-1-john.mathew@unikie.com>
In-Reply-To: <20200401100029.1445-1-john.mathew@unikie.com>
From:   John Mathew <john.mathew@unikie.com>
Date:   Mon, 6 Apr 2020 08:07:49 +0300
Message-ID: <CAJz2qX=cbnHp86oZ96Mo0ghXS0v2gg7DSkaGykvn5dnG8XoEtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Add scheduler overview documentation
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        dietmar.eggemann@arm.com, rostedt@goodmis.org,
        Benjamin Segall <bsegall@google.com>, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 1, 2020 at 1:02 PM John Mathew <john.mathew@unikie.com> wrote:
>
> Hi all,
>
> Based on our investigation in the area of the MIPS scheduler context
> switch we wish to share our learnings about the kernel scheduler in
> the form of kernel documentation. Investigations were done mostly by
> stepping through the code using GDB and code inspection. The aim of
> the patchset is to provide a brief overview of the kernel scheduler
> starting from a brief history, the overview of the kernel structs
> used by the scheduler, scheduler invocation and context switch. We
> have also added a small section on scheduler state modelling
> possibilities. In order to add these subjects we have restructured
> the existing scheduler documentation so as to put them in to suitable
> sections. We hope the new structure will enable easy extension of the
> scheduler documentation.
>
> Patch 1 creates place holders and new structure for the scheduler documentation.
> The main sections are
>  - Scheduler overview: Overview of the scheduler.
>  - CFS: A section dedicated to CFS scheduler.
>  - Process context switching: Context switching overview.
>  - Scheduler features: We thought most of the existing documentation can be moved
>    here.
>  - Architecture Specific Scheduler Implementation Differences: Aimed for each
>    architecture and future updates.
>  - Scheduler Debugging Interface: For scheduler diagnostics and utilities
>  - Scheduler related functions: Scheduler API reference.
>
> Patch 2: Adds documentation for the place holders of the Scheduler overview,
>  Scheduler State Transition and CFS sections.
>
> Patch 3: Adds documentation for the place holder of the Process context switching
>  and add 2 new sections to for x86 and MIPS context switch.
>
>
> John Mathew (3):
>   docs: scheduler: Restructure scheduler documentation.
>   docs: scheduler: Add scheduler overview documentation
>   docs: scheduler: Add introduction to scheduler context-switch
>
>  Documentation/scheduler/arch-specific.rst     |  14 +
>  Documentation/scheduler/cfs-data-structs.rst  | 208 ++++++++++++++
>  Documentation/scheduler/cfs-overview.rst      |  46 ++++
>  .../scheduler/cfs-sched-overview.rst          |  17 ++
>  Documentation/scheduler/context-switching.rst |  71 +++++
>  Documentation/scheduler/index.rst             |  31 ++-
>  .../scheduler/mips-context-switch.rst         |  78 ++++++
>  Documentation/scheduler/overview.rst          | 260 ++++++++++++++++++
>  Documentation/scheduler/sched-debugging.rst   |  14 +
>  Documentation/scheduler/sched-features.rst    |  20 ++
>  Documentation/scheduler/scheduler-api.rst     |  34 +++
>  .../scheduler/x86-context-switch.rst          |  59 ++++
>  kernel/sched/core.c                           |  36 ++-
>  13 files changed, 867 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/scheduler/arch-specific.rst
>  create mode 100644 Documentation/scheduler/cfs-data-structs.rst
>  create mode 100644 Documentation/scheduler/cfs-overview.rst
>  create mode 100644 Documentation/scheduler/cfs-sched-overview.rst
>  create mode 100644 Documentation/scheduler/context-switching.rst
>  create mode 100644 Documentation/scheduler/mips-context-switch.rst
>  create mode 100644 Documentation/scheduler/overview.rst
>  create mode 100644 Documentation/scheduler/sched-debugging.rst
>  create mode 100644 Documentation/scheduler/sched-features.rst
>  create mode 100644 Documentation/scheduler/scheduler-api.rst
>  create mode 100644 Documentation/scheduler/x86-context-switch.rst
>
> --
> 2.17.1
>

Thank you  Peter, Daniel, Matthew, Juri, Valentin and Jonathan for taking
time to review this patchset.

Please find the summary of feedback:

Formatting and Representation
---------------------------------------
1. Fix white space damage in the kernel-doc comments added to
    the scheduler function (Peter)
2. Find a format that can be displayed properly and edited in a text editor
    and also looks good in the html view(Daniel)
3. Provide graphical representation for scheduler automata models.
4. Limit document width to 75 (Matthew)
5. Add text representation of dot format images and check if ditaa
tool can be used for graphical output  (Valentin)

Referencing (of code parts)
---------------------------------------
1. Remove :c:func: directive as it is redundant. (Peter)
2. Add reference to all the arch specific implementations of resume() (Peter).
3. Add reference to the 32 bit version of assembly implementation of
     __switch_to_asm (Peter)
4. Remove references to the _cond_resched() and __cond_resched_lock()
    from the scheduler API reference list added in the patch. (Peter)
5. Describe rq struct member as kernel-doc comments (Matthew)
6. Add reference to scheduler journal paper about scheduler
    automata model (Daniel)

Style of Writing and Wording
---------------------------------------
1. Rename running queue to runqueue (Matthew)
2. Describe cfs_rq correctly (Matthew)
3. Describe vruntime correctly (Matthew)
4. Rephrase sentences about scheduler history (Matthew)

Documentation Scope, Focus and Depth
----------------------------------------------------
1. Describe finish_task_switch() correctly (Peter)
2. Do not over-describe current implementation (Matthew)
3. Drop explanation and add reference to existing  rbtree
    documentation (Matthew)
4. Do not add too much info on current implementation (Valentin)
5. Add documentation for sched_class fields themselves, when/why the
    core code calls them (Valentin).
6. Highlight the change cycle (Valentin)
7. Mention SCHED_DEADLINE (Juri)
8. Add pointer to sched-deadline.txt. (Juri)

Technical Understanding and Description
-----------------------------------------------------
1. Describe prepare_task_switch() correctly (Peter)
2. Describe ASID allocation correctly (Peter)
3. Describe kernel task to user space task transition correctly (Peter)
4. Check FPU affinity management feature (Peter)

We will work on all this feedback and provide a RFC PATCH v2

-John
