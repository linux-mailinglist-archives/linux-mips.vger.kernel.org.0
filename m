Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95ACBDAB2
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2019 11:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388944AbfIYJOg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Sep 2019 05:14:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2718 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388828AbfIYJOb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Sep 2019 05:14:31 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 9C859387E7EFF1887A06;
        Wed, 25 Sep 2019 17:14:25 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 25 Sep 2019
 17:14:21 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To:     Michal Hocko <mhocko@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
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
References: <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
Date:   Wed, 25 Sep 2019 17:14:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190924131939.GS23050@dhcp22.suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/24 21:19, Michal Hocko wrote:
> On Tue 24-09-19 14:59:36, Peter Zijlstra wrote:
>> On Tue, Sep 24, 2019 at 02:43:25PM +0200, Peter Zijlstra wrote:
>>> On Tue, Sep 24, 2019 at 02:25:00PM +0200, Michal Hocko wrote:
>>>> On Tue 24-09-19 14:09:43, Peter Zijlstra wrote:
>>>
>>>>> We can push back and say we don't respect the specification because it
>>>>> is batshit insane ;-)
>>>>
>>>> Here is my fingers crossed.
>>>>
>>>> [...]
>>>>
>>>>> Now granted; there's a number of virtual devices that really don't have
>>>>> a node affinity, but then, those are not hurt by forcing them onto a
>>>>> random node, they really don't do anything. Like:
>>>>
>>>> Do you really consider a random node a better fix than simply living
>>>> with a more robust NUMA_NO_NODE which tells the actual state? Page
>>>> allocator would effectivelly use the local node in that case. Any code
>>>> using the cpumask will know that any of the online cpus are usable.
>>>
>>> For the pmu devices? Yes, those 'devices' aren't actually used for
>>> anything other than sysfs entries.
>>>
>>> Nothing else uses the struct device.
>>
>> The below would get rid of the PMU and workqueue warnings with no
>> side-effects (the device isn't used for anything except sysfs).
> 
> Hardcoding to 0 is simply wrong, if the node0 is cpuless for example...

Hi, Peter & Michal

From the discussion above, It seems making the node_to_cpumask_map()
NUMA_NO_NODE aware is the most feasible way to move forwad.

Any suggestion?

> 

