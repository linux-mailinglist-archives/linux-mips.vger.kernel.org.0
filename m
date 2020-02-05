Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2FD1525BD
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 06:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgBEFBe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 00:01:34 -0500
Received: from mail.loongson.cn ([114.242.206.163]:48352 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725468AbgBEFBe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Feb 2020 00:01:34 -0500
Received: from [192.168.68.106] (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH2sYTDpeNpEMAA--.66S3;
        Wed, 05 Feb 2020 13:01:14 +0800 (CST)
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
 <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
 <20200203131422.384cd168@endymion>
 <609c7042-0e44-2bd4-5e03-97465621b184@loongson.cn>
 <17537451580871338@vla4-87a00c2d2b1b.qloud-c.yandex.net>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <081c8d68-35c4-2dc1-f73f-f5cf23cfaf27@loongson.cn>
Date:   Wed, 5 Feb 2020 13:01:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <17537451580871338@vla4-87a00c2d2b1b.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxH2sYTDpeNpEMAA--.66S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw13uF4xGw4xXF4fJw4rGrg_yoWrZr43pa
        1UGa1YkF4DJr17C3WSqw17Zr1a93yfXrykWry7Wr17u3Z0qF1ftr1Ikr1j9FyUZr1rGay2
        yr1aqFyfu3WYya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
        Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
        x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
        1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j
        6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
        UvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/5/20 10:55 AM, Jiaxun Yang wrote:
>
>> On 2/3/20 8:14 PM, Jean Delvare wrote:
>>
>>> Hi Tiezhun,
>>>
>>> On Mon, 3 Feb 2020 16:32:03 +0800, Tiezhu Yang wrote:
>>>
>>>> On 1/16/20 9:26 PM, Tiezhu Yang wrote:
>>>>
>>>>> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
>>>>> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
>>>>> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
>>>>> driver can easily match various of mainboards.
>>>>>
>>>>> In the SMBIOS reference specification, the table anchor string "_SM_" is
>>>>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>>>>> but there exists a special case for Loongson platform, when call function
>>>>> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
>>>>> it is reserved for SMBIOS and can be normally access in the BIOS.
>>>>>
>>>>> This patch works fine on the Loongson 3A3000 platform which belongs to
>>>>> MIPS architecture and has no influence on the other architectures such
>>>>> as x86 and ARM.
>>>>>
>>>>> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
>>>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>>>> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>>> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>>>>> ---
>>>>>
>>>>> v2:
>>>>> - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>>>>> - refine definitions and Kconfig by Jiaxun
>>>>>
>>>>> arch/mips/Kconfig | 10 ++++++++++
>>>>> arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>>>>> arch/mips/kernel/setup.c | 2 ++
>>>>> drivers/firmware/dmi_scan.c | 6 +++++-
>>>>> 4 files changed, 37 insertions(+), 1 deletion(-)
>>>>> create mode 100644 arch/mips/include/asm/dmi.h
>>>> Hi Paul and Jean,
>>>>
>>>> How do you think this patch?
>>> Looks good to me and you can add:
>>>
>>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>>
>>> for the dmi subsystem part.
>>>
>>>> Should I split it into the following two patches?
>>>> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
>>>> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
>>>>
>>>> The first patch is only related with the common dmi code
>>>> drivers/firmware/dmi_scan.c, the other patch is only related
>>>> with the mips code under arch/mips.
>>>>
>>>> If you have any questions or suggestions, please let me know.
>>>> I am looking forward to your early reply.
>>> I'm fine either way. I you do not split it, as most changes are in the
>>> mips arch files and I do not expect any conflict in the dmi subsystem
>>> part, I believe that the patch should be merged by the mips arch
>>> maintainer.
>> Hi Jean,
>>
>> Thanks very much for your review.
>>
>> As described in another mail [1] by MIPS maintainer Paul Burton:
>>
>> "So if unmerged arch/mips/ patches are holding you up, ping me, but
>> preferrably make sure code being added actually belongs under arch/mips/
>> first."
>>
>> I think it is better to split it into the following two patches?
>> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
>> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
> Hi Tiezhu,
>
> That way will break bisect. In this case, I think the patch should still go through MIPS
> tree after grab review or ack from DMI maintainer.
>
> There is a grey margin for tree-wide patches, we should discuss how to deal with them case by
> case, for the email you mentioned, the main focus is platform driver.


Hi Jiaxun,


Sorry for the late reply.

I just saw your email a moment ago, and already sent the split v3 patch.

https://lore.kernel.org/patchwork/patch/1189713/

https://lore.kernel.org/patchwork/patch/1189714/

Let us wait and hear the opinion of Paul.


Hi Paul,

How do you think this case? One patch or two patches?

If one patch is better, I will send a v4 patch to make MIPS DMI config

depend on MACH_LOONGSON64.


Hi Jean,

Please do not merge the following patch until  we hear the opinion of Paul:

[PATCH v3,1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START

https://lore.kernel.org/patchwork/patch/1189713/


Thanks,


Tiezhu Yang


>
> Thanks.
>
> --
>
> Jiaxun Yang

