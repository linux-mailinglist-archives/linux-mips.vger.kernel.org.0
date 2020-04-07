Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6DB1A161E
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 21:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgDGTkb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 15:40:31 -0400
Received: from ms.lwn.net ([45.79.88.28]:40610 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgDGTkb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Apr 2020 15:40:31 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 82BD260C;
        Tue,  7 Apr 2020 19:40:29 +0000 (UTC)
Date:   Tue, 7 Apr 2020 13:40:28 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        John Mathew <john.mathew@unikie.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        tsbogend@alpha.franken.de, lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200407134028.44d0d16a@lwn.net>
In-Reply-To: <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com>
References: <20200401100029.1445-1-john.mathew@unikie.com>
        <20200401100029.1445-3-john.mathew@unikie.com>
        <20200401103520.GA20713@hirez.programming.kicks-ass.net>
        <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 1 Apr 2020 13:47:04 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> > And that is a prime example of why I hates RST, it pretty much mandates
> > you view this with something other than a text editor.  
> 
> The good thing about the dot format is that we can convert it to many other
> formats, including text:
> 
> [bristot@x1 ~]$ cat sched_transition.dot | graph-easy 
> 
>                        *
> 
>                        |
>                        | task
>                        | forks
>                        v
>                      +------------------------------------+
>                      |              TASK_NEW              |
>                      |           (Ready to run)           |
>                      +------------------------------------+
>                        |
>                        |
>                        v
> + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+
> '                                     int                                            '
> '                                                                                    '
> '                    +------------------------------------+                          '
> '                    |            TASK_RUNNING            |                          '
> '   +--------------> |           (Ready to run)           | <--+                     '
> '   |                +------------------------------------+    |                     '
> '   |                  |                                       |                     '
> '   |                  | schedule() calls context_switch()     | task is pre-empted  '
> '   |                  v                                       |                     '
> '   |                +------------------------------------+    |                     '
> '   |                |            TASK_RUNNING            |    |                     '
> '   |                |             (Running)              | ---+                     '
> '   | event occurred +------------------------------------+                          '
> '   |                  |                                                             '
> '   |                  |                                      - - - - - - - - - - - -+
> '   |                  |                                    '
> '   |                  | task needs to wait for event       '
> '   |                  v                                    '
> '   |                +------------------------------------+ '
> '   |                |         TASK_INTERRUPTIBLE         | '
> '   |                |        TASK_UNINTERRUPTIBLE        | '
> '   +--------------- |           TASK_WAKEKILL            | '
> '                    +------------------------------------+ '
> '                                                           '
> + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
>                        |
>                        | task exits via do_exit()
>                        v
>                      +------------------------------------+
>                      |             TASK_DEAD              |
>                      |            EXIT_ZOMBIE             |
>                      +------------------------------------+
> 
> 
> Is there a way to also add this representation, while hiding it
> when using a graphical reader?

Better, honestly, to just put the ascii art into the doc as a literal
block.  I don't see any real reason to embed Dot stuff unless there's
really no alternative.

Thanks,

jon
