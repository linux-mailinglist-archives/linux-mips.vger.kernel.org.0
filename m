Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEE2476BF1
	for <lists+linux-mips@lfdr.de>; Thu, 16 Dec 2021 09:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhLPI3w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Dec 2021 03:29:52 -0500
Received: from mxout02.lancloud.ru ([45.84.86.82]:44344 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhLPI3w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Dec 2021 03:29:52 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 4B89022F24EA
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <f6e65422-c007-d682-a6ea-698b41d4a9b7@omp.ru>
Date:   Thu, 16 Dec 2021 11:29:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] MIPS: tx39: adjust tx39_flush_cache_page
Content-Language: en-US
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        <ambrosehua@gmail.com>
CC:     Bibo Mao <maobibo@loongson.cn>, <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-3-huangpei@loongson.cn>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211215084500.24444-3-huangpei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 15.12.2021 11:44, Huang Pei wrote:

> Indexed cache operation actually uses KSEG0/CKSEG0 (AKA physical
> address, see INDEX_BASE in arch/mips/include/asm/r4kcache.h) to
> index cache line, so it CAN NOT handle cache alias(cache alias
> is first introduced into MIPS by R4000, indexing cache line with
> virtual address).
> 
> It is said, on "32-Bit TX System TX39 Family TMPR3911/3912", P86,
> 
> •Translation Look-aside Buffer (TLB) (4 Kbyte Page size, 32 Entries)
> •4Kbyte instruction cache (I-cache)
> 	•16 bytes (4 words) per line (256 lines total)
> 	•physical address tag per cache line
> 	•single valid bit per cache line
> 	•direct-mapped
> •1 Kbyte data cache (D-cache)
> 	•4bytes (1 word) per line (128 lines total)
> 	•physical address tag per cache line
> 	•write-through
> 	•two-way set associate
> 
> We can assume there is NO cache alias on TX39's R3900 core
> 
> Anyway, remove checking for cpu_has_dc_aliases, since tx39_*indexed
> can not index cache alias, nor there is cache alias on R3900
> 
> More info about TX3911/3912, see
> https://pdf1.alldatasheet.com/datasheet-pdf/view/211951/TOSHIBA/TMPR
> 3912.html
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>   arch/mips/mm/c-tx39.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
> index 03dfbb40ec73..c2ecdde0371d 100644
> --- a/arch/mips/mm/c-tx39.c
> +++ b/arch/mips/mm/c-tx39.c
> @@ -207,11 +207,12 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
>   	/*
>   	 * Do indexed flush, too much work to get the (possible) TLB refills
>   	 * to work correctly.
> +	 *

    Why?

[...]

MBR, Sergey
