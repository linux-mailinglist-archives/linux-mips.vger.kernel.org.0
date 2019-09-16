Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F24B3ACF
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2019 14:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732742AbfIPMzK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Sep 2019 08:55:10 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:53924 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732709AbfIPMzK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Sep 2019 08:55:10 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2CEFAD60FEE03B91BC25;
        Mon, 16 Sep 2019 20:55:06 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Sep 2019
 20:55:02 +0800
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
 <8df06e27-ad21-bf14-dbd6-cc8f5a274ec2@huawei.com>
 <20190916122359.GG10231@dhcp22.suse.cz>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <c3a90839-703e-718a-a489-9905e52bbc46@huawei.com>
Date:   Mon, 16 Sep 2019 20:55:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190916122359.GG10231@dhcp22.suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/16 20:23, Michal Hocko wrote:
> On Mon 16-09-19 20:07:22, Yunsheng Lin wrote:
> [...]
>>>> @@ -861,9 +861,12 @@ void numa_remove_cpu(int cpu)
>>>>   */
>>>>  const struct cpumask *cpumask_of_node(int node)
>>>>  {
>>>> -	if (node >= nr_node_ids) {
>>>> +	if (node == NUMA_NO_NODE)
>>>> +		return cpu_online_mask;
>>>> +
>>>> +	if ((unsigned int)node >= nr_node_ids) {
>>>>  		printk(KERN_WARNING
>>>> -			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
>>>> +			"cpumask_of_node(%d): node >= nr_node_ids(%u)\n",
>>>>  			node, nr_node_ids);
>>>>  		dump_stack();
>>>>  		return cpu_none_mask;
>>>
>>> Why do we need this?
>>
>> As the commit log says, the above cpumask_of_node() is for debugging,
>> it should catch other "node < 0" cases except NUMA_NO_NODE.
> 
> OK, I would just make it a separate patch.

Ok, thanks.

> 

