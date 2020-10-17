Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CC3290F17
	for <lists+linux-mips@lfdr.de>; Sat, 17 Oct 2020 07:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388456AbgJQF0r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Oct 2020 01:26:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52580 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732215AbgJQF0q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Oct 2020 01:26:46 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx+MR6R4pfySQeAA--.5443S3;
        Sat, 17 Oct 2020 09:23:06 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add /proc/boardinfo
To:     Pavel Machek <pavel@ucw.cz>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
 <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
 <20201016131159.GB4335@amd>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <40965d79-63ec-2397-528f-15eacf49bbf9@loongson.cn>
Date:   Sat, 17 Oct 2020 09:23:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201016131159.GB4335@amd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx+MR6R4pfySQeAA--.5443S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr47tF1kWr45Gw4xJr4UCFg_yoWDtFbE9r
        y0krWrKF1UJF1kGr4rJF4rCrZrW34xX3W5KFy7Ka97A34rZanagFsa9r93u3s7XFW0vrn8
        uF47KF4kZF12vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
        1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
        ZEXa7VUbLiSPUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/16/2020 09:11 PM, Pavel Machek wrote:
> Hi!
>
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
> Please put this into /sys somewhere, with usual rules. This is hard to
> extend/parse.

Hi Pavel,

Thanks for your suggestion. I submitted a new version some days ago.

[1/2] MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo
https://lore.kernel.org/patchwork/patch/1320574/

[2/2] Documentation: ABI: Add /sys/firmware/lefi/boardinfo description 
for Loongson64
https://lore.kernel.org/patchwork/patch/1320573/

Thanks,
Tiezhu

>
> 								Pavel
>

