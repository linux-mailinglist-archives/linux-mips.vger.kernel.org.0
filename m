Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDF9BB882
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 17:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfIWPvF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 11:51:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40272 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbfIWPvF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Sep 2019 11:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0RDd3iHkouZU1pRFRB48/lD4Y4fOddJfRH7mBxc6Vao=; b=NXlQx8HeAqeDb6yqEaTk/519B
        dPw5dQx+43R/Xql9eX//W6l/1vbSDqJBsSKbX0+GgxGyR/lMzRBIJJLwaiBlYUPovHMUeZ4WuI2U9
        pqR/T7IrCuH324g5O+5uhidav3oL5K11yioHiIVa88PxC9Lhl8Af25UBQiNsPQjgWAv5dhal7H8Pm
        kjjT0b4sbkwdVtooJ5V/S1z3/O080RdL39Z8BxDGhymwdoNXrZ7KMaQqR08JJFpuEuA5JxPauwCNC
        NwI5i96tju02O7rB8oB1RofYv2QQUL82ESd4By1d+WKKUSotGlAN05bG1WBwAaFYH+M7oRF/I/hUL
        8rRYpfeYg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCQa9-0006CY-8C; Mon, 23 Sep 2019 15:49:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CEBBA303DFD;
        Mon, 23 Sep 2019 17:48:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0AF5F20D80D41; Mon, 23 Sep 2019 17:48:53 +0200 (CEST)
Date:   Mon, 23 Sep 2019 17:48:52 +0200
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
Message-ID: <20190923154852.GG2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923152856.GB17206@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 23, 2019 at 05:28:56PM +0200, Michal Hocko wrote:
> On Mon 23-09-19 17:15:19, Peter Zijlstra wrote:

> > > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > > index 4123100e..9859acb 100644
> > > --- a/arch/x86/mm/numa.c
> > > +++ b/arch/x86/mm/numa.c
> > > @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
> > >   */
> > >  const struct cpumask *cpumask_of_node(int node)
> > >  {
> > > +	if (node == NUMA_NO_NODE)
> > > +		return cpu_online_mask;
> > 
> > This mandates the caller holds cpus_read_lock() or something, I'm pretty
> > sure that if I put:
> > 
> > 	lockdep_assert_cpus_held();
> 
> Is this documented somewhere?

No idea... common sense :-)

> Also how does that differ from a normal
> case when a proper node is used? The cpumask will always be dynamic in
> the cpu hotplug presence, right?

As per normal yes, and I'm fairly sure there's a ton of bugs. Any
'online' state is subject to change except when you're holding
sufficient locks to stop it.

Disabling preemption also stabilizes it, because cpu unplug relies on
stop-machine.

> > here, it comes apart real quick. Without holding the cpu hotplug lock,
> > the online mask is gibberish.
> 
> Can the returned cpu mask go away?

No, the cpu_online_mask itself has static storage, the contents OTOH can
change at will. Very little practical difference :-)


