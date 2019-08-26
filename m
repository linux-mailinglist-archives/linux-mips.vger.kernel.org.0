Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C90439D02E
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 15:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731513AbfHZNNt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 09:13:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59236 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731174AbfHZNNt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 09:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=urDTYQxxHpDLHKYV3DkLPJyBgIdOzd8vbZl6Cfapxyc=; b=S0Qm85v5u+mC94Z+1NTp3zLxy
        RVikWlbB8+mD7D3i6pKW1vaRh6+mpvdmY0hZwt7QeNMOfDK4v1mKu4uLruFJY+80WEeNiclw0bMni
        VgFWVa4FMxmnuDh4DG/NHs34XNaySiBjcLQotEzPIlKfk98LzJOfOfATotjcOvgRsK0BvJg1vvrY6
        PC3VQkaRupcuqt52WqBPC5JvmCjmjjLmU1rbYgod7HJ/IZrUNwVg/kxESAnrEZvrP/71g/C/cTVL3
        KSmHw9glYY9tQdIrKjhRnF9olVe6RlSSQh43S7mnoLe1VnIU+Q8j9tFnodpiFcOU1xeFxRbNIYZHd
        4Bsb3y2yA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i2Eo0-0002Mw-Mf; Mon, 26 Aug 2019 13:13:08 +0000
Date:   Mon, 26 Aug 2019 06:13:08 -0700
From:   Matthew Wilcox <willy@infradead.org>
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
Subject: Re: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
Message-ID: <20190826131308.GA15933@bombadil.infradead.org>
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
 <20190809101632.GM5482@bombadil.infradead.org>
 <a5aab7ff-f7fd-9cc1-6e37-e4185eee65ac@arm.com>
 <20190809135202.GN5482@bombadil.infradead.org>
 <7a88f6bb-e8c7-3ac7-2f92-1de752a01f33@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a88f6bb-e8c7-3ac7-2f92-1de752a01f33@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 26, 2019 at 08:07:13AM +0530, Anshuman Khandual wrote:
> On 08/09/2019 07:22 PM, Matthew Wilcox wrote:
> > On Fri, Aug 09, 2019 at 04:05:07PM +0530, Anshuman Khandual wrote:
> >> On 08/09/2019 03:46 PM, Matthew Wilcox wrote:
> >>> On Fri, Aug 09, 2019 at 01:03:17PM +0530, Anshuman Khandual wrote:
> >>>> Should alloc_gigantic_page() be made available as an interface for general
> >>>> use in the kernel. The test module here uses very similar implementation from
> >>>> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
> >>>> needs to be exported through a header.
> >>>
> >>> Why are you allocating memory at all instead of just using some
> >>> known-to-exist PFNs like I suggested?
> >>
> >> We needed PFN to be PUD aligned for pfn_pud() and PMD aligned for mk_pmd().
> >> Now walking the kernel page table for a known symbol like kernel_init()
> > 
> > I didn't say to walk the kernel page table.  I said to call virt_to_pfn()
> > for a known symbol like kernel_init().
> > 
> >> as you had suggested earlier we might encounter page table page entries at PMD
> >> and PUD which might not be PMD or PUD aligned respectively. It seemed to me
> >> that alignment requirement is applicable only for mk_pmd() and pfn_pud()
> >> which create large mappings at those levels but that requirement does not
> >> exist for page table pages pointing to next level. Is not that correct ? Or
> >> I am missing something here ?
> > 
> > Just clear the bottom bits off the PFN until you get a PMD or PUD aligned
> > PFN.  It's really not hard.
> 
> As Mark pointed out earlier that might end up being just a synthetic PFN
> which might not even exist on a given system.

And why would that matter?
