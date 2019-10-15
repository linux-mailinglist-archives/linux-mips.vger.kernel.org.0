Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE22D6DFD
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 06:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbfJOEAv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 00:00:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45052 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfJOEAu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Oct 2019 00:00:50 -0400
Received: from [10.20.41.27] (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPDxz2JgRKVdtuEQAA--.1S3;
        Tue, 15 Oct 2019 12:00:43 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson: Make default kernel log buffer size as
 128KB for Loongson3
To:     Huacai Chen <chenhc@lemote.com>
References: <1571101656-871-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H573fv+NVqBRgU38BRDDX=syj3gUqnJqRp4CdBx+QcdpQ@mail.gmail.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d897527b-3c36-41a8-b878-64a099cbdfa0@loongson.cn>
Date:   Tue, 15 Oct 2019 12:00:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H573fv+NVqBRgU38BRDDX=syj3gUqnJqRp4CdBx+QcdpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QMiowPDxz2JgRKVdtuEQAA--.1S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1ruF1rGw13tr18Xw1UJrb_yoW8Gw4rpw
        4rJa1DKrWkXr1rCFWkCas7WrWxtFZxZFn7WF48AF1rAF95W3WUXr1qqw1jgrZrXF9rt3W0
        9F95Kr1Yka17ua7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1ZXrUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/15/2019 11:36 AM, Huacai Chen wrote:
> On Tue, Oct 15, 2019 at 10:12 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> When I update kernel with loongson3_defconfig based on the Loongson 3A3000
>> platform, then using dmesg command to show kernel ring buffer, the initial
>> kernel messages have disappeared due to the log buffer is too small, it is
>> better to change the default kernel log buffer size from 16KB to 128KB.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/configs/loongson3_defconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
>> index 90ee008..3aa2201 100644
>> --- a/arch/mips/configs/loongson3_defconfig
>> +++ b/arch/mips/configs/loongson3_defconfig
>> @@ -12,7 +12,7 @@ CONFIG_TASKSTATS=y
>>   CONFIG_TASK_DELAY_ACCT=y
>>   CONFIG_TASK_XACCT=y
>>   CONFIG_TASK_IO_ACCOUNTING=y
>> -CONFIG_LOG_BUF_SHIFT=14
>> +CONFIG_LOG_BUF_SHIFT=17
> Hi, Tiezhu,
>
> Why you choose 128KB but not 64KB or 256KB? I found 64KB is enough for
> our cases. And if you really need more, I think 256KB could be better
> because there are many platforms choose 256KB.

Hi Huacai,

Thanks for your reply and suggestion, I will send a v2 patch.

Thanks,

Tiezhu Yang

>
> Huacai
>
>>   CONFIG_MEMCG=y
>>   CONFIG_MEMCG_SWAP=y
>>   CONFIG_BLK_CGROUP=y
>> --
>> 2.1.0
>>
>>

