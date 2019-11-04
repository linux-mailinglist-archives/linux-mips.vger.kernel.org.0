Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4688ED7A3
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 03:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbfKDCPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 Nov 2019 21:15:41 -0500
Received: from foss.arm.com ([217.140.110.172]:34396 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728227AbfKDCPk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 3 Nov 2019 21:15:40 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7F6631F;
        Sun,  3 Nov 2019 18:15:39 -0800 (PST)
Received: from [10.163.1.23] (unknown [10.163.1.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E4893F67D;
        Sun,  3 Nov 2019 18:15:22 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To:     Qian Cai <cai@lca.pw>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
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
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <B6AAFA3F-745D-48E2-98CC-CFB30934CE39@lca.pw>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <fdb72ac1-5f21-bcf1-ebab-411f56e67b56@arm.com>
Date:   Mon, 4 Nov 2019 07:45:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <B6AAFA3F-745D-48E2-98CC-CFB30934CE39@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/29/2019 04:01 PM, Qian Cai wrote:
> 
> 
>> On Oct 28, 2019, at 1:29 AM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>
>> This adds tests which will validate architecture page table helpers and
>> other accessors in their compliance with expected generic MM semantics.
>> This will help various architectures in validating changes to existing
>> page table helpers or addition of new ones.
>>
>> This test covers basic page table entry transformations including but not
>> limited to old, young, dirty, clean, write, write protect etc at various
>> level along with populating intermediate entries with next page table page
>> and validating them.
>>
>> Test page table pages are allocated from system memory with required size
>> and alignments. The mapped pfns at page table levels are derived from a
>> real pfn representing a valid kernel text symbol. This test gets called
>> right after page_alloc_init_late().
>>
>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>> arm64. Going forward, other architectures too can enable this after fixing
>> build or runtime problems (if any) with their page table helpers.
>>
>> Folks interested in making sure that a given platform's page table helpers
>> conform to expected generic MM semantics should enable the above config
>> which will just trigger this test during boot. Any non conformity here will
>> be reported as an warning which would need to be fixed. This test will help
>> catch any changes to the agreed upon semantics expected from generic MM and
>> enable platforms to accommodate it thereafter.
> 
> This looks like a perfect candidate to streamline with the new kunit framework, no?

I have not been following the kunit test framework. But being highly dependent on
existing MM accessors (generic or platform) and very much page table modification
centric, mm/ is the best place for this test IMHO. It is now also part of DEBUG_VM
set of tests. Probably in future all existing MM tests (mm/ or lib/) might move to
kunit framework but for now it should remain with DEBUG_VM set of tests.
