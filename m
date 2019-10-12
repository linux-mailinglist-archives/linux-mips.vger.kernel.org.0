Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B252D4EBC
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 11:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbfJLJs3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 05:48:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:45680 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727507AbfJLJs3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 05:48:29 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C55FA89947D5590388D6;
        Sat, 12 Oct 2019 17:48:25 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Sat, 12 Oct 2019
 17:48:24 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, <catalin.marinas@arm.com>,
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <len.brown@intel.com>, <axboe@kernel.dk>, <dledford@redhat.com>,
        <jeffrey.t.kirsher@intel.com>, <linux-alpha@vger.kernel.org>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <rafael@kernel.org>, <bhelgaas@google.com>,
        <linux-pci@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, <lenb@kernel.org>,
        <linux-acpi@vger.kernel.org>
References: <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
 <20191010073212.GB18412@dhcp22.suse.cz>
 <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
 <20191012074014.GA2037204@kroah.com>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <1e1ec851-b5e7-8f35-a627-4c12ca9c2d3c@huawei.com>
Date:   Sat, 12 Oct 2019 17:47:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20191012074014.GA2037204@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/10/12 15:40, Greg KH wrote:
> On Sat, Oct 12, 2019 at 02:17:26PM +0800, Yunsheng Lin wrote:
>> add pci and acpi maintainer
>> cc linux-pci@vger.kernel.org and linux-acpi@vger.kernel.org
>>
>> On 2019/10/11 19:15, Peter Zijlstra wrote:
>>> On Fri, Oct 11, 2019 at 11:27:54AM +0800, Yunsheng Lin wrote:
>>>> But I failed to see why the above is related to making node_to_cpumask_map()
>>>> NUMA_NO_NODE aware?
>>>
>>> Your initial bug is for hns3, which is a PCI device, which really _MUST_
>>> have a node assigned.
>>>
>>> It not having one, is a straight up bug. We must not silently accept
>>> NO_NODE there, ever.
>>>
>>
>> I suppose you mean reporting a lack of affinity when the node of a pcie
>> device is not set by "not silently accept NO_NODE".
> 
> If the firmware of a pci device does not provide the node information,
> then yes, warn about that.
> 
>> As Greg has asked about in [1]:
>> what is a user to do when the user sees the kernel reporting that?
>>
>> We may tell user to contact their vendor for info or updates about
>> that when they do not know about their system well enough, but their
>> vendor may get away with this by quoting ACPI spec as the spec
>> considering this optional. Should the user believe this is indeed a
>> fw bug or a misreport from the kernel?
> 
> Say it is a firmware bug, if it is a firmware bug, that's simple.
> 
>> If this kind of reporting is common pratice and will not cause any
>> misunderstanding, then maybe we can report that.
> 
> Yes, please do so, that's the only way those boxes are ever going to get
> fixed.  And go add the test to the "firmware testing" tool that is based
> on Linux that Intel has somewhere, to give vendors a chance to fix this
> before they ship hardware.
> 
> This shouldn't be a big deal, we warn of other hardware bugs all the
> time.

Ok, thanks for clarifying.

Will send a patch to catch the case when a pcie device without numa node
being set and warn about it.

Maybe use dev->bus to verify if it is a pci device?

> 
> thanks,
> 
> greg k-h
> 
> .
> 

