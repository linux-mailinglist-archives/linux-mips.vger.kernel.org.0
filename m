Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09E2BC7A4
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 14:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504864AbfIXMKe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 08:10:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56104 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbfIXMKe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 08:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Py99/bUhc96pJg4JneE/EcK3DluCeStWrFG1PdjjrUQ=; b=Er9FZK69DqPnnmZdOt8/DcwRo
        ALWJIRUL5g/PNUrF624BGuY8eUM12KssF79Ga1DDfsCUn6q4Q/noDQV3MDJzkMzDgjJ9K+Gsgx/qw
        z2jBYR36Lm9NISmBiwNgM1OVm93ble/u5hO8dnKM4Xjz6CBsyCWUGdblYT2QE6VUbNxVzuYf54LAD
        JCqYDtJVEUSCXS3/f3084ucmwUJUC3zu/8YHXTjtReGzSYU7Y0YKz05oE+4koDSooPl661Rq66knE
        eS4ZvXd6HuDlU5tg67hLR2FkTqQO1gGPVT9FjjlWTSU9bku1wTx3gPXroU8weR0USqNsZyzyqOcMH
        tK77ylYmQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCjda-0007nC-K2; Tue, 24 Sep 2019 12:09:46 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7120305E54;
        Tue, 24 Sep 2019 14:08:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7FC4920C3E176; Tue, 24 Sep 2019 14:09:43 +0200 (CEST)
Date:   Tue, 24 Sep 2019 14:09:43 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com,
        axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
        linux-alpha@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        mwb@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, tbogendoerfer@suse.de,
        linux-mips@vger.kernel.org, rafael@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924120943.GP2349@hirez.programming.kicks-ass.net>
References: <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924115401.GM23050@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 24, 2019 at 01:54:01PM +0200, Michal Hocko wrote:
> On Tue 24-09-19 13:23:49, Peter Zijlstra wrote:
> > On Tue, Sep 24, 2019 at 12:56:22PM +0200, Michal Hocko wrote:
> [...]
> > > To be honest I really fail to see why to object to a simple semantic
> > > that NUMA_NO_NODE imply all usable cpus. Could you explain that please?
> > 
> > Because it feels wrong. The device needs to be _somewhere_. It simply
> > cannot be node-less.
> 
> What if it doesn't have any numa preference for what ever reason? There
> is no other way to express that than NUMA_NO_NODE.

Like I said; how does that physically work? The device needs to be
somewhere. It _must_ have a preference.

> Anyway, I am not going to argue more about this because it seems more of
> a discussion about "HW shouldn't be doing that although the specification
> allows that" which cannot really have any outcome except of "feels
> correct/wrong".

We can push back and say we don't respect the specification because it
is batshit insane ;-)

> If you really feel strongly about this then we should think of a proper
> way to prevent this to happen because an out-of-bound access is
> certainly not something we really want, right?

I just genuinely don't understand it. And I refuse to duct tape it.

And as shown in that email here:

  https://lkml.kernel.org/r/5a188e2b-6c07-a9db-fbaa-561e9362d3ba@huawei.com

there is a ton of broken...

15.061682] node node0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
...
15.285602] node node3: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

15.360241] cpu cpu0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
...
24.768305] cpu cpu127: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

39.623339] clockevents clockevent0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
...
48.769530] clockevents clockevent127: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

That's all broken for no reason.. those things actually _have_ a trivial
node affinity.

By silently accepting we let this stuff fester.

Now granted; there's a number of virtual devices that really don't have
a node affinity, but then, those are not hurt by forcing them onto a
random node, they really don't do anything. Like:

48.913502] event_source armv8_pmuv3_0: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
48.985462] event_source breakpoint: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.057120] event_source uprobe: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.128431] event_source kprobe: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.199742] event_source tracepoint: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
49.271399] event_source software: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.

That's just fake devices to get a sysfs entry.
