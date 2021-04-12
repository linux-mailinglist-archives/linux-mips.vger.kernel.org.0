Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B1535BA01
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 08:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhDLGHg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 02:07:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhDLGHf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 02:07:35 -0400
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax7ch343NgF_kGAA--.9298S3;
        Mon, 12 Apr 2021 14:06:47 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <16899466-cc3c-3b7f-0e3d-f79549185a4a@loongson.cn>
Date:   Mon, 12 Apr 2021 14:06:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Ax7ch343NgF_kGAA--.9298S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrykKryruFWfWw1fCFW3Wrg_yoW5XF15pF
        Z3A3Z7GF4DKry3AF1ay3yIqF15Gws5Gr4UK3WjgrykZr4DZr13tr4fKr1F9348JrZ7Aa4x
        WFy8trn8Gr4jv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
        IFyTuYvjfUjD73UUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/12/2021 11:02 AM, Tiezhu Yang wrote:

> On 04/11/2021 07:04 PM, Jinyang He wrote:
>> Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") brought a problem for
>> strnlen_user(). Jump out when checking access_ok() with condition that
>> (s + strlen(s)) < __UA_LIMIT <= (s + n). The old __strnlen_user_asm()
>> just checked (ua_limit & s) without checking (ua_limit & (s + n)).
>> Therefore, find strlen form s to __UA_LIMIT - 1 in that condition.
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/include/asm/uaccess.h | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/uaccess.h 
>> b/arch/mips/include/asm/uaccess.h
>> index 91bc7fb..85ba0c8 100644
>> --- a/arch/mips/include/asm/uaccess.h
>> +++ b/arch/mips/include/asm/uaccess.h
>> @@ -630,8 +630,15 @@ static inline long strnlen_user(const char 
>> __user *s, long n)
>>   {
>>       long res;
>>   -    if (!access_ok(s, n))
>> -        return -0;
>> +    if (unlikely(n <= 0))
>> +        return 0;
>> +
>> +    if (!access_ok(s, n)) {
>> +        if (!access_ok(s, 0))
>> +            return 0;
>> +
>> +        n = __UA_LIMIT - (unsigned long)s - 1;
>> +    }
>>         might_fault();
>>       __asm__ __volatile__(
>
> The following simple changes are OK to fix this issue?
>
> diff --git a/arch/mips/include/asm/uaccess.h 
> b/arch/mips/include/asm/uaccess.h
> index 91bc7fb..eafc99b 100644
> --- a/arch/mips/include/asm/uaccess.h
> +++ b/arch/mips/include/asm/uaccess.h
> @@ -630,8 +630,8 @@ static inline long strnlen_user(const char __user 
> *s, long n)
>  {
>         long res;
>
> -       if (!access_ok(s, n))
> -               return -0;
> +       if (!access_ok(s, 1))
> +               return 0;
>
>         might_fault();
>         __asm__ __volatile__(
>
> Thanks,
> Tiezhu
>
Thanks for your comment. That looks similar to other archs, but I don't
know how the access_ok() implementation in other archs.

Using access_ok(s, 0) is similar to the old strnlen_user(). Using
access_ok(s, 1) may have a problem in this extreme case,
s = __UA_LIMIT - 1, *s = 0, and we hope it returns 1. But it returns 0 by
!access_ok(s, 1). Of course, it is so extrme.

More importantly, I want to set up a maximum for strnlen_user_asm. And do
not access the part of beyond __ua_limit. As follow shows,

                     +-----------+
                     |    ...    |
                     +-----------+  <---- s + n
                     |     0     |
                     +-----------+
                     |     s     |
                     +-----------+
                     |     r     |
                     +-----------+
                     |     e     |
                     +-----------+
                     |     h     |
                     +-----------+
                     |     t     |
                     +-----------+
                     |     o     |
                     +-----------+  <---- __UA_LIMIT
                     |     r     |
                     +-----------+
                     |     t     |
                     +-----------+
                     |     s     |
                     +-----------+  <---- s
                     |    ...    |
                     +-----------+

It is dangerous to access "others", for user, only "str" is safe.

I don't know whether it would be happend, I just limited it by change `n`.
Should do other things if meet __UA_LIMIT - 1?

Thanks,
Jinyang


