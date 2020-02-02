Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00FA14FC45
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2020 09:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgBBI0X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Feb 2020 03:26:23 -0500
Received: from foss.arm.com ([217.140.110.172]:45212 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgBBI0X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Feb 2020 03:26:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C77E1045;
        Sun,  2 Feb 2020 00:26:22 -0800 (PST)
Received: from [10.163.1.42] (unknown [10.163.1.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D883F68E;
        Sun,  2 Feb 2020 00:29:45 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <eecaf6d6-66d2-1c17-ce02-74ed399fc58e@arm.com>
Date:   Sun, 2 Feb 2020 13:56:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/30/2020 06:34 PM, Anshuman Khandual wrote:
> On 01/28/2020 10:35 PM, Christophe Leroy wrote:
>>
>> Le 28/01/2020 à 02:27, Anshuman Khandual a écrit :
>>> This adds tests which will validate architecture page table helpers and
>>> other accessors in their compliance with expected generic MM semantics.
>>> This will help various architectures in validating changes to existing
>>> page table helpers or addition of new ones.
>>>
>>> This test covers basic page table entry transformations including but not
>>> limited to old, young, dirty, clean, write, write protect etc at various
>>> level along with populating intermediate entries with next page table page
>>> and validating them.
>>>
>>> Test page table pages are allocated from system memory with required size
>>> and alignments. The mapped pfns at page table levels are derived from a
>>> real pfn representing a valid kernel text symbol. This test gets called
>>> right after page_alloc_init_late().
>>>
>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>>> arm64. Going forward, other architectures too can enable this after fixing
>>> build or runtime problems (if any) with their page table helpers.
>>>
>>> Folks interested in making sure that a given platform's page table helpers
>>> conform to expected generic MM semantics should enable the above config
>>> which will just trigger this test during boot. Any non conformity here will
>>> be reported as an warning which would need to be fixed. This test will help
>>> catch any changes to the agreed upon semantics expected from generic MM and
>>> enable platforms to accommodate it thereafter.
>>>
>> [...]
>>
>>> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>        #PPC32
>> Also tested on PPC64 (under QEMU): book3s/64 64k pages, book3s/64 4k pages and book3e/64
> Hmm but earlier Michael Ellerman had reported some problems while
> running these tests on PPC64, a soft lock up in hash__pte_update()
> and a kernel BUG (radix MMU). Are those problems gone away now ?
> 
> Details in this thread - https://patchwork.kernel.org/patch/11214603/
> 

It is always better to have more platforms enabled than not. But lets keep
this test disabled on PPC64 for now, if there is any inconsistency between
results while running this under QEMU and on actual systems.
