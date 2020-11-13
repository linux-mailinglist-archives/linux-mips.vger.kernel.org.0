Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4AA2B14CC
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 04:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgKMDlH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 22:41:07 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60740 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726011AbgKMDlH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 22:41:07 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOtBNAK5fkjUNAA--.19164S3;
        Fri, 13 Nov 2020 11:41:02 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
 <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com>
 <b84fe88b-7527-e88c-1efd-739f6d846518@flygoat.com>
 <6f0a7a43-4eac-65d8-61ff-778dc13f925c@loongson.cn>
 <1e01b317-b315-443c-a53b-db360ea17254@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        WANG Xuerui <git@xen0n.name>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bb0fbd42-07b2-397b-1a63-f7817a1a9d4b@loongson.cn>
Date:   Fri, 13 Nov 2020 11:41:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1e01b317-b315-443c-a53b-db360ea17254@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxOtBNAK5fkjUNAA--.19164S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWDGrWxXrWUWF4fXr1kZrb_yoW5Aw1rp3
        y8Aay5Kr4UXryUuw42yrn8CFyjg3y3GF4jq3s8J345Zryqvr13GrykC3yj9F9rXr1fCw4v
        vrW5t3sxWa1UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUa0PhUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/13/2020 10:21 AM, Jiaxun Yang wrote:
>
>
> 在 2020/11/12 20:03, Tiezhu Yang 写道:
>> On 11/12/2020 06:09 PM, Jiaxun Yang wrote:
>>>
>>>
>>> 在 2020/11/12 18:04, Jiaxun Yang 写道:
>>>> Hi Tiezhu,
>>>>
>>>> 在 2020/11/12 16:29, Tiezhu Yang 写道:
>>>>> Add read_persistent_clock64() to read the time from the battery 
>>>>> backed
>>>>> persistent clock. With this patch, we can fix the wrong time issue 
>>>>> due
>>>>> to the system clock is not consistent with hardware clock after 
>>>>> resume
>>>>> from sleep state S3 (suspend to RAM), at the same time, the system 
>>>>> time
>>>>> can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc 
>>>>> driver.
>>>>>
>>>>> start_kernel()
>>>>>    timekeeping_init()
>>>>>      read_persistent_wall_and_boot_offset()
>>>>>        read_persistent_clock64()
>>>>>
>>>>> timekeeping_resume()
>>>>>    read_persistent_clock64()
>>>>>
>>>>> timekeeping_suspend()
>>>>>    read_persistent_clock64()
>>>>
>>>> It is highly discoraged to do anything with bridgetype, which isn't 
>>>> probed via
>>>> devicetree.
>>>>
>>>> Please check if you can deal with that inside RTC framework, or 
>>>> make it as
>>>> a part of RTC driver (e.g. set up a callback).
>>>>
>>>> Also you should submit RTC driver at first if you intend to 
>>>> complete LS7A support.
>>>
>>> Oops,
>>> Just dig it deeper, I guess simply select RTC_HCTOSYS would solve 
>>> the issue.
>>> We're trying very hard to decouple all the drivers and conponents,
>>> DeviceTree for all!
>>
>> +cc WANG Xuerui <git@xen0n.name>
>>
>> Hi Jiaxun,
>>
>> Thanks for your reply.
>>
>> Xuerui has already submitted the patch of LS7A rtc driver [1],
>> but not yet been merged into the mainline kernel, I discussed
>> with him early today.
>>
>> Do you mean that read_persistent_clock64() can call the function
>> like rtc_read_time() defined in rtc driver?
>
> I do think select RTC_HCTOSYS after getting RTC driver applied can help.

Yes, I agree.

> What's your point to have read_persistent_clock64 for Loongson64?

(1) Currently, the LS7A RTC driver has not been merged into the
mainline kernel, read_persistent_clock64() is useful in the following
call path:

start_kernel()
    timekeeping_init()
      read_persistent_wall_and_boot_offset()
        read_persistent_clock64()

(2) When the LS7A RTC driver is merged into the mainline kernel
some time later, if RTC_HCTOSYS and RTC_DRV_LS2X are not set,
read_persistent_clock64() is also useful unless RTC_HCTOSYS
and RTC_DRV_LS2X are set by default in Kconfig instead of
loongson3_defconfig.

So I think read_persistent_clock64() looks like a backup function.

>
> Thanks
>
> - Jiaxun
>
>>
>> Thanks,
>> Tiezhu
>>
>> [1] 
>> https://patchwork.kernel.org/project/linux-mips/patch/20200923075845.360974-2-git@xen0n.name/
>>
>>>
>>>>
>>>> Thanks.
>>>>
>>>> - Jiaxun
>>>>
>>>>>
>>>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>>> ---
>>>>>

