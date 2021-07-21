Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DA43D0A95
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 10:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbhGUHno (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Jul 2021 03:43:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42710 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236045AbhGUHdY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Jul 2021 03:33:24 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [222.209.8.152])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax2uA+1_dgj0giAA--.23804S2;
        Wed, 21 Jul 2021 16:13:51 +0800 (CST)
Date:   Wed, 21 Jul 2021 16:13:50 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
Message-ID: <20210721081350.ygtezwksqfy6cbsq@ambrosehua-HP-xw6600-Workstation>
References: <20210721034335.2015914-1-huangpei@loongson.cn>
 <d08a98c9-e696-57b0-5837-b8a640e156fa@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d08a98c9-e696-57b0-5837-b8a640e156fa@gentoo.org>
X-CM-TRANSID: AQAAf9Ax2uA+1_dgj0giAA--.23804S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1xAr13XrWxXr1xJr4xJFb_yoW5GFy3pF
        Z5GF4kWay5JryrWrW7ArsY9r9xJws5GFWktFsFga4Sv3ZrKryFkr97C3s8Z3W5ZFWkXF48
        ZrWIqF17Cr4ay3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjNJ55UUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 21, 2021 at 12:23:39AM -0400, Joshua Kinard wrote:
> On 7/20/2021 23:43, Huang Pei wrote:
> > +. According to Documentation/vm/split_page_table_lock, handle failure
> > of pgtable_pmd_page_ctor
> > 
> > +. use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT
> > 
> > Reported-by: Joshua Kinard <kumba@gentoo.org>
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/include/asm/pgalloc.h | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> > index d0cf997b4ba8..5c9597a6c60c 100644
> > --- a/arch/mips/include/asm/pgalloc.h
> > +++ b/arch/mips/include/asm/pgalloc.h
> > @@ -62,11 +62,15 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
> >  	pmd_t *pmd = NULL;
> >  	struct page *pg;
> >  
> > -	pg = alloc_pages(GFP_KERNEL | __GFP_ACCOUNT, PMD_ORDER);
> > +	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
> >  	if (pg) {
> > -		pgtable_pmd_page_ctor(pg);
> > -		pmd = (pmd_t *)page_address(pg);
> > -		pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> > +		if(pgtable_pmd_page_ctor(pg)) {
> > +			pmd = (pmd_t *)page_address(pg);
> > +			pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> > +		} else {
> > +			__free_pages(pg, PMD_ORDER);
> > +		}
> > +
> >  	}
> >  	return pmd;
> >  }
> > 
> Instead of the nested if statements, why not go with something that looks more
> like what is in arch/x86/include/asm/pgalloc.h?
> 
> Note, I don't have a full kernel tree in front of me at the moment, so this is
> just the refactored function of pmd_alloc_one:
> 
> static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
> {
> 	pmd_t *pmd;
> 	struct page *page;
> 
> 	page = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
> 	if (!page)
> 		return NULL;
> 
> 	if (!pgtable_pmd_page_ctor(page)) {
> 		__free_pages(page, PMD_ORDER);
> 		return NULL;
> 	}
> 
> 	pmd = (pmd_t *)page_address(page);
> 	pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
> 
> 	return pmd;
> }
> 

Much more readable, V2 just resend, thank you!

PS:

Latest Gentoo/MIPS stage3 is only available for big endian, is there any
little endian stage3 available? 
> -- 
> Joshua Kinard
> Gentoo/MIPS
> kumba@gentoo.org
> rsa6144/5C63F4E3F5C6C943 2015-04-27
> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
> 
> "The past tempts us, the present confuses us, the future frightens us.  And
> our lives slip away, moment by moment, lost in that vast, terrible in-between."
> 
> --Emperor Turhan, Centauri Republic

