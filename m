Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39D2BC815
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 14:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440951AbfIXMpA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 08:45:00 -0400
Received: from merlin.infradead.org ([205.233.59.134]:48768 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439119AbfIXMo7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 08:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=z5wfISW69eZ/kWXd4xS3/YcskS/mxFjheiW7ixIex14=; b=WIMYj2tRUrC7JYkCCQxCqzPmr
        eY7v/diobkQ+WLbrXSbzwyxW4iMZCZphUYFSPt9rrDdGl9ZKXo2i0OceglW9WDcIPsjHcxD15Qc2Y
        K9ozUDMls72WuTWCN/TorFuAf4A6PAQ5Xh0ACawwLZJ3mXrTTg1uJPW5mjf7w7vC5NgBQBysGTU3U
        np6ZtqoWQ0GKmiKv0p0ouxKN6kL4WmFc01pnfZxtbBI58YXEugJXvMXqBuEOAvfAG3Jp3qPhZ64vT
        Mxyw8HrGyIIAC9fvxv9ZzX7kCmie2FgIcHYDOFNNUFZSLhS4fE7hRJwacFZpyQ7/PXoAr3A3VCJbg
        mK0txX+5A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCkAF-0000Nf-M0; Tue, 24 Sep 2019 12:43:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 17485305E35;
        Tue, 24 Sep 2019 14:42:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id AD4FF20D83742; Tue, 24 Sep 2019 14:43:25 +0200 (CEST)
Date:   Tue, 24 Sep 2019 14:43:25 +0200
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
Message-ID: <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
References: <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924122500.GP23050@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 24, 2019 at 02:25:00PM +0200, Michal Hocko wrote:
> On Tue 24-09-19 14:09:43, Peter Zijlstra wrote:

> > We can push back and say we don't respect the specification because it
> > is batshit insane ;-)
> 
> Here is my fingers crossed.
> 
> [...]
> 
> > Now granted; there's a number of virtual devices that really don't have
> > a node affinity, but then, those are not hurt by forcing them onto a
> > random node, they really don't do anything. Like:
> 
> Do you really consider a random node a better fix than simply living
> with a more robust NUMA_NO_NODE which tells the actual state? Page
> allocator would effectivelly use the local node in that case. Any code
> using the cpumask will know that any of the online cpus are usable.

For the pmu devices? Yes, those 'devices' aren't actually used for
anything other than sysfs entries.

Nothing else uses the struct device.

> Compare that to a wild guess that might be easily wrong and have subtle
> side effects which are really hard to debug. You will only see a higher
> utilization on a specific node. Good luck with a bug report like that.

We'd have the FW_BUG in the dmesg, which should be a big fat clue.


