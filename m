Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E812B43DB
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 13:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgKPMkH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 07:40:07 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59202 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726527AbgKPMkH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 07:40:07 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutEhc7JfJf4PAA--.38904S3;
        Mon, 16 Nov 2020 20:40:02 +0800 (CST)
Subject: Re: [PATCH 1/4] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To:     WANG Xuerui <i@xen0n.name>, Du Huanpeng <u74147@gmail.com>
References: <20200923075845.360974-1-git@xen0n.name>
 <20200923075845.360974-2-git@xen0n.name>
 <2a478254-c4de-49dd-d598-c7553f4672bf@loongson.cn>
 <20200923143149.GA11566@tkernel.org>
 <3b35cd8d-012a-18b5-50c3-8dae19cc53b1@xen0n.name>
Cc:     WANG Xuerui <git@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <477c948a-37cc-8b21-a5fb-78234da1f457@loongson.cn>
Date:   Mon, 16 Nov 2020 20:40:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <3b35cd8d-012a-18b5-50c3-8dae19cc53b1@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxutEhc7JfJf4PAA--.38904S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy3Jw4DXryfur43Gw4xtFb_yoW8Xr1kpF
        WSkay5Gr4DJF1FyaykAr45XayY93yfJF45Jw1vyr1qv3s093WSqryktr45tFs7JFyrXFy0
        vrZ3K3sxCF4DuFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
        6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x07jcPE-UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/25/2020 02:13 PM, WANG Xuerui wrote:
> (Re-sending, as the original reply inadvertently contained an HTML part
> and has been blocked by all of the mailing lists.)
>
> Hi Huanpeng,
>
> On 2020/9/23 22:31, Du Huanpeng wrote:
>
>>> rtc-ls2x --> rtc-ls2x-ls7a
>>> RTC_DRV_LS2X --> RTC_DRV_LS2X_LS7A
>>> Loongson LS2X RTC --> Loongson LS2X/LS7A RTC
>>>
>>> Maybe the related names include ls7a or LS7A is better to
>>> reflect the reality?
>> Is there any difference with the rtc IP in loongson 1* SoCs?
>  From a cursory look at 1A and 7A manuals the registers seem to have the
> same layout. Some registers are marked as "reserved" on the 7A manual
> while having real meaning on 1A, like the sys_toytrim and sys_rtctrim
> registers.
>
> I am investigating whether the rtc_ls1x driver could be worked to
> support DT configuration, along with the hardcoded addresses when
> compiled for Loongson 1A. If so, adding a separate rtc_ls2x may not be
> necessary, rtc_ls1x would be turned into something like rtc_loongson
> instead.

Hi Xuerui,

This patch series work well on the Loongson 3A3000 and 3A4000 platform
used with LS7A bridge chip, both read time and write time are OK.

So add:

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

And also, since the implementation between rtc_ls1x.c and rtc_ls2x.c
is different, maybe there is no need to add rtc_loongson.c for the
combination of rtc_ls1x.c and rtc_ls2x.c, just leave them as they are.

Thanks,
Tiezhu

