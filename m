Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351321E4043
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 13:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgE0Li4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 07:38:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:41068 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730063AbgE0Lia (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 07:38:30 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jduO3-00011U-00; Wed, 27 May 2020 13:38:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3E183C04CD; Wed, 27 May 2020 13:32:56 +0200 (CEST)
Date:   Wed, 27 May 2020 13:32:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 0/4] MIPS: page fault handling optimization
Message-ID: <20200527113256.GA13537@alpha.franken.de>
References: <1590546320-21814-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590546320-21814-1-git-send-email-maobibo@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 10:25:16AM +0800, Bibo Mao wrote:
> V7:
> - define function flush_tlb_fix_spurious_fault as inline rather
>   than macro
> V6:
> - Add update_mmu_tlb function as empty on all platform except mips
>   system, we use this function to update local tlb for page fault
>   smp-race handling
> V5:
> - define update_mmu_cache function specified on MIPS platform, and
>   add page fault smp-race stats info
> V4:
> - add pte_sw_mkyoung function to implement readable privilege, and
>   this function is  only in effect on MIPS system.
> - add page valid bit judgement in function pte_modify
> V3:
> - add detailed changelog, modify typo issue in patch V2
> v2:
> - split flush_tlb_fix_spurious_fault and tlb update into two patches
> - comments typo modification
> - separate tlb update and add pte readable privilege into two patches
> 
> Bibo Mao (4):
>   MIPS: Do not flush tlb page when updating PTE entry
>   mm/memory.c: Update local TLB if PTE entry exists
>   mm/memory.c: Add memory read privilege on page fault handling
>   MIPS: mm: add page valid judgement in function pte_modify
> 
>  arch/mips/include/asm/pgtable.h | 37 +++++++++++++++++++++++++++++++++++--
>  include/asm-generic/pgtable.h   | 33 +++++++++++++++++++++++++++++++++
>  mm/memory.c                     | 30 ++++++++++++++++++++++--------
>  3 files changed, 90 insertions(+), 10 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
