Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF535209C5B
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 11:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390771AbgFYJ5j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jun 2020 05:57:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34688 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388485AbgFYJ5j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Jun 2020 05:57:39 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axf+judPReSJtJAA--.1308S3;
        Thu, 25 Jun 2020 17:57:03 +0800 (CST)
Subject: Re: [PATCH 2/3] mm/huge_memory.c: update tlb entry if pmd is changed
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>
References: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
 <1592990792-1923-2-git-send-email-maobibo@loongson.cn>
 <07f78e99-6e59-0bce-8ac0-50d7c7600461@oracle.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <b6f29ae6-8246-9110-1d93-3a68d55e19d0@loongson.cn>
Date:   Thu, 25 Jun 2020 17:57:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <07f78e99-6e59-0bce-8ac0-50d7c7600461@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Axf+judPReSJtJAA--.1308S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFykKr1xKr18Kr18Wr13twb_yoW8Xr47p3
        yfGan5Jw4DKr40krs7Xw47Xr4FvwsIqFWDXr1YkrWUZ3W5Xw1Fkr97uws7Wa4UZr4rXw47
        ZayjgF98ur98ZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
        Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7IU56c_DUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/25/2020 08:30 AM, Mike Kravetz wrote:
> On 6/24/20 2:26 AM, Bibo Mao wrote:
>> When set_pmd_at is called in function do_huge_pmd_anonymous_page,
>> new tlb entry can be added by software on MIPS platform.
>>
>> Here add update_mmu_cache_pmd when pmd entry is set, and
>> update_mmu_cache_pmd is defined as empty excepts arc/mips platform.
>> This patch has no negative effect on other platforms except arc/mips
>> system.
> 
> I am confused by this comment.  It appears that update_mmu_cache_pmd
> is defined as non-empty on arc, mips, powerpc and sparc architectures.
> Am I missing something?
ohh, sparc is missing here, it not defined as empty. On powerpc it is defined
as empty.

> 
> If those architectures do provide update_mmu_cache_pmd, then the previous
> patch and this one now call update_mmu_cache_pmd with the actual faulting
> address instead of the huge page aligned address.  This was intentional
> for mips.  However, are there any potential issues on the other architectures?
It is not special for mips, only that fault address is useful on mips system.
In function huge_pmd_set_accessed/do_huge_pmd_wp_page, update_mmu_cache_pmd is
called with vmf->address, rather than start address of pmd page.

regards
bibo,mao

> I am no expert in any of those architectures.  arc looks like it could be
> problematic as update_mmu_cache_pmd calls update_mmu_cache and then
> operates on (address & PAGE_MASK).  That could now be different.

