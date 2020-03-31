Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6841B198CDA
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 09:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgCaHVG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 03:21:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60752 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726216AbgCaHVG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 03:21:06 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax9ulc74JetQAiAA--.20S3;
        Tue, 31 Mar 2020 15:21:01 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson: Use CONFIG_NR_CPUS_DEFAULT_64 to support
 more CPUs
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1585638006-19439-1-git-send-email-yangtiezhu@loongson.cn>
 <6A188705-D65C-4500-BD26-EB944EEF0B21@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c4520c91-5285-ca8d-c310-5354f3ef3cba@loongson.cn>
Date:   Tue, 31 Mar 2020 15:21:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <6A188705-D65C-4500-BD26-EB944EEF0B21@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax9ulc74JetQAiAA--.20S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr43WrWxGr48JF1kWw45ZFb_yoW8Jw4Upr
        4kKan2gr4v9F1YkFZYyr93urW3Zr93KrZ3Gr10yry7CF98u34DGrnYgwnFgFWUZr4kta1I
        9F93CryYkayUCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JU9o7NUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/31/2020 03:05 PM, Jiaxun Yang wrote:

>
> 于 2020年3月31日 GMT+08:00 下午3:00:06, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
>> When I update the mainline kernel on the Loongson 2-way platform which
>> has 8 CPUs, it only shows 4 CPUs due to NR_CPUS is 4, this is obviously
>> wrong.
>>
>> In order to support more CPUs on the Loongson platform, it is better
>> to use CONFIG_NR_CPUS_DEFAULT_64 instead of CONFIG_NR_CPUS_DEFAULT_4
>> to specify the maximum number of CPUs which the kernel will support.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Would 16 be a better option?
> We have only 4 way platform.

There maybe have more than 4 cores per CPU or more than 4 ways
in the future, so I think 64 is better, otherwise we need to
modify this configuration once more.

>
>> ---
>> arch/mips/Kconfig | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index a1f973c..a0b11f5 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -475,7 +475,7 @@ config MACH_LOONGSON64
>> 	select ISA
>> 	select I8259
>> 	select IRQ_MIPS_CPU
>> -	select NR_CPUS_DEFAULT_4
>> +	select NR_CPUS_DEFAULT_64
>> 	select USE_GENERIC_EARLY_PRINTK_8250
>> 	select SYS_HAS_CPU_LOONGSON64
>> 	select SYS_HAS_EARLY_PRINTK

