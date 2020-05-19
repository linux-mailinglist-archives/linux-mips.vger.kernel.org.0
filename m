Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61E21D8E2D
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 05:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgESDXf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 23:23:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33100 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726302AbgESDXf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 23:23:35 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT90JUcNerWM2AA--.50S3;
        Tue, 19 May 2020 11:22:50 +0800 (CST)
Subject: Re: [PATCH v3 3/3] mm/memory.c: Add memory read privilege before
 filling PTE entry
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
 <1589778529-25627-3-git-send-email-maobibo@loongson.cn>
 <20200518135747.d8837ba6742b2d193e14fbb0@linux-foundation.org>
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
Message-ID: <d1646320-51ec-4b5f-bcad-41eba85b78cf@loongson.cn>
Date:   Tue, 19 May 2020 11:22:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200518135747.d8837ba6742b2d193e14fbb0@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxT90JUcNerWM2AA--.50S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4ktr1Dur17CFy8AFW7CFg_yoW5WF15pF
        Z7G3W29Fs7tw18AF1xW3WkAF15uw4FgFW5Wrn5Gw15ZwsrArn8CFW7GFWFvryDAr1UCw4r
        AF4Utr4UZan8uaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU90b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
        04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
        VFxhVjvjDU0xZFpf9x07b5sjbUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/19/2020 04:57 AM, Andrew Morton wrote:
> On Mon, 18 May 2020 13:08:49 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> On mips platform, hw PTE entry valid bit is set in pte_mkyoung
>> function, it is used to set physical page with readable privilege.
> 
> pte_mkyoung() seems to be a strange place to set the pte's valid bit. 
> Why is it done there?  Can it be done within mips's mk_pte()?
On MIPS system hardware cannot set PAGE_ACCESS bit when accessing the page,
software sets PAGE_ACCESS software bit and PAGE_VALID hw bit together during page
fault stage.

If mk_pte is called in page fault flow, it is ok to set both bits. If it is not 
called in page fault, PAGE_ACCESS is set however there is no actual memory accessing.

> 
>> Here add pte_mkyoung function to make page readable on MIPS platform
>> during page fault handling. This patch improves page fault latency
>> about 10% on my MIPS machine with lmbench lat_pagefault case.
>>
>> ...
>>
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>>  		}
>>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>>  		entry = mk_pte(new_page, vma->vm_page_prot);
>> +		entry = pte_mkyoung(entry);
>>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> 
> What is the effect on non-mips machines?  If it's only "additional
> overhead" then it would be better to add a new pte_mkvalid() (or
> whatever) and arrange for it to be a no-op on all but mips?

how about adding pte_sw_mkyoung alike function which is a noop on all but mips?
this function is used to set PAGE_ACCESS bit and PAGE_VALID bit on mips platform.

regards
bibo,mao

> 
>>  		/*
>>  		 * Clear the pte entry and flush it first, before updating the
>> @@ -3378,6 +3379,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>  	__SetPageUptodate(page);
>>  
>>  	entry = mk_pte(page, vma->vm_page_prot);
>> +	entry = pte_mkyoung(entry);
>>  	if (vma->vm_flags & VM_WRITE)
>>  		entry = pte_mkwrite(pte_mkdirty(entry));
>>  
>> @@ -3660,6 +3662,7 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
>>  
>>  	flush_icache_page(vma, page);
>>  	entry = mk_pte(page, vma->vm_page_prot);
>> +	entry = pte_mkyoung(entry);
>>  	if (write)
>>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>>  	/* copy-on-write page */
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 494192ca..673f1cd 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -131,6 +131,8 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>>  				ptent = pte_clear_uffd_wp(ptent);
>>  			}
>>  
>> +			if (vma->vm_flags & VM_READ)
>> +				ptent = pte_mkyoung(ptent);
>>  			/* Avoid taking write faults for known dirty pages */
>>  			if (dirty_accountable && pte_dirty(ptent) &&
>>  					(pte_soft_dirty(ptent) ||

