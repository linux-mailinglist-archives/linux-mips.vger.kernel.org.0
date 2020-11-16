Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5BD32B402E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 10:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgKPJrx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 04:47:53 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55554 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728492AbgKPJrx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 04:47:53 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxqtDGSrJfUOIPAA--.24770S3;
        Mon, 16 Nov 2020 17:47:50 +0800 (CST)
Subject: Re: [RFC PATCH] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
 <62ea9838-70ce-ca73-7dae-e94620956ab5@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <aa8b9e92-8851-60d2-32d1-cec99be1af57@loongson.cn>
Date:   Mon, 16 Nov 2020 17:47:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <62ea9838-70ce-ca73-7dae-e94620956ab5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxqtDGSrJfUOIPAA--.24770S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fWw1fJF4UtFyrZFykuFg_yoW8AFyrpa
        1vka1Dt3ykXayUK3W0yr4rZ345t393GayYkFZxKry5J3WrXa4fKrWftrs8WFn2gr1kKa4I
        qF9aqFyjgr1vy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUbEfYDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/16/2020 05:08 PM, Sergei Shtylyov wrote:
> Hello!
>
> On 16.11.2020 8:03, Tiezhu Yang wrote:
>
>> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
>> CONFIG_DEBUG_ATOMIC_SLEEP:
>>
>>    CC      arch/mips/kernel/signal.o
>> {standard input}: Assembler messages:
>> {standard input}:1775: Error: Unable to parse register name $fp
>> scripts/Makefile.build:283: recipe for target 
>> 'arch/mips/kernel/signal.o' failed
>> make[2]: *** [arch/mips/kernel/signal.o] Error 1
>> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
>> make[1]: *** [arch/mips/kernel] Error 2
>> Makefile:1799: recipe for target 'arch/mips' failed
>> make: *** [arch/mips] Error 2
>>
>> I think it is useful to get debugging information as described in the
>> following texts:
>>
>> lib/Kconfig.debug
>> config FRAME_POINTER
>>          bool "Compile the kernel with frame pointers"
>>          ...
>>          default y if (DEBUG_INFO && UML) || ARCH_WANT_FRAME_POINTERS
>>          help
>>            If you say Y here the resulting kernel image will be slightly
>>            larger and slower, but it gives very useful debugging 
>> information
>>            in case of kernel bugs. (precise oopses/stacktraces/warnings)
>>
>> Documentation/dev-tools/kgdb.rst
>> This option inserts code to into the compiled executable which saves
>
>    So to or into? :-)

Hi Sergei,

Thanks for pointing that out，this may be a typo which should be "into".
I will update the commit message to correct it.

Thanks,
Tiezhu

>
>> the frame information in registers or on the stack at different points
>> which allows a debugger such as gdb to more accurately construct stack
>> back traces while debugging the kernel.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> [...]
>
> MBR, Sergei

