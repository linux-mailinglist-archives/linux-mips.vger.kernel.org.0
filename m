Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304B4BC639
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 13:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395018AbfIXLHn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 07:07:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35638 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394981AbfIXLHn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Sep 2019 07:07:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D77FEB6C3883268478B0;
        Tue, 24 Sep 2019 19:07:40 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Sep 2019
 19:07:37 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To:     Peter Zijlstra <peterz@infradead.org>
CC:     Michal Hocko <mhocko@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
        <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
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
 <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
 <20190924092551.GK2369@hirez.programming.kicks-ass.net>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <c816abbe-155b-504b-cef1-6413f7cdd20c@huawei.com>
Date:   Tue, 24 Sep 2019 19:07:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190924092551.GK2369@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/24 17:25, Peter Zijlstra wrote:
> On Tue, Sep 24, 2019 at 09:29:50AM +0800, Yunsheng Lin wrote:
>> On 2019/9/24 4:34, Peter Zijlstra wrote:
> 
>>> I'm saying the ACPI standard is wrong. Explain to me how it is
>>> physically possible to have a device without NUMA affinity in a NUMA
>>> system?
>>>
>>>  1) The fundamental interconnect is not uniform.
>>>  2) The device needs to actually be somewhere.
>>>
>>
>> From what I can see, NUMA_NO_NODE may make sense in the below case:
>>
>> 1) Theoretically, there would be a device that can access all the memory
>> uniformly and can be accessed by all cpus uniformly even in a NUMA system.
>> Suppose we have two nodes, and the device just sit in the middle of the
>> interconnect between the two nodes.
>>
>> Even we define a third node solely for the device, we may need to look at
>> the node distance to decide the device can be accessed uniformly.
>>
>> Or we can decide that the device can be accessed uniformly by setting
>> it's node to NUMA_NO_NODE.
> 
> This is indeed a theoretical case; it doesn't scale. The moment you're
> adding multiple sockets or even board interconnects this all goes out
> the window.
> 
> And in this case, forcing the device to either node is fine.

Not really.
For packet sending and receiving, the buffer memory may be allocated
dynamically. Node of tx buffer memory is mainly based on the cpu
that is sending sending, node of rx buffer memory is mainly based on
the cpu the interrupt handler of the device is running on, and the
device' interrupt affinity is mainly based on node id of the device.

We can bind the processes that are using the device to both nodes
in order to utilize memory on both nodes for packet sending.

But for packet receiving, the node1 may not be used becuase the node
id of device is forced to node 0, which is the default way to bind
the interrupt to the cpu of the same node.

If node_to_cpumask_map() returns all usable cpus when the device's node
id is NUMA_NO_NODE, then interrupt can be binded to the cpus on both nodes.

> 
>> 2) For many virtual deivces, such as tun or loopback netdevice, they
>> are also accessed uniformly by all cpus.
> 
> Not true; the virtual device will sit in memory local to some node.
> 
> And as with physical devices, you probably want at least one (virtual)
> queue per node.

There may be similar handling as above for virtual device too.

> 
> 
> .
> 

