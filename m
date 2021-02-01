Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE96309FDE
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 02:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhBABNu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Jan 2021 20:13:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42480 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229656AbhBABNr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 Jan 2021 20:13:47 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSdSQVRdg1AcBAA--.1074S3;
        Mon, 01 Feb 2021 09:12:49 +0800 (CST)
Subject: Re: [PATCH 1/3] MIPS: ftrace: Fix N32 save registers
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
 <b1a5eae4-2032-4ace-aa48-a21893e47528@www.fastmail.com>
Cc:     Wu Zhangjin <wuzhangjin@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <d9548ffc-9d91-baf6-107a-af1b174db29b@loongson.cn>
Date:   Mon, 1 Feb 2021 09:12:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b1a5eae4-2032-4ace-aa48-a21893e47528@www.fastmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxSdSQVRdg1AcBAA--.1074S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1UtryfZF1rGrWkXFW3trb_yoW8GryDp3
        y8AF4kWFW0vry5Gry5X39agry5twnxAryvgFWqv34rJFs0g3WrXw1ktrnIgrsFqFW0kr40
        9rW3WrZ8Aa9ayFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUbLiSPUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/31/2021 06:38 PM, Jiaxun Yang wrote:

>
> On Sun, Jan 31, 2021, at 4:14 PM, Jinyang He wrote:
>> CONFIG_64BIT is confusing. N32 also pass parameters by a0~a7.
> Do we have NEW kernel build?
> CONFIG_64BIT assumed N64 as kernel ABI.
>
>
> -Jiaxun
Hi, Jiaxun,

Thank you for your reply, and now I know. Before that, I saw the macro
from arch/mips/include/asm/regdef.h and thought it needed to be modified
here. But that seems have no sence.
Please ignore this patch.

Thanks,
Jinyang

>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/kernel/mcount.S | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
>> index cff52b2..808257a 100644
>> --- a/arch/mips/kernel/mcount.S
>> +++ b/arch/mips/kernel/mcount.S
>> @@ -27,7 +27,7 @@
>>   	PTR_S	a1, PT_R5(sp)
>>   	PTR_S	a2, PT_R6(sp)
>>   	PTR_S	a3, PT_R7(sp)
>> -#ifdef CONFIG_64BIT
>> +#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
>>   	PTR_S	a4, PT_R8(sp)
>>   	PTR_S	a5, PT_R9(sp)
>>   	PTR_S	a6, PT_R10(sp)
>> @@ -42,7 +42,7 @@
>>   	PTR_L	a1, PT_R5(sp)
>>   	PTR_L	a2, PT_R6(sp)
>>   	PTR_L	a3, PT_R7(sp)
>> -#ifdef CONFIG_64BIT
>> +#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
>>   	PTR_L	a4, PT_R8(sp)
>>   	PTR_L	a5, PT_R9(sp)
>>   	PTR_L	a6, PT_R10(sp)
>> -- 
>> 2.1.0
>>
>>

