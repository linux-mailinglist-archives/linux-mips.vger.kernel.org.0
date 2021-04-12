Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE12535BA97
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 09:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhDLHIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 03:08:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40948 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236774AbhDLHIv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 03:08:51 -0400
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxLcnU8XNgIgEHAA--.9126S3;
        Mon, 12 Apr 2021 15:08:05 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1634fae6-4a39-0e60-2cd1-b41ee4bc3996@loongson.cn>
Date:   Mon, 12 Apr 2021 15:08:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxLcnU8XNgIgEHAA--.9126S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrykKryruFWfWw1fCFW3Wrg_yoWrJrW3pF
        Z3AFnIkFs5KrWxCa42y392gFyrGr45Gr1vgw12gw1rZan8Z3W8JrWfKrn0934kJF4kAa4I
        9FyxJwn8uw4jv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfU8J5oDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
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

Hi all,

Here is some detail info about background and analysis process,
I hope it is useful to understand this issue.

When update kernel with the latest mips-next, we can not login through a
graphical interface, this is because drm radeon GPU driver does not work,
we can not see the boot message "[drm] radeon kernel modesetting enabled."
through the serial console.

drivers/gpu/drm/radeon/radeon_drv.c
static int __init radeon_module_init(void)
{
         [...]
         DRM_INFO("radeon kernel modesetting enabled.\n");
         [...]
}

I use git bisect to find commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs")
is the first bad commit:

  $ git bisect log
  git bisect start
  # good: [666c1fc90cd82184624d4cc5d124c66025f89a47] mips: bmips: 
bcm63268: populate device tree nodes
  git bisect good 666c1fc90cd82184624d4cc5d124c66025f89a47
  # bad: [e86e75596623e1ce5d784db8214687326712a8ae] MIPS: octeon: Add 
__raw_copy_[from|to|in]_user symbols
  git bisect bad e86e75596623e1ce5d784db8214687326712a8ae
  # good: [45deb5faeb9e02951361ceba5ffee721745661c3] MIPS: uaccess: 
Remove get_fs/set_fs call sites
  git bisect good 45deb5faeb9e02951361ceba5ffee721745661c3
  # bad: [5e65c52ec716af6e8f51dacdaeb4a4d872249af1] MIPS: Loongson64: 
Use _CACHE_UNCACHED instead of _CACHE_UNCACHED_ACCELERATED
  git bisect bad 5e65c52ec716af6e8f51dacdaeb4a4d872249af1
  # bad: [04324f44cb69a03fdc8f2ee52386a4fdf6a0043b] MIPS: Remove 
get_fs/set_fs
  git bisect bad 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
  # first bad commit: [04324f44cb69a03fdc8f2ee52386a4fdf6a0043b] MIPS: 
Remove get_fs/set_fs

I analysis and test the changes in the above first bad commit and find out
the following obvious difference which leads to the login issue.

arch/mips/include/asm/uaccess.h
static inline long strnlen_user(const char __user *s, long n)
{
         [...]
         if (!access_ok(s, n))
                 return -0;
         [...]
}

Thanks,
Tiezhu

