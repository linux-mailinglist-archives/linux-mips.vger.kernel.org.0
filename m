Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 646ACBBFBA
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 03:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404620AbfIXB35 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 21:29:57 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2708 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404600AbfIXB35 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Sep 2019 21:29:57 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id B5C2B8D913E60B3E6185;
        Tue, 24 Sep 2019 09:29:54 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Sep 2019
 09:29:51 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To:     Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>
CC:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>,
        <akpm@linux-foundation.org>, <rppt@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <tglx@linutronix.de>, <cai@lca.pw>,
        <robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <len.brown@intel.com>, <axboe@kernel.dk>, <dledford@redhat.com>,
        <jeffrey.t.kirsher@intel.com>, <linux-alpha@vger.kernel.org>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <rafael@kernel.org>, <gregkh@linuxfoundation.org>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
Date:   Tue, 24 Sep 2019 09:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190923203410.GI2369@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/24 4:34, Peter Zijlstra wrote:
> On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
>> On Mon 23-09-19 17:48:52, Peter Zijlstra wrote:
> 
>> To the NUMA_NO_NODE itself. Your earlier email noted:
>> : > +
>> : >  	if ((unsigned)node >= nr_node_ids) {
>> : >  		printk(KERN_WARNING
>> : >  			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
>> : 
>> : I still think this makes absolutely no sense what so ever.
>>
>> Did you mean the NUMA_NO_NODE handling or the specific node >= nr_node_ids
>> check?
> 
> The NUMA_NO_NODE thing. It's is physical impossibility. And if the
> device description doesn't give us a node, then the description is
> incomplete and wrong and we should bloody well complain about it.
> 
>> Because as to NUMA_NO_NODE I believe this makes sense because this is
>> the only way that a device is not bound to any numa node.
> 
> Which is a physical impossibility.
> 
>> I even the
>> ACPI standard is considering this optional. Yunsheng Lin has referred to
>> the specific part of the standard in one of the earlier discussions.
>> Trying to guess the node affinity is worse than providing all CPUs IMHO.
> 
> I'm saying the ACPI standard is wrong. Explain to me how it is
> physically possible to have a device without NUMA affinity in a NUMA
> system?
> 
>  1) The fundamental interconnect is not uniform.
>  2) The device needs to actually be somewhere.
> 

From what I can see, NUMA_NO_NODE may make sense in the below case:

1) Theoretically, there would be a device that can access all the memory
uniformly and can be accessed by all cpus uniformly even in a NUMA system.
Suppose we have two nodes, and the device just sit in the middle of the
interconnect between the two nodes.

Even we define a third node solely for the device, we may need to look at
the node distance to decide the device can be accessed uniformly.

Or we can decide that the device can be accessed uniformly by setting
it's node to NUMA_NO_NODE.


2) For many virtual deivces, such as tun or loopback netdevice, they
are also accessed uniformly by all cpus.

