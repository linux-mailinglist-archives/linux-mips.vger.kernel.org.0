Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 638D0B4AB8
	for <lists+linux-mips@lfdr.de>; Tue, 17 Sep 2019 11:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfIQJhC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Sep 2019 05:37:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:40034 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726191AbfIQJhC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Sep 2019 05:37:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E6DA5ACC6;
        Tue, 17 Sep 2019 09:36:58 +0000 (UTC)
Date:   Tue, 17 Sep 2019 11:36:55 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, catalin.marinas@arm.com,
        will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        benh@kernel.crashing.org, paulus@samba.org,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
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
Subject: Re: [PATCH v5] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190917093655.GA1872@dhcp22.suse.cz>
References: <1568640481-133352-1-git-send-email-linyunsheng@huawei.com>
 <87pnjzsd8f.fsf@mpe.ellerman.id.au>
 <d748aae4-4d48-6f8a-2f6d-67fad5224ba9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d748aae4-4d48-6f8a-2f6d-67fad5224ba9@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue 17-09-19 14:20:11, Yunsheng Lin wrote:
> On 2019/9/17 13:28, Michael Ellerman wrote:
> > Yunsheng Lin <linyunsheng@huawei.com> writes:
[...]
> >> But we cannot really copy the page allocator logic. Simply because the
> >> page allocator doesn't enforce the near node affinity. It just picks it
> >> up as a preferred node but then it is free to fallback to any other numa
> >> node. This is not the case here and node_to_cpumask_map will only restrict
> >> to the particular node's cpus which would have really non deterministic
> >> behavior depending on where the code is executed. So in fact we really
> >> want to return cpu_online_mask for NUMA_NO_NODE.
> >>
> >> Some arches were already NUMA_NO_NODE aware, but they return cpu_all_mask,
> >> which should be identical with cpu_online_mask when those arches do not
> >> support cpu hotplug, this patch also changes them to return cpu_online_mask
> >> in order to be consistent and use NUMA_NO_NODE instead of "-1".
> > 
> > Except some of those arches *do* support CPU hotplug, powerpc and sparc
> > at least. So switching from cpu_all_mask to cpu_online_mask is a
> > meaningful change.
> 
> Yes, thanks for pointing out.
> 
> > 
> > That doesn't mean it's wrong, but you need to explain why it's the right
> > change.
> 
> How about adding the below to the commit log:
> Even if some of the arches do support CPU hotplug, it does not make sense
> to return the cpu that has been hotplugged.
>
> Any suggestion?

Again, for the third time, I believe. Make it a separate patch please.
There is absolutely no reason to conflate those two things.
-- 
Michal Hocko
SUSE Labs
