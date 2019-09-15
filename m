Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13984B2E91
	for <lists+linux-mips@lfdr.de>; Sun, 15 Sep 2019 08:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfIOGOB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Sep 2019 02:14:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2269 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725497AbfIOGOB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 15 Sep 2019 02:14:01 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EBDFD36DDAEE5ECE5E61;
        Sun, 15 Sep 2019 14:13:56 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sun, 15 Sep 2019
 14:13:52 +0800
Subject: Re: [PATCH v3 7/8] mips: numa: make node_to_cpumask_map()
 NUMA_NO_NODE aware for mips
To:     Mike Rapoport <rppt@linux.ibm.com>
CC:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>,
        <akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
        <tglx@linutronix.de>, <cai@lca.pw>, <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <naveen.n.rao@linux.vnet.ibm.com>,
        <mwb@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <tbogendoerfer@suse.de>,
        <linux-mips@vger.kernel.org>, <rafael@kernel.org>,
        <mhocko@kernel.org>, <gregkh@linuxfoundation.org>
References: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
 <1568283334-178380-8-git-send-email-linyunsheng@huawei.com>
 <20190915054901.GC11429@linux.ibm.com>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <938be3af-ece4-7f5f-34d6-f949ee2a3d32@huawei.com>
Date:   Sun, 15 Sep 2019 14:13:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190915054901.GC11429@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/15 13:49, Mike Rapoport wrote:
> Hi,
> 
> On Thu, Sep 12, 2019 at 06:15:33PM +0800, Yunsheng Lin wrote:
>> When passing the return value of dev_to_node() to cpumask_of_node()
>> without checking the node id if the node id is NUMA_NO_NODE, there is
>> global-out-of-bounds detected by KASAN.
>>
>> From the discussion [1], NUMA_NO_NODE really means no node affinity,
>> which also means all cpus should be usable. So the cpumask_of_node()
>> should always return all cpus online when user passes the node id
>> as NUMA_NO_NODE, just like similar semantic that page allocator handles
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
>> Since this arch was already NUMA_NO_NODE aware, this patch only changes
>> it to return cpu_online_mask and use NUMA_NO_NODE instead of "-1".
>>
>> [1] https://lore.kernel.org/patchwork/patch/1125789/
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> Suggested-by: Michal Hocko <mhocko@kernel.org>
>> ---
>> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>>     for NUMA_NO_NODE case, and change the commit log to better justify
>>     the change.
>> ---
>>  arch/mips/include/asm/mach-ip27/topology.h | 4 ++--
> 
> Nit: the subject says "mips:", but this patch only touches sgi-ip27 and
> loongson is updated as a separate patch. I don't see why both patches
> cannot be merged. Moreover, the whole set can be made as a single patch,
> IMHO.

Thanks for reviewing.

As this patchset touches a few files, which may has different maintainer.
I am not sure if a separate patch for different arch will make the merging
process easy, or a single patch will make the merging process easy?

It can be made as a single patch if a single patch will make the merging
process easy.

> 
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
>> index 965f079..04505e6 100644
>> --- a/arch/mips/include/asm/mach-ip27/topology.h
>> +++ b/arch/mips/include/asm/mach-ip27/topology.h
>> @@ -15,8 +15,8 @@ struct cpuinfo_ip27 {
>>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
>>  
>>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
>> -#define cpumask_of_node(node)	((node) == -1 ?				\
>> -				 cpu_all_mask :				\
>> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
>> +				 cpu_online_mask :			\
>>  				 &hub_data(node)->h_cpus)
>>  struct pci_bus;
>>  extern int pcibus_to_node(struct pci_bus *);
>> -- 
>> 2.8.1
>>
> 

