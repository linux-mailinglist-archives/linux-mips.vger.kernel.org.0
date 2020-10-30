Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CBC29FDC6
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 07:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgJ3GWz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 02:22:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39424 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgJ3GWz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Oct 2020 02:22:55 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx338isZtfju8CAA--.627S3;
        Fri, 30 Oct 2020 14:22:26 +0800 (CST)
Subject: Re: [PATCH 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
 <1603958581-4723-2-git-send-email-yangtiezhu@loongson.cn>
 <a384c467-048d-1296-4a0d-ecbf4cea844d@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <7306f77f-b70a-862d-b4c5-d8f20102dc62@loongson.cn>
Date:   Fri, 30 Oct 2020 14:22:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a384c467-048d-1296-4a0d-ecbf4cea844d@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx338isZtfju8CAA--.627S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw1kGry3ArWkuF4xWr4UJwb_yoWDZFcEkF
        yxKrZ7CrWkJr1fAanrK3yrWFySkayUWwsrWr15Jr4xXw42vryDXa929r4xW3y3WasFyrsa
        qrWFqa4akFn2kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbskFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
        IFyTuYvjfU1uc_DUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/30/2020 12:00 PM, Jiaxun Yang wrote:
>
>
> 在 2020/10/29 16:02, Tiezhu Yang 写道:
>> The field LPA of CP0_CONFIG3 register is read only for Loongson64, so 
>> the
>> write operations are meaningless, remove them.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 --------
>>   arch/mips/loongson64/numa.c                               | 3 ---
>>   2 files changed, 11 deletions(-)
> Hi Tiezhu,
>
> AFAIK it's not read only on 3A1000.
> Have you check with hardware guys?

Hi Jiaxun,

Yes, I checked it before send this patch,  the field LPA of CP0_CONFIG3
on 3A1000 is also read only,  we can see the related description in the
chapter 3.22 of Loongson_3A1000_cpu_user_2.

And also we can see the following description in the chapter
"9.45 Configuration Register 3 (CP0 Register 16, Select 3)" of
MD00091-2B-MIPS64PRA-AFP-05.04:
"The Config3 register encodes additional capabilities.
All fields in the Config3 register are read-only."

Thanks,
Tiezhu

>
> Thanks.
>
> - Jiaxun

