Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4E019AD0C
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 15:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732542AbgDANpM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 09:45:12 -0400
Received: from foss.arm.com ([217.140.110.172]:52264 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732205AbgDANpM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Apr 2020 09:45:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 454D830E;
        Wed,  1 Apr 2020 06:45:11 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4853F71E;
        Wed,  1 Apr 2020 06:45:08 -0700 (PDT)
References: <20200401100029.1445-1-john.mathew@unikie.com> <20200401100029.1445-3-john.mathew@unikie.com> <20200401103520.GA20713@hirez.programming.kicks-ass.net> <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com> <20200401122606.GF20713@hirez.programming.kicks-ass.net>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Daniel Bristot de Oliveira <bristot@redhat.com>,
        John Mathew <john.mathew@unikie.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        tsbogend@alpha.franken.de, lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview documentation
In-reply-to: <20200401122606.GF20713@hirez.programming.kicks-ass.net>
Date:   Wed, 01 Apr 2020 14:45:06 +0100
Message-ID: <jhjv9mjjp5p.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On Wed, Apr 01 2020, Peter Zijlstra wrote:
> On Wed, Apr 01, 2020 at 01:47:04PM +0200, Daniel Bristot de Oliveira wrote:
>> On 4/1/20 12:35 PM, Peter Zijlstra wrote:
>> >> +Scheduler State Transition
>> >> +==========================
>> >> +
>> >> +A very high level scheduler state transition flow with a few states can be
>> >> +depicted as follows.
>> >> +
>> >> +.. kernel-render:: DOT
>> >> +   :alt: DOT digraph of Scheduler state transition
>> >> +   :caption: Scheduler state transition
>> >> +
>> >> +   digraph sched_transition {
>> >> +      node [shape = point,  label="exisiting task\n calls fork()"]; fork
>> >> +      node [shape = box, label="TASK_NEW\n(Ready to run)"] tsk_new;
>> >> +      node [shape = box, label="TASK_RUNNING\n(Ready to run)"] tsk_ready_run;
>> >> +      node [shape = box, label="TASK_RUNNING\n(Running)"] tsk_running;
>> >> +      node [shape = box, label="TASK_DEAD\nEXIT_ZOMBIE"] exit_zombie;
>> >> +      node [shape = box, label="TASK_INTERRUPTIBLE\nTASK_UNINTERRUPTIBLE\nTASK_WAKEKILL"] tsk_int;
>> >> +      fork -> tsk_new [ label = "task\nforks" ];
>> >> +      tsk_new -> tsk_ready_run;
>> >> +      tsk_ready_run -> tsk_running [ label = "schedule() calls context_switch()" ];
>> >> +      tsk_running -> tsk_ready_run [ label = "task is pre-empted" ];
>> >> +      subgraph int {
>> >> +         tsk_running -> tsk_int [ label = "task needs to wait for event" ];
>> >> +         tsk_int ->  tsk_ready_run [ label = "event occurred" ];
>> >> +      }
>> >> +      tsk_int ->  exit_zombie [ label = "task exits via do_exit()" ];
>> >> +   }
>> > And that is a prime example of why I hates RST, it pretty much mandates
>> > you view this with something other than a text editor.
>>
>> The good thing about the dot format is that we can convert it to many other
>> formats, including text:
>
> Oh, I know and love dot files, I generate them occasionally. But they
> stink as end-result, which is what it is here.
>
> If you can't read a document (or worse comment) in a code editor it's
> broken (and yes, I know some subsystems have a different opinion here).

Agreed. Feel free to use dot to draw stuff, but please include the textual
version in the doc. If you really insist on having a fancier image in the
web output, have a look at things like ditaa (or whatever equivalent is
supported in rst).
