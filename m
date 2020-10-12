Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE18E28B44E
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 14:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388334AbgJLMCj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 08:02:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51246 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388332AbgJLMCi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 08:02:38 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxGMbRRYRfq8ocAA--.4092S3;
        Mon, 12 Oct 2020 20:02:26 +0800 (CST)
Subject: Re: [PATCH v2 3/4 RESEND] MIPS: Loongson64: Add /proc/boardinfo
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
 <1602373674-4579-4-git-send-email-yangtiezhu@loongson.cn>
 <20201012103805.GC7953@alpha.franken.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <95060519-530b-c5f5-537d-a7b217b39003@loongson.cn>
Date:   Mon, 12 Oct 2020 20:02:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201012103805.GC7953@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxGMbRRYRfq8ocAA--.4092S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw45Ww1fXr4DArWfCr13CFg_yoW8tFyrpa
        yfAw4DGr4DK3WUurn5Ww4UZrWFv3yYkFWqqFW2vw1fK3s5G34FqFW0kayjyF1ayr18Jayj
        qFWIkr4rWa4DCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjsjjDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/12/2020 06:38 PM, Thomas Bogendoerfer wrote:
> On Sun, Oct 11, 2020 at 07:47:53AM +0800, Tiezhu Yang wrote:
>> Add /proc/boardinfo to get mainboard and BIOS info easily on the Loongson
>> platform, this is useful to point out the current used mainboard type and
>> BIOS version when there exists problems related with hardware or firmware.
>>
>> E.g. with this patch:
>>
>> [loongson@linux ~]$ cat /proc/boardinfo
>> Board Info
>> Manufacturer            : LEMOTE
>> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
>> Family                  : LOONGSON3
>>
>> BIOS Info
>> Vendor                  : Kunlun
>> Version                 : Kunlun-A1901-V4.1.3-20200414093938
>> ROM Size                : 4 KB
>> Release Date            : 2020-04-14
> Why does Loongson64 need this extra file no other architecture or MIPS
> platform need ? Do others provide this information via a different method ?
> If yes, why can't Loongson64 do the same ?

Hi Thomas,

This is related with the implementation of firmware.

Using dmidecode command can get the similar info if there exists SMBIOS
in firmware, but the fact is there is no SMBIOS on some machines, we can
see nothing when execute dmidecode, like this:

[root@linux loongson]# dmidecode
# dmidecode 2.12
# No SMBIOS nor DMI entry point found, sorry.

The following three structures are already defined in the interface
specification about firmware and kernel on the Loongson platform,
this is common requirement and specific for Loongson64, so add a
new boardinfo.c file in arch/mips/loongson64.

arch/mips/include/asm/mach-loongson64/boot_param.h
struct interface_info {
     u16 vers; /* version of the specificition */
     u16 size;
     u8  flag;
     char description[64];
} __packed;

struct board_devices {
     char name[64];    /* hold the device name */
     u32 num_resources; /* number of device_resource */
     /* for each device's resource */
     struct resource_loongson resource[MAX_RESOURCE_NUMBER];
     /* arch specific additions */
     struct archdev_data archdata;
};

struct loongson_special_attribute {
     u16 vers;     /* version of this special */
     char special_name[64]; /* special_atribute_name */
     u32 loongson_special_type; /* type of special device */
     /* for each device's resource */
     struct resource_loongson resource[MAX_RESOURCE_NUMBER];
};

Thanks,
Tiezhu

>
> Thomas.
>

