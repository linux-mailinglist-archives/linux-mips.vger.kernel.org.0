Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23E71D2E86
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 13:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgENLkj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 07:40:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51860 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725925AbgENLkj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 07:40:39 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn98kLr1eYKQ0AA--.4S3;
        Thu, 14 May 2020 19:40:21 +0800 (CST)
Subject: Re: [PATCH] MIPS: update tlb even if pte entry has no change
To:     Mike Rapoport <rppt@linux.ibm.com>
References: <1589422677-11455-1-git-send-email-maobibo@loongson.cn>
 <20200514093359.GB1059226@linux.ibm.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <1abd8a86-6e04-b69b-6f25-c3ff8201ea5d@loongson.cn>
Date:   Thu, 14 May 2020 19:40:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200514093359.GB1059226@linux.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn98kLr1eYKQ0AA--.4S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUCw1UAw1rXF15CrW8tFb_yoW8ZrWrpF
        Z7A3ZagFZ7J34Ik3ySqrn8KFy3G3y8KFs7KryxKF1Yy3ZI9F1rGrWfK3yFkrWrZa9rKa18
        uFW09F4DWa12y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
        Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x07beAp5UUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/14/2020 05:33 PM, Mike Rapoport wrote:
> On Thu, May 14, 2020 at 10:17:57AM +0800, Bibo Mao wrote:
>> From: bibo mao <maobibo@loongson.cn>
>>
>> If there are two threads reading the same memory and tlb miss happens,
>> one thread fills pte entry, the other reads new pte value during page fault
>> handling. PTE value may be updated before page faul, so the process need
>> need update tlb still.
>>
>> Also this patch define flush_tlb_fix_spurious_fault as empty, since it not
>> necessary to flush the page for all CPUs
> 
> I'm not familiar enough with MIPS TLB workings, but it seems that adding
> a MIPS version of ptep_set_access_flags() and relaxing
> flush_tlb_fix_spurious_fault() are two separate patches.

Well, will split it into two patches.


regards
bibo, mao
> 
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>  arch/mips/include/asm/pgtable.h | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
>> index aab0ec1..d0a4940 100644
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -635,6 +635,26 @@ static inline pmd_t pmd_mknotpresent(pmd_t pmd)
>>  	return pmd;
>>  }
>>  
>> +#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
>> +
>> +#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
>> +int ptep_set_access_flags(struct vm_area_struct *vma,
>> +			unsigned long address, pte_t *ptep,
>> +			pte_t entry, int dirty)
>> +{
>> +	int changed = !pte_same(*ptep, entry);
>> +
>> +	if (changed)
>> +		set_pte_at(vma->vm_mm, address, ptep, entry);
>> +	else
>> +		/* update tlb with latest pte entry still, tlb entry is old
>> +		 * since there is page fault
>> +		 */
>> +		update_mmu_cache(vma, address, ptep);
>> +
>> +	return changed;
>> +}
>> +
>>  /*
>>   * The generic version pmdp_huge_get_and_clear uses a version of pmd_clear() with a
>>   * different prototype.
>> -- 
>> 1.8.3.1
>>
> 

