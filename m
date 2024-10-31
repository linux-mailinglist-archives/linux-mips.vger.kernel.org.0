Return-Path: <linux-mips+bounces-6576-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F3E9B717B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 02:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DCA728253F
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 01:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC0F3B2BB;
	Thu, 31 Oct 2024 01:08:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295692110E;
	Thu, 31 Oct 2024 01:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730336936; cv=none; b=DPR4OPcgSgvBmIaDqkiOczlOAUc6ySwAs1b/gUUfm7I6tCwNT0RR+hV3Dgdu+wLihNmVpAJ5n/WTcSNNbTvHeSWzEVIw/mrFGo1OBem2JteTmIOUvJ0Z+iNMXe3jcOXNciy8rvHnE5Gi7pHcR5Pqp6lXhIYm7Uf/edZP3NgVNkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730336936; c=relaxed/simple;
	bh=9Cebry7tKliR9PhYmpGR8QNY5H718CjFL9eBYVRfdK8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UIOuU2exCWUvBhqz5DDU04njeaLlRvRwzix58C1qLWVKD/EgpB8RSWRT5cQ9Hf9b89ERXw9N4bE1jg0jRpQoB275AJbKQq8Vvf7hKL5TWuN+uvChUOZ64UBJKn3ncw657kUn3nTwLEV3G43UDuN6HZ2ESjr0BjDQEg1fLCGOkXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxMK+a2CJn4d4fAA--.41853S3;
	Thu, 31 Oct 2024 09:08:42 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMAxreCX2CJn3b8rAA--.6898S3;
	Thu, 31 Oct 2024 09:08:41 +0800 (CST)
Subject: Re: [PATCH v2] mm: define general function pXd_init()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 WANG Xuerui <kernel@xen0n.name>
References: <20241030063905.2434824-1-maobibo@loongson.cn>
 <20241030164123.ff63a1c0e7666ad1a4f8944e@linux-foundation.org>
From: maobibo <maobibo@loongson.cn>
Message-ID: <836c4d86-3b93-06fc-8ac1-6f636a244753@loongson.cn>
Date: Thu, 31 Oct 2024 09:08:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241030164123.ff63a1c0e7666ad1a4f8944e@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxreCX2CJn3b8rAA--.6898S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKry7ZrykuF13CF18Cry5KFX_yoWfXFg_W3
	Z7Zws5u3ykGay2gFWqkry5Cr4UGayrJF4vyw1UWr92k3s3tr45Jws0gFyfXrs09Fs2vr9x
	uayvvan8Zrn8WosvyTuYvTs0mTUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==



On 2024/10/31 上午7:41, Andrew Morton wrote:
> On Wed, 30 Oct 2024 14:39:05 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -267,8 +267,11 @@ extern void set_pmd_at(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp, pm
>>    * Initialize a new pgd / pud / pmd table with invalid pointers.
>>    */
>>   extern void pgd_init(void *addr);
>> +#define pud_init pud_init
>>   extern void pud_init(void *addr);
>> +#define pmd_init pmd_init
>>   extern void pmd_init(void *addr);
>> +#define kernel_pte_init kernel_pte_init
>>   extern void kernel_pte_init(void *addr);
> 
> Nitlet: don't we usually put the #define *after* the definition?
> 
> void foo(void);
> #define foo() foo()
yes, it should be so. Will modify it in next version.

Regards
Bibo Mao
> 
> ?
> 
> 


