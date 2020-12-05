Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED6B2CF96F
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 06:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLEFGF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 00:06:05 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33558 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725770AbgLEFGF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 5 Dec 2020 00:06:05 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutACFctfM90ZAA--.42419S3;
        Sat, 05 Dec 2020 13:05:06 +0800 (CST)
Subject: Re: [PATCH 2/2] MIPS: Select ARCH_KEEP_MEMBLOCK to enable sysfs
 memblock debug
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1606965544-22611-1-git-send-email-yangtiezhu@loongson.cn>
 <1606965544-22611-3-git-send-email-yangtiezhu@loongson.cn>
 <9c9af0de-387b-f113-b0a2-c5767c31c16d@flygoat.com>
 <20201204120816.GC10011@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <727e9b94-0a22-189f-4c65-4a6e8504013f@loongson.cn>
Date:   Sat, 5 Dec 2020 13:05:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201204120816.GC10011@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxutACFctfM90ZAA--.42419S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtr43AFWxCw1xZF13KFWUtwb_yoWktFb_Wr
        4jkFnrK3WrJFWqka1vqw4fZFn0g3y0qFy8ury3Wr4Svw18JFW3Gw1kKa93Xrn5Way8Grsx
        Xr90vr13Krn8KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
        Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUhdbbUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/04/2020 08:08 PM, Thomas Bogendoerfer wrote:
> On Thu, Dec 03, 2020 at 11:58:51AM +0800, Jiaxun Yang wrote:
>>
>> 在 2020/12/3 上午11:19, Tiezhu Yang 写道:
>>> In the current code, CONFIG_ARCH_KEEP_MEMBLOCK is not set for MIPS arch,
>>> memblock_discard() will discard memory and reserved arrays if they were
>>> allocated, select ARCH_KEEP_MEMBLOCK to give a chance to track "memory"
>>> and "reserved" memblocks after early boot, with this patch, we can see
>>> the following two sysfs interfaces under DEBUG_FS.
>>>
>>> /sys/kernel/debug/memblock/memory
>>> /sys/kernel/debug/memblock/reserved
>> Is this really necessary?
>> memblock data is not really necessary after boot for non-debug purpose.
>>
>> Given that MIPS is widely used in embedded systems which doesn't have much
>> memory, keeping unused data after boot is kinda unconvincing.
> about how much memory are talking here ?
>
>> If you intend to debug that please do it locally.
> maybe we can add a
>
> if DEBUG_KERNEL
>
> since enabling DEBUG_KERNEL will cost already some memory...

Yes, that makes sense.

If nobody has any objections, I will send v2 in the next week.

Thanks,
Tiezhu

>
> Thomas.
>

