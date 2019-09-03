Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE8FA612D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 08:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfICGTx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 02:19:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6183 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726980AbfICGTx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Sep 2019 02:19:53 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3346C78A70894A92193E;
        Tue,  3 Sep 2019 14:19:48 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Sep 2019
 14:19:41 +0800
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
To:     Peter Zijlstra <peterz@infradead.org>
CC:     <dalias@libc.org>, <linux-sh@vger.kernel.org>,
        <catalin.marinas@arm.com>, <dave.hansen@linux.intel.com>,
        <heiko.carstens@de.ibm.com>, <linuxarm@huawei.com>,
        <jiaxun.yang@flygoat.com>, <linux-kernel@vger.kernel.org>,
        <mwb@linux.vnet.ibm.com>, <paulus@samba.org>, <hpa@zytor.com>,
        <sparclinux@vger.kernel.org>, <chenhc@lemote.com>,
        <will@kernel.org>, <linux-s390@vger.kernel.org>,
        <ysato@users.sourceforge.jp>, <mpe@ellerman.id.au>,
        <x86@kernel.org>, <rppt@linux.ibm.com>, <borntraeger@de.ibm.com>,
        <dledford@redhat.com>, <mingo@redhat.com>,
        <jeffrey.t.kirsher@intel.com>, <benh@kernel.crashing.org>,
        <jhogan@kernel.org>, <nfont@linux.vnet.ibm.com>,
        <mattst88@gmail.com>, <len.brown@intel.com>, <gor@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <ink@jurassic.park.msu.ru>,
        <cai@lca.pw>, <luto@kernel.org>, <tglx@linutronix.de>,
        <naveen.n.rao@linux.vnet.ibm.com>,
        <linux-arm-kernel@lists.infradead.org>, <rth@twiddle.net>,
        <axboe@kernel.dk>, <robin.murphy@arm.com>,
        <linux-mips@vger.kernel.org>, <ralf@linux-mips.org>,
        <tbogendoerfer@suse.de>, <paul.burton@mips.com>,
        <linux-alpha@vger.kernel.org>, <bp@alien8.de>,
        <akpm@linux-foundation.org>, <linuxppc-dev@lists.ozlabs.org>,
        <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <1f48081c-c9d6-8f3e-9559-8b0bec98f125@huawei.com>
Date:   Tue, 3 Sep 2019 14:19:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/2 20:56, Peter Zijlstra wrote:
> On Mon, Sep 02, 2019 at 08:25:24PM +0800, Yunsheng Lin wrote:
>> On 2019/9/2 15:25, Peter Zijlstra wrote:
>>> On Mon, Sep 02, 2019 at 01:46:51PM +0800, Yunsheng Lin wrote:
>>>> On 2019/9/1 0:12, Peter Zijlstra wrote:
>>>
>>>>> 1) because even it is not set, the device really does belong to a node.
>>>>> It is impossible a device will have magic uniform access to memory when
>>>>> CPUs cannot.
>>>>
>>>> So it means dev_to_node() will return either NUMA_NO_NODE or a
>>>> valid node id?
>>>
>>> NUMA_NO_NODE := -1, which is not a valid node number. It is also, like I
>>> said, not a valid device location on a NUMA system.
>>>
>>> Just because ACPI/BIOS is shit, doesn't mean the device doesn't have a
>>> node association. It just means we don't know and might have to guess.
>>
>> How do we guess the device's location when ACPI/BIOS does not set it?
> 
> See device_add(), it looks to the device's parent and on NO_NODE, puts
> it there.
> 
> Lacking any hints, just stick it to node0 and print a FW_BUG or
> something.
> 
>> It seems dev_to_node() does not do anything about that and leave the
>> job to the caller or whatever function that get called with its return
>> value, such as cpumask_of_node().
> 
> Well, dev_to_node() doesn't do anything; nor should it. It are the
> callers of set_dev_node() that should be taking care.
> 
> Also note how device_add() sets the device node to the parent device's
> node on NUMA_NO_NODE. Arguably we should change it to complain when it
> finds NUMA_NO_NODE and !parent.

Is it possible that the node id set by device_add() become invalid
if the node is offlined, then dev_to_node() may return a invalid
node id.

From the comment in select_fallback_rq(), it seems that a node can
be offlined, not sure if node offline process has taken cared of that?

	/*
         * If the node that the CPU is on has been offlined, cpu_to_node()
         * will return -1. There is no CPU on the node, and we should
         * select the CPU on the other node.
         */


With the above assumption that a device is always on a valid node,
the node id returned from dev_to_node() can be safely passed to
cpumask_of_node() without any checking?

> 
> ---
>  drivers/base/core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f0dd8e38fee3..2caf204966a0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2120,8 +2120,16 @@ int device_add(struct device *dev)
>  		dev->kobj.parent = kobj;
>  
>  	/* use parent numa_node */
> -	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
> -		set_dev_node(dev, dev_to_node(parent));
> +	if (dev_to_node(dev) == NUMA_NO_NODE) {
> +		if (parent)
> +			set_dev_node(dev, dev_to_node(parent));
> +#ifdef CONFIG_NUMA
> +		else {
> +			pr_err("device: '%s': has no assigned NUMA node\n", dev_name(dev));
> +			set_dev_node(dev, 0);
> +		}
> +#endif
> +	}
>  
>  	/* first, register with generic layer. */
>  	/* we require the name to be set before, and pass NULL */
> 
> .
> 

