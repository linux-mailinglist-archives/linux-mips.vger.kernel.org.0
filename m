Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4911E19AB9D
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 14:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732454AbgDAM0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 08:26:36 -0400
Received: from merlin.infradead.org ([205.233.59.134]:51310 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgDAM0g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 08:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bA2F3xYSXtxToYcDGgMY/bpcLo9r2/rBkw5fn89bMVc=; b=ylqXajWEGkF6Sqt0mYJLWvBd4P
        EfrnpLHH5mnJJTenvfXH1elq4HtisN2p43CzGpYz20gO6yBTHt6Ssrq0nVta7D4C7lbLPNrVrFy8F
        E3AQKnZsqN5RLqqk2/HGI4S/7dyl1yETbviZn/PY2dO/lAdigeI5AR1wogE81uAH0uV0MXhZxLe1V
        S5QDsER+MfMdrdltaeQpjxn7kqeYJLw8lCGYxU162PBH2v6qqeLsefRS3EiGDSSoXHBMlLghgY4Q1
        frR61c4vQyHRmyn2LPBk1yvva8CiIlcL1szhAcgNwnwrupUmYnkMNdXd1ZpbmoKoKkg9LcQxlbMdX
        yVEXVdyQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJcRd-00044m-Ry; Wed, 01 Apr 2020 12:26:10 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 01A5730610E;
        Wed,  1 Apr 2020 14:26:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id DBF4D29D85C87; Wed,  1 Apr 2020 14:26:06 +0200 (CEST)
Date:   Wed, 1 Apr 2020 14:26:06 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     John Mathew <john.mathew@unikie.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200401122606.GF20713@hirez.programming.kicks-ass.net>
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-3-john.mathew@unikie.com>
 <20200401103520.GA20713@hirez.programming.kicks-ass.net>
 <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 01, 2020 at 01:47:04PM +0200, Daniel Bristot de Oliveira wrote:
> On 4/1/20 12:35 PM, Peter Zijlstra wrote:
> >> +Scheduler State Transition
> >> +==========================
> >> +
> >> +A very high level scheduler state transition flow with a few states can be
> >> +depicted as follows.
> >> +
> >> +.. kernel-render:: DOT
> >> +   :alt: DOT digraph of Scheduler state transition
> >> +   :caption: Scheduler state transition
> >> +
> >> +   digraph sched_transition {
> >> +      node [shape = point,  label="exisiting task\n calls fork()"]; fork
> >> +      node [shape = box, label="TASK_NEW\n(Ready to run)"] tsk_new;
> >> +      node [shape = box, label="TASK_RUNNING\n(Ready to run)"] tsk_ready_run;
> >> +      node [shape = box, label="TASK_RUNNING\n(Running)"] tsk_running;
> >> +      node [shape = box, label="TASK_DEAD\nEXIT_ZOMBIE"] exit_zombie;
> >> +      node [shape = box, label="TASK_INTERRUPTIBLE\nTASK_UNINTERRUPTIBLE\nTASK_WAKEKILL"] tsk_int;
> >> +      fork -> tsk_new [ label = "task\nforks" ];
> >> +      tsk_new -> tsk_ready_run;
> >> +      tsk_ready_run -> tsk_running [ label = "schedule() calls context_switch()" ];
> >> +      tsk_running -> tsk_ready_run [ label = "task is pre-empted" ];
> >> +      subgraph int {
> >> +         tsk_running -> tsk_int [ label = "task needs to wait for event" ];
> >> +         tsk_int ->  tsk_ready_run [ label = "event occurred" ];
> >> +      }
> >> +      tsk_int ->  exit_zombie [ label = "task exits via do_exit()" ];
> >> +   }
> > And that is a prime example of why I hates RST, it pretty much mandates
> > you view this with something other than a text editor.
> 
> The good thing about the dot format is that we can convert it to many other
> formats, including text:

Oh, I know and love dot files, I generate them occasionally. But they
stink as end-result, which is what it is here.

If you can't read a document (or worse comment) in a code editor it's
broken (and yes, I know some subsystems have a different opinion here).
