Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CA8D85E0
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 04:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbfJPCXl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 22:23:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38918 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbfJPCXl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Oct 2019 22:23:41 -0400
Received: from [10.20.41.27] (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPCxeewWf6ZdsLQRAA--.72S3;
        Wed, 16 Oct 2019 10:23:32 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson: Make default kernel log buffer size as
 128KB for Loongson3
To:     Paul Burton <paulburton89@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>
References: <1571101656-871-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H573fv+NVqBRgU38BRDDX=syj3gUqnJqRp4CdBx+QcdpQ@mail.gmail.com>
 <d897527b-3c36-41a8-b878-64a099cbdfa0@loongson.cn>
 <20191015184745.xxihqrcaezbazzgm@lantea.localdomain>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ebf2c8fe-64a9-a11c-a402-01ea4491e1ac@loongson.cn>
Date:   Wed, 16 Oct 2019 10:23:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191015184745.xxihqrcaezbazzgm@lantea.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QMiowPCxeewWf6ZdsLQRAA--.72S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAry3trWDKFyxAr13XF1DKFg_yoW5Kryrpr
        WYqan0kF4kXF1FyFZ2ka4kWrW0v3ZxCF93WF18twn0yrnxua4jqwsrtw1UursrXF93t3Wj
        9FykKFy7KF43ua7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JV
        WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgQVyDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/16/2019 02:53 AM, Paul Burton wrote:
> Hi Tiezhu & Huacai,
>
> On Tue, Oct 15, 2019 at 12:00:25PM +0800, Tiezhu Yang wrote:
>> On 10/15/2019 11:36 AM, Huacai Chen wrote:
>>> On Tue, Oct 15, 2019 at 10:12 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>> When I update kernel with loongson3_defconfig based on the Loongson 3A3000
>>>> platform, then using dmesg command to show kernel ring buffer, the initial
>>>> kernel messages have disappeared due to the log buffer is too small, it is
>>>> better to change the default kernel log buffer size from 16KB to 128KB.
>>>>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> ---
>>>>    arch/mips/configs/loongson3_defconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
>>>> index 90ee008..3aa2201 100644
>>>> --- a/arch/mips/configs/loongson3_defconfig
>>>> +++ b/arch/mips/configs/loongson3_defconfig
>>>> @@ -12,7 +12,7 @@ CONFIG_TASKSTATS=y
>>>>    CONFIG_TASK_DELAY_ACCT=y
>>>>    CONFIG_TASK_XACCT=y
>>>>    CONFIG_TASK_IO_ACCOUNTING=y
>>>> -CONFIG_LOG_BUF_SHIFT=14
>>>> +CONFIG_LOG_BUF_SHIFT=17
>>> Hi, Tiezhu,
>>>
>>> Why you choose 128KB but not 64KB or 256KB? I found 64KB is enough for
>>> our cases. And if you really need more, I think 256KB could be better
>>> because there are many platforms choose 256KB.
>> Hi Huacai,
>>
>> Thanks for your reply and suggestion, I will send a v2 patch.
> Thanks for the patches.
>
> I actually have a slight preference for 128KB if you've no specific
> need, since 128KB is the default. Some quick grepping says that of 405
> defconfigs in tree (as of v5.4-rc3), we have:
>
>    LOG_BUF_SHIFT  Count
>               12  1
> 	     13  3
> 	     14  235
> 	     15  18
> 	     16  39
> 	     17  90
> 	     18  13
> 	     19  2
> 	     20  4
>
> ie. 16KiB is by far the most common, then second most common is the
> default 128KiB. 256KiB is comparatively rare.

Hi Paul,

Thank you very much for your detailed explanation. I think 128KB is 
enough to save
the boot messages because the dmesg output size is about 40KB after 
reboot in my
system.

>
> However, I don't think your v1 patch is quite right Tiezhu - since 17 is
> the default it shouldn't be specified in the defconfig at all. Did you
> manually make the change in the loongson3_defconfig file? If so please
> take a look at the savedefconfig make target & try something like this:
>
>    make ARCH=mips loongson3_defconfig
>    make ARCH=mips menuconfig
>    # Change LOG_BUF_SHIFT
>    make ARCH=mips savedefconfig
>    mv defconfig arch/mips/configs/loongson3_defconfig
>    git add -i arch/mips/configs/loongson3_defconfig
>    # Stage the relevant changes, drop the others
>
> You should end up with the CONFIG_LOG_BUF_SHIFT line just getting
> deleted.

Yes, you are right, I will make a new patch followed with your steps and 
send a v3
patch: just delete the CONFIG_LOG_BUF_SHIFT line to use the default 
value 128KB and
update the commit message.

>
> If on the other hand you really do prefer 256KiB for these systems
> please describe why in the commit message. It could be something as
> simple as "we have lots of memory so using 256KiB isn't a big deal, and
> gives us a better chance of preserving boot messages until they're
> examined". But if your log is getting this big before you look at it (or
> before something like systemd copies it into its journal), there's
> probably something fishy going on.

Hi Huacai,

What do you think? If you have any more suggestion, please let me know.

Thanks,

Tiezhu Yang

>
> Thanks,
>      Paul

