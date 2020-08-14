Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A7B2445D9
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 09:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgHNHba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 03:31:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34602 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726455AbgHNHba (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 03:31:30 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxCMXHPTZf+tIIAA--.125S3;
        Fri, 14 Aug 2020 15:31:21 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson: Set CONFIG_FRAME_WARN=2048 in
 loongson3_defconfig to fix build warning
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1597373793-8482-1-git-send-email-yangtiezhu@loongson.cn>
 <20200814065310.GA4751@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <be055bef-e731-7242-78ca-e1844389c791@loongson.cn>
Date:   Fri, 14 Aug 2020 15:31:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200814065310.GA4751@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxCMXHPTZf+tIIAA--.125S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1UAr1DXF4DXFy5Wr45KFg_yoWkWwb_Wr
        yUGaykurW5ArykuFZ7Wws5C392ya4UZw1rAr15Xr13Xas3trnxtw4kJrn8CFn8X3Zrtrsx
        Z3y8A3sFkF1IqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUMMKZUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/14/2020 02:53 PM, Thomas Bogendoerfer wrote:
> On Fri, Aug 14, 2020 at 10:56:33AM +0800, Tiezhu Yang wrote:
>> Fixes: 70b838292bef ("MIPS: Update default config file for Loongson-3")
> I'm not so sure whether this warrants a fixes tag.

I use git bisect to find it is the first bad commit. Please let me know
if it is not necessary and then I will remove the Fixes tag.

>
>>   arch/mips/configs/loongson3_defconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
>> index a65b08d..2b356d9 100644
>> --- a/arch/mips/configs/loongson3_defconfig
>> +++ b/arch/mips/configs/loongson3_defconfig
>> @@ -403,7 +403,7 @@ CONFIG_CRYPTO_TEA=m
>>   CONFIG_CRYPTO_TWOFISH=m
>>   CONFIG_CRYPTO_DEFLATE=m
>>   CONFIG_PRINTK_TIME=y
>> -CONFIG_FRAME_WARN=1024
>> +CONFIG_FRAME_WARN=2048
> what about just dropping it ? Default for 64bit is 2048. Leaving it out
> of the config has the advantage that you will get a change of the default
> for free.

OK, looks good to me, I will send v2.

Thanks,
Tiezhu

>
> Thomas.
>

