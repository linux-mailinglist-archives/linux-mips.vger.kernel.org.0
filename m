Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9342C26F5D3
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 08:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgIRGUo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 02:20:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55436 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726022AbgIRGUo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 02:20:44 -0400
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMSxUWRfgSoWAA--.1044S3;
        Fri, 18 Sep 2020 14:20:34 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Add kexec/kdump support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
References: <1600175263-7872-1-git-send-email-hejinyang@loongson.cn>
 <376B4B91-0736-43FA-87EA-43E12FF24EF1@flygoat.com>
 <7b78c4d4-7ee3-cf57-71d1-95611713de2b@loongson.cn>
 <CAAhV-H5t3KWL1O+JKVp+T2qqGXuW7OiasjnnCLmV0+GE0Ns9xQ@mail.gmail.com>
 <647822a9-bc3b-5da1-95e7-c048a5a3b8fa@loongson.cn>
 <42ff66fb-a0bf-937f-8415-5d407fb93e03@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Youling Tang <tangyouling@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kexec@lists.infradead.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <97e7b66c-b1cc-4810-7431-ba302abaabe0@loongson.cn>
Date:   Fri, 18 Sep 2020 14:20:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <42ff66fb-a0bf-937f-8415-5d407fb93e03@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxmMSxUWRfgSoWAA--.1044S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JFy8ZFWUWF15ZFWktrW8JFb_yoWxCFW3pa
        y5Aa1Ykr4DJr42ywsaqr18ZryYv34rJr9rWr43tryDuryqq3WxJr1IvF1Y9F9rZr1rKF12
        vryfXw1xuF1jyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjY0PDUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/17/2020 10:21 PM, Jiaxun Yang wrote:
>
>
> 在 2020/9/17 20:41, Jinyang He 写道:
>> Hi, Huacai,
>>
>>
>> On 09/16/2020 01:39 PM, Huacai Chen wrote:
>>> Hi, Jinyang,
>>>
>>> On Tue, Sep 15, 2020 at 10:17 PM Jinyang He <hejinyang@loongson.cn> 
>>> wrote:
>>>>
>>>>
>>>> On 09/16/2020 09:33 AM, Jiaxun Yang wrote:
>>>>> 于 2020年9月15日 GMT+08:00 下午9:07:43, Jinyang He 
>>>>> <hejinyang@loongson.cn> 写到:
>>>>>> Add loongson_kexec_prepare(), loongson_kexec_shutdown() and
>>>>>> loongson_kexec_crashdown() for passing the parameters of kexec_args.
>>>>>>
>>>>>> To start loongson64, CPU0 needs 3 parameters:
>>>>>> fw_arg0: the number of cmd.
>>>>>> fw_arg1: cmd structure which seems strange, the cmd array[index]'s
>>>>>>           value is cmd string's address, index >= 1.
>>>>>> fw_arg2: environment.
>>>>>>
>>>>>> Secondary CPUs do not need parameter at once. They query their
>>>>>> mailbox to get PC, SP and GP in a loop before CPU0 brings them up
>>>>>> and passes these parameters via mailbox.
>>>>>>
>>>>>> loongson_kexec_prepare(): Alloc new memory to save cmd for kexec.
>>>>>> Combine the kexec append option string as cmd structure, and the cmd
>>>>>> struct will be parsed in fw_init_cmdline() of 
>>>>>> arch/mips/fw/lib/cmdline.c.
>>>>>> image->control_code_page need pointing to a safe memory page. In 
>>>>>> order to
>>>>>> maintain compatibility for the old firmware the low 2MB is reserverd
>>>>>> and safe for Loongson. So let it points here.
>>>>>>
>>>>>> loongson_kexec_shutdown(): Wake up all present CPUs and let them go
>>>>>> to reboot_code_buffer. Pass the kexec parameters to kexec_args.
>>>>>>
>>>>>> loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
>>>>>>
>>>>>> The assembly part provide a way like BIOS doing to keep secondary
>>>>>> CPUs in a querying loop.
>>>>>>
>>>>>> This patch referenced [1][2][3].
>>>>>>
>>>>>> [1] arch/mips/cavium-octeon/setup.c
>>>>>> [2] https://patchwork.kernel.org/patch/10799217/
>>>>>> [3] 
>>>>>> https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h 
>>>>>>
>>>>>>
>>>>>> Co-developed-by: Youling Tang <tangyouling@loongson.cn>
>>>>>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>>>>>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>>>>>> ---
>>>>>> arch/mips/kernel/relocate_kernel.S | 19 ++++++++
>>>>>> arch/mips/loongson64/reset.c       | 88 
>>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>> 2 files changed, 107 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/mips/kernel/relocate_kernel.S 
>>>>>> b/arch/mips/kernel/relocate_kernel.S
>>>>>> index ac87089..061cbfb 100644
>>>>>> --- a/arch/mips/kernel/relocate_kernel.S
>>>>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>>>>> @@ -133,6 +133,25 @@ LEAF(kexec_smp_wait)
>>>>>> #else
>>>>>>       sync
>>>>>> #endif
>>>>>> +
>>>>>> +#ifdef CONFIG_CPU_LOONGSON64
>>>>>> +#define MAILBOX_BASE 0x900000003ff01000
>>>>> Please avoid hardcoded SMP information. You're breaking Loongson 
>>>>> 3B support.
>>>>>
>>>> Ok, I see. Since my machine is Loongson 3A. I'll send v2
>>>> after I test it in 3B.
>>> 1, My original version can work on both Loongson-3A and Loongson-3B,
>>> why you modify my patch and hadn't discuss with me?
>>>
>>> 2, With this single patch both kexec and kdump cannot work reliably,
>>> because kexec need this patch:
>>>     https://patchwork.kernel.org/patch/11695929/
>>>
>>>     and kdump need my first patch in my original version:
>>>     https://patchwork.kernel.org/patch/10799215/
>>>
>>>     You may argue that you have tested. Yes, I believe that, I'm not
>>> saying that you haven't test, and I'm not saying that your patch
>>> cannot work, I'm just saying that your patch is not robust.
>>>
>>> 3, I'm the original author and paying attention to kexec/kdump
>>> continuosly, I will send a new version once the above two patches be
>>> accepted. But you re-send my patch without any communication with me,
>>> why you so impatient?
>>>
>>> Huacai
>>>
>>
>> 1, Your original version:
>>    https://patchwork.kernel.org/patch/10799217/
>>
>> This patch can work on Loongson-3A, I tested it.
>>
>> But it works wrong after the follow behaviors,
>>    kexec -l vmlinux --append=cmdline_kexec
>>    kexec -p vmlinux --append=cmdline_kdump
>>    kexec -e
>>
>> It works but cmdline_kdump merged cmdline_kexec.
>>
>> And this patch memcpy from fw_arg2 to kexec_envp and later memcpy from
>> kexec_envp to fw_arg2 when fw_arg2 was not changed, it's redundant.
>>
>> However, I have not Loongson-3B now, and did not test it. For this 
>> patch,
>> does it work well on Loongson-3B3000/Loongson-3B4000?
>
> Hi Jingyang,
>
> Well for Loongson-3B I meant 3B1000/3B1500, which have different layout
> of SMP registers. For 3B3000/3B4000 everyone know they're just different
> branding to the same silicon.

OK, I see. Thank you.

>>
>> 3, I try to fix Loongson64 kexec function since I joined the community.
>> I fell sorry to not do enough research on Loongson64 kexec. My first 
>> patch:
>>    https://patchwork.kernel.org/patch/11684849/
>
> I'm glad to see Loongson staff joining the community and enhance our 
> code.
> It is common practice to investigate historical changes before do 
> something
> to the upstream code :-)
>
>>
>> It fixed problem about "Crash kernel" which can be traced back to 
>> linux-5.4.
>> At that time, I thought there is no developer work on Kexec. Thus, I 
>> did a
>> lot on Kexec. Are you really continuosly paying attention to 
>> kexec/kdump?
>> With the exploring and developing deep, I found your patch several 
>> days ago
>> after I did a draft patch witch referenced:
>>    arch/mips/cavium-octeon/setup.c
>> https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h
>>
>> There is no doubt that your patch gives me confidence and suggestion 
>> while
>> it gives me worry. As a newcomer, I do not know if should communicate 
>> with
>> you since your patch was committed one year ago. And now it may be a 
>> good
>> chance to do some communication.
>
> You should *always* try to *credit* others properly, that's the first 
> thing.
> Communication is optional but highly recommanded.
>
> Recently I can smell there are some tensions raised between the 
> community and
> the Loongson company, mainly about GPL violation and Loongson's attitude
> towards the community. Personaly I don't hold any hostility to Loongosn's
> practice in the community but I'd also like to see Loongson show their 
> respect
> to the community.

I have replied to Yanjie:
https://lore.kernel.org/patchwork/patch/1306401/#1502870

>
> Thanks.
>
> - Jiaxun
>
>>
>> Thanks,
>>
>> - Jinyang.
>>

