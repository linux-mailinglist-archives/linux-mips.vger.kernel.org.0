Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 086ED9C74C
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 04:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbfHZChV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Aug 2019 22:37:21 -0400
Received: from foss.arm.com ([217.140.110.172]:52498 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728460AbfHZChV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Aug 2019 22:37:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19249344;
        Sun, 25 Aug 2019 19:37:20 -0700 (PDT)
Received: from [10.162.43.136] (p8cg001049571a15.blr.arm.com [10.162.43.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19513F718;
        Sun, 25 Aug 2019 19:37:09 -0700 (PDT)
Subject: Re: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
 <20190809101632.GM5482@bombadil.infradead.org>
 <a5aab7ff-f7fd-9cc1-6e37-e4185eee65ac@arm.com>
 <20190809135202.GN5482@bombadil.infradead.org>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <7a88f6bb-e8c7-3ac7-2f92-1de752a01f33@arm.com>
Date:   Mon, 26 Aug 2019 08:07:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190809135202.GN5482@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 08/09/2019 07:22 PM, Matthew Wilcox wrote:
> On Fri, Aug 09, 2019 at 04:05:07PM +0530, Anshuman Khandual wrote:
>> On 08/09/2019 03:46 PM, Matthew Wilcox wrote:
>>> On Fri, Aug 09, 2019 at 01:03:17PM +0530, Anshuman Khandual wrote:
>>>> Should alloc_gigantic_page() be made available as an interface for general
>>>> use in the kernel. The test module here uses very similar implementation from
>>>> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
>>>> needs to be exported through a header.
>>>
>>> Why are you allocating memory at all instead of just using some
>>> known-to-exist PFNs like I suggested?
>>
>> We needed PFN to be PUD aligned for pfn_pud() and PMD aligned for mk_pmd().
>> Now walking the kernel page table for a known symbol like kernel_init()
> 
> I didn't say to walk the kernel page table.  I said to call virt_to_pfn()
> for a known symbol like kernel_init().
> 
>> as you had suggested earlier we might encounter page table page entries at PMD
>> and PUD which might not be PMD or PUD aligned respectively. It seemed to me
>> that alignment requirement is applicable only for mk_pmd() and pfn_pud()
>> which create large mappings at those levels but that requirement does not
>> exist for page table pages pointing to next level. Is not that correct ? Or
>> I am missing something here ?
> 
> Just clear the bottom bits off the PFN until you get a PMD or PUD aligned
> PFN.  It's really not hard.

As Mark pointed out earlier that might end up being just a synthetic PFN
which might not even exist on a given system.
