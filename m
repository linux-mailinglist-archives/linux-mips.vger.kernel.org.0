Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF99BD2551
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 11:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389317AbfJJI5n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 04:57:43 -0400
Received: from merlin.infradead.org ([205.233.59.134]:57860 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389496AbfJJI5m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Oct 2019 04:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rb2GpQEK1mzik7VDpp+Q0B0w/sBe3+HggdUz3hckVXc=; b=GheWtHyuaOnqUCnRP+8IuZIby
        4L30bGsje9ocd5iUH8NVIyCuSMdmhnrmZrWz4CqW+5c5ARUagEFX1CvM76na3juS0ZJgeA2iYqwk/
        vwGspjDN5aU24+JGaDMCixz3MgBW377tOmmXo2TWuT0UuPWw0cRhImx8n6XpmynMtaPKIAN3DBxTa
        0KYATEHfwUVLJhVPmXdgaiKw32BBuEEZNOhzsRv1MWaogEY/OvQauPZeduJb2hzhIlP3nOAsoN5Rl
        /qvf5mbxvb8slIP6EE8OU3wON/t6u1zPMDLdVuSRCezXRpuRyx1ogUaXW7AVDphTfQVYCd6ZMVuiy
        IrIgGZokA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iIUFD-0000dI-8N; Thu, 10 Oct 2019 08:56:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B86223074EB;
        Thu, 10 Oct 2019 10:55:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id DBA9E202F4F50; Thu, 10 Oct 2019 10:56:16 +0200 (CEST)
Date:   Thu, 10 Oct 2019 10:56:16 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>,
        Michal Hocko <mhocko@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com,
        luto@kernel.org, len.brown@intel.com, axboe@kernel.dk,
        dledford@redhat.com, jeffrey.t.kirsher@intel.com,
        linux-alpha@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        mwb@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, tbogendoerfer@suse.de,
        linux-mips@vger.kernel.org, rafael@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191010085616.GQ2311@hirez.programming.kicks-ass.net>
References: <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 09, 2019 at 01:25:14PM +0100, Robin Murphy wrote:
> On 2019-10-08 9:38 am, Yunsheng Lin wrote:
> > On 2019/9/25 18:41, Peter Zijlstra wrote:
> > > On Wed, Sep 25, 2019 at 05:14:20PM +0800, Yunsheng Lin wrote:
> > > >  From the discussion above, It seems making the node_to_cpumask_map()
> > > > NUMA_NO_NODE aware is the most feasible way to move forwad.
> > > 
> > > That's still wrong.
> > 
> > Hi, Peter
> > 
> > It seems this has trapped in the dead circle.
> > 
> >  From my understanding, NUMA_NO_NODE which means not node numa preference
> > is the state to describe the node of virtual device or the physical device
> > that has equal distance to all cpu.

So I _really_ don't believe in the equidistant physical device. Physics
just doesn't allow that. Or rather, you can, but then it'll be so slow
it doesn't matter.

The only possible option is equidistant to a _small_ number of nodes,
and if that is a reality, then we should look at that. So far however
it's purely been a hypothetical device.

> > We can be stricter if the device does have a nearer node, but we can not
> > deny that a device does not have a node numa preference or node affinity,
> > which also means the control or data buffer can be allocated at the node where
> > the process is running.
> > 
> > As you has proposed, making it -2 and have dev_to_node() warn if the device does
> > have a nearer node and not set by the fw is a way to be stricter.

Because it is 100% guaranteed (we have proof) that BIOS is shit and
doesn't set node affinity for devices that really should have it.

So we're trading a hypothetical shared device vs not reporting actual
BIOS bugs. That's no contest.

Worse, we have virtual devices that have clear node affinity without it
set.

So we're growing shit, allowing bugs, and what do we get in return? Warm
fuzzies is not it.

> > Any better suggestion to move this forward?
> 
> FWIW (since this is in my inbox), it sounds like the fundamental issue is
> that NUMA_NO_NODE is conflated for at least two different purposes, so
> trying to sort that out would be a good first step. AFAICS we have genuine
> "don't care" cases like alloc_pages_node(), where if the producer says it
> doesn't matter then the consumer is free to make its own judgement on what
> to do, and fundamentally different "we expect this thing to have an affinity
> but it doesn't, so we can't say what's appropriate" cases which could really
> do with some separate indicator like "NUMA_INVALID_NODE".

It can possible be a 3 state:

 - UNKNON; overridden by parent/bus/etc..
   ERROR when still UNKNOWN on register.

 - INVALID; ERROR on devm usage.
   for virtual devices / pure sysfs nodes

 - NO_NODE; may only be set on virtual devices (we can check against PCI
   bus etc..) when there really is no better option.

But I only want to see the NO_NODE crap at the end, after all other
possible avenues have been done.

> The tricky part is then bestowed on the producers to decide whether they can
> downgrade "invalid" to "don't care". You can technically build 'a device'
> whose internal logic is distributed between nodes and thus appears to have
> equal affinity - interrupt controllers, for example, may have per-CPU or
> per-node interfaces that end up looking like that - so although it's
> unlikely it's not outright nonsensical.

I'm thinking we should/do create per cpu/node devices for such
distributed stuff. For instance, we create per-cpu clockevent devices
(where appropriate).

> Similarly a 'device' that's actually emulated behind a firmware call
> interface may well effectively have no real affinity.

Emulated devices are typically slow as heck and should be avoided if at
all possible. I don't see NUMA affinity being important for them.
