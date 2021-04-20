Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063133651CA
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 07:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhDTFWp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 01:22:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47414 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229523AbhDTFWp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Apr 2021 01:22:45 -0400
Received: from [10.130.0.193] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax7cj+ZH5ghuAKAA--.14700S3;
        Tue, 20 Apr 2021 13:22:07 +0800 (CST)
Subject: Re: [PATCH] mips: kdump: Crash kernel should be able to see old
 memories
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1618829807-12522-1-git-send-email-tangyouling@loongson.cn>
 <bd5b70cf-cfdf-0a4a-dfb5-08e030864138@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <a04a736e-4f64-0491-165c-2544bb178d73@loongson.cn>
Date:   Tue, 20 Apr 2021 13:22:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <bd5b70cf-cfdf-0a4a-dfb5-08e030864138@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax7cj+ZH5ghuAKAA--.14700S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kAw45Cr4kCw43ur4DJwb_yoW8ur4kpr
        WxJa4Ykr48GF1I9a4Iyw15uryfZa1kArWYganrGrW5ArnFyw1xGryFqFn09FyIvryfKFyv
        qFZYva4I9ayvyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
        9x07j2-erUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun

On 04/20/2021 09:11 AM, Jiaxun Yang wrote:
>
> 在 2021/4/19 18:56, Youling Tang 写道:
>> From: Huacai Chen <chenhc@lemote.com>
>>
>> kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
>> commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
>> BIOS passed memories are removed by early_parse_mem(). I think this is
>> reasonable for a normal kernel but not for a crash kernel, because a
>> crash kernel should be able to see all old memories, even though it is
>> not supposed to use them.
>>
>> Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
>> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>>   arch/mips/kernel/setup.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index b86e241..ac90d3b 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -351,8 +351,10 @@ static int __init early_parse_mem(char *p)
>>        */
>>       if (usermem == 0) {
>>           usermem = 1;
>> +#ifndef CONFIG_CRASH_DUMP
>
> Why depend on a config instead of a runtime variable?
>
If not depend on config, we can determine whether the command line contains
the "elfcorehdr=" parameter, because the "mem=" and "elfcorhdr=" parameters
are automatically added in kexec-tools. So if there is an "elfcorehdr="
parameter in the command line, it means that the currently running kernel
is a capture kernel, and the memblock_remove() operation is not called.

The revised patch is as follows:
         if (usermem == 0) {
                 usermem = 1;
-               memblock_remove(memblock_start_of_DRAM(),
-                       memblock_end_of_DRAM() - memblock_start_of_DRAM());
+               if (!strstr(boot_command_line, "elfcorehdr")) {
+                       memblock_remove(memblock_start_of_DRAM(),
+                               memblock_end_of_DRAM() - 
memblock_start_of_DRAM());
+               }

Do you think it is feasible?
> Btw as you are fixing my commit please keep me CCed.
Sorry, I will add your CCed.

Thanks,
Youling
>
> Thanks.
>
>
> - Jiaxun
>

