Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9839B1A2C
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 10:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbfIMIvi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 04:51:38 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37095 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387499AbfIMIvi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 04:51:38 -0400
Received: by mail-ed1-f65.google.com with SMTP id i1so26404830edv.4
        for <linux-mips@vger.kernel.org>; Fri, 13 Sep 2019 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ljRy//1oqpxbNqcuLvCNHWlNadtkzDq51hCzmFakYzM=;
        b=M6Wl/quwPsEOiMFNCv3xSOrdnDulq5fkBOVf8YSY3tiw77PxkkHJwmP5iEk0kohLlY
         pg4uPVtKpUEevoagc8enKn4uPrSlBiZORCgQoAOniX52xYmOZkzG1/HzuVuRwG1eo1oP
         UUMYm6uVKM/ZyICPXIY6dw0BD4t6sF6ZjlwPzQZa+ZeBzMMqOs4xYJXwzCpcBNDo8jhx
         jXjUL9kfKg583djOtcu64hthdRWYl9M2FSJHI0vB9ZCDV10OZHe+j1P2FdlMaHZTn/Du
         o7aK3kotbpwDLHIjGD7A7LXZ8OC4HcGT0NeYVB7fDkav49RWCtmQCPySSqquXilUNVHm
         pP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ljRy//1oqpxbNqcuLvCNHWlNadtkzDq51hCzmFakYzM=;
        b=OgEb52QDZKE1/hiGnmoMzf2kWX2QbKOGRvKtvSdveUCUgB14Ha1o411yVMIKkBG3Sw
         TVhLpo6isLjN8PfXlfcr5HgGmnZTEtOXbV0guFAuAPfLOdtYt2FHDBT6MZMER08f1cjE
         x8yStwAQP6rYA5b0Cvl2zepv/bYQbOK8ZIktUAmfSbWSbz9SL65MFHmICinboypS/ypI
         6PVPnasHXvju88hNrZqKYEYNjYyR3qmMMUFuztZhP3lnLf2/0WG73xhIsBxzDbiBabkd
         zbi/FUSrM5vb6AX9PqC2GXeSFObgHhbnAdUG2e/JNX5BR35PHj39XgtZWgCfW3g67ehC
         yjgg==
X-Gm-Message-State: APjAAAUeRo6en9Z9MPPCrE2mbAI4RRJHAPWw2tpu9D+WHecoY8ADzKP9
        eWwIV5gMJiLSjbq3eDdNFJljDdoVfcYtOg==
X-Google-Smtp-Source: APXvYqxZm96QADm/8SST6BnmvoIUqtDzA7VCb5AHjQ8XsG2pGy1aWbbiVHhIwmyiU7DjVjOntMuCeQ==
X-Received: by 2002:a50:ee92:: with SMTP id f18mr24791178edr.253.1568364694523;
        Fri, 13 Sep 2019 01:51:34 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id j30sm5287480edb.8.2019.09.13.01.51.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 01:51:33 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id A972310160B; Fri, 13 Sep 2019 11:51:35 +0300 (+03)
Date:   Fri, 13 Sep 2019 11:51:35 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        linux-s390@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vlastimil Babka <vbabka@suse.cz>,
        linux-snps-arc@lists.infradead.org,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-arm-kernel@lists.infradead.org,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
Message-ID: <20190913085135.rfr3zrabghi2qo2t@box>
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <527dd29d-45fa-4d83-1899-6cbf268dd749@arm.com>
 <e2b42446-7f91-83f1-ac12-08dff75c4d35@c-s.fr>
 <cb226b56-ff20-3136-7ffb-890657e56870@c-s.fr>
 <bdf7f152-d093-1691-4e96-77da7eb9e20a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdf7f152-d093-1691-4e96-77da7eb9e20a@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 13, 2019 at 02:12:45PM +0530, Anshuman Khandual wrote:
> 
> 
> On 09/13/2019 12:41 PM, Christophe Leroy wrote:
> > 
> > 
> > Le 13/09/2019 à 09:03, Christophe Leroy a écrit :
> >>
> >>
> >> Le 13/09/2019 à 08:58, Anshuman Khandual a écrit :
> >>> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
> >>>> Fix build failure on powerpc.
> >>>>
> >>>> Fix preemption imbalance.
> >>>>
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >>>> ---
> >>>>   mm/arch_pgtable_test.c | 3 +++
> >>>>   1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
> >>>> index 8b4a92756ad8..f2b3c9ec35fa 100644
> >>>> --- a/mm/arch_pgtable_test.c
> >>>> +++ b/mm/arch_pgtable_test.c
> >>>> @@ -24,6 +24,7 @@
> >>>>   #include <linux/swap.h>
> >>>>   #include <linux/swapops.h>
> >>>>   #include <linux/sched/mm.h>
> >>>> +#include <linux/highmem.h>
> >>>
> >>> This is okay.
> >>>
> >>>>   #include <asm/pgalloc.h>
> >>>>   #include <asm/pgtable.h>
> >>>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
> >>>>       p4d_clear_tests(p4dp);
> >>>>       pgd_clear_tests(mm, pgdp);
> >>>> +    pte_unmap(ptep);
> >>>> +
> >>>
> >>> Now the preemption imbalance via pte_alloc_map() path i.e
> >>>
> >>> pte_alloc_map() -> pte_offset_map() -> kmap_atomic()
> >>>
> >>> Is not this very much powerpc 32 specific or this will be applicable
> >>> for all platform which uses kmap_XXX() to map high memory ?
> >>>
> >>
> >> See https://elixir.bootlin.com/linux/v5.3-rc8/source/include/linux/highmem.h#L91
> >>
> >> I think it applies at least to all arches using the generic implementation.
> >>
> >> Applies also to arm:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/mm/highmem.c#L52
> >>
> >> Applies also to mips:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/mips/mm/highmem.c#L47
> >>
> >> Same on sparc:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/sparc/mm/highmem.c#L52
> >>
> >> Same on x86:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/mm/highmem_32.c#L34
> >>
> >> I have not checked others, but I guess it is like that for all.
> >>
> > 
> > 
> > Seems like I answered too quickly. All kmap_atomic() do preempt_disable(), but not all pte_alloc_map() call kmap_atomic().
> > 
> > However, for instance ARM does:
> > 
> > https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/include/asm/pgtable.h#L200
> > 
> > And X86 as well:
> > 
> > https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/include/asm/pgtable_32.h#L51
> > 
> > Microblaze also:
> > 
> > https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/microblaze/include/asm/pgtable.h#L495
> 
> All the above platforms checks out to be using k[un]map_atomic(). I am wondering whether
> any of the intermediate levels will have similar problems on any these 32 bit platforms
> or any other platforms which might be using generic k[un]map_atomic().

No. Kernel only allocates pte page table from highmem. All other page
tables are always visible in kernel address space.

-- 
 Kirill A. Shutemov
