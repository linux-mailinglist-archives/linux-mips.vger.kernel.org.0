Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493B13D0790
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 06:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhGUDnF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 23:43:05 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:53358 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231363AbhGUDnF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 23:43:05 -0400
X-Greylist: delayed 13073 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Jul 2021 23:43:05 EDT
Subject: Re: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
References: <20210721034335.2015914-1-huangpei@loongson.cn>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <d08a98c9-e696-57b0-5837-b8a640e156fa@gentoo.org>
Date:   Wed, 21 Jul 2021 00:23:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210721034335.2015914-1-huangpei@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/20/2021 23:43, Huang Pei wrote:
> +. According to Documentation/vm/split_page_table_lock, handle failure
> of pgtable_pmd_page_ctor
> 
> +. use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT
> 
> Reported-by: Joshua Kinard <kumba@gentoo.org>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/pgalloc.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index d0cf997b4ba8..5c9597a6c60c 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -62,11 +62,15 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  	pmd_t *pmd = NULL;
>  	struct page *pg;
>  
> -	pg = alloc_pages(GFP_KERNEL | __GFP_ACCOUNT, PMD_ORDER);
> +	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
>  	if (pg) {
> -		pgtable_pmd_page_ctor(pg);
> -		pmd = (pmd_t *)page_address(pg);
> -		pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> +		if(pgtable_pmd_page_ctor(pg)) {
> +			pmd = (pmd_t *)page_address(pg);
> +			pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> +		} else {
> +			__free_pages(pg, PMD_ORDER);
> +		}
> +
>  	}
>  	return pmd;
>  }
> 
Instead of the nested if statements, why not go with something that looks more
like what is in arch/x86/include/asm/pgalloc.h?

Note, I don't have a full kernel tree in front of me at the moment, so this is
just the refactored function of pmd_alloc_one:

static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
{
	pmd_t *pmd;
	struct page *page;

	page = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
	if (!page)
		return NULL;

	if (!pgtable_pmd_page_ctor(page)) {
		__free_pages(page, PMD_ORDER);
		return NULL;
	}

	pmd = (pmd_t *)page_address(page);
	pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);

	return pmd;
}

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
