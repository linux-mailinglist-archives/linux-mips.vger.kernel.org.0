Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935C3A43E7
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 12:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfHaKKR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 06:10:17 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6158 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726650AbfHaKKR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 06:10:17 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 1A9E488D2CD023DF4C0A;
        Sat, 31 Aug 2019 18:10:11 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sat, 31 Aug 2019
 18:10:04 +0800
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
To:     Peter Zijlstra <peterz@infradead.org>
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
        <nfont@linux.vnet.ibm.com>, <naveen.n.rao@linux.vnet.ibm.com>,
        <mwb@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <tbogendoerfer@suse.de>,
        <linux-mips@vger.kernel.org>, <linuxarm@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
Date:   Sat, 31 Aug 2019 18:09:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190831085539.GG2369@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2019/8/31 16:55, Peter Zijlstra wrote:
> On Sat, Aug 31, 2019 at 01:58:16PM +0800, Yunsheng Lin wrote:
>> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
>> of proximity domain is optional, as below:
>>
>> This optional object is used to describe proximity domain
>> associations within a machine. _PXM evaluates to an integer
>> that identifies a device as belonging to a Proximity Domain
>> defined in the System Resource Affinity Table (SRAT).
> 
> That's just words.. what does it actually mean?

It means the dev_to_node(dev) may return -1 if the bios does not
implement the proximity domain feature, user may use that value
to call cpumask_of_node and cpumask_of_node does not protect itself
from node id being -1, which causes out of bound access.

> 
>> This patch checks node id with the below case before returning
>> node_to_cpumask_map[node]:
>> 1. if node_id >= nr_node_ids, return cpu_none_mask
>> 2. if node_id < 0, return cpu_online_mask
>> 3. if node_to_cpumask_map[node_id] is NULL, return cpu_online_mask
>>
>> [1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
>>
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> ---
>>  arch/x86/include/asm/topology.h | 6 ++++++
>>  arch/x86/mm/numa.c              | 2 +-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
>> index 4b14d23..f36e9c8 100644
>> --- a/arch/x86/include/asm/topology.h
>> +++ b/arch/x86/include/asm/topology.h
>> @@ -69,6 +69,12 @@ extern const struct cpumask *cpumask_of_node(int node);
>>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>>  static inline const struct cpumask *cpumask_of_node(int node)
>>  {
>> +	if (node >= nr_node_ids)
>> +		return cpu_none_mask;
>> +
>> +	if (node < 0 || !node_to_cpumask_map[node])
>> +		return cpu_online_mask;
>> +
>>  	return node_to_cpumask_map[node];
>>  }
>>  #endif
> 
> I _reallly_ hate this. Users are expected to use valid numa ids. Now
> we're adding all this checking to all users. Why do we want to do that?

As above, the dev_to_node(dev) may return -1.

> 
> Using '(unsigned)node >= nr_nods_ids' is an error.

'node >= nr_node_ids' can be dropped if all user is expected to not call
cpumask_of_node with node id greater or equal to nr_nods_ids.

From what I can see, the problem can be fixed in three place:
1. Make user dev_to_node return a valid node id even when proximity
   domain is not set by bios(or node id set by buggy bios is not valid),
   which may need info from the numa system to make sure it will return
   a valid node.

2. User that call cpumask_of_node should ensure the node id is valid
   before calling cpumask_of_node, and user also need some info to
   make ensure node id is valid.

3. Make sure cpumask_of_node deal with invalid node id as this patchset.

Which one do you prefer to make sure node id is valid, or do you
have any better idea?

Any detail advice and suggestion will be very helpful, thanks.

> 
>> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
>> index e6dad60..5e393d2 100644
>> --- a/arch/x86/mm/numa.c
>> +++ b/arch/x86/mm/numa.c
>> @@ -868,7 +868,7 @@ const struct cpumask *cpumask_of_node(int node)
>>  		dump_stack();
>>  		return cpu_none_mask;
>>  	}
>> -	if (node_to_cpumask_map[node] == NULL) {
>> +	if (node < 0 || !node_to_cpumask_map[node]) {
>>  		printk(KERN_WARNING
>>  			"cpumask_of_node(%d): no node_to_cpumask_map!\n",
>>  			node);
>> -- 
>> 2.8.1
>>
> 
> .
> 

