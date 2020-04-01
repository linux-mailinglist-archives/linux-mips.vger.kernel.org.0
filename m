Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E1F19AB1B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 13:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732146AbgDALyH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 07:54:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38488 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgDALyH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 07:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=AgQFSxEvyQI5c9OqmsGVak2w5TUXqlTckkpw5+VXheM=; b=M5vzK71ssKANYsOooCUYejwb9M
        oFdPsW/spZQC5r3KOxJ24gq/9mmqZqDcq24c6WgDObLoU7x82DOEM9Z591NQYuzlqoWOyDrZIrC3N
        Y2w4Uv1JgeP3Itq1l/CvcZCUrIUjikT5OGTkYtR1wHoXIKeD/atEiUrNvgqxUyHp21kxdk1NofMv0
        vqdUkvpnb2zI8ifnLp6EIa5Kp3YcWBQn2jvMfpSI2WkvTMM7HXKWsb7z82/ESE702oq/wJqtAHPko
        t7GL4ceAWO04X+sq3uZTN6S78IzPP2temA9jDraixrWqO2dfeIDTrr7a/AiAVxDhsEoyDk1aQRPxV
        t4A577TQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJbwZ-0006QH-DI; Wed, 01 Apr 2020 11:54:03 +0000
Date:   Wed, 1 Apr 2020 04:54:03 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200401115403.GG21484@bombadil.infradead.org>
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
> +====================
> +CFS Data Structures
> +====================
> +
> +Main parts of the Linux scheduler are:

The main parts ...

> +**Running Queue:** This is the central data structure of process scheduling. It

I've never heard anyone call this 'Running Queue'.  It's always called
'run queue'.

> +the CPU core. The main members of the :c:type:`struct rq <rq>` are:
> +
> +:c:member:`nr_running`
> +    Total number of tasks on the runqueue.

This seems like it should be kernel-doc so the documentation is with the
code ... meaning it might possibly get updated when the code changes as
opposed to languishing over here.

> +Each rq struct points to a cfs_rq struct which represents the rb tree. The main

How does a cfs_rq struct represent an rb tree?  I suspect what you intended
to say is that the cfs_rq structs are stored in an rb tree (I'm not familiar
with the details of the scheduler implementation).

More generally, you're making a mistake that a lot of documentation
writers make which is to overdescribe the current implementation.
The important thing to document is that they're stored in a tree; the
type of tree used is an irrelevant detail.  If that changes, we shouldn't
need to update this documentation.

> +Each scheduling entity may be run from its parents runqueue. Scheduler traverses

The scheduler ...

also, please format your line lengths to more like 75 characters; don't go
all the way to 80.  Just use 'fmt'; its defaults work fine.

> +vruntime is the value by which tasks are ordered on the red-black tree. Tasks are
> +arranged in increasing order of vruntime which is the amount of time a task has
> +spent running on the cpu.vruntime of a task is updated periodically based on the
> +:c:func:`scheduler_tick` function.

This is a backwards explanation.

vruntime is the amount of time a task has spent running on the cpu.  It is
updated periodically by scheduler_tick().  Tasks are stored in the
scheduler's tree sorted by vruntime.

> +History
> +-------
> +
> +Linux 2.6.23 introduced a modular scheduler core and a Completely Fair Scheduler
> +(CFS) implemented as a scheduling module. Scheduler has been improving since
> +kernel version 2.4. In kernel 2.4  there was one running queue for all processes.

I would drop 'Scheduler has been improving since kernel version 2.4'.  I
just assume that Linux has been improving.

> +CFS uses a time ordered red-black tree for each CPU. The red-black tree is a type
> +of self-balancing binary search tree. Every running process, has a node in the

Don't explain what an rbtree is, just link to the rbtree documentation.
Which, admittedly, hasn't been converted to rst format yet, but link to
rbtree.txt and someone else can fix that up when they do the conversion.

