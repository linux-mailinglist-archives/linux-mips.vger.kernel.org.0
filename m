Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D0314AE44
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 04:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgA1DGX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jan 2020 22:06:23 -0500
Received: from foss.arm.com ([217.140.110.172]:51646 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgA1DGX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Jan 2020 22:06:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA3A30E;
        Mon, 27 Jan 2020 19:06:21 -0800 (PST)
Received: from [10.163.1.151] (unknown [10.163.1.151])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0623F68E;
        Mon, 27 Jan 2020 19:06:06 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
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
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
Date:   Tue, 28 Jan 2020 08:36:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/28/2020 07:41 AM, Qian Cai wrote:
> 
> 
>> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
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

Hello Qian,

> 
> What’s the value of this block of new code? It only supports x86 and arm64
> which are supposed to be good now.

We have been over the usefulness of this code many times before as the patch is
already in it's V12. Currently it is enabled on arm64, x86 (except PAE), arc and
ppc32. There are build time or runtime problems with other archs which prevent
enablement of this test (for the moment) but then the goal is to integrate all
of them going forward. The test not only validates platform's adherence to the
expected semantics from generic MM but also helps in keeping it that way during
code changes in future as well.

> Did those tests ever find any regression or this is almost only useful for new

The test has already found problems with s390 page table helpers.

> architectures which only happened once in a few years?

Again, not only it validates what exist today but its also a tool to make
sure that all platforms continue adhere to a common agreed upon semantics
as reflected through the tests here.

> The worry if not many people will use this config and code those that much in

Debug features or tests in the kernel are used when required. These are never or
should not be enabled by default. AFAICT this is true even for entire DEBUG_VM
packaged tests. Do you have any particular data or precedence to substantiate
the fact that this test will be used any less often than the other similar ones
in the tree ? I can only speak for arm64 platform but the very idea for this
test came from Catalin when we were trying to understand the semantics for THP
helpers while enabling THP migration without split. Apart from going over the
commit messages from the past, there were no other way to figure out how any
particular page table helper is suppose to change given page table entry. This
test tries to formalize those semantics.

> the future because it is inefficient to find bugs, it will simply be rotten
Could you be more specific here ? What parts of the test are inefficient ? I
am happy to improve upon the test. Do let me know you if you have suggestions.

> like a few other debugging options out there we have in the mainline that
will be a pain to remove later on.
>

Even though I am not agreeing to your assessment about the usefulness of the
test without any substantial data backing up the claims, the test case in
itself is very much compartmentalized, staying clear from generic MM and
debug_vm_pgtable() is only function executing the test which is getting
called from kernel_init_freeable() path.

- Anshuman
