Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B193B5AE2
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 11:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhF1JI1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 05:08:27 -0400
Received: from regular1.263xmail.com ([211.150.70.203]:47648 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbhF1JI0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 05:08:26 -0400
Received: from localhost (unknown [192.168.167.16])
        by regular1.263xmail.com (Postfix) with ESMTP id 62022977;
        Mon, 28 Jun 2021 17:05:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [10.4.23.46] (unknown [58.240.82.166])
        by smtp.263.net (postfix) whith ESMTP id P12363T139710759249664S1624871154487525_;
        Mon, 28 Jun 2021 17:05:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3be8a4599a3b6d776fad225e14b58892>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: linux-kernel@vger.kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] mm: Fix the problem of mips architecture Oops
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        jiaxun.yang@flygoat.com, chenhuacai@kernel.org,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210628054738.10964-1-zhanglianjie@uniontech.com>
 <d49404ca-b55c-847d-968d-273ca604b1e6@gmail.com>
From:   zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <f5db8f46-ef29-da7d-eb36-eedb7be077bc@uniontech.com>
Date:   Mon, 28 Jun 2021 17:05:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d49404ca-b55c-847d-968d-273ca604b1e6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2021-06-28 16:51, Sergei Shtylyov wrote:
> Hello!
> 
> On 28.06.2021 8:47, zhanglianjie wrote:
> 
>> The cause of the problem is as follows:
>> 1. when cat /sys/devices/system/memory/memory0/valid_zones,
>>     test_pages_in_a_zone() will be called.
>> 2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
>>     The smallest pfn of the numa node in the mips architecture is 128,
>>     and the page corresponding to the previous 0~127 pfn is not
>>     initialized (page->flags is 0xFFFFFFFF)
>> 3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
>>     of bounds in the corresponding array,
>>     &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
>>     access to the out-of-bounds zone member variables appear abnormal,
>>     resulting in Oops.
>> Therefore, it is necessary to keep the page between 0 and the minimum
>> pfn to prevent Oops from appearing.
>>
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>> ---
>>   arch/mips/loongson64/numa.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
>> index fa9b4a487a47..dba9e6f17b9e 100644
>> --- a/arch/mips/loongson64/numa.c
>> +++ b/arch/mips/loongson64/numa.c
>> @@ -129,6 +129,9 @@ static void __init node_mem_init(unsigned int node)
>>           if (node_end_pfn(0) >= (0xffffffff >> PAGE_SHIFT))
>>               memblock_reserve((node_addrspace_offset | 0xfe000000),
>>                        32 << 20);
>> +
>> +        /* Reserver pfn range 0~node[0]->node_start_pfn */
> 
>     Reserve?
> 
>> +        memblock_reserve(0, PAGE_SIZE * start_pfn);
>>       }
>>   }
> [...]
> 
> MBR, Sergei
> 
> 

Oh, I’m so sorry. I will resubmit, thanks for your reminder.

-- 
Regards,
Zhang Lianjie


