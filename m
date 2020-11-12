Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429E62B04AC
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 13:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgKLMEL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 07:04:11 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49358 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726969AbgKLMEI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 07:04:08 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmtCmJK1fl58MAA--.18841S3;
        Thu, 12 Nov 2020 20:03:50 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
 <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com>
 <b84fe88b-7527-e88c-1efd-739f6d846518@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        WANG Xuerui <git@xen0n.name>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6f0a7a43-4eac-65d8-61ff-778dc13f925c@loongson.cn>
Date:   Thu, 12 Nov 2020 20:03:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b84fe88b-7527-e88c-1efd-739f6d846518@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxmtCmJK1fl58MAA--.18841S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UWF18JFyfurW7AF13Jwb_yoW8Cw48pa
        18Aan0kF4UXF1UCw4Iyrn8Cryjgw4rGF1qg34rt345ur1q93W3GFykC3yj9FyDur1fCw1v
        vrW5t3sxWa1j9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjfHUDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/12/2020 06:09 PM, Jiaxun Yang wrote:
>
>
> 在 2020/11/12 18:04, Jiaxun Yang 写道:
>> Hi Tiezhu,
>>
>> 在 2020/11/12 16:29, Tiezhu Yang 写道:
>>> Add read_persistent_clock64() to read the time from the battery backed
>>> persistent clock. With this patch, we can fix the wrong time issue due
>>> to the system clock is not consistent with hardware clock after resume
>>> from sleep state S3 (suspend to RAM), at the same time, the system time
>>> can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc 
>>> driver.
>>>
>>> start_kernel()
>>>    timekeeping_init()
>>>      read_persistent_wall_and_boot_offset()
>>>        read_persistent_clock64()
>>>
>>> timekeeping_resume()
>>>    read_persistent_clock64()
>>>
>>> timekeeping_suspend()
>>>    read_persistent_clock64()
>>
>> It is highly discoraged to do anything with bridgetype, which isn't 
>> probed via
>> devicetree.
>>
>> Please check if you can deal with that inside RTC framework, or make 
>> it as
>> a part of RTC driver (e.g. set up a callback).
>>
>> Also you should submit RTC driver at first if you intend to complete 
>> LS7A support.
>
> Oops,
> Just dig it deeper, I guess simply select RTC_HCTOSYS would solve the 
> issue.
> We're trying very hard to decouple all the drivers and conponents,
> DeviceTree for all!

+cc WANG Xuerui <git@xen0n.name>

Hi Jiaxun,

Thanks for your reply.

Xuerui has already submitted the patch of LS7A rtc driver [1],
but not yet been merged into the mainline kernel, I discussed
with him early today.

Do you mean that read_persistent_clock64() can call the function
like rtc_read_time() defined in rtc driver?

Thanks,
Tiezhu

[1] 
https://patchwork.kernel.org/project/linux-mips/patch/20200923075845.360974-2-git@xen0n.name/

>
>>
>> Thanks.
>>
>> - Jiaxun
>>
>>>
>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>

