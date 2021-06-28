Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155843B568D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 03:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhF1BQ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 21:16:27 -0400
Received: from regular1.263xmail.com ([211.150.70.195]:41392 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhF1BQ1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Jun 2021 21:16:27 -0400
X-Greylist: delayed 392 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Jun 2021 21:16:26 EDT
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 4B4051CAC;
        Mon, 28 Jun 2021 09:07:15 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [10.4.23.46] (unknown [58.240.82.166])
        by smtp.263.net (postfix) whith ESMTP id P5175T139827079014144S1624842434919731_;
        Mon, 28 Jun 2021 09:07:15 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7be08a7aac80ae91b5dc06d0e1b7a40f>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: tangyouling@loongson.cn
X-RCPT-COUNT: 4
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH] mm: Fix the problem of mips architecture Oops
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        tangyouling@loongson.cn
References: <20210624032212.24769-1-zhanglianjie@uniontech.com>
 <20210625133909.GA2565@alpha.franken.de>
From:   zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <37efbf00-d4c8-b830-a1b6-9f90d990f4e4@uniontech.com>
Date:   Mon, 28 Jun 2021 09:07:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210625133909.GA2565@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2021-06-25 21:39, Thomas Bogendoerfer wrote:
> On Thu, Jun 24, 2021 at 11:22:12AM +0800, zhanglianjie wrote:
>> The cause of the problem is as follows:
>> 1. when cat /sys/devices/system/memory/memory0/valid_zones,
>>     test_pages_in_a_zone() will be called.
>> 2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
>>     The smallest pfn of the numa node in the mips architecture is 128,
>>     and the page corresponding to the previous 0~127 pfn is not
>>     initialized (page->flags is 0xFFFFFFFF)
>> 3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
>>     of bounds in the corresponding array,
>>     &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
>>     access to the out-of-bounds zone member variables appear abnormal,
>>     resulting in Oops.
>> Therefore, it is necessary to keep the page between 0 and the minimum
>> pfn to prevent Oops from appearing.
>>
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>> ---
>>   arch/mips/kernel/setup.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index 23a140327a0b..f1da2b2ba5e9 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -653,6 +653,8 @@ static void __init arch_mem_init(char **cmdline_p)
>>   	 */
>>   	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
>>
>> +	memblock_reserve(0, PAGE_SIZE * NODE_DATA(0)->node_start_pfn);
>> +
> 
> which platform needs this ? This look it should be better fixed in
> the platform memory registration code.
> 
> Thomas.
> 

I have a problem on the loogson platform.

-- 
Regards,
Zhang Lianjie


