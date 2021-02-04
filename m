Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAE630EB88
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 05:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhBDEW1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 23:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhBDEW0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Feb 2021 23:22:26 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4485BC061573;
        Wed,  3 Feb 2021 20:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=WMId+cxkCWnvOqXDQrIS9DTWp8t6upKk/k1BmoUUQwU=; b=H7DiSRpo4WoTTloZz/lJb8YPyu
        y6PEevzTClujUfBlG8PpHjE+HLmW6+D3XB9JI1fZSaJLK/lemFHODhF/MUF4G/X0atwRClYdrw++z
        rvfKZE/ra4DwapzJfpcp99aBkGuIYC3W6NqLcv5IAcbe7wbvNRDXSHC3NlJo1JR8QbKg2itTJuVih
        E5ylPtz21/3qXBC5ma62SYyydsym6AFm79KgaVWdnm1Rb2TKkgsPoLEQj0BLe/b9G9jJqU3fWzmBX
        2TtDeSWOHTupc7mcNfhXCzJFIw9bftFUiWyCf1JB+E5xbzXbkQttxdKpT8wt+CzlGvwBd9UPt2qjS
        F4DV1oAg==;
Received: from [2601:1c0:6280:3f0::aec2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l7W9H-0002ih-VU; Thu, 04 Feb 2021 04:21:44 +0000
Subject: Re: [PATCH] MIPS: Use common way to parse elfcorehdr
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1612408033-5446-1-git-send-email-hejinyang@loongson.cn>
 <57e74a56-abc1-dbc0-1277-5effb0e4e4c6@infradead.org>
 <eff38b91-edd9-6f03-fd47-17932025f2ff@loongson.cn>
 <b19fd98a-13a0-75ef-37d6-b9e3d4cf5102@infradead.org>
 <0c36f7e5-ce5d-e2ed-55a0-2f9113ac06bb@loongson.cn>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9d275273-cafb-5f1c-9d83-a43e55cab7ac@infradead.org>
Date:   Wed, 3 Feb 2021 20:21:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0c36f7e5-ce5d-e2ed-55a0-2f9113ac06bb@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/3/21 8:19 PM, Jinyang He wrote:
> On 02/04/2021 12:01 PM, Randy Dunlap wrote:
> 
>> On 2/3/21 7:57 PM, Jinyang He wrote:
>>> On 02/04/2021 11:28 AM, Randy Dunlap wrote:
>>>
>>>> On 2/3/21 7:07 PM, Jinyang He wrote:
>>>>> "elfcorehdr" can be parsed at kernel/crash_dump.c
>>>>>
>>>>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>>>> Hm, looks like that would require CONFIG_CRASH_DUMP?
>>> Hi,
>>>
>>> I don't think so. We expect to generate a /proc/vmcore when we reserved
>>> memory for elfcorehdr. So put it under CONFIG_PROC_VMCORE. If only rely
>>> on CONFIG_CRASH_DUMP and CONFIG_PROC_VMCORE is not enabled, we will
>>> reserve these memory while cannot use these later. And the reason why
>>> kernel/crash_dump.c being under CONFIG_CRASH_DUMP is that it provide
>>> is_kdump_kernel() for others.
>>>
>>> Thanks,
>>> Jinyang
>> Hi,
>>
>> I'm referring to kernel/Makefile:
>>
>> obj-$(CONFIG_CRASH_DUMP) += crash_dump.o
>>
>> so that's not an issue here?  Please explain.
> Hi,
> 
> CONFIG_PROC_VMCORE depends on CONFIG_PROC_FS && CONFIG_CRASH_DUMP.
> So...

Got it. Thank you.

-- 
~Randy

