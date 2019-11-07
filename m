Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8232F2580
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 03:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbfKGCmu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 21:42:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47700 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbfKGCmt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 21:42:49 -0500
Received: from [10.20.41.27] (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPAxycmjhMNdrDoAAA--.22S3;
        Thu, 07 Nov 2019 10:42:43 +0800 (CST)
Subject: Re: [PATCH] MIPS: Scan the DMI system information
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
References: <1573056341-21159-1-git-send-email-yangtiezhu@loongson.cn>
 <480995AF-A678-479F-A3EA-11662474E600@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yinglu Yang <yangyinglu@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <7aa12639-b94e-e3db-647f-ec1d399fbffd@loongson.cn>
Date:   Thu, 7 Nov 2019 10:42:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <480995AF-A678-479F-A3EA-11662474E600@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QMiowPAxycmjhMNdrDoAAA--.22S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyxWw1Dur47tw4xJr43KFg_yoW5KF45pa
        ykJan5KF40qF17GF1ft343WFyayrs5JFZ8KFy7tF9rAas8uw17Jrs3K34jkFy8Zr4kKa40
        9F1Sga13ursI9aDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
        c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
        AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOG
        QDUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/07/2019 08:35 AM, Jiaxun Yang wrote:
>
> 于 2019年11月7日 GMT+08:00 上午12:05:41, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
>> Enable DMI scanning on the MIPS architecture, this setups DMI
>> identifiers
>> (dmi_system_id) for printing it out on task dumps and prepares DIMM
>> entry
>> information (dmi_memdev_info) from the SMBIOS table. With this patch,
>> the
>> driver can easily match various of mainboards.
>>
>> In the SMBIOS reference specification, the table anchor string "_SM_"
>> is
>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>> but there exists a special case for loongson platform, when call
>> function
>> dmi_early_remap, it should specify the start address to 0xFFFE000 due
>> to
>> it is reserved for SMBIOS and can be normally access in the BIOS.
>>
>> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>> arch/mips/Kconfig           | 12 ++++++++++++
>> arch/mips/include/asm/dmi.h | 43
>> +++++++++++++++++++++++++++++++++++++++++++
>> arch/mips/kernel/setup.c    |  2 ++
>> 3 files changed, 57 insertions(+)
>> create mode 100644 arch/mips/include/asm/dmi.h
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 7cb8947..0a67b18 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -2757,6 +2757,18 @@ config HW_PERF_EVENTS
>> 	  Enable hardware performance counter support for perf events. If
>> 	  disabled, perf events will use software events only.
>>
>> +# Mark as expert because too many people got it wrong.
>> +# The code disables itself when not needed.
>> +config DMI
>> +	default y
>> +	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
>> +	bool "Enable DMI scanning" if EXPERT
>> +	help
>> +	  Enabled scanning of DMI to identify machine quirks. Say Y
>> +	  here unless you have verified that your setup is not
>> +	  affected by entries in the DMI blacklist. Required by PNP
>> +	  BIOS code.
>> +
>> config SMP
>> 	bool "Multi-Processing support"
>> 	depends on SYS_SUPPORTS_SMP
>> diff --git a/arch/mips/include/asm/dmi.h b/arch/mips/include/asm/dmi.h
>> new file mode 100644
>> index 0000000..1f3da37
>> --- /dev/null
>> +++ b/arch/mips/include/asm/dmi.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_MIPS_DMI_H
>> +#define _ASM_MIPS_DMI_H
>> +
>> +#define dmi_early_remap		mips_early_memremap
>> +#define dmi_early_unmap		mips_early_memunmap
>> +#define dmi_remap(_x, _l)	mips_memremap(_x, _l, MEMREMAP_WB)
>> +#define dmi_unmap(_x)		mips_memunmap(_x)
>> +
>> +#define dmi_alloc(l)		memblock_alloc_low(l, PAGE_SIZE)
>> +
>> +void __init *mips_early_memremap(resource_size_t phys_addr, unsigned
>> long size)
>> +{
>> +#if defined(CONFIG_MACH_LOONGSON64)
>> +	if (phys_addr == 0xF0000)
>> +		phys_addr = 0xFFFE000;
>> +
>> +	return (void *)TO_CAC(phys_addr);
>> +#else
>> +	return NULL;
>> +#endif
>> +}
> Hi Tiezhu,
>
> It is really tricky to hijack dmi address here during remap.
> I think we should set the dmi table address at  dmi_scan.c by a marco or something else rather than hijack it during remap.

Hi Jiaxun,

Thanks for your review. I agree with you, let me think about it and try to
find a proper way, and then I will send a v2 patch.

>
> Btw: Probably we should set DMI default y when MACH_LOONGSON64 is set?

CONFIG_DMI is set to y by default, I think there is no need to select 
DMI when
set CONFIG_MACH_LOONGSON64.

Thanks,

Tiezhu Yang

>
> Thanks.
>

