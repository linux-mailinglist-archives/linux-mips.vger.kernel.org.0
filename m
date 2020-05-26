Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237101E24E3
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgEZPBw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:01:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54742 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728110AbgEZPBw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 11:01:52 -0400
Received: from [192.168.50.168] (unknown [111.199.184.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx72pHL81ex1A5AA--.143S3;
        Tue, 26 May 2020 23:01:27 +0800 (CST)
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
To:     Robin Murphy <robin.murphy@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
References: <20200526111438.3788-1-liulichao@loongson.cn>
 <20200526193859.0adaea3b@halation.net.flygoat.com>
 <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
 <20200526130128.GA8487@alpha.franken.de>
 <1d594568-e457-533e-122a-c7e449c0f05d@arm.com>
From:   Lichao Liu <liulichao@loongson.cn>
Message-ID: <7a6d91e3-282c-44db-1e0a-2572b814f2e5@loongson.cn>
Date:   Tue, 26 May 2020 23:01:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1d594568-e457-533e-122a-c7e449c0f05d@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx72pHL81ex1A5AA--.143S3
X-Coremail-Antispam: 1UD129KBjvJXoW7trW3JFWUGF4DKry5XF1xGrg_yoW8KF4kpF
        W0yFsFkrs7tF4UZ3s2yw13WFyYy393tFyUGry5JF1Fyas0qFyUKrs2gFZ5CFWaqr1UZ3y2
        vrZ8KF13Wa98AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkF7I0En4kS14v26r126r1DMxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j
        6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
        vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42
        IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUb6pPUUUUU
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/5/26 下午9:29, Robin Murphy 写道:
> On 2020-05-26 14:01, Thomas Bogendoerfer wrote:
>> On Tue, May 26, 2020 at 08:40:28PM +0800, Lichao Liu wrote:
>>> Loongson-2EF need software maintain cache consistency, So when using
>>> streaming DMA, software needs to maintain consistency.
>>>
>>> dma_map_single() is correct, but dma_unmap_single is wrong.
>>>
>>> The function call path:
>>> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
>>>   dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
>>>   cpu_needs_post_dma_flush'
>>>
>>> In current version, 'cpu_needs_post_dma_flush' will return false
>>> at Loongon-2EF platform, and dma_unmap_single will not invalidate cache,
>>> driver may access wrong dma data.
>>
>> why should it ? CPU must not touch data while it's mapped for DMA.
>>
>>> I don't know what's the exact meaning of "fill random cachelines with
>>> stale data at any time". I always think 'cpu_needs_post_dma_flush()'
>>> means whether this platform needs software to maintain cache consistency.
>>
>> this will only happen, if cpu speculates creates dirty cache lines
>> by speculation as R10k type of CPUs do.
>
> Will it? The usual pattern for this problem is that the CPU speculatively fills a (clean) cache line after a DMA_FROM_DEVICE operation has begun, but before the device has actually written to that part of the buffer. Thus a subsequent CPU read after the operation is complete can hit in the cache and return the previous data rather than the updated data that the device wrote. I don't know about MIPS specifically, but that can certainly happen on Arm.
Yes, I think the essence of this problem is speculative execution.

>
>>> I found this problem in 4.19.90 kernel's ethernet driver,
>>> and this patch can fix this problem.
>>
>> if CPU isn't affected by the R10k speculation problem, it sounds more
>> like wrong usage of DMA api.
>
> Sure, explicit accesses to the mapped buffer would be a software error, but if legitimate non-overlapping accesses to other data nearby can trigger the CPU to speculatively fetch lines from the DMA-mapped region, that's generally beyond software's control.
>
> Robin.
The usage of DMA api is correct, driver only access DMA-mapped region after 'dmp_unmap_single'.

Sorry for the previous wrong message format.

Thanks.

