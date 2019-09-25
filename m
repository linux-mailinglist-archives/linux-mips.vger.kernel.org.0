Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 179B2BDEE6
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2019 15:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406228AbfIYNZw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Sep 2019 09:25:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:57812 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406079AbfIYNZw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Sep 2019 09:25:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0D081B0B6;
        Wed, 25 Sep 2019 13:25:49 +0000 (UTC)
Date:   Wed, 25 Sep 2019 15:25:44 +0200
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
Message-ID: <20190925132544.GL23050@dhcp22.suse.cz>
References: <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925104040.GD4553@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed 25-09-19 12:40:40, Peter Zijlstra wrote:
> On Tue, Sep 24, 2019 at 03:19:39PM +0200, Michal Hocko wrote:
> 
> > > The below would get rid of the PMU and workqueue warnings with no
> > > side-effects (the device isn't used for anything except sysfs).
> > 
> > Hardcoding to 0 is simply wrong, if the node0 is cpuless for example...
> 
> It doesn't matter.... that 0 is _never_ used. These are fake devices,
> and all we care about is getting rid of that error.

That is a very subtle and hard to review assumption. Even if this holds
now a future change might easily break this AFAIU. It also assumes that
you catch all such special devices.

I am sorry but I still do not understand why you consider this whack a
mole better then simply live with the fact that NUMA_NO_NODE is a
reality and that using the full cpu mask is a reasonable answer to that.
Anyway, I feel we are loop here so I will leave out the final decision
to you.

> If it makes you feel better we can make it -2 and have dev_to_node()
> WARN if it ever sees one.

That would help

-- 
Michal Hocko
SUSE Labs
