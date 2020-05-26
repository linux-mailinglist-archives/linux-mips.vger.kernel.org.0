Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81AE1E247E
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 16:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgEZOvI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 10:51:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53498 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726856AbgEZOvI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 10:51:08 -0400
Received: from [192.168.50.168] (unknown [111.199.184.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf93CLM1e3E85AA--.157S3;
        Tue, 26 May 2020 22:50:43 +0800 (CST)
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
References: <20200526111438.3788-1-liulichao@loongson.cn>
 <20200526193859.0adaea3b@halation.net.flygoat.com>
 <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
 <20200526212544.1737411f@halation.net.flygoat.com>
From:   Lichao Liu <liulichao@loongson.cn>
Message-ID: <678b6ae6-1396-1835-1145-faab7a44fbb2@loongson.cn>
Date:   Tue, 26 May 2020 22:50:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200526212544.1737411f@halation.net.flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf93CLM1e3E85AA--.157S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw43XF15CryrKw1kZF17trb_yoW5GFWUpF
        W0yanFkr4ktr47Ar4xK3WUWF1Yy3yrtFyUJa4rK3W093WqvF95W39rKrWYkF42vF47Ww4I
        vrWDGFsa9FZ8J3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        CFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r
        4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeKZXUUUUU
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/5/26 下午9:25, Jiaxun Yang 写道:
> On Tue, 26 May 2020 20:40:28 +0800
> Lichao Liu <liulichao@loongson.cn> wrote:
>
>> On 2020/5/26 下午7:38, Jiaxun Yang wrote:
>>> On Tue, 26 May 2020 19:14:38 +0800
>>> Lichao Liu <liulichao@loongson.cn> wrote:
>>>  
>>>> CPU_LOONGSON2EF need software to maintain cache consistency,
>>>> so modify the 'cpu_needs_post_dma_flush' function to return true
>>>> when the cpu type is CPU_LOONGSON2EF.  
>>> Hi Lichao,
>>>
>>> I don't think that's required for Loongson-2EF,
>>>
>>> According to the comment in code:
>>>
>>> The affected CPUs below in 'cpu_needs_post_dma_flush()' can
>>> speculatively
>>> fill random cachelines with stale data at any time, requiring an
>>> extra flush post-DMA.
>>>
>>> And according to my understanding that's not going to happen on
>>> Loongson-2EF. We're always allocating coherent DMA memory in
>>> uncached range, Loongson-2EF's writeback policy will ensure it
>>> won't writeback random lines to the memory but only modified dirty
>>> lines.
>>>
>>> We've been fine without post flush for almost 10 years, there is no
>>> stability issue revealed.
>>>
>>> Btw: Please keep me CCed for Loongson-2EF patches. I'm not very
>>> active on 2EF development but I'll still review patches.
>>>
>>> Thanks.
>>>  
>> Hi Jiaxun,
>>
>> Loongson-2EF need software maintain cache consistency, So when using 
>> streaming DMA, software needs to maintain consistency.
>>
>> dma_map_single() is correct, but dma_unmap_single is wrong. 
>>
>> The function call path:
>> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
>>  dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
>>  cpu_needs_post_dma_flush'
>>
>> In current version, 'cpu_needs_post_dma_flush' will return false 
>> at Loongon-2EF platform, and dma_unmap_single will not invalidate
>> cache, driver may access wrong dma data.
>>
>> I don't know what's the exact meaning of "fill random cachelines with 
>> stale data at any time". I always think 'cpu_needs_post_dma_flush()' 
>> means whether this platform needs software to maintain cache
>> consistency.
>>
>> I found this problem in 4.19.90 kernel's ethernet driver, 
>> and this patch can fix this problem.
>
> Which machine with which ethernet card?
>
> My Fuloong 2F is still serving as printer server and looks like there
> is no stability issue.
>
> Thanks.
> --
> Jiaxun Yang

I think a common intel igb or e1000 nic can reproduce the problem, 
I have encountered this problem on both 2.6 and 4.19 kernel.
Try use tftp to get a large file, such as 200M, then compare their md5.

