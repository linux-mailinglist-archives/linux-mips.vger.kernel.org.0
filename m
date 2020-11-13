Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A952B143D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 03:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgKMCWQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 21:22:16 -0500
Received: from relay5.mymailcheap.com ([159.100.248.207]:43411 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgKMCWQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 21:22:16 -0500
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 4048D260EC;
        Fri, 13 Nov 2020 02:22:13 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 5F0303F1D0;
        Fri, 13 Nov 2020 03:22:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 28AE22A5BA;
        Fri, 13 Nov 2020 03:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1605234130;
        bh=vZyrFUxAS7zddxvsdapT6Y28AZ1sBS4aKL8J9wG90N4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aYgu/GFNzMT9MdcY2VnX8EG7xtaCapjuPN1P1egUjfVm70Q354cvfpbyEvOLl4jKg
         DiaBt2XZUQwY9wZO0d/9TO/TAbzpKzVFXLw6wYPOeSPJ+lIx1M/jGDSbM5lSa3H2os
         Q1vw2idB6EjNP8ptwNjbfgFMQ1m0ZR4G67iVtDbw=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SPQQgPsmFYEa; Fri, 13 Nov 2020 03:22:07 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 13 Nov 2020 03:22:07 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 2159B400C1;
        Fri, 13 Nov 2020 02:22:06 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="mKm8OHBu";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id C5BD0400C1;
        Fri, 13 Nov 2020 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1605234119;
        bh=vZyrFUxAS7zddxvsdapT6Y28AZ1sBS4aKL8J9wG90N4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mKm8OHBuUD0gzJPv2XHzZz8rk/6nGkJ8EiIz5s1BaLSXapSN7gI2D1UtS1svu4BSS
         a8/Bge0aLmpl9MncUQ4g3R1N/CEmp5Cv+9cVidOEHwzGg90HwS5ctmi726Z6e9Q5Lo
         hMif54DJw6VKtoLNt24oEWa2djpYPPA1IcZAFjGg=
Subject: Re: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        WANG Xuerui <git@xen0n.name>
References: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
 <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com>
 <b84fe88b-7527-e88c-1efd-739f6d846518@flygoat.com>
 <6f0a7a43-4eac-65d8-61ff-778dc13f925c@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1e01b317-b315-443c-a53b-db360ea17254@flygoat.com>
Date:   Fri, 13 Nov 2020 10:21:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <6f0a7a43-4eac-65d8-61ff-778dc13f925c@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2159B400C1
X-Spamd-Result: default: False [2.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/11/12 20:03, Tiezhu Yang 写道:
> On 11/12/2020 06:09 PM, Jiaxun Yang wrote:
>>
>>
>> 在 2020/11/12 18:04, Jiaxun Yang 写道:
>>> Hi Tiezhu,
>>>
>>> 在 2020/11/12 16:29, Tiezhu Yang 写道:
>>>> Add read_persistent_clock64() to read the time from the battery backed
>>>> persistent clock. With this patch, we can fix the wrong time issue due
>>>> to the system clock is not consistent with hardware clock after resume
>>>> from sleep state S3 (suspend to RAM), at the same time, the system 
>>>> time
>>>> can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc 
>>>> driver.
>>>>
>>>> start_kernel()
>>>>    timekeeping_init()
>>>>      read_persistent_wall_and_boot_offset()
>>>>        read_persistent_clock64()
>>>>
>>>> timekeeping_resume()
>>>>    read_persistent_clock64()
>>>>
>>>> timekeeping_suspend()
>>>>    read_persistent_clock64()
>>>
>>> It is highly discoraged to do anything with bridgetype, which isn't 
>>> probed via
>>> devicetree.
>>>
>>> Please check if you can deal with that inside RTC framework, or make 
>>> it as
>>> a part of RTC driver (e.g. set up a callback).
>>>
>>> Also you should submit RTC driver at first if you intend to complete 
>>> LS7A support.
>>
>> Oops,
>> Just dig it deeper, I guess simply select RTC_HCTOSYS would solve the 
>> issue.
>> We're trying very hard to decouple all the drivers and conponents,
>> DeviceTree for all!
>
> +cc WANG Xuerui <git@xen0n.name>
>
> Hi Jiaxun,
>
> Thanks for your reply.
>
> Xuerui has already submitted the patch of LS7A rtc driver [1],
> but not yet been merged into the mainline kernel, I discussed
> with him early today.
>
> Do you mean that read_persistent_clock64() can call the function
> like rtc_read_time() defined in rtc driver?

I do think select RTC_HCTOSYS after getting RTC driver applied can help.
What's your point to have read_persistent_clock64 for Loongson64?

Thanks

- Jiaxun

>
> Thanks,
> Tiezhu
>
> [1] 
> https://patchwork.kernel.org/project/linux-mips/patch/20200923075845.360974-2-git@xen0n.name/
>
>>
>>>
>>> Thanks.
>>>
>>> - Jiaxun
>>>
>>>>
>>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> ---
>>>>
