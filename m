Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B2E3A3B8F
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 08:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFKGCz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 11 Jun 2021 02:02:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57042 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230117AbhFKGCy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Jun 2021 02:02:54 -0400
Received: from [127.0.0.1] (unknown [222.209.8.141])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0IE_MJg2xUPAA--.5471S2;
        Fri, 11 Jun 2021 14:00:38 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-Mailer: BlackBerry Email (10.3.3.3216)
Message-ID: <20210611060037.5779544.79787.9730@loongson.cn>
Date:   Fri, 11 Jun 2021 14:00:37 +0800
Subject: Re: [PATCH] MIPS: add PMD table accounting into MIPS'pmd_alloc_one
From:   =?utf-8?b?6buE5rKb?= <huangpei@loongson.cn>
In-Reply-To: <bc494f2f-9593-ddfa-11bf-ef33d0a614ee@loongson.cn>
References: <20210611021235.2426442-1-huangpei@loongson.cn>
 <bc494f2f-9593-ddfa-11bf-ef33d0a614ee@loongson.cn>
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
X-CM-TRANSID: AQAAf9DxH0IE_MJg2xUPAA--.5471S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryfArWfXw15Aw45CrW3Wrg_yoW8AryfpF
        4kAa48G3yYgry8uFW3Ar4v9rW5Gw45GrZYgF47uwnav3ZrGFyrK34kKwn8ZFn8Aws5GF48
        urZagF1DCr42va7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUndb1UUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

yes，my bad，I will resend soon

  Original Message  
From: Jinyang He
Sent: 2021年6月11日星期五 13:52
To: Huang Pei; Thomas Bogendoerfer; ambrosehua@gmail.com
Cc: Bibo Mao; linux-mips@vger.kernel.org; Jiaxun Yang; Paul Burton; Li Xuefeng; Yang Tiezhu; Gao Juxin; Huacai Chen
Subject: Re: [PATCH] MIPS: add PMD table accounting into MIPS'pmd_alloc_one

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
> arch/mips/include/asm/pgalloc.h | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index 8b18424b3120..916bd637d30f 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -60,10 +60,14 @@ do {	 \
> static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
> {
> pmd_t *pmd;

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
> +	 pgtable_pmd_page_ctor(pg);
> +	 pmd = (pmd_t *)page_address(pg);
> pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> +	}
> return pmd;
> }
> 

