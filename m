Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663D31DAAB9
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 08:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgETGkC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 02:40:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47006 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726224AbgETGkC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 02:40:02 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH2mR0MReo942AA--.119S3;
        Wed, 20 May 2020 14:39:14 +0800 (CST)
Subject: Re: [PATCH v4 2/4] mm/memory.c: Update local TLB if PTE entry exists
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
 <1589882610-7291-2-git-send-email-maobibo@loongson.cn>
 <20200519182619.2c5e76d3f6b25d71702abbe0@linux-foundation.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <e9cd1d61-c475-9b13-fd48-3ff886c74797@loongson.cn>
Date:   Wed, 20 May 2020 14:39:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200519182619.2c5e76d3f6b25d71702abbe0@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxH2mR0MReo942AA--.119S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWryfKr1rGrWUGF4kCF13twb_yoW5urW3pF
        WfCa1DXayktr4UZFWxXr4DZry5Za45XFWkJryfK3WYy3sxXw4SvFW7Ga9Y9rW5Ary0vwsr
        Aa1jgFWUZa1xZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
        xwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjxUg0D7DUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/20/2020 09:26 AM, Andrew Morton wrote:
> On Tue, 19 May 2020 18:03:28 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> If two threads concurrently fault at the same address, the thread that
>> won the race updates the PTE and its local TLB. For now, the other
>> thread gives up, simply does nothing, and continues.
>>
>> It could happen that this second thread triggers another fault, whereby
>> it only updates its local TLB while handling the fault. Instead of
>> triggering another fault, let's directly update the local TLB of the
>> second thread.
>>
>> It is only useful to architectures where software can update TLB, it may
>> bring out some negative effect if update_mmu_cache is used for other
>> purpose also. It seldom happens where multiple threads access the same
>> page at the same time, so the negative effect is limited on other arches.
> 
> I'm still worried about the impact on other architectures.  The
> additional update_mmu_cache() calls won't occur only when multiple
> threads are racing against the same page, I think?  For example,
> insert_pfn() will do this when making a read-only page a writable one.
How about defining ptep_set_access_flags function like this on mips system?
which is the same on riscv platform.

static inline int ptep_set_access_flags(struct vm_area_struct *vma,
					unsigned long address, pte_t *ptep,
					pte_t entry, int dirty)
{
	if (!pte_same(*ptep, entry))
		set_pte_at(vma->vm_mm, address, ptep, entry);
	/*
	 * update_mmu_cache will unconditionally execute, handling both
	 * the case that the PTE changed and the spurious fault case.
	 */
	return true;
}

And keep the following piece of code unchanged, the change will be smaller.
@@ -1770,8 +1770,8 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
                        }
                        entry = pte_mkyoung(*pte);
                        entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-                       if (ptep_set_access_flags(vma, addr, pte, entry, 1))
-                               update_mmu_cache(vma, addr, pte);
+                       ptep_set_access_flags(vma, addr, pte, entry, 1);
+                       update_mmu_cache(vma, addr, pte);
                }

@@ -2436,17 +2436,16 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
                entry = pte_mkyoung(vmf->orig_pte);
-               if (ptep_set_access_flags(vma, addr, vmf->pte, entry, 0))
-                       update_mmu_cache(vma, addr, vmf->pte);
+               ptep_set_access_flags(vma, addr, vmf->pte, entry, 0);
+               update_mmu_cache(vma, addr, vmf->pte);
        }
@@ -2618,8 +2618,8 @@ static inline void wp_page_reuse(struct vm_fault *vmf)
        flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
        entry = pte_mkyoung(vmf->orig_pte);
        entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-       if (ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1))
-               update_mmu_cache(vma, vmf->address, vmf->pte);
+       ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1);
+       update_mmu_cache(vma, vmf->address, vmf->pte);
        pte_unmap_unlock(vmf->pte, vmf->ptl);
 }



> 
> Would you have time to add some instrumentation into update_mmu_cache()
> (maybe a tracepoint) and see what effect this change has upon the
> frequency at which update_mmu_cache() is called for a selection of
> workloads?  And add this info to the changelog to set minds at ease?
OK, I will add some instrumentation data in the changelog.

 

