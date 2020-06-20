Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99BC202113
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 05:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgFTDsM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 23:48:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55488 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725290AbgFTDsL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Jun 2020 23:48:11 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH2nXhu1eKzJHAA--.7854S3;
        Sat, 20 Jun 2020 11:47:36 +0800 (CST)
From:   maobibo <maobibo@loongson.cn>
Subject: Re: [PATCH] MIPS: Do not flush tlb when setting pmd entry
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1591177333-17833-1-git-send-email-maobibo@loongson.cn>
 <20200615101443.GA10075@alpha.franken.de>
 <4bef403d-baba-ddf8-c25c-3d6968897a53@loongson.cn>
 <20200617111403.GC9940@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ea914a82-70c1-b9a3-f6f0-f92a6d6c6e7f@loongson.cn>
Date:   Sat, 20 Jun 2020 11:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200617111403.GC9940@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxH2nXhu1eKzJHAA--.7854S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1xXr4kCw1rCrW3urWfXwb_yoWrWrWUpF
        93JFn7tr4UJw1DJw4xJrW8Xr45tr15Ja45Jr15Gw18Jr1q9r48Kr1UJ348XayUJry5ArWU
        XF4YqFyDXw1UJ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/17/2020 07:14 PM, Thomas Bogendoerfer wrote:
> On Tue, Jun 16, 2020 at 06:34:21PM +0800, maobibo wrote:
>>
>>
>> On 06/15/2020 06:14 PM, Thomas Bogendoerfer wrote:
>>> On Wed, Jun 03, 2020 at 05:42:13PM +0800, Bibo Mao wrote:
>>>> Function set_pmd_at is to set pmd entry, if tlb entry need to
>>>> be flushed, there exists pmdp_huge_clear_flush alike function
>>>> before set_pmd_at is called. So it is not necessary to call
>>>> flush_tlb_all in this function.
>>>
>>> have you checked all set_pmd_at() calls ? I found a few case where
>>> it's not clear to me, if tlb flushing is done... If you think this
>>> is still the right thing to do, please change arch/mips/mm/pgtable-32.c
>>> as well.
>> well, I will double check this and do more testing about thp and hugepage.
> 
> I was more concerned about
> 
> fs/dax.c
> fs/proc/task_mmu.c
> mm/rmap.c

I think that flush_tlb_all should not be called in function set_pmd_at
on mips platform. However update_mmu_cache_pmd() should be called __after__
set_pmd_at() function to update tlb entry at some places, it is another issue.
Here is my analysis in the three files where set_pmd_at is called.

in file fs/dax.c
------------------------------------------------------
                if (pmdp) {
#ifdef CONFIG_FS_DAX_PMD
                        pmd_t pmd;
        
                        if (pfn != pmd_pfn(*pmdp))
                                goto unlock_pmd;          
                        if (!pmd_dirty(*pmdp) && !pmd_write(*pmdp))
                                goto unlock_pmd;
        
                        flush_cache_page(vma, address, pfn);
                        pmd = pmdp_invalidate(vma, address, pmdp);
                        pmd = pmd_wrprotect(pmd);
                        pmd = pmd_mkclean(pmd);
                        set_pmd_at(vma->vm_mm, address, pmdp, pmd);
unlock_pmd:          
#endif 
------------------------------------------------------
pmdp_invalidate is called here to flush pmd range already, it is not necessary
to flush pmd range in function set_pmd_at

------------------------------------------------------
        if (!pmd_none(*(vmf->pmd))) {
                spin_unlock(ptl);
                goto fallback;
        }

        if (pgtable) {
                pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
                mm_inc_nr_ptes(vma->vm_mm);
        }
        pmd_entry = mk_pmd(zero_page, vmf->vma->vm_page_prot);
        pmd_entry = pmd_mkhuge(pmd_entry);
        set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
        spin_unlock(ptl);
        trace_dax_pmd_load_hole(inode, vmf, zero_page, *entry);
        return VM_FAULT_NOPAGE;
------------------------------------------------------
pmd entry is none, does not need to flush pmd range


in file fs/proc/task_mmu.c
------------------------------------------------------
static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
                unsigned long addr, pmd_t *pmdp)
{
        pmd_t old, pmd = *pmdp;

        if (pmd_present(pmd)) {
                /* See comment in change_huge_pmd() */
                old = pmdp_invalidate(vma, addr, pmdp);
                if (pmd_dirty(old))
                        pmd = pmd_mkdirty(pmd);
                if (pmd_young(old))
                        pmd = pmd_mkyoung(pmd);

                pmd = pmd_wrprotect(pmd);
                pmd = pmd_clear_soft_dirty(pmd);

                set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
        } else if (is_migration_entry(pmd_to_swp_entry(pmd))) {
                pmd = pmd_swp_clear_soft_dirty(pmd);
                set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
        }
}
------------------------------------------------------
At the first place where set_pmd_at is called, pmdp_invalidate is called to
flush pmd range. At the second place, on mips system pmd_swp_clear_soft_dirty(pmd)
is equal to pmd, pmd entry has no change, does not need to flush pmd range

in file linux/mm/rmap.c:
------------------------------------------------------
                        pmd_t *pmd = pvmw.pmd;
                        pmd_t entry;
                                                          
                        if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
                                continue;
        
                        flush_cache_page(vma, address, page_to_pfn(page));
                        entry = pmdp_invalidate(vma, address, pmd);
                        entry = pmd_wrprotect(entry);
                        entry = pmd_mkclean(entry);
                        set_pmd_at(vma->vm_mm, address, pmd, entry);
                        ret = 1;
------------------------------------------------------
pmdp_invalidate is called to flush pmd range, does not need to flush pmd range
again in function set_pmd_at.

> 
> Thomas.
> 

