Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70102E756A
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 01:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL3AzV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 19:55:21 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56048 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726156AbgL3AzV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 19:55:21 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax+cnKz+tf56YHAA--.56S3;
        Wed, 30 Dec 2020 08:54:35 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Give chance to build under !CONFIG_NUMA
 and !CONFIG_SMP
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1606998772-5904-1-git-send-email-yangtiezhu@loongson.cn>
 <20201215132123.GA9201@alpha.franken.de>
 <3eb215e2-82ae-2834-2837-55f429027840@loongson.cn>
 <20201229163907.GA8519@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5354959b-eacb-ff77-ab3d-dc0a6c89dc9f@loongson.cn>
Date:   Wed, 30 Dec 2020 08:54:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201229163907.GA8519@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax+cnKz+tf56YHAA--.56S3
X-Coremail-Antispam: 1UD129KBjvJXoW7try8Xw15Xw1fAFyxGr1xKrg_yoW8KFyDpa
        yvkasIyws2ga45AasxAw1Iq34Yqw48ArW2yFW8W34UAa4q9F97Kr4rtF1j9F1Ikr4v9a10
        ga15WFy5GryvvF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6w1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUb5Ef7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/30/2020 12:39 AM, Thomas Bogendoerfer wrote:
> On Wed, Dec 16, 2020 at 10:44:23AM +0800, Tiezhu Yang wrote:
>> I have tested the following three configs on the Loongson platform:
>> (1) !NUMA and !SMP,
>> (2) !NUMA and SMP,
>> (3) NUMA and SMP,
>> everything is all right.
>>
>> But there exists the following build error under NUMA and !SMP:
>>
>>    CC      arch/mips/kernel/asm-offsets.s
>> In file included from ./include/linux/gfp.h:9:0,
>>                   from ./include/linux/xarray.h:14,
>>                   from ./include/linux/radix-tree.h:19,
>>                   from ./include/linux/fs.h:15,
>>                   from ./include/linux/compat.h:17,
>>                   from arch/mips/kernel/asm-offsets.c:12:
>> ./include/linux/topology.h: In function ‘numa_node_id’:
>> ./include/linux/topology.h:119:2: error: implicit declaration of function
>> ‘cpu_logical_map’ [-Werror=implicit-function-declaration]
>>    return cpu_to_node(raw_smp_processor_id());
>>    ^
>> cc1: some warnings being treated as errors
>> scripts/Makefile.build:117: recipe for target
>> 'arch/mips/kernel/asm-offsets.s' failed
>> make[1]: *** [arch/mips/kernel/asm-offsets.s] Error 1
>> arch/mips/Makefile:396: recipe for target 'archprepare' failed
>> make: *** [archprepare] Error 2
>>
>> I find a patch to fix this kind of build errors [1], but it seems
>> meaningless.
>>
>> According to the NUMA and SMP description in arch/mips/Kconfig,
>> we will use only one CPU of a multiprocessor machine if !SMP,
>> on single node systems leave NUMA disabled.
>>
>> So I think there is no need to use NUMA if !SMP, and also we should
>> make NUMA depend on SMP to avoid build errors.
> ok, but compiling IP27 with your patch gives
>
> WARNING: unmet direct dependencies detected for NUMA
>    Depends on [n]: SYS_SUPPORTS_NUMA [=y] && SMP [=n]
>    Selected by [y]:
>    - SGI_IP27 [=y] && <choice>
>
> WARNING: unmet direct dependencies detected for NUMA
>    Depends on [n]: SYS_SUPPORTS_NUMA [=y] && SMP [=n]
>    Selected by [y]:
>    - SGI_IP27 [=y] && <choice>
>
> WARNING: unmet direct dependencies detected for NUMA
>    Depends on [n]: SYS_SUPPORTS_NUMA [=y] && SMP [=n]
>    Selected by [y]:
>    - SGI_IP27 [=y] && <choice>
>
> If I use "select SMP" instead both ip27 and loongson64 compile.
>
> If you are ok with this change, I'll change it while appling your
> patch.

No problem, looks good to me, thank you very much.

Thanks,
Tiezhu
>
> Thomas.
>

