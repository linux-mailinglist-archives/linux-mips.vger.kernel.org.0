Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6829D325B58
	for <lists+linux-mips@lfdr.de>; Fri, 26 Feb 2021 02:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBZBid (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 20:38:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57116 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229534AbhBZBic (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 20:38:32 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_PoUDhgULMPAA--.2921S3;
        Fri, 26 Feb 2021 09:37:45 +0800 (CST)
Subject: Re: [PATCH RFC] MIPS: Remove detect_memory_region()
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
References: <1614171720-13221-1-git-send-email-hejinyang@loongson.cn>
 <987b0dc5-9306-4271-afc0-7c44dba644b7@www.fastmail.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <a657ea7c-3d0e-6b92-5ad6-c445e827a845@loongson.cn>
Date:   Fri, 26 Feb 2021 09:37:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <987b0dc5-9306-4271-afc0-7c44dba644b7@www.fastmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn_PoUDhgULMPAA--.2921S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5JryruF17ur13Jw48Crg_yoW8uw48p3
        98GanI9rs8tryIvws7Zw409rWfA395Ga15XFyYyryDu345WrnayF4Sqw4UK34qyr1fGw4U
        Za10qr4UZa4qvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU8sqXPUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/24/2021 11:40 PM, Jiaxun Yang wrote:

>
> On Wed, Feb 24, 2021, at 9:02 PM, Jinyang He wrote:
>> detect_memory_region() was committed by Commit 4d9f77d25268 ("MIPS: add
>> detect_memory_region()"). Then it was equipped by Commit dd63b00804a5
>> ("MIPS: ralink: make use of the new memory detection code") and
>> Commit 9b75733b7b5e ("MIPS: ath79: make use of the new memory detection
>> code"). Its code is based on early ath79 platform code.
>>
>> What puzzles me is that how memcmp() detect the memory region. If `break`
>> was touched, the function could make sense. That means memcmp() should
>> return zero. Otherwise, the loop will be end by size > sz_max.
>>
>> I have tested detect_memory_region() on Loongson64 3A3000. On our design,
>> kseg0 low 256MB maps real memory and kseg0 high 256MB maps IO/PCI. The
>> function runs and last stopped on kseg1 where is uncached. In this process
>> memcmp also returned non-zero when detected kseg0 high 256MB. Then I did
>> another thing. memcpy first and test memcmp then (after &_end). It works
>> well on 3A3000 but badly on 3A4000. Maybe because kseg0 high 256MB maps
>> IO/PCI and it is dangerous to write like write memory.
>>
>> At last, read memory from where is not memory region may always return 0.
>> (Or trigger exception.) This function have been used several years and
>> seems no error occur. Maybe it's a fallback way.
> That is not true for other platforms like ath79 or mtk.
> They'll wrap around or return 0xffffffff for out of boundary accessing.
>
> Loongson does not apply to this case as it have special "Address Window"
> design to accurately describe address regions.
> Any access beyond described windows will be handled by MC and return 0 or random stuff.
>
> Again, please don't make changes because you can.
>
> Thanks.
>
> - Jiaxun

Hi, Jiaxun,

Thank you for answering this puzzle for me in detail.

Assume that the machine has 8MB real memory and dm address is (base + 3M).
When size = 8MB, there will be a phenomenon of `wrap around`, the actual
content of (dm + 8M + 3M) is content of (dm + 3M), so it will trigger
`break`, right? At this time, the kernel will add 8M to the memory.

Thanks,
Jinyang

