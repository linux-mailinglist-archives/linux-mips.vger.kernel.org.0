Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CABA4BB7AC
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 17:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfIWPRR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 11:17:17 -0400
Received: from merlin.infradead.org ([205.233.59.134]:43144 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfIWPRQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Sep 2019 11:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BQxmWDdzGIFE7S88Yi92UG2auB0mbgTz3kRl3Taa3FI=; b=t8VS6tSnmrlzM+Dk9CyzGPLMt
        N8isqB9JLD9XPobqT8fc3dfzorxqXbSBbiePOLH9slgkt7c8/x6l847kAc6lrKnV82aAO5bDorIMu
        YjjxsscQB6tQ50zT9SFofb+NFESL297iEmmU8/JL29dFjRYomSrEu+QShhTIPw86PoSsMyCz+N/PP
        LCH1puLwbn+9Vw8dPbpuqmsdVuBEbsqqLtzmB4pFdqhwkPpTebf2j/lYsEMVsp/CuFdG7Po9RBYan
        uhdIMZv8znk6MUH0UjYoAWnErPz6C7zS3yuGzEh25kpJXJFr0fXRrE7G8EnTUy9x8JgpkFEGhRUbf
        J3QKktDWQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCQ3h-0004cS-VH; Mon, 23 Sep 2019 15:15:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A8633303DFD;
        Mon, 23 Sep 2019 17:14:34 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id D4E7C20C3E176; Mon, 23 Sep 2019 17:15:19 +0200 (CEST)
Date:   Mon, 23 Sep 2019 17:15:19 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
        bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
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
        linux-mips@vger.kernel.org, rafael@kernel.org, mhocko@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190923151519.GE2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 17, 2019 at 08:48:54PM +0800, Yunsheng Lin wrote:
> When passing the return value of dev_to_node() to cpumask_of_node()
> without checking if the device's node id is NUMA_NO_NODE, there is
> global-out-of-bounds detected by KASAN.
> 
> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> which also means all cpus should be usable. So the cpumask_of_node()
> should always return all cpus online when user passes the node id as
> NUMA_NO_NODE, just like similar semantic that page allocator handles
> NUMA_NO_NODE.
> 
> But we cannot really copy the page allocator logic. Simply because the
> page allocator doesn't enforce the near node affinity. It just picks it
> up as a preferred node but then it is free to fallback to any other numa
> node. This is not the case here and node_to_cpumask_map will only restrict
> to the particular node's cpus which would have really non deterministic
> behavior depending on where the code is executed. So in fact we really
> want to return cpu_online_mask for NUMA_NO_NODE.
> 
> Also there is a debugging version of node_to_cpumask_map() for x86 and
> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
> 
> [1] https://lore.kernel.org/patchwork/patch/1125789/

That is bloody unusable, don't do that. Use:

  https://lkml.kernel.org/r/$MSGID

if anything. Then I can find it in my local mbox without having to
resort to touching a mouse and shitty browser software.

(also patchwork is absolute crap for reading email threads)

Anyway, I found it -- I think, I refused to click the link. I replied
there.

> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>



> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 4123100e..9859acb 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
>   */
>  const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node == NUMA_NO_NODE)
> +		return cpu_online_mask;

This mandates the caller holds cpus_read_lock() or something, I'm pretty
sure that if I put:

	lockdep_assert_cpus_held();

here, it comes apart real quick. Without holding the cpu hotplug lock,
the online mask is gibberish.

> +
>  	if ((unsigned)node >= nr_node_ids) {
>  		printk(KERN_WARNING
>  			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",

I still think this makes absolutely no sense what so ever.
