Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E102A5D35
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 04:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgKDDvB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 22:51:01 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40318 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbgKDDvB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 22:51:01 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmtEdJaJfkGIFAA--.15514S3;
        Wed, 04 Nov 2020 11:50:54 +0800 (CST)
Subject: Re: [PATCH v3 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
To:     Huacai Chen <chenhc@lemote.com>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
 <1604387525-23400-2-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4WfaCLuCzvCJx-UriqgPAz2b0H6LGwMhyhRaxvuSAMwQ@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e999986a-8236-752a-8b17-353bb87fc521@loongson.cn>
Date:   Wed, 4 Nov 2020 11:50:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4WfaCLuCzvCJx-UriqgPAz2b0H6LGwMhyhRaxvuSAMwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxmtEdJaJfkGIFAA--.15514S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW3Cry7Wr13ArWkCw4UArb_yoW5Jw1fpa
        n5Aa1kGF4UXr1UuFnYy34DWrWrJ39xtrW2kanFqr95X3s3K3sFgr1fJ3W8JFyrZry8Ka10
        qFyF9rWjvanrC3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JU-miiUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/04/2020 10:00 AM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Tue, Nov 3, 2020 at 3:13 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
>> write operations are meaningless, remove them.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> v2: No changes
>> v3: No changes
>>
>>   arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 --------
>>   arch/mips/loongson64/numa.c                               | 3 ---
>>   2 files changed, 11 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
>> index 87a5bfb..e4d77f4 100644
>> --- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
>> +++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
>> @@ -19,10 +19,6 @@
>>          .macro  kernel_entry_setup
>>          .set    push
>>          .set    mips64
>> -       /* Set LPA on LOONGSON3 config3 */
>> -       mfc0    t0, CP0_CONFIG3
>> -       or      t0, (0x1 << 7)
>> -       mtc0    t0, CP0_CONFIG3
> Sorry for the late response, I have the same worry as Jiaxun. As you
> know, Loongson's user manuals are not always correct, but the original
> code comes from Loongson are usually better. So, my opinion is "Don't
> change it if it doesn't break anything".

Hi Huacai,

Thanks for your reply, I have confirmed by Loongson user manuals and
hardware designers, CP0_CONFIG3 register is read only.

Without this patch, the related kernel code is meaningless, with
this patch, it can reflect the reality.

Thanks,
Tiezhu

>
> Huacai
>
>>          /* Set ELPA on LOONGSON3 pagegrain */
>>          mfc0    t0, CP0_PAGEGRAIN
>>          or      t0, (0x1 << 29)
>> @@ -54,10 +50,6 @@
>>          .macro  smp_slave_setup
>>          .set    push
>>          .set    mips64
>> -       /* Set LPA on LOONGSON3 config3 */
>> -       mfc0    t0, CP0_CONFIG3
>> -       or      t0, (0x1 << 7)
>> -       mtc0    t0, CP0_CONFIG3
>>          /* Set ELPA on LOONGSON3 pagegrain */
>>          mfc0    t0, CP0_PAGEGRAIN
>>          or      t0, (0x1 << 29)
>> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
>> index cf9459f..c7e3cced 100644
>> --- a/arch/mips/loongson64/numa.c
>> +++ b/arch/mips/loongson64/numa.c
>> @@ -40,9 +40,6 @@ static void enable_lpa(void)
>>          unsigned long value;
>>
>>          value = __read_32bit_c0_register($16, 3);
>> -       value |= 0x00000080;
>> -       __write_32bit_c0_register($16, 3, value);
>> -       value = __read_32bit_c0_register($16, 3);
>>          pr_info("CP0_Config3: CP0 16.3 (0x%lx)\n", value);
>>
>>          value = __read_32bit_c0_register($5, 1);
>> --
>> 2.1.0
>>

