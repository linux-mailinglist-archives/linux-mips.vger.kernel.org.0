Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201541524CA
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 03:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbgBEC20 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 21:28:26 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56844 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727674AbgBEC20 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Feb 2020 21:28:26 -0500
Received: from [192.168.68.106] (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2o7KDpeEYgMAA--.977S3;
        Wed, 05 Feb 2020 10:28:12 +0800 (CST)
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jean Delvare <jdelvare@suse.com>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
 <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
 <20200203131422.384cd168@endymion>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <609c7042-0e44-2bd4-5e03-97465621b184@loongson.cn>
Date:   Wed, 5 Feb 2020 10:28:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203131422.384cd168@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf2o7KDpeEYgMAA--.977S3
X-Coremail-Antispam: 1UD129KBjvJXoWxArWkJF1kZr48KF1fXr1fZwb_yoW5urWkpa
        1UGayYkF4DJr1xC3Zavw4xZr1S9393XrykWFy7uryUu3Z8X3Wftr1Ik3WUuFyDur4rKa4S
        934agFyrCa4YkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI4
        8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
        wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
        v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
        Y4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/3/20 8:14 PM, Jean Delvare wrote:
> Hi Tiezhun,
>
> On Mon, 3 Feb 2020 16:32:03 +0800, Tiezhu Yang wrote:
>> On 1/16/20 9:26 PM, Tiezhu Yang wrote:
>>> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
>>> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
>>> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
>>> driver can easily match various of mainboards.
>>>
>>> In the SMBIOS reference specification, the table anchor string "_SM_" is
>>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>>> but there exists a special case for Loongson platform, when call function
>>> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
>>> it is reserved for SMBIOS and can be normally access in the BIOS.
>>>
>>> This patch works fine on the Loongson 3A3000 platform which belongs to
>>> MIPS architecture and has no influence on the other architectures such
>>> as x86 and ARM.
>>>
>>> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>>> ---
>>>
>>> v2:
>>>     - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>>>     - refine definitions and Kconfig by Jiaxun
>>>
>>>    arch/mips/Kconfig           | 10 ++++++++++
>>>    arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>>>    arch/mips/kernel/setup.c    |  2 ++
>>>    drivers/firmware/dmi_scan.c |  6 +++++-
>>>    4 files changed, 37 insertions(+), 1 deletion(-)
>>>    create mode 100644 arch/mips/include/asm/dmi.h
>>
>> Hi Paul and Jean,
>>
>> How do you think this patch?
> Looks good to me and you can add:
>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>
> for the dmi subsystem part.
>
>> Should I split it into the following two patches?
>> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
>> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
>>
>> The first patch is only related with the common dmi code
>> drivers/firmware/dmi_scan.c, the other patch is only related
>> with the mips code under arch/mips.
>>
>> If you have any questions or suggestions, please let me know.
>> I am looking forward to your early reply.
> I'm fine either way. I you do not split it, as most changes are in the
> mips arch files and I do not expect any conflict in the dmi subsystem
> part, I believe that the patch should be merged by the mips arch
> maintainer.


Hi Jean,


Thanks very much for your review.


As described in another mail [1] by MIPS maintainer Paul Burton:

"So if unmerged arch/mips/ patches are holding you up, ping me, but
preferrably make sure code being added actually belongs under arch/mips/
first."

I think it is better to split it into the following two patches?
[PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
[PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)


I will send v3 patch as soon as possible.


Thanks,


Tiezhu Yang


[1] 
https://lore.kernel.org/linux-mips/20190208200852.wcywd7yfcq7zwzve@pburton-laptop/


>
> Thanks,

