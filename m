Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F5419AE6A
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 17:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733085AbgDAPDb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 11:03:31 -0400
Received: from foss.arm.com ([217.140.110.172]:53918 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732946AbgDAPDb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Apr 2020 11:03:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E7F11FB;
        Wed,  1 Apr 2020 08:03:30 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C134C3F71E;
        Wed,  1 Apr 2020 08:03:27 -0700 (PDT)
References: <20200401100029.1445-1-john.mathew@unikie.com> <20200401100029.1445-3-john.mathew@unikie.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview documentation
In-reply-to: <20200401100029.1445-3-john.mathew@unikie.com>
Date:   Wed, 01 Apr 2020 16:03:19 +0100
Message-ID: <jhjh7y3xn7s.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 01/04/20 11:00, John Mathew wrote:
> +**Schedule class:** It is an extensible hierarchy of scheduler modules. The
> +modules encapsulate scheduling policy details.
> +They are called from the core code which is independent. Scheduling classes are
> +implemented through the sched_class structure.
> +fair_sched_class and rt_sched_class class are implementations of this class. The
> +main members of the :c:type:`struct sched_class <sched_class>` are :
> +
> +For the fair_sched_class the hooks (implemented as <function name>_fair)
> +does the following:
> +
> +:c:member:`enqueue_task`
> +    Update the fair scheduling stats and puts scheduling entity in
> +    to rb tree and increments the nr_running variable.
> +
> +:c:member:`dequeue_task`
> +    Moves the entity out of the rb tree when entity no longer runnable
> +    and decrements the nr_running variable. Also update the fair scheduling stats.
> +
> +:c:member:`yield_task`
> +    Use the buddy mechanism to skip onto the next highest priority se at
> +    every level in the CFS tree, unless doing so would introduce gross unfairness
> +    in CPU time distribution.
> +
> +:c:member:`check_preempt_curr`
> +    Check whether the task that woke up should pre-empt the
> +    running task.
> +
> +:c:member:`pick_next_task`
> +    Pick the next eligible task. This may not be the left most task
> +    in the rbtree. Instead a buddy system is used which provides benefits of
> +    cache locality and group scheduling.
> +
> +:c:member:`task_tick`
> +    Called from scheduler_tick(). Updates the runtime statistics of the
> +    currently running task and checks if this task needs to be pre-empted.
> +
> +:c:member:`task_fork`
> +    scheduler setup for newly forked task.
> +
> +:c:member:`task_dead`
> +    A task struct has one reference for the use as "current". If a task
> +    dies, then it sets TASK_DEAD in tsk->state and calls schedule one last time.
> +    The schedule call will never return, and the scheduled task must drop that
> +    reference.
> +

I tend to agree with Matthew in that this is too much info on the current
implem. What would be useful however is some sort of documentation for the
sched_class fields themselves; as you say those are (mainly) called from
core code, so IMO what's interesting is when/why the core code calls them.

For instance highlighting the "change" cycle would be a good start, see
e.g. do_set_cpus_allowed() and what it does with {en,de}queue_task() &
{set_next,put_prev}_task().
