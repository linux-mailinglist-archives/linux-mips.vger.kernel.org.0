Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AC71E2211
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 14:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388632AbgEZMkt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 08:40:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38428 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388497AbgEZMkt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 08:40:49 -0400
Received: from [172.20.10.2] (unknown [124.64.16.78])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2o8Ds1eBEg5AA--.201S3;
        Tue, 26 May 2020 20:40:30 +0800 (CST)
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
From:   Lichao Liu <liulichao@loongson.cn>
Message-ID: <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
Date:   Tue, 26 May 2020 20:40:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200526193859.0adaea3b@halation.net.flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf2o8Ds1eBEg5AA--.201S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuF43uFyfKFyfuw43KFyDKFg_yoW5Jw4fpa
        y0yrsxCr40qF4xA34xG3WUWr4ay3yrtFW5JFyUK3WIq3Z0qF97W397KrWFkF4jvF42q3yS
        vw4DCF9Y9Fs8A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb0D73
        UUUUU==
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2020/5/26 下午7:38, Jiaxun Yang wrote:
> On Tue, 26 May 2020 19:14:38 +0800
> Lichao Liu <liulichao@loongson.cn> wrote:
>
>> CPU_LOONGSON2EF need software to maintain cache consistency,
>> so modify the 'cpu_needs_post_dma_flush' function to return true
>> when the cpu type is CPU_LOONGSON2EF.
>
> Hi Lichao,
>
> I don't think that's required for Loongson-2EF,
>
> According to the comment in code:
>
> The affected CPUs below in 'cpu_needs_post_dma_flush()' can
> speculatively
> fill random cachelines with stale data at any time, requiring an
> extra flush post-DMA.
>
> And according to my understanding that's not going to happen on
> Loongson-2EF. We're always allocating coherent DMA memory in uncached
> range, Loongson-2EF's writeback policy will ensure it won't writeback
> random lines to the memory but only modified dirty lines.
>
> We've been fine without post flush for almost 10 years, there is no
> stability issue revealed.
>
> Btw: Please keep me CCed for Loongson-2EF patches. I'm not very active
> on 2EF development but I'll still review patches.
>
> Thanks.
>
Hi Jiaxun,

Loongson-2EF need software maintain cache consistency, So when using 
streaming DMA, software needs to maintain consistency.

dma_map_single() is correct, but dma_unmap_single is wrong. 

The function call path:
'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
 dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
 cpu_needs_post_dma_flush'

In current version, 'cpu_needs_post_dma_flush' will return false 
at Loongon-2EF platform, and dma_unmap_single will not invalidate cache, 
driver may access wrong dma data.

I don't know what's the exact meaning of "fill random cachelines with 
stale data at any time". I always think 'cpu_needs_post_dma_flush()' 
means whether this platform needs software to maintain cache consistency.

I found this problem in 4.19.90 kernel's ethernet driver, 
and this patch can fix this problem.

Thanks. 


>> ---
>>  arch/mips/mm/dma-noncoherent.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/mips/mm/dma-noncoherent.c
>> b/arch/mips/mm/dma-noncoherent.c index fcea92d95d86..563c2c0d0c81
>> 100644 --- a/arch/mips/mm/dma-noncoherent.c
>> +++ b/arch/mips/mm/dma-noncoherent.c
>> @@ -33,6 +33,7 @@ static inline bool cpu_needs_post_dma_flush(void)
>>  	case CPU_R10000:
>>  	case CPU_R12000:
>>  	case CPU_BMIPS5000:
>> +	case CPU_LOONGSON2EF:
>>  		return true;
>>  	default:
>>  		/*
> --
> Jiaxun Yang

