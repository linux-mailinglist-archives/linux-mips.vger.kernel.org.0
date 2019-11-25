Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B5E1087DD
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 05:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfKYE1i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 23:27:38 -0500
Received: from foss.arm.com ([217.140.110.172]:44392 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbfKYE1h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Nov 2019 23:27:37 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 948E431B;
        Sun, 24 Nov 2019 20:27:36 -0800 (PST)
Received: from [192.168.0.10] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03E013F6C4;
        Sun, 24 Nov 2019 20:27:21 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V10] mm/debug: Add tests validating architecture page
 table helpers
To:     linux-mm@kvack.org
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1574227906-20550-1-git-send-email-anshuman.khandual@arm.com>
Message-ID: <d20b95b2-369c-bcb8-3bf0-f7ce32d0fb12@arm.com>
Date:   Mon, 25 Nov 2019 09:58:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1574227906-20550-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/20/2019 11:01 AM, Anshuman Khandual wrote:
> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
> 
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page
> and validating them.
> 
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> right after page_alloc_init_late().
> 
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
> arm64. Going forward, other architectures too can enable this after fixing
> build or runtime problems (if any) with their page table helpers.
> 
> Folks interested in making sure that a given platform's page table helpers
> conform to expected generic MM semantics should enable the above config
> which will just trigger this test during boot. Any non conformity here will
> be reported as an warning which would need to be fixed. This test will help
> catch any changes to the agreed upon semantics expected from generic MM and
> enable platforms to accommodate it thereafter.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steven Price <Steven.Price@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sri Krishna chowdary <schowdary@nvidia.com>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>		#PPC32
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This adds a test validation for architecture exported page table helpers.
> Patch adds basic transformation tests at various levels of the page table.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/
> 
> Needs to be applied on linux-next (next-20191108).
> 
> Changes in V10:
> 
> - Always enable DEBUG_VM_PGTABLE when DEBUG_VM is enabled per Ingo
> - Added tags from Ingo

Hello Andrew,

There has not been any further comments on the previous version (V9) or this version
(V10) of the patch which accommodated a comment from Ingo Molnar regarding making
DEBUG_VM_PGTABLE always enabled when DEBUG_VM is selected. If this version looks okay,
then would you please consider merging ? But if there is anything which still needs
to be improved, please do let me know. I will try to incorporate that. Thank you.

- Anshuman
