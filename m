Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8625719A99D
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 12:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731608AbgDAKfw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 06:35:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40570 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728087AbgDAKfw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 06:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jKC6THGZrwUVixb6BZ2XeXxaF8x3c1jFGIQFFG8nplo=; b=OdvRiX9s+jzUuN2+Trq6HNZNn3
        bbIRTb4aXdDlvC1mJIYOImVV0lel7qBcabQ9EgJ/6uSseDHcrJFJgJ5Zr2VByt7m3izFEBItq2wVd
        f3+H8sF9Km45g8oNzBfnmDC8G26ITO3gOm1Q1Oh+rDun6mWJOjgks9we2s9eHUen2shIk1kbOWORz
        Ff9qwO99XBZrLhJXB40v7mzRUVVVrVDLj+B8hBBuyspXhiYHilrWK2DMN5GT5MGPZ2PUCklQ3Ovtc
        Zi83iQfrA0LUz/nbaS6qX6zFxhZ8aLm52TylS5Kw5ZeZoKbIH/GS1blJ/rBdht/j3I60dOxxeMFha
        a65iKE3g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJaiR-0001R8-32; Wed, 01 Apr 2020 10:35:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 970483060FD;
        Wed,  1 Apr 2020 12:35:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 75DD029C48EA9; Wed,  1 Apr 2020 12:35:20 +0200 (CEST)
Date:   Wed, 1 Apr 2020 12:35:20 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200401103520.GA20713@hirez.programming.kicks-ass.net>
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-3-john.mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401100029.1445-3-john.mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 01, 2020 at 01:00:28PM +0300, John Mathew wrote:

I dispise RST, it's an unreadable mess, but I did skim the document and
felt I should comment on this:

> +* _cond_resched() : It gives the scheduler a chance to run a
> +  higher-priority process.
> +
> +* __cond_resched_lock() :  if a reschedule is pending, drop the given
> +  lock, call schedule, and on return reacquire the lock.

Those are not functions anybody should be using; the normal entry points
are: cond_resched() and cond_resched_lock().


> +Scheduler State Transition
> +==========================
> +
> +A very high level scheduler state transition flow with a few states can be
> +depicted as follows.
> +
> +.. kernel-render:: DOT
> +   :alt: DOT digraph of Scheduler state transition
> +   :caption: Scheduler state transition
> +
> +   digraph sched_transition {
> +      node [shape = point,  label="exisiting task\n calls fork()"]; fork
> +      node [shape = box, label="TASK_NEW\n(Ready to run)"] tsk_new;
> +      node [shape = box, label="TASK_RUNNING\n(Ready to run)"] tsk_ready_run;
> +      node [shape = box, label="TASK_RUNNING\n(Running)"] tsk_running;
> +      node [shape = box, label="TASK_DEAD\nEXIT_ZOMBIE"] exit_zombie;
> +      node [shape = box, label="TASK_INTERRUPTIBLE\nTASK_UNINTERRUPTIBLE\nTASK_WAKEKILL"] tsk_int;
> +      fork -> tsk_new [ label = "task\nforks" ];
> +      tsk_new -> tsk_ready_run;
> +      tsk_ready_run -> tsk_running [ label = "schedule() calls context_switch()" ];
> +      tsk_running -> tsk_ready_run [ label = "task is pre-empted" ];
> +      subgraph int {
> +         tsk_running -> tsk_int [ label = "task needs to wait for event" ];
> +         tsk_int ->  tsk_ready_run [ label = "event occurred" ];
> +      }
> +      tsk_int ->  exit_zombie [ label = "task exits via do_exit()" ];
> +   }

And that is a prime example of why I hates RST, it pretty much mandates
you view this with something other than a text editor.

Also, Daniel, you modeled all this, is the above anywhere close?

> +Scheduler provides trace points tracing all major events of the scheduler.
> +The tracepoints are defined in ::
> +
> +  include/trace/events/sched.h
> +
> +Using these treacepoints it is possible to model the scheduler state transition
> +in an automata model. The following conference paper discusses such modeling.
> +
> +https://www.researchgate.net/publication/332440267_Modeling_the_Behavior_of_Threads_in_the_PREEMPT_RT_Linux_Kernel_Using_Automata

Ah, you've found Daniel ;-)

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1a9983da4408..ccefc820557f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3578,8 +3578,12 @@ unsigned long long task_sched_runtime(struct task_struct *p)
>  	return ns;
>  }
>  
> -/*
> - * This function gets called by the timer code, with HZ frequency.
> +/**
> + * scheduler_tick -
> + *
> + * This function is called on every timer interrupt with HZ frequency and
> + * calls scheduler on any task that has used up its quantum of CPU time.
> + *
>   * We call it with interrupts disabled.
>   */
>  void scheduler_tick(void)
> @@ -3958,8 +3962,8 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>  	BUG();
>  }
>  
> -/*
> - * __schedule() is the main scheduler function.
> +/**
> + * __schedule() - The main scheduler function.
>   *
>   * The main means of driving the scheduler and thus entering this function are:
>   *
> @@ -4086,6 +4090,12 @@ static void __sched notrace __schedule(bool preempt)
>  	balance_callback(rq);
>  }
>  
> +/**
> + * do_task_dead - Final step of task exit
> + *
> + *  Changes the the task state to TASK_DEAD and calls schedule to pick next
> + *  task to run.
> + */

That has whitespace damage.

>  void __noreturn do_task_dead(void)
>  {
>  	/* Causes final put_task_struct in finish_task_switch(): */
> @@ -4244,7 +4254,9 @@ static void __sched notrace preempt_schedule_common(void)
>  }
>  
>  #ifdef CONFIG_PREEMPTION
> -/*
> +/**
> + * preempt_schedule -
> + *
>   * This is the entry point to schedule() from in-kernel preemption
>   * off of preempt_enable.
>   */
> @@ -4316,7 +4328,9 @@ EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
>  
>  #endif /* CONFIG_PREEMPTION */
>  
> -/*
> +/**
> + * preempt_schedule_irq -
> + *
>   * This is the entry point to schedule() from kernel preemption
>   * off of irq context.
>   * Note, that this is called and return with irqs disabled. This will
> @@ -5614,6 +5628,11 @@ SYSCALL_DEFINE0(sched_yield)
>  }
>  
>  #ifndef CONFIG_PREEMPTION
> +/**
> + * _cond_resched -
> + *
> + * gives the scheduler a chance to run a higher-priority process
> + */
>  int __sched _cond_resched(void)
>  {
>  	if (should_resched(0)) {
> @@ -5626,9 +5645,10 @@ int __sched _cond_resched(void)
>  EXPORT_SYMBOL(_cond_resched);
>  #endif
>  
> -/*
> - * __cond_resched_lock() - if a reschedule is pending, drop the given lock,
> +/**
> + * __cond_resched_lock - if a reschedule is pending, drop the given lock,
>   * call schedule, and on return reacquire the lock.
> + * @lock: target lock
>   *
>   * This works OK both with and without CONFIG_PREEMPTION. We do strange low-level
>   * operations here to prevent schedule() from being called twice (once via

Just know that the first time someone comes and whines about how a
scheduler comment doesn't build or generates bad output, I remove the
/** kerneldoc thing.

Also, like I said above, _cond_resched() and __cond_resched_lock()
really should not be exposed like this, they're not API.


