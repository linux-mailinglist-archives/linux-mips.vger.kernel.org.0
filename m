Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC053A3B81
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 07:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhFKFyu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 01:54:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55206 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230001AbhFKFyu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Jun 2021 01:54:50 -0400
Received: from [10.130.0.77] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxEOIu+sJgcxQPAA--.17828S3;
        Fri, 11 Jun 2021 13:52:46 +0800 (CST)
Subject: Re: [PATCH] MIPS: add PMD table accounting into MIPS'pmd_alloc_one
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
References: <20210611021235.2426442-1-huangpei@loongson.cn>
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <bc494f2f-9593-ddfa-11bf-ef33d0a614ee@loongson.cn>
Date:   Fri, 11 Jun 2021 13:52:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210611021235.2426442-1-huangpei@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9BxEOIu+sJgcxQPAA--.17828S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tr18Ar1rZF1UKw1xZF1rCrg_yoW8Gr4rpa
        1kCa48G3yYgry5KFW3Ar4v9rZ8Jan5GrWvgr47urnIv3ZrWr4fKryDKw1DZFn8Aa95JF48
        urWSgF1DCr4293JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUfCztUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/11/2021 10:12 AM, Huang Pei wrote:

> This fixes Page Table accounting bug.
>
> MIPS is the ONLY arch just defining __HAVE_ARCH_PMD_ALLOC_ONE alone.
> Since commit b2b29d6d011944 (mm: account PMD tables like PTE tables),
> "pmd_free" in asm-generic with PMD table accounting and "pmd_alloc_one"
> in MIPS without PMD table accounting causes PageTable accounting number
> negative, which read by global_zone_page_state(), always returns 0.
>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>   arch/mips/include/asm/pgalloc.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index 8b18424b3120..916bd637d30f 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -60,10 +60,14 @@ do {							\
>   static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>   {
>   	pmd_t *pmd;

pmd_t *pmd = NULL;

Does it needed?

Thanks,
Jinyang

> +	struct page *pg;
>   
> -	pmd = (pmd_t *) __get_free_pages(GFP_KERNEL, PMD_ORDER);
> -	if (pmd)
> +	pg = alloc_pages(GFP_KERNEL, PMD_ORDER);
> +	if (pg) {
> +		pgtable_pmd_page_ctor(pg);
> +		pmd = (pmd_t *)page_address(pg);
>   		pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> +	}
>   	return pmd;
>   }
>   

