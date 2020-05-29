Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491001E7FC1
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 16:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgE2OKY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 10:10:24 -0400
Received: from ms.lwn.net ([45.79.88.28]:58654 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726476AbgE2OKY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 10:10:24 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BEE864E5;
        Fri, 29 May 2020 14:10:22 +0000 (UTC)
Date:   Fri, 29 May 2020 08:10:21 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     john mathew <john.mathew@unikie.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, rdunlap@infradead.org,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: Re: [RFC PATCH v5 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200529081021.013e37d9@lwn.net>
In-Reply-To: <20200529110012.GJ706495@hirez.programming.kicks-ass.net>
References: <20200514092637.15684-1-John.Mathew@unikie.com>
        <20200514092637.15684-3-John.Mathew@unikie.com>
        <20200529110012.GJ706495@hirez.programming.kicks-ass.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 29 May 2020 13:00:12 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > +**Thermal Pressure**:  
> 
> I find these attached headers really hard to read. And what's with the
> ** stuff ?
> 
> Other files in this same patch use a different style:
> 
> Header
> ------
> test goes here,
> 
> Which I find a lot more readable. Use it here too?

Normal headers would seem to be appropriate here, yes.

> > +process runs when. In that context, it has the following tasks:
> > +
> > +* share CPU cores equally among all currently running processes.
> > +* pick appropriate process to run next if required, considering scheduling
> > +  class/policy and process priorities.
> > +* balance processes between multiple cores in SMP systems.  
> 
> indent the bullets at least one space, like:
> 
>  * share CPU cores...
>  * pick ..
> 
> Write it like you want to read this as a text document. Ignore all that
> RST bullshit.

The "RST bullshit" can handle a leading space there just fine.

> > +Runqueue
> > +~~~~~~~~
> > +
> > +:c:type:`struct rq <rq>` is the central data structure of process  
> 
> I so hate that rst crap; John, can't we teach the thing that anything
> called 'struct foo' or 'foo_t' is in fact a C type, just like we did
> with foo() being a function?

Yes, we can, we're just waiting for somebody (perhaps even me) to find the
time to do it. Until then, I think we can probably just leave :c:type: out
entirely.

jon
