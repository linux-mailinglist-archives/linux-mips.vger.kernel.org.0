Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D672B56AD
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 03:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgKQCRp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 21:17:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35718 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbgKQCRp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 21:17:45 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv9PDMrNfNXgQAA--.34570S3;
        Tue, 17 Nov 2020 10:17:40 +0800 (CST)
Subject: Re: [RFC PATCH v2] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1605520506-26733-1-git-send-email-yangtiezhu@loongson.cn>
 <20201116151441.GA10686@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ea260945-ced5-3cf0-d1cc-8c92f04aaf92@loongson.cn>
Date:   Tue, 17 Nov 2020 10:17:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201116151441.GA10686@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxv9PDMrNfNXgQAA--.34570S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWxAFy7XFyDZw1kGw1ftFb_yoW8Gw1Dpa
        1vyrsrtr4vqFy8Jw4kArWrW345Jw4kurWY9anrG3y5JF1rXFWfGrWIvr45WF9Fgr1kKayx
        tF93WFyFqrykA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjByIUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/16/2020 11:14 PM, Thomas Bogendoerfer wrote:
> On Mon, Nov 16, 2020 at 05:55:06PM +0800, Tiezhu Yang wrote:
>> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
>> CONFIG_DEBUG_ATOMIC_SLEEP:
>>
>>    CC      arch/mips/kernel/signal.o
>> {standard input}: Assembler messages:
>> {standard input}:1775: Error: Unable to parse register name $fp
>> scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' failed
>> make[2]: *** [arch/mips/kernel/signal.o] Error 1
>> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
>> make[1]: *** [arch/mips/kernel] Error 2
>> Makefile:1799: recipe for target 'arch/mips' failed
>> make: *** [arch/mips] Error 2
> I don't see this error and to me it looks strange to fix that with
> enablding frame pointers... What gcc is this ?

I found this build error used with gcc 4.9.4.
I try it used with gcc 7.3.1 and it has no problem.
We can use new gcc version to avoid this build error.

Additionally, I want to know whether ARCH_WANT_FRAME_POINTERS
is necessary for MIPS to get more debugging info, with this
config we can enable the config FRAME_POINTER by default and
disable it manually.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile#n790
ifdef CONFIG_FRAME_POINTER
KBUILD_CFLAGS   += -fno-omit-frame-pointer -fno-optimize-sibling-calls

Thanks,
Tiezhu

