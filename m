Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CAB2F5D29
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 10:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbhANJUf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 04:20:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2340 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbhANJUe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 04:20:34 -0500
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DGdx04nKYz67Xkl;
        Thu, 14 Jan 2021 17:16:52 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 14 Jan 2021 10:19:52 +0100
Received: from [10.210.171.141] (10.210.171.141) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 14 Jan 2021 09:19:51 +0000
Subject: Re: logical PIO code for mips question (was Re: [PATCH RESEND v3 3/3]
 MIPS: Loongson64: Enable PCI_IO_VMMAP)
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
CC:     <chenhc@lemote.com>, <tsbogend@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-3-jiaxun.yang@flygoat.com>
 <1a21eaf7-52c0-c032-4405-1b6916628ade@huawei.com>
 <05b37da0-aabd-941f-6fff-47c3b46c95d2@flygoat.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <797e574a-e4fe-df6c-f352-6a5a239c32de@huawei.com>
Date:   Thu, 14 Jan 2021 09:18:42 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <05b37da0-aabd-941f-6fff-47c3b46c95d2@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.210.171.141]
X-ClientProxiedBy: lhreml714-chm.china.huawei.com (10.201.108.65) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/01/2021 00:13, Jiaxun Yang wrote:
>>> range->fwnode = &of_root->fwnode;
>>> +    range->size = MMIO_LOWER_RESERVED;
>>> +    range->hw_start = LOONGSON_PCIIO_BASE;
>>> +    range->flags = LOGIC_PIO_CPU_MMIO;
>>> +
>>> +    if (logic_pio_register_range(range)) {
>>> +        pr_err("Failed to reserve PIO range for legacy ISA\n");
>>> +        goto free_range;
>>> +    }
>>
>> Hi Jiaxun,
>>
>>> +
>>> +    if (WARN(range->io_start != 0,
>>> +            "Reserved PIO range does not start from 0\n"))
>>
>> Do the mips code still rely on this check?


Hi Jiaxun,

> 
> Yes :-/

ok, but I was hoping that this dependency would be removed at some stage.

> 
>>
>> I was considering changing the logical PIO code to reserve the first 
>> 64K of PCI MMIO space, but making that change would break this code as 
>> things stand.
>>
>> The motivation is that some drivers, like [0], access IO ports 
>> unconditionally and can kill systems when no PCI host exists. By 
>> reserving the first 64K, accesses by those drivers could nullified.
> 
> Actually we're trying to deal with almost the same problem.
> The reserved region on MIPS is used to serve these driver that access
> I/O ports bypassing resource subsystem.

Yes, so reserving the first 64K of IO space would break mips, as things 
stand. Has any work been done for these drivers that bypass resource 
subsystem (or directly access hardcoded IO ports)?

I may just do this (reserve 64K) under INDIRECT_PIO for now, not sure yet.

Thanks,
John
