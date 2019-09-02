Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2D2A4EE9
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 07:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbfIBFrh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 01:47:37 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5706 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729403AbfIBFrh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Sep 2019 01:47:37 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 841D5224CEFB5C28D060;
        Mon,  2 Sep 2019 13:47:28 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Sep 2019
 13:47:19 +0800
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
To:     Peter Zijlstra <peterz@infradead.org>
CC:     <dalias@libc.org>, <linux-sh@vger.kernel.org>,
        <catalin.marinas@arm.com>, <dave.hansen@linux.intel.com>,
        <heiko.carstens@de.ibm.com>, <linuxarm@huawei.com>,
        <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>,
        <mwb@linux.vnet.ibm.com>, <paulus@samba.org>, <hpa@zytor.com>,
        <sparclinux@vger.kernel.org>, <chenhc@lemote.com>,
        <will@kernel.org>, <cai@lca.pw>, <linux-s390@vger.kernel.org>,
        <ysato@users.sourceforge.jp>, <mpe@ellerman.id.au>,
        <x86@kernel.org>, <rppt@linux.ibm.com>, <borntraeger@de.ibm.com>,
        <dledford@redhat.com>, <mingo@redhat.com>,
        <jeffrey.t.kirsher@intel.com>, <benh@kernel.crashing.org>,
        <jhogan@kernel.org>, <nfont@linux.vnet.ibm.com>,
        <mattst88@gmail.com>, <len.brown@intel.com>, <gor@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <bp@alien8.de>, <luto@kernel.org>,
        <tglx@linutronix.de>, <naveen.n.rao@linux.vnet.ibm.com>,
        <linux-arm-kernel@lists.infradead.org>, <rth@twiddle.net>,
        <axboe@kernel.dk>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>, <ralf@linux-mips.org>,
        <tbogendoerfer@suse.de>, <paul.burton@mips.com>,
        <linux-alpha@vger.kernel.org>, <ink@jurassic.park.msu.ru>,
        <akpm@linux-foundation.org>, <robin.murphy@arm.com>,
        <davem@davemloft.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
Date:   Mon, 2 Sep 2019 13:46:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190831161247.GM2369@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/1 0:12, Peter Zijlstra wrote:
> On Sat, Aug 31, 2019 at 06:09:39PM +0800, Yunsheng Lin wrote:
>>
>>
>> On 2019/8/31 16:55, Peter Zijlstra wrote:
>>> On Sat, Aug 31, 2019 at 01:58:16PM +0800, Yunsheng Lin wrote:
>>>> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
>>>> of proximity domain is optional, as below:
>>>>
>>>> This optional object is used to describe proximity domain
>>>> associations within a machine. _PXM evaluates to an integer
>>>> that identifies a device as belonging to a Proximity Domain
>>>> defined in the System Resource Affinity Table (SRAT).
>>>
>>> That's just words.. what does it actually mean?
>>
>> It means the dev_to_node(dev) may return -1 if the bios does not
>> implement the proximity domain feature, user may use that value
>> to call cpumask_of_node and cpumask_of_node does not protect itself
>> from node id being -1, which causes out of bound access.
> 
>>>> @@ -69,6 +69,12 @@ extern const struct cpumask *cpumask_of_node(int node);
>>>>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>>>>  static inline const struct cpumask *cpumask_of_node(int node)
>>>>  {
>>>> +	if (node >= nr_node_ids)
>>>> +		return cpu_none_mask;
>>>> +
>>>> +	if (node < 0 || !node_to_cpumask_map[node])
>>>> +		return cpu_online_mask;
>>>> +
>>>>  	return node_to_cpumask_map[node];
>>>>  }
>>>>  #endif
>>>
>>> I _reallly_ hate this. Users are expected to use valid numa ids. Now
>>> we're adding all this checking to all users. Why do we want to do that?
>>
>> As above, the dev_to_node(dev) may return -1.
>>
>>>
>>> Using '(unsigned)node >= nr_nods_ids' is an error.
>>
>> 'node >= nr_node_ids' can be dropped if all user is expected to not call
>> cpumask_of_node with node id greater or equal to nr_nods_ids.
> 
> you copied my typo :-)

I did note the typo, corrected the first one, but missed the second one :)

> 
>> From what I can see, the problem can be fixed in three place:
>> 1. Make user dev_to_node return a valid node id even when proximity
>>    domain is not set by bios(or node id set by buggy bios is not valid),
>>    which may need info from the numa system to make sure it will return
>>    a valid node.
>>
>> 2. User that call cpumask_of_node should ensure the node id is valid
>>    before calling cpumask_of_node, and user also need some info to
>>    make ensure node id is valid.
>>
>> 3. Make sure cpumask_of_node deal with invalid node id as this patchset.
>>
>> Which one do you prefer to make sure node id is valid, or do you
>> have any better idea?
>>
>> Any detail advice and suggestion will be very helpful, thanks.
> 
> 1) because even it is not set, the device really does belong to a node.
> It is impossible a device will have magic uniform access to memory when
> CPUs cannot.

So it means dev_to_node() will return either NUMA_NO_NODE or a
valid node id?

> 
> 2) is already true today, cpumask_of_node() requires a valid node_id.

Ok, most of the user does check node_id before calling
cpumask_of_node(), but does a little different type of checking:

1) some does " < 0" check;
2) some does "== NUMA_NO_NODE" check;
3) some does ">= MAX_NUMNODES" check;
4) some does "< 0 || >= MAX_NUMNODES || !node_online(node)" check.


> 
> 3) is just wrong and increases overhead for everyone.

Ok, cpumask_of_node() is also used in some critical path such
as scheduling, which may not need those checking, the overhead
is unnecessary.

But for non-critical path such as setup or configuration path,
it better to have consistent checking, and also simplify the
user code that calls cpumask_of_node().

Do you think it is worth the trouble to add a new function
such as cpumask_of_node_check(maybe some other name) to do
consistent checking?

Or caller just simply check if dev_to_node()'s return value is
NUMA_NO_NODE before calling cpumask_of_node()?


> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> .
> 

