Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C841E346F
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 03:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgE0BIb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 21:08:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53702 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728092AbgE0BIb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 21:08:31 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axpultvc1eVXI5AA--.413S3;
        Wed, 27 May 2020 09:07:57 +0800 (CST)
Subject: Re: [PATCH v6 1/4] MIPS: Do not flush tlb page when updating PTE
 entry
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
 <79778fc3-c029-272b-358e-4f8f8e5772d3@cogentembedded.com>
 <0a38f25d-dba0-688f-4588-345c861325aa@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <9b71761b-a744-086f-43f5-78dcca18b459@loongson.cn>
Date:   Wed, 27 May 2020 09:07:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0a38f25d-dba0-688f-4588-345c861325aa@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Axpultvc1eVXI5AA--.413S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr15XF1UZFyfCw4DuFyDZFb_yoW8Xr43pF
        97CayYganrW34xKF1xXw4kurWfCws5KFWjqry3ArW5ZanrZr1kKr43ta10kr97Wr1fu3WI
        v3yDt3y8Za45Z3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
        Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026x
        CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
        JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
        1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG
        6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
        4UJbIYCTnIWIevJa73UjIFyTuYvjxU2znQUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/25/2020 04:31 PM, Sergei Shtylyov wrote:
> On 25.05.2020 11:12, Sergei Shtylyov wrote:
> 
>>> It is not necessary to flush tlb page on all CPUs if suitable PTE
>>> entry exists already during page fault handling, just updating
>>> TLB is fine.
>>>
>>> Here redefine flush_tlb_fix_spurious_fault as empty on MIPS system.
>>
>>     Need empty line here.
>>
>>> V6:
>>> - Add update_mmu_tlb function as empty on all platform except mips
>>>    system, we use this function to update local tlb for page fault
>>>    smp-race handling
>>> V5:
>>> - define update_mmu_cache function specified on MIPS platform, and
>>>    add page fault smp-race stats info
>>> V4:
>>> - add pte_sw_mkyoung function to implement readable privilege, and
>>>    this function is  only in effect on MIPS system.
>>> - add page valid bit judgement in function pte_modify
>>> V3:
>>> - add detailed changelog, modify typo issue in patch V2
>>> v2:
>>> - split flush_tlb_fix_spurious_fault and tlb update into two patches
>>> - comments typo modification
>>> - separate tlb update and add pte readable privilege into two patches
>>
>>    It was a bad idea to keep the version change log in the 1st patch only,
>> we have either cover letter for that, or all the individual patches...
> 
>    Sorry for noticing this only now. With 4 patches, you should have a cover letter anyway...
Thanks for reviewing my patch, a cover letter will be added.

> 

>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> [...]
> 
> MBR, Sergei

