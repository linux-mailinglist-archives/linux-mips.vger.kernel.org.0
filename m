Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0626D28C806
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 06:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731731AbgJMEhC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 00:37:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56004 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726463AbgJMEhC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 00:37:02 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr93mLoVf8fccAA--.8279S3;
        Tue, 13 Oct 2020 12:36:55 +0800 (CST)
Subject: Re: [PATCH v2 3/4 RESEND] MIPS: Loongson64: Add /proc/boardinfo
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
 <1602373674-4579-4-git-send-email-yangtiezhu@loongson.cn>
 <20201012103805.GC7953@alpha.franken.de>
 <95060519-530b-c5f5-537d-a7b217b39003@loongson.cn>
 <3707A9AD-DD41-4DD0-A015-DE4DC33279DE@flygoat.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhc@lemote.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f1a4ef4a-a293-5b07-3436-37835e92ca1e@loongson.cn>
Date:   Tue, 13 Oct 2020 12:36:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <3707A9AD-DD41-4DD0-A015-DE4DC33279DE@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr93mLoVf8fccAA--.8279S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyUZFWDAryDJrW5Kry3urg_yoW5CF1UpF
        Z3Aa1DGw4DGr1UCrnagw4kZFWSvrWYyrZYqF4ayw1xK3s5KFyfXrWxJFWjkF13Zr48Ja1j
        qFW0kr45ZFn5CFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUfcTPUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/13/2020 08:15 AM, Jiaxun Yang wrote:
>
> 于 2020年10月12日 GMT+08:00 下午8:02:25, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
>> On 10/12/2020 06:38 PM, Thomas Bogendoerfer wrote:
>>> On Sun, Oct 11, 2020 at 07:47:53AM +0800, Tiezhu Yang wrote:
>>>> Add /proc/boardinfo to get mainboard and BIOS info easily on the Loongson
>>>> platform, this is useful to point out the current used mainboard type and
>>>> BIOS version when there exists problems related with hardware or firmware.
>>>>
>>>> E.g. with this patch:
>>>>
>>>> [loongson@linux ~]$ cat /proc/boardinfo
>>>> Board Info
>>>> Manufacturer            : LEMOTE
>>>> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
>>>> Family                  : LOONGSON3
>>>>
>>>> BIOS Info
>>>> Vendor                  : Kunlun
>>>> Version                 : Kunlun-A1901-V4.1.3-20200414093938
>>>> ROM Size                : 4 KB
>>>> Release Date            : 2020-04-14
>>> Why does Loongson64 need this extra file no other architecture or MIPS
>>> platform need ? Do others provide this information via a different method ?
>>> If yes, why can't Loongson64 do the same ?
>> Hi Thomas,
>>
>> This is related with the implementation of firmware.
>>
>> Using dmidecode command can get the similar info if there exists SMBIOS
>> in firmware, but the fact is there is no SMBIOS on some machines, we can
>> see nothing when execute dmidecode, like this:
>>
>> [root@linux loongson]# dmidecode
>> # dmidecode 2.12
>> # No SMBIOS nor DMI entry point found, sorry.
>>
>> The following three structures are already defined in the interface
>> specification about firmware and kernel on the Loongson platform,
>> this is common requirement and specific for Loongson64, so add a
>> new boardinfo.c file in arch/mips/loongson64.
>>
>> arch/mips/include/asm/mach-loongson64/boot_param.h
>> struct interface_info {
>>      u16 vers; /* version of the specificition */
>>      u16 size;
>>      u8  flag;
>>      char description[64];
>> } __packed;
>>
>> struct board_devices {
>>      char name[64];    /* hold the device name */
>>      u32 num_resources; /* number of device_resource */
>>      /* for each device's resource */
>>      struct resource_loongson resource[MAX_RESOURCE_NUMBER];
>>      /* arch specific additions */
>>      struct archdev_data archdata;
>> };
>>
>> struct loongson_special_attribute {
>>      u16 vers;     /* version of this special */
>>      char special_name[64]; /* special_atribute_name */
>>      u32 loongson_special_type; /* type of special device */
>>      /* for each device's resource */
>>      struct resource_loongson resource[MAX_RESOURCE_NUMBER];
>> };
> Hi Tiezhu,
>
> Through I don't think touching top level of proc would be a good idea. It's all about API consistency.
>
> If you intend to provide user an interface then I guess /sys/firmware/lefi
> like what DMI did or somewhere less critical is better.
>
> There is no guarantee that Loongson64 device would come with LEFI,
> although it's mandatory for now.

Hi Jiaxun,

Thank you very much.

Let us add /sys/firmware/lefi/boardinfo, I will do it and then send a 
new patch.

Thanks,
Tiezhu

>
> Thanks.
>
> - Jiaxun
>
>> Thanks,
>> Tiezhu
>>
>>> Thomas.
>>>

