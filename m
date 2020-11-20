Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA662BA09A
	for <lists+linux-mips@lfdr.de>; Fri, 20 Nov 2020 03:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgKTCn3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 21:43:29 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60688 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725890AbgKTCn2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 21:43:28 -0500
Received: from [10.130.0.170] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutBKLbdfVlITAA--.31068S3;
        Fri, 20 Nov 2020 10:43:23 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: KASLR: Make relocation_address can be
 configured
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
 <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
 <20201119124544.GB4936@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <55b35e07-7491-7404-1ab5-03fd059aac79@loongson.cn>
Date:   Fri, 20 Nov 2020 10:43:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201119124544.GB4936@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxutBKLbdfVlITAA--.31068S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFykCF4DGF4UJF1rCw43trb_yoW8WrW5pr
        ZrGr45G3yDKFy2krWDXw4rCr15A393Ja4xG34DJrWrZ34ag3Zayw1UWr1xKas5Krn7Jw43
        ZFWq9rW29FWYyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU8sa93UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 11/19/2020 08:45 PM, Thomas Bogendoerfer wrote:
> On Thu, Nov 19, 2020 at 10:29:14AM +0800, Jinyang He wrote:
>> When CONFIG_RANDOMIZE_BASE is not set, determine_relocation_address()
>> always returns a constant. It is not friendly to users if the address
>> cannot be used. Make it can be configured at Kconfig.
> and how do I get the information which address I need to enter ?
> This looks more like platforms need to supply a working address and
> not the user configuring the kernel...
You are right.

We only have two address to enter if CONFIG_RANDOMIZE_BASE disabled. One
is 0xffffffff81000000 in the current if succeed, the other is the orignal
address if failed. From relocation_addr_valid() we see that the avaliable
address need to higher than &_end to avoid overlaps original kernel.
E.g. 0xffffffff83000000 and 0xffffffff84000000 both is avaliable on
Loongson64 platform when &_end ==  0xffffffff82213f80. But
0xffffffff82000000 is not available in that case.

In reality test, I compiled kernel first and got &_end. And then modified
the relocate_address to avaliable and compiled kernel once more. It is
a bad idea.

Is it different from modifying CONFIG_PHYSICAL_START when just relocate
one address? Does it make sense if only one address to relocate?

Morever, RANDOMIZE_BASE is normally avaliable. Can we add a kernel
parameter like "relocation=0xffffffff81000000" to direct address?
At least, other architecture disabling RANDOMIZE_BASE looks like "nokaslr".
Thus, can we delete these code which RANDOMIZE_BASE disabled?

Thanks! :-)
Jinyang

> Thomas.
>

