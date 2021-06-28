Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589503B58BF
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 07:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhF1Fyo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 01:54:44 -0400
Received: from regular1.263xmail.com ([211.150.70.206]:33004 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhF1Fyn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 01:54:43 -0400
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 1D8A01B24;
        Mon, 28 Jun 2021 13:52:02 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [10.4.23.46] (unknown [58.240.82.166])
        by smtp.263.net (postfix) whith ESMTP id P5175T139827884320512S1624859521564084_;
        Mon, 28 Jun 2021 13:52:02 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1f20fdf4e359861942c198caa05c5cb7>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: tangyouling@loongson.cn
X-RCPT-COUNT: 5
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhanglianjie <zhanglianjie@uniontech.com>
Subject: Re: [PATCH] mm: Fix the problem of mips architecture Oops
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        tangyouling@loongson.cn, linux-mips@vger.kernel.org,
        tangyouling@loongson.cn
References: <20210624032212.24769-1-zhanglianjie@uniontech.com>
 <20210625133909.GA2565@alpha.franken.de>
 <37efbf00-d4c8-b830-a1b6-9f90d990f4e4@uniontech.com>
 <d76a111c-61ab-4275-8d87-2ee69087a226@flygoat.com>
Message-ID: <071b2cb4-fcf3-117e-d50e-bfe4704f01b1@uniontech.com>
Date:   Mon, 28 Jun 2021 13:52:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d76a111c-61ab-4275-8d87-2ee69087a226@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2021-06-28 09:17, Jiaxun Yang wrote:
> 
> 在 2021/6/28 上午9:07, zhanglianjie 写道:
>>
>>
>> On 2021-06-25 21:39, Thomas Bogendoerfer wrote:
>>> On Thu, Jun 24, 2021 at 11:22:12AM +0800, zhanglianjie wrote:
>>>> The cause of the problem is as follows:
>>>> 1. when cat /sys/devices/system/memory/memory0/valid_zones,
>>>>     test_pages_in_a_zone() will be called.
>>>> 2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
>>>>     The smallest pfn of the numa node in the mips architecture is 128,
>>>>     and the page corresponding to the previous 0~127 pfn is not
>>>>     initialized (page->flags is 0xFFFFFFFF)
>>>> 3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
>>>>     of bounds in the corresponding array,
>>>> &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
>>>>     access to the out-of-bounds zone member variables appear abnormal,
>>>>     resulting in Oops.
>>>> Therefore, it is necessary to keep the page between 0 and the minimum
>>>> pfn to prevent Oops from appearing.
>>>>
>>>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>>>> ---
>>>>   arch/mips/kernel/setup.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>>>> index 23a140327a0b..f1da2b2ba5e9 100644
>>>> --- a/arch/mips/kernel/setup.c
>>>> +++ b/arch/mips/kernel/setup.c
>>>> @@ -653,6 +653,8 @@ static void __init arch_mem_init(char **cmdline_p)
>>>>        */
>>>>       memblock_set_current_limit(PFN_PHYS(max_low_pfn));
>>>>
>>>> +    memblock_reserve(0, PAGE_SIZE * NODE_DATA(0)->node_start_pfn);
>>>> +
>>>
>>> which platform needs this ? This look it should be better fixed in
>>> the platform memory registration code.
>>>
>>> Thomas.
>>>
>>
>> I have a problem on the loogson platform.
> 
> I had checked a Loongson 3A4000 board (Lemote-A1901) with UEFI firmware 
> and the region is reserved by firmware.
> 
> Hmm, you'd better contact vendor to fix the firmware. If it's not 
> possible then workaround it in arch/mips/loongson64/numa.c
> 
> Thanks.
> 
> - Jiaxun
> 
> 
> 
> 

I will try to contact the manufacturer. However, the manufacturer cannot 
be contacted temporarily. I resubmitted a patch according to your method.
thank you very much for your help.

I want to ask, how do you check that the region is reserved by UEFI 
firmware?

The machine information I tested is as follows:
1. Lemote board
- hardware information:
         Loongson 3A4000 board LEMOTE-LS3A4000-7A1000-1w-V01-pc.
- pagesize is 16k.
2. THTF board
- hardware information:
         Loongson 3A4000 board THTF-LS3A4000-7A1000-1W-VB1-ML4A
- pagesize is 16k.



-- 
Regards,
Zhang Lianjie


