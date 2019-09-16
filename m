Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A63DB39F8
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2019 14:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731744AbfIPMHh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Sep 2019 08:07:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2225 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727795AbfIPMHh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Sep 2019 08:07:37 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2EF0699DDD3E64D216AB;
        Mon, 16 Sep 2019 20:07:27 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Sep 2019
 20:07:23 +0800
Subject: Re: [PATCH v4] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To:     Michal Hocko <mhocko@kernel.org>
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
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <naveen.n.rao@linux.vnet.ibm.com>,
        <mwb@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <tbogendoerfer@suse.de>,
        <linux-mips@vger.kernel.org>, <rafael@kernel.org>,
        <gregkh@linuxfoundation.org>
References: <1568535656-158979-1-git-send-email-linyunsheng@huawei.com>
 <20190916084328.GC10231@dhcp22.suse.cz>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <8df06e27-ad21-bf14-dbd6-cc8f5a274ec2@huawei.com>
Date:   Mon, 16 Sep 2019 20:07:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190916084328.GC10231@dhcp22.suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/16 16:43, Michal Hocko wrote:
> On Sun 15-09-19 16:20:56, Yunsheng Lin wrote:
>> When passing the return value of dev_to_node() to cpumask_of_node()
>> without checking if the device's node id is NUMA_NO_NODE, there is
>> global-out-of-bounds detected by KASAN.
>>
>> >From the discussion [1], NUMA_NO_NODE really means no node affinity,
>> which also means all cpus should be usable. So the cpumask_of_node()
>> should always return all cpus online when user passes the node id as
>> NUMA_NO_NODE, just like similar semantic that page allocator handles
>> NUMA_NO_NODE.
>>
>> But we cannot really copy the page allocator logic. Simply because the
>> page allocator doesn't enforce the near node affinity. It just picks it
>> up as a preferred node but then it is free to fallback to any other numa
>> node. This is not the case here and node_to_cpumask_map will only restrict
>> to the particular node's cpus which would have really non deterministic
>> behavior depending on where the code is executed. So in fact we really
>> want to return cpu_online_mask for NUMA_NO_NODE.
>>
>> Some arches were already NUMA_NO_NODE aware, so only change them to return
>> cpu_online_mask and use NUMA_NO_NODE instead of "-1".
>>
>> Also there is a debugging version of node_to_cpumask_map() for x86 and
>> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
>> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
>> And "fix" a sign "bug" since it is for debugging and should catch all the
>> error cases.
>>
>> [1] https://lore.kernel.org/patchwork/patch/1125789/
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> Suggested-by: Michal Hocko <mhocko@kernel.org>
> 
> The change makes sense to me. I wish this particular thing wasn't
> duplicated so heavily - maybe we can unify all of them and use a common
> code? In a separate patch most likely...
> 
> I would also not change cpu_all_mask -> cpu_online_mask in this patch.
> That is worth a patch on its own with some explanation. I haven't
> checked but I would suspect that alpha simply doesn't support cpu
> hotplug so the two things are the same. But this needs some explanation.

In commit 44c36aed43b5 ("alpha: cpumask_of_node() should handle -1 as a node")
and commit d797396f3387 ("MIPS: cpumask_of_node() should handle -1 as a node")
mention below:
"pcibus_to_node can return -1 if we cannot determine which node a pci bus
is on. If passed -1, cpumask_of_node will negatively index the lookup array
and pull in random data"

From the cpu hotplug process: take_cpu_down() -> __cpu_disable().
alpha does not define the __cpu_disable() function, so it seems alpha does not
support HOTPLUG_CPU.

> 
> Other than that the patch looks good to me. Feel free to add
> Acked-by: Michal Hocko <mhocko@suse.com>
> 
> [...]
>> diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
>> index 5a77a40..836c9e2 100644
>> --- a/arch/alpha/include/asm/topology.h
>> +++ b/arch/alpha/include/asm/topology.h
>> @@ -31,7 +31,7 @@ static const struct cpumask *cpumask_of_node(int node)
>>  	int cpu;
>>  
>>  	if (node == NUMA_NO_NODE)
>> -		return cpu_all_mask;
>> +		return cpu_online_mask;
>>  
>>  	cpumask_clear(&node_to_cpumask_map[node]);
>>  
> [...]
> 
>> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
>> index e6dad60..c676ffb 100644
>> --- a/arch/x86/mm/numa.c
>> +++ b/arch/x86/mm/numa.c
>> @@ -861,9 +861,12 @@ void numa_remove_cpu(int cpu)
>>   */
>>  const struct cpumask *cpumask_of_node(int node)
>>  {
>> -	if (node >= nr_node_ids) {
>> +	if (node == NUMA_NO_NODE)
>> +		return cpu_online_mask;
>> +
>> +	if ((unsigned int)node >= nr_node_ids) {
>>  		printk(KERN_WARNING
>> -			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
>> +			"cpumask_of_node(%d): node >= nr_node_ids(%u)\n",
>>  			node, nr_node_ids);
>>  		dump_stack();
>>  		return cpu_none_mask;
> 
> Why do we need this?

As the commit log says, the above cpumask_of_node() is for debugging,
it should catch other "node < 0" cases except NUMA_NO_NODE.

Thanks for reviewing.

