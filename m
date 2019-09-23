Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061B5BB7E4
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 17:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbfIWP3E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 11:29:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:51768 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725951AbfIWP3E (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Sep 2019 11:29:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3DAA9AD85;
        Mon, 23 Sep 2019 15:28:59 +0000 (UTC)
Date:   Mon, 23 Sep 2019 17:28:56 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <20190923152856.GB17206@dhcp22.suse.cz>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923151519.GE2369@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon 23-09-19 17:15:19, Peter Zijlstra wrote:
> On Tue, Sep 17, 2019 at 08:48:54PM +0800, Yunsheng Lin wrote:
> > When passing the return value of dev_to_node() to cpumask_of_node()
> > without checking if the device's node id is NUMA_NO_NODE, there is
> > global-out-of-bounds detected by KASAN.
> > 
> > From the discussion [1], NUMA_NO_NODE really means no node affinity,
> > which also means all cpus should be usable. So the cpumask_of_node()
> > should always return all cpus online when user passes the node id as
> > NUMA_NO_NODE, just like similar semantic that page allocator handles
> > NUMA_NO_NODE.
> > 
> > But we cannot really copy the page allocator logic. Simply because the
> > page allocator doesn't enforce the near node affinity. It just picks it
> > up as a preferred node but then it is free to fallback to any other numa
> > node. This is not the case here and node_to_cpumask_map will only restrict
> > to the particular node's cpus which would have really non deterministic
> > behavior depending on where the code is executed. So in fact we really
> > want to return cpu_online_mask for NUMA_NO_NODE.
> > 
> > Also there is a debugging version of node_to_cpumask_map() for x86 and
> > arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> > patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
> > 
> > [1] https://lore.kernel.org/patchwork/patch/1125789/
> 
> That is bloody unusable, don't do that. Use:
> 
>   https://lkml.kernel.org/r/$MSGID
> 
> if anything. Then I can find it in my local mbox without having to
> resort to touching a mouse and shitty browser software.
> 
> (also patchwork is absolute crap for reading email threads)
> 
> Anyway, I found it -- I think, I refused to click the link. I replied
> there.
> 
> > Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> > Suggested-by: Michal Hocko <mhocko@kernel.org>
> > Acked-by: Michal Hocko <mhocko@suse.com>
> 
> 
> 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 4123100e..9859acb 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
> >   */
> >  const struct cpumask *cpumask_of_node(int node)
> >  {
> > +	if (node == NUMA_NO_NODE)
> > +		return cpu_online_mask;
> 
> This mandates the caller holds cpus_read_lock() or something, I'm pretty
> sure that if I put:
> 
> 	lockdep_assert_cpus_held();

Is this documented somewhere? Also how does that differ from a normal
case when a proper node is used? The cpumask will always be dynamic in
the cpu hotplug presence, right?

> here, it comes apart real quick. Without holding the cpu hotplug lock,
> the online mask is gibberish.

Can the returned cpu mask go away?
-- 
Michal Hocko
SUSE Labs
