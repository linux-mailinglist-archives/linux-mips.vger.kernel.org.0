Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7E3B1524BA
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 03:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgBECNr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 21:13:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55170 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727140AbgBECNr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Feb 2020 21:13:47 -0500
Received: from [192.168.68.106] (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX9zKJDpei4cMAA--.47S3;
        Wed, 05 Feb 2020 10:13:32 +0800 (CST)
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jean Delvare <jdelvare@suse.de>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
 <CAOiHx==FfiQoFA9cESSni_izS=m+mm7G+gk_tei5XFnKrgurew@mail.gmail.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <10732371-fbd1-e9f3-6fed-7821a3ce4847@loongson.cn>
Date:   Wed, 5 Feb 2020 10:13:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOiHx==FfiQoFA9cESSni_izS=m+mm7G+gk_tei5XFnKrgurew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxX9zKJDpei4cMAA--.47S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyxWw4fKw43Wr13GF4DJwb_yoWrJr4xpa
        18JanYkrWkJF1fGw4fZ34xuryYkrZ3Kr98uFy3J3WUu3s8u34jvrs7Ar1I9FyDJr4kGw10
        vr1a9F4UuayDuFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
        0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
        zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
        4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
        6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
        BIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/3/20 10:46 PM, Jonas Gorski wrote:
> Hi,
>
> On Thu, 16 Jan 2020 at 14:28, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
>> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
>> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
>> driver can easily match various of mainboards.
>>
>> In the SMBIOS reference specification, the table anchor string "_SM_" is
>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>> but there exists a special case for Loongson platform, when call function
>> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
>> it is reserved for SMBIOS and can be normally access in the BIOS.
>>
>> This patch works fine on the Loongson 3A3000 platform which belongs to
>> MIPS architecture and has no influence on the other architectures such
>> as x86 and ARM.
>>
>> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>> ---
>>
>> v2:
>>    - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>>    - refine definitions and Kconfig by Jiaxun
>>
>>   arch/mips/Kconfig           | 10 ++++++++++
>>   arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>>   arch/mips/kernel/setup.c    |  2 ++
>>   drivers/firmware/dmi_scan.c |  6 +++++-
>>   4 files changed, 37 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/mips/include/asm/dmi.h
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 4b83507..c097f78 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -2773,6 +2773,16 @@ config HW_PERF_EVENTS
>>            Enable hardware performance counter support for perf events. If
>>            disabled, perf events will use software events only.
>>
>> +config DMI
>> +       default y if MACH_LOONGSON64
>> +       select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
>> +       bool "Enable DMI scanning"
> Is this option harmless to enable for other MIPS platforms? What
> happens if it is enabled on devices where PHYS_OFFSET isn't 0, so
> 0xF0000 is likely not backed by anything and accessing it might hang
> the system?
>
> This probably should depend on MACH_LOONGSON64.


Hi Jonas,

Thanks for your reply and suggestion.

With the current patch, on the MIPS architecture, the DMI option is
default y only if MACH_LOONGSON64 is set, otherwise it is not set.
When enable DMI manually on the MIPS platform which is not LOONGSON64,
the SMBIOS_ENTRY_POINT_SCAN_START is 0xF0000, dmi_early_remap() will
return NULL and goto err to print "DMI not present or invalid."

static void __init dmi_scan_machine(void)
{
...
         p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
         if (p == NULL)
             goto error;
...
  error:
     pr_info("DMI not present or invalid.\n");
}

It seems harmless and the system can boot successful. However, in order
to avoid the unknown risks on the mips platform which is not LOONGSON64,
I think it is better to depend on MACH_LOONGSON64.

config DMI
     bool "Enable DMI scanning"
     depends on MACH_LOONGSON64
     select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
     default y

If other mips platform also needs this DMI feature in the future,
the "depends on" conditon can be modified.

I will do it in the v3 patch.


Thanks,


Tiezhu Yang


>
> Regards
>
> Jonas

