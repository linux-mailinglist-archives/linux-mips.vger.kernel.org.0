Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D95FA9DA0
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 10:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732221AbfIEI7P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 04:59:15 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45269 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfIEI7P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 04:59:15 -0400
Received: by mail-ed1-f67.google.com with SMTP id f19so1855643eds.12
        for <linux-mips@vger.kernel.org>; Thu, 05 Sep 2019 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SKtJJu4FCFZsJ92b3cW6n8O2xfCEANWfldD9FkzpDzQ=;
        b=R8BlrmFhCk2x1HCIE9OG+MzqwkVVvHT7xE/I4ZOytjMQkYUn6niG46sVFILMlRZ0wa
         hnpRdMnQxL0M6N7DzlsNvJtuHrm2YYjqELC8r/mXNrp4n+j5uoHa6nbZiuvc8wrnT/t6
         4nureBeZq0SanvEKzbmw5Vki4JKtNGpleNIYkZagBCFngBNM3yw6nhahf/tuodmQp0f3
         Y0ruk0kL+Dj3gQQ29z0NBH6NwktGQzVePR1emsKENHFifDwOfLe9idjet5jyzABWjuRX
         f39uHKvkUv+7WUzGyUECMghUmTiVEGNrdHlzcBwe02Kaf8vWGnnCAEW53LJ7sKx8wTFX
         +lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SKtJJu4FCFZsJ92b3cW6n8O2xfCEANWfldD9FkzpDzQ=;
        b=nGVfvf+yAvx0ihvJKOn4H64IiycAqKbhsetMDoUxDdHzbum0Tf1Sts61dtIDXBU38Q
         0snlFcL86PhW24neHd+HwSEPgoF4HrYDCjrLvWls94m6Dn25TG8kLuQLLlAisiEj888O
         6IUlLjXLfZFak2Z8Yh9LfZFKd++isbg9VwGKlR/rc3E6NgNirJ8Q39ZzxLdqvUj43v9m
         4qHJ9CT+qqHhVTFu0V+KHmZzm5yipMxdIiHVt8rGIPb6ORDYtBJxfDgQbsqgtL11CNnK
         dtfeqmGNCSRglQFbi5Ai3Jrr7ww5L23zQXfldRLJ17WNkdRyCqKWUI7wcyNcaqiKu8JP
         qHRg==
X-Gm-Message-State: APjAAAXlO2PA50udwBpeVgP1KO3AJ/2n6WDUn56FOuqBfiX2H1V2ALbf
        aQ/NdEl/Nh+YpFogarGO0qjaJg==
X-Google-Smtp-Source: APXvYqwS8JLF/JnkIaUo5JF41+czQxMqyXPCFFoUEhsPXNX+sGdC7T/bBd4BAC8GGRtwPWaIloZ1rA==
X-Received: by 2002:a50:f98c:: with SMTP id q12mr2065158edn.75.1567673952348;
        Thu, 05 Sep 2019 01:59:12 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id u14sm275438edy.55.2019.09.05.01.59.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 01:59:11 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id C58BF104AE5; Thu,  5 Sep 2019 11:59:10 +0300 (+03)
Date:   Thu, 5 Sep 2019 11:59:10 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
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
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
Message-ID: <20190905085910.i6dppgnqi4ple22w@box.shutemov.name>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <20190904141950.ykoe3h7b4hcvnysu@box>
 <6d4b989d-8eaa-d26e-6068-4b0e4d7a52f9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d4b989d-8eaa-d26e-6068-4b0e4d7a52f9@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 05, 2019 at 01:48:27PM +0530, Anshuman Khandual wrote:
> >> +#define VADDR_TEST	(PGDIR_SIZE + PUD_SIZE + PMD_SIZE + PAGE_SIZE)
> > 
> > What is special about this address? How do you know if it is not occupied
> > yet?
> 
> We are creating the page table from scratch after allocating an mm_struct
> for a given random virtual address 'VADDR_TEST'. Hence nothing is occupied
> just yet. There is nothing special about this address, just that it tries
> to ensure the page table entries are being created with some offset from
> beginning of respective page table page at all levels ? The idea is to
> have a more representative form of page table structure for test.

Why P4D_SIZE is missing?

Are you sure it will not land into kernel address space on any arch?

I think more robust way to deal with this would be using
get_unmapped_area() instead of fixed address.

> This makes sense for runtime cases but there is a problem here.
> 
> On arm64, pgd_populate() which takes (pud_t *) as last argument instead of
> (p4d_t *) will fail to build when not wrapped in !__PAGETABLE_P4D_FOLDED
> on certain configurations.
> 
> ./arch/arm64/include/asm/pgalloc.h:81:75: note:
> expected ‘pud_t *’ {aka ‘struct <anonymous> *’}
> but argument is of type ‘pgd_t *’ {aka ‘struct <anonymous> *’}
> static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, pud_t *pudp)
>                                                                    ~~~~~~~^~~~
> Wondering if this is something to be fixed on arm64 or its more general
> problem. Will look into this further.

I think you need wrap this into #ifndef __ARCH_HAS_5LEVEL_HACK.

> >> +	pmd_populate_tests(mm, pmdp, (pgtable_t) page);
> > 
> > This is not correct for architectures that defines pgtable_t as pte_t
> > pointer, not struct page pointer.
> 
> Right, a grep on the source confirms that.
> 
> These platforms define pgtable_t as struct page *
> 
> arch/alpha/include/asm/page.h:typedef struct page *pgtable_t;
> arch/arm/include/asm/page.h:typedef struct page *pgtable_t;
> arch/arm64/include/asm/page.h:typedef struct page *pgtable_t;
> arch/csky/include/asm/page.h:typedef struct page *pgtable_t;
> arch/hexagon/include/asm/page.h:typedef struct page *pgtable_t;
> arch/ia64/include/asm/page.h:  typedef struct page *pgtable_t;
> arch/ia64/include/asm/page.h:    typedef struct page *pgtable_t;
> arch/m68k/include/asm/page.h:typedef struct page *pgtable_t;
> arch/microblaze/include/asm/page.h:typedef struct page *pgtable_t;
> arch/mips/include/asm/page.h:typedef struct page *pgtable_t;
> arch/nds32/include/asm/page.h:typedef struct page *pgtable_t;
> arch/nios2/include/asm/page.h:typedef struct page *pgtable_t;
> arch/openrisc/include/asm/page.h:typedef struct page *pgtable_t;
> arch/parisc/include/asm/page.h:typedef struct page *pgtable_t;
> arch/riscv/include/asm/page.h:typedef struct page *pgtable_t;
> arch/sh/include/asm/page.h:typedef struct page *pgtable_t;
> arch/sparc/include/asm/page_32.h:typedef struct page *pgtable_t;
> arch/um/include/asm/page.h:typedef struct page *pgtable_t;
> arch/unicore32/include/asm/page.h:typedef struct page *pgtable_t;
> arch/x86/include/asm/pgtable_types.h:typedef struct page *pgtable_t;
> arch/xtensa/include/asm/page.h:typedef struct page *pgtable_t;
> 
> These platforms define pgtable_t as pte_t *
> 
> arch/arc/include/asm/page.h:typedef pte_t * pgtable_t;
> arch/powerpc/include/asm/mmu.h:typedef pte_t *pgtable_t;
> arch/s390/include/asm/page.h:typedef pte_t *pgtable_t;
> arch/sparc/include/asm/page_64.h:typedef pte_t *pgtable_t;
> 
> Should we need have two pmd_populate_tests() definitions with
> different arguments (struct page pointer or pte_t pointer) and then
> call either one after detecting the given platform ?

Use pte_alloc_one() instead of alloc_mapped_page() to allocate the page
table.

> >> +	pud_populate_tests(mm, pudp, pmdp);
> >> +	p4d_populate_tests(mm, p4dp, pudp);
> >> +	pgd_populate_tests(mm, pgdp, p4dp);
> > 
> > This is wrong. All p?dp points to the second entry in page table entry.
> > This is not valid pointer for page table and triggers p?d_bad() on x86.
> 
> Yeah these are second entries because of the way we create the page table.
> But I guess its applicable only to the second argument in all these above
> cases because the first argument can be any valid entry on previous page
> table level.

Yes:

@@ -397,9 +396,9 @@ static int __init arch_pgtable_tests_init(void)
 	pgd_clear_tests(pgdp);
 
 	pmd_populate_tests(mm, pmdp, (pgtable_t) page);
-	pud_populate_tests(mm, pudp, pmdp);
-	p4d_populate_tests(mm, p4dp, pudp);
-	pgd_populate_tests(mm, pgdp, p4dp);
+	pud_populate_tests(mm, pudp, saved_pmdp);
+	p4d_populate_tests(mm, p4dp, saved_pudp);
+	pgd_populate_tests(mm, pgdp, saved_p4dp);
 
 	p4d_free(mm, saved_p4dp);
 	pud_free(mm, saved_pudp);

-- 
 Kirill A. Shutemov
