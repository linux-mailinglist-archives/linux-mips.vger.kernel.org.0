Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0476F4082FA
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 04:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbhIMCxW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 22:53:22 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:49960 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236935AbhIMCxW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Sep 2021 22:53:22 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436714|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0306803-0.0842631-0.885057;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.LJPrOgI_1631501518;
Received: from 192.168.88.131(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.LJPrOgI_1631501518)
          by smtp.aliyun-inc.com(10.147.41.158);
          Mon, 13 Sep 2021 10:52:03 +0800
Subject: Re: [PATCH 1/2] mips: convert syscall to generic entry
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
        arnd@arndb.de, Feiyang Chen <chenfeiyang@loongson.cn>,
        linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
        chenhuacai@kernel.org, Yanteng Si <siyanteng@loongson.cn>
References: <cover.1630929519.git.chenfeiyang@loongson.cn>
 <ec14e242a73227bf5314bbc1b585919500e6fbc7.1630929519.git.chenfeiyang@loongson.cn>
 <59feb382-a4ab-c94e-8f71-10ad0c0ceceb@flygoat.com>
 <CACWXhKnA24KuJo33+OitPQVRRd3g_05DWRC2Dsnm7w8hVyKjNQ@mail.gmail.com>
 <20210908085150.GA5622@alpha.franken.de>
 <13d237ab-0ef3-772d-6f21-ff023781efcf@flygoat.com>
 <7e2c0db1-bf5a-8f16-bc43-81830a30045e@wanyeetech.com>
Message-ID: <c5ec1d21-3517-489b-5abc-2e49096d91d3@wanyeetech.com>
Date:   Mon, 13 Sep 2021 10:51:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7e2c0db1-bf5a-8f16-bc43-81830a30045e@wanyeetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2021/9/9 下午8:45, Zhou Yanjie wrote:
> Hi,
>
> On 2021/9/8 下午8:41, Jiaxun Yang wrote:
>>
>> 在 2021/9/8 16:51, Thomas Bogendoerfer 写道:
>>> On Wed, Sep 08, 2021 at 10:08:47AM +0800, 陈飞扬 wrote:
>>>> On Tue, 7 Sept 2021 at 21:49, Jiaxun Yang <jiaxun.yang@flygoat.com> 
>>>> wrote:
>>>>>
>>>>> 在 2021/9/7 14:16, FreeFlyingSheep 写道:
>>>>>> From: Feiyang Chen <chenfeiyang@loongson.cn>
>>>>>>
>>>>>> Convert mips syscall to use the generic entry infrastructure from
>>>>>> kernel/entry/*.
>>>>>>
>>>>>> There are a few special things on mips:
>>>>>>
>>>>>> - There is one type of syscall on mips32 (scall32-o32) and three 
>>>>>> types
>>>>>> of syscalls on mips64 (scall64-o32, scall64-n32 and scall64-n64). 
>>>>>> Now
>>>>>> convert to C code to handle different types of syscalls.
>>>>>>
>>>>>> - For some special syscalls (e.g. fork, clone, clone3 and sysmips),
>>>>>> save_static_function() wrapper is used to save static registers. Now
>>>>>> SAVE_STATIC is used in handle_sys before calling do_syscall(), so 
>>>>>> the
>>>>>> save_static_function() wrapper can be removed.
>>>>>>
>>>>>> - For sigreturn/rt_sigreturn and sysmips, inline assembly is used to
>>>>>> jump to syscall_exit directly for skipping setting the error flag 
>>>>>> and
>>>>>> restoring all registers. Now use regs->regs[27] to mark whether to
>>>>>> handle the error flag and always restore all registers in 
>>>>>> handle_sys,
>>>>>> so these functions can return normally as other architecture.
>>>>> Hmm, that would give us overhead of register context on these 
>>>>> syscalls.
>>>>>
>>>>> I guess it's worthy?
>>>>>
>>>> Hi, Jiaxun,
>>>>
>>>> Saving and restoring registers against different system calls can be
>>>> difficult due to the use of generic entry.
>>>> To avoid a lot of duplicate code, I think the overhead is worth it.
>>> could you please provide numbers for that ? This code still runs
>>> on low end MIPS CPUs for which overhead might mean a different
>>> ballpark than some highend Loongson CPUs.
>>
>> It shows ~3% regression for UnixBench on MT7621A (1004Kec).
>>
>> + Yanjie could you help with a run on ingenic platform?
>
>
> Sure, I can help with JZ4775, JZ4780, X1000, X1830, X2000 from 
> Ingenic, and SF16A18, SF19A2890 from SiFlower.


Sorry for the delay.

I encountered some troubles when testing UNIX Bench on the Ingenic 
X2000(SMT on) and two SiFlower processors,
so I ended up with only the following test results:


Score Without Patches    Score With Patches    Performance Change    SoC 
Model
             105.9                                    101.2             
          -4.4%                         JZ4775
             132.4                                    122.0             
          -7.9%                         JZ4780(SMP off)
             170.2                                    149.5             
        -12.2%                         JZ4780(SMP on)
             101.3                                      89.0             
        -12.1%                         X1000E
             187.1                                    177.7             
          -5.0%                         X1830
             324.9                                    312.2             
          -3.9%                         X2000(SMT off)


On the whole, the impact on performance is quite huge.


Thanks and best regards!


>
> + Paul could you help with a run on JZ4760 and JZ4770?
>
> + Nikolaus could you help with a run on JZ4730?
>
>
> Thanks and best regards!
>
>
>>
>> Thanks.
>>
>> - Jiaxun
>>
>>>
>>> Thomas.
>>>
