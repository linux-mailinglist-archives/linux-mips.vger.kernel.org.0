Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3BDB3A38
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2019 14:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732490AbfIPMYl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Sep 2019 08:24:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:41480 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727783AbfIPMYk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Sep 2019 08:24:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2F895B643;
        Mon, 16 Sep 2019 12:24:37 +0000 (UTC)
Date:   Mon, 16 Sep 2019 14:23:59 +0200
From:   Michal Hocko <mhocko@kernel.org>
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
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        len.brown@intel.com, axboe@kernel.dk, dledford@redhat.com,
        jeffrey.t.kirsher@intel.com, linux-alpha@vger.kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, mwb@linux.vnet.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        tbogendoerfer@suse.de, linux-mips@vger.kernel.org,
        rafael@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190916122359.GG10231@dhcp22.suse.cz>
References: <1568535656-158979-1-git-send-email-linyunsheng@huawei.com>
 <20190916084328.GC10231@dhcp22.suse.cz>
 <8df06e27-ad21-bf14-dbd6-cc8f5a274ec2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df06e27-ad21-bf14-dbd6-cc8f5a274ec2@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon 16-09-19 20:07:22, Yunsheng Lin wrote:
[...]
> >> @@ -861,9 +861,12 @@ void numa_remove_cpu(int cpu)
> >>   */
> >>  const struct cpumask *cpumask_of_node(int node)
> >>  {
> >> -	if (node >= nr_node_ids) {
> >> +	if (node == NUMA_NO_NODE)
> >> +		return cpu_online_mask;
> >> +
> >> +	if ((unsigned int)node >= nr_node_ids) {
> >>  		printk(KERN_WARNING
> >> -			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
> >> +			"cpumask_of_node(%d): node >= nr_node_ids(%u)\n",
> >>  			node, nr_node_ids);
> >>  		dump_stack();
> >>  		return cpu_none_mask;
> > 
> > Why do we need this?
> 
> As the commit log says, the above cpumask_of_node() is for debugging,
> it should catch other "node < 0" cases except NUMA_NO_NODE.

OK, I would just make it a separate patch.

-- 
Michal Hocko
SUSE Labs
