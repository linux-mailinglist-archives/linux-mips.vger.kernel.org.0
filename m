Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321702CCD52
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 04:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgLCDaU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Dec 2020 22:30:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45538 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726938AbgLCDaU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Dec 2020 22:30:20 -0500
Received: from [10.130.0.58] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx73+dW8hfhUcZAA--.41169S3;
        Thu, 03 Dec 2020 11:29:34 +0800 (CST)
Subject: Re: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when
 synci_step is zero
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn>
 <20201202103943.GA9065@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <642b9149-6de5-fa04-80e2-aed7367b3cce@loongson.cn>
Date:   Thu, 3 Dec 2020 11:29:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201202103943.GA9065@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx73+dW8hfhUcZAA--.41169S3
X-Coremail-Antispam: 1UD129KBjvJXoW7try8Xw1ktFWUGr15ur15Jwb_yoW8trWxpF
        WUKw1rJrsxWr48ta4UJ3yDZw1fAw1Y9rW3GF15t345Aas8u3s7KF1Fga1Fga92vrWkGw12
        vFWjqr4YvFsrZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x07b7WlkUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On 12/02/2020 06:39 PM, Thomas Bogendoerfer wrote:
> On Wed, Dec 02, 2020 at 11:00:05AM +0800, Jinyang He wrote:
>> Reading synci_step by using rdhwr instruction may return zero if no cache
>> need be synchronized. On the one hand, to make sure all load operation and
>> store operation finished we do __sync() for every platform. On the other
>> hand, some platform need operate synci one time although step is zero.
> Should this be someting like: Avoid endless loop, if no synci is needed ?
>
>> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
>> index 57bdd276..47aeb33 100644
>> --- a/arch/mips/kernel/relocate.c
>> +++ b/arch/mips/kernel/relocate.c
>> @@ -64,7 +64,7 @@ static void __init sync_icache(void *kbase, unsigned long kernel_length)
>>   			: "r" (kbase));
>>   
>>   		kbase += step;
>> -	} while (kbase < kend);
>> +	} while (step && kbase < kend);
> why not do a
>
> 	if (step == 0)
> 		return;
>
> before entering the loop ? According to MIPS32PRA no synci is needed,
> if stepi value is zero.

Thanks for your reply.

Most platforms do not need to do synci instruction operations
when synci_step is 0. But for example, the synci implementation
on Loongson64 platform has some changes. On the one hand, it
ensures that the memory access instructions have been completed.
On the other hand, it guarantees that all prefetch instructions
need to be fetched again. And its address information is useless.
Thus, only one synci operation is required when synci_step is 0
on Loongson64 platform. I guess that some other platforms have
similar implementations on synci, so add judgment conditions in
`while` to ensure that at least all platforms perform synci
operations once. For those platforms that do not need synci,
they just do one more operation similar to nop.

I will modify the submitted information and send v2.

> Thomas.
> PS: Does anybody know a reason, why this code doesn't use an old fashioned
> dache/icache flushing, which might be slower but would work also on
> legecy cores ?
For this, my thought is that different platforms using the cache
instruction to flush caches is inconsistent. Here is just a more
general way to flush these caches.

Thanks,
Jinyang.

