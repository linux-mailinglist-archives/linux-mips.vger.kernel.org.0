Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A14FF0CBB
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 04:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbfKFDKo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Nov 2019 22:10:44 -0500
Received: from foss.arm.com ([217.140.110.172]:32962 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730562AbfKFDKo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Nov 2019 22:10:44 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0480C30E;
        Tue,  5 Nov 2019 19:10:43 -0800 (PST)
Received: from [192.168.225.149] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DA843F719;
        Tue,  5 Nov 2019 19:10:22 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <20191105203638.6889a994@thinkpad>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d9487d9b-7f23-6311-f432-d2271b961f00@arm.com>
Date:   Wed, 6 Nov 2019 08:40:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191105203638.6889a994@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/06/2019 01:06 AM, Gerald Schaefer wrote:
> On Mon, 28 Oct 2019 10:59:22 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
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
> 
> I've prepared a couple of commits to our arch code to make this work on s390,
> they will go upstream in the next merge window. After that, we can add s390
> to the supported architectures.

Thats good.

> 
> We had some issues, e.g. because we do not report large entries as bad in
> pxd_bad(), do not check for folded page tables in pxd_free(), or assume
> that primitives like pmd_mkdirty() will only be called after pmd_mkhuge().
> None of those should have any impact on current code, but your test module
> revealed that we do not behave like other architectures in some aspects,
> and it's good to find and fix such things to prevent possible future issues.

Right and those s390 fixes are the testimony for the usefulness of this test.

> 
> Thanks a lot for the effort!
> 
> Regards,
> Gerald
> 
> 
