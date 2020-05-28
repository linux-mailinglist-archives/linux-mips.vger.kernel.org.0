Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5270D1E551D
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 06:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgE1Edf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 00:33:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50296 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725298AbgE1Edf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 00:33:35 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2r_Ps9e4wI6AA--.1019S3;
        Thu, 28 May 2020 12:33:04 +0800 (CST)
Subject: Re: [PATCH v3 3/3] mm/memory.c: Add memory read privilege before
 filling PTE entry
To:     Hugh Dickins <hughd@google.com>
References: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
 <1589778529-25627-3-git-send-email-maobibo@loongson.cn>
 <20200518135747.d8837ba6742b2d193e14fbb0@linux-foundation.org>
 <d1646320-51ec-4b5f-bcad-41eba85b78cf@loongson.cn>
 <alpine.LSU.2.11.2005271329050.6217@eggly.anvils>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
Message-ID: <b5219f15-f0bb-55b0-010a-104d42bd64c2@loongson.cn>
Date:   Thu, 28 May 2020 12:33:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.11.2005271329050.6217@eggly.anvils>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn2r_Ps9e4wI6AA--.1019S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1kZw48AF47Gry7Jw1xuFg_yoW8KF1fpa
        ySya12kr4DKrn2yFy2gw1xZF15C3yktFW5WrnxJryj9398XryrKr4aqFZYga1UCr4fCa1F
        yrW8Xr98ua9xZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
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



On 05/28/2020 04:55 AM, Hugh Dickins wrote:
> On Tue, 19 May 2020, maobibo wrote:
>> On 05/19/2020 04:57 AM, Andrew Morton wrote:
>>> On Mon, 18 May 2020 13:08:49 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
>>>
>>>> On mips platform, hw PTE entry valid bit is set in pte_mkyoung
>>>> function, it is used to set physical page with readable privilege.
>>>
>>> pte_mkyoung() seems to be a strange place to set the pte's valid bit. 
>>> Why is it done there?  Can it be done within mips's mk_pte()?
>> On MIPS system hardware cannot set PAGE_ACCESS bit when accessing the page,
>> software sets PAGE_ACCESS software bit and PAGE_VALID hw bit together during page
>> fault stage.
>>
>> If mk_pte is called in page fault flow, it is ok to set both bits. If it is not 
>> called in page fault, PAGE_ACCESS is set however there is no actual memory accessing.
> 
> Sorry for joining in so late, but would you please explain that some more:
> preferably in the final commit message, if not here.
> 
> I still don't understand why this is not done in the same way as on other
> architectures - those that care (I just checked x86, powerpc, arm, arm64,
> but not all of them) make sure that all the bits they want are there in
> mm/mmap.c's protection_map[16], which then feeds into vma->vm_page_prot,
> and so into mk_pte() as Andrew indicated.
> 
> And I can see that arch/mips/mm/cache.c has a setup_protection_map()
> to do that: why does it not set the additional bits that you want?
> including the valid bit and the accessed (young) bit, as others do.
> Are you saying that there are circumstances in which it is wrong
> for mk_pte() to set the additional bits?
MIPS is actually strange here, _PAGE_ACCESSED is not set in protection_map.
I do not understand history of mips neither. 

On x86/aarch/powerpc system, _PAGE_ACCESSED bit is set in the beginning. How does
software track memory page accessing frequency?  Does software not care current
status about _PAGE_ACCESSED bit, just calles madvise_cold to clear this bit, and
then watches whether this bit is changed or not?

regards
bibo,mao
> 
> I'm afraid that generic mm developers will have no clue as to whether
> or not to add a pte_sw_mkyoung() after a mk_pte(); and generic source
> will be the cleaner if it turns out not to be needed (but thank you
> for making sure that it does nothing on the other architectures).
> 
> Hugh
> 

