Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E503B5694
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 03:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhF1BTx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 21:19:53 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52217 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231706AbhF1BTx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 21:19:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 131813200312;
        Sun, 27 Jun 2021 21:17:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 27 Jun 2021 21:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=U
        l2GWeBx9seMT4gzePmQzr2z1aiG/M1HUtXl7JlkZMI=; b=llvYxVYhdClQeKtrC
        uHdk64YRs7/uv4ettab5++wTJqxVfKqH6ACRhGJjg2scnkxUhYiH8CoY7sFvICJr
        61lxDT2R+MUm5lGZngQ6niUlFjMcfMXx+/mReA4Jk7/xbo/cbE0sXUqz9eyEKqwR
        BcRrtvP9q+8XPe3IwrzMED43o5uPInHztGtRwvLsWTVHodu8nB7R551VW3htvEoN
        pNILqHbgVlFOBSIvTE3wqMX6U56KBqwR0gUwVwKWlVECFgeyQWymFGdWCiM8AG76
        Kni/idsk/93RpaRggclb8hAFOGk6RLdaqk/RTfHUBD+yxrIR7BgGT+dyDKAHsRTk
        Z6XxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Ul2GWeBx9seMT4gzePmQzr2z1aiG/M1HUtXl7JlkZ
        MI=; b=IycA8Oh5AERF0fFOcZqWuSdjR0d9LlmHnb20IPKlbcJ23s2dVO2uDgijN
        O/PXDNik509cOTuUaOvQvbGuaQyC2FyVG4AKJkV6X7ICVWMk8XecazxfHMIMlvCN
        qe4QRxpT5fkatRTivZ+2QfBXyBndsedhBlzbMAr/pMzmH2xLDxjLIMsCvQAvWmZA
        GHVzsBzpBXWxS0q70cLq1XCtqYvuzE/fHE9YnaLtcIE1VPS3qvU4evqYpUQxO42E
        /T+ptijEOyeH2oGPRCAyjTD5q0BGOXcMIKUfqWBzFtH8l78F11dy3ROT03i3bII+
        fEQB1s2xT5gkVt4Sdzu2au+RedWbA==
X-ME-Sender: <xms:JiPZYASLLOFkT7GQNTeHxHnMjZXO5YwMgbMydCX6Ju4iNt-IdGd1VQ>
    <xme:JiPZYNzkgswjLNo5zRa-zr_V4DcP9UGaiE51j_RcbfcdY_dnItB0-kDXMhBkelvKk
    SkrIh4KyV7ouX0vsn0>
X-ME-Received: <xmr:JiPZYN1xiWcEhAt7w7AokG67xiHfU0H0SjuJ5QM0IKxm-IL4ApHJg0S_c2U8XiRO7xk3iPZ_kPQ49FY9tHrXrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:JiPZYEB1cXRKCMr-RqITfS0pVKbfulzjZ0urO1IU2FnfwU4pgXaXQw>
    <xmx:JiPZYJgw6lYl4PlJce1xFtsMd0JHARwWR_KBeHnNdjQKqBeBNwlDfg>
    <xmx:JiPZYArdZYbVY6UnB4lDljBhV2MQJzdnyyb6SYzAV-7BChOlpLHKaA>
    <xmx:JyPZYOsZhaUfOlS1ya603zWG2WyKn41x49MgMmYqNwPPVbuhP3xeTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 21:17:24 -0400 (EDT)
Subject: Re: [PATCH] mm: Fix the problem of mips architecture Oops
To:     zhanglianjie <zhanglianjie@uniontech.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        tangyouling@loongson.cn
References: <20210624032212.24769-1-zhanglianjie@uniontech.com>
 <20210625133909.GA2565@alpha.franken.de>
 <37efbf00-d4c8-b830-a1b6-9f90d990f4e4@uniontech.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d76a111c-61ab-4275-8d87-2ee69087a226@flygoat.com>
Date:   Mon, 28 Jun 2021 09:17:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37efbf00-d4c8-b830-a1b6-9f90d990f4e4@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/6/28 上午9:07, zhanglianjie 写道:
>
>
> On 2021-06-25 21:39, Thomas Bogendoerfer wrote:
>> On Thu, Jun 24, 2021 at 11:22:12AM +0800, zhanglianjie wrote:
>>> The cause of the problem is as follows:
>>> 1. when cat /sys/devices/system/memory/memory0/valid_zones,
>>>     test_pages_in_a_zone() will be called.
>>> 2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
>>>     The smallest pfn of the numa node in the mips architecture is 128,
>>>     and the page corresponding to the previous 0~127 pfn is not
>>>     initialized (page->flags is 0xFFFFFFFF)
>>> 3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
>>>     of bounds in the corresponding array,
>>> &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
>>>     access to the out-of-bounds zone member variables appear abnormal,
>>>     resulting in Oops.
>>> Therefore, it is necessary to keep the page between 0 and the minimum
>>> pfn to prevent Oops from appearing.
>>>
>>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>>> ---
>>>   arch/mips/kernel/setup.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>>> index 23a140327a0b..f1da2b2ba5e9 100644
>>> --- a/arch/mips/kernel/setup.c
>>> +++ b/arch/mips/kernel/setup.c
>>> @@ -653,6 +653,8 @@ static void __init arch_mem_init(char **cmdline_p)
>>>        */
>>>       memblock_set_current_limit(PFN_PHYS(max_low_pfn));
>>>
>>> +    memblock_reserve(0, PAGE_SIZE * NODE_DATA(0)->node_start_pfn);
>>> +
>>
>> which platform needs this ? This look it should be better fixed in
>> the platform memory registration code.
>>
>> Thomas.
>>
>
> I have a problem on the loogson platform.

I had checked a Loongson 3A4000 board (Lemote-A1901) with UEFI firmware 
and the region is reserved by firmware.

Hmm, you'd better contact vendor to fix the firmware. If it's not 
possible then workaround it in arch/mips/loongson64/numa.c

Thanks.

- Jiaxun


