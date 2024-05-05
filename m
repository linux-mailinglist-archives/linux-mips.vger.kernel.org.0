Return-Path: <linux-mips+bounces-3085-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD28BC16B
	for <lists+linux-mips@lfdr.de>; Sun,  5 May 2024 16:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1ACB1C20F55
	for <lists+linux-mips@lfdr.de>; Sun,  5 May 2024 14:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6289635280;
	Sun,  5 May 2024 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="Xy1J2stR"
X-Original-To: linux-mips@vger.kernel.org
Received: from out187-14.us.a.mail.aliyun.com (out187-14.us.a.mail.aliyun.com [47.90.187.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953E2BAF6;
	Sun,  5 May 2024 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714919423; cv=none; b=T/s8x5QXVSeGMNxfypCSG6YiK8+sqe4nJnEuYxJE8fat5GgnAB1BA6pcydKgv7LtcuURii7nEoh7YVfWmprfpTyeDBshArxPjd7qp++/tBFvEVRxc5sajaxjHYeXjpNUjBSH+B+v7itigi597EduhagirpfYamA48Wlo5nnFblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714919423; c=relaxed/simple;
	bh=+5M/UHVCF/4+zdZT19hNfPftPYcVlDMS+M5WUIbdi+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQuzcduQuXTikITJfHYLVrH+ZAWXKToe+lFC1WBXobU9x+lKRoiIgoNYtlRG4lgJdlZX5ylflFVrAkN5KaJQwWNukq+7Tl3HiMK3OOgLAHHwcb4KEwGLqWDqecukcuDAoUxzb1MMVxRbOu1tYxx+LVu1VFaZ8Ug5thgS92+WElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=Xy1J2stR; arc=none smtp.client-ip=47.90.187.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714919402; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=yUcsdhnPhmEHzxVOANaSCTb2AazIh17RKQgQDGLXMqg=;
	b=Xy1J2stR+8iy4ZuHVyuZVktpQFwq6tqdzeuaM6lf6frMKWZwniuyea86RfCVkvmCYNTuly07KR85+ax2rXOQDSyepfhwgKaX+0c+QXIJppStMU7rA/wnxQWUxOW0gU3DTmfVlhPifoS5YnwAdxo4rB4r3bahcE2r+vGAxBj4bo4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047188;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XSX6Fdd_1714919399;
Received: from 30.121.4.198(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XSX6Fdd_1714919399)
          by smtp.aliyun-inc.com;
          Sun, 05 May 2024 22:30:01 +0800
Message-ID: <f3114a5a-3ddb-474b-897c-0d96d25c31f9@antgroup.com>
Date: Sun, 05 May 2024 22:29:59 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] mm: Add update_mmu_tlb_range()
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org,
 tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 chris@zankel.net, jcmvbkbc@gmail.com, david@redhat.com,
 ryan.roberts@arm.com, libang.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240429103346.59115-1-libang.li@antgroup.com>
 <20240429103346.59115-6-libang.li@antgroup.com>
 <CAK1f24n4usJm4=e0+jrTxGtRjqTJZvn4gBp8d_vU=p2CrU=TsA@mail.gmail.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <CAK1f24n4usJm4=e0+jrTxGtRjqTJZvn4gBp8d_vU=p2CrU=TsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Lance,

Thanks for taking time to review!

On 2024/4/29 19:23, Lance Yang wrote:
> Hey Bang,
> 
> On Mon, Apr 29, 2024 at 6:36 PM Bang Li <libang.li@antgroup.com> wrote:
>>
>> After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
>> multi-size THP"), it may need to batch update tlb of an address range
>> through the update_mmu_tlb function. We can simplify this operation by
>> adding the update_mmu_tlb_range function, which may also reduce the
>> execution of some unnecessary code in some architectures.
>>
>> Signed-off-by: Bang Li <libang.li@antgroup.com>
>> ---
>>   include/linux/pgtable.h | 5 +++++
>>   mm/memory.c             | 4 +---
>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 18019f037bae..73411dfebf7a 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -734,6 +734,11 @@ static inline void update_mmu_tlb(struct vm_area_struct *vma,
>>                                  unsigned long address, pte_t *ptep)
>>   {
>>   }
>> +
>> +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
>> +                               unsigned long address, pte_t *ptep, unsigned int nr)
>> +{
>> +}
>>   #define __HAVE_ARCH_UPDATE_MMU_TLB
>>   #endif
> 
> IMO, it might be better to use a separate definition to determine whether
> update_mmu_tlb_range() is overridden by a specific architecture.

I have also considered this, and I will modify it in the next version.
thank you again for your review!

Thanks,
Bang

> 
> Thanks,
> Lance
> 
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 6647685fd3c4..1f0ca362b82a 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -4396,7 +4396,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>          vm_fault_t ret = 0;
>>          int nr_pages = 1;
>>          pte_t entry;
>> -       int i;
>>
>>          /* File mapping without ->vm_ops ? */
>>          if (vma->vm_flags & VM_SHARED)
>> @@ -4465,8 +4464,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>                  update_mmu_tlb(vma, addr, vmf->pte);
>>                  goto release;
>>          } else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
>> -               for (i = 0; i < nr_pages; i++)
>> -                       update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pte + i);
>> +               update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
>>                  goto release;
>>          }
>>
>> --
>> 2.19.1.6.gb485710b
>>

