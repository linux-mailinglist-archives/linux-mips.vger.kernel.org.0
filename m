Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01799C73F
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 04:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfHZC3o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Aug 2019 22:29:44 -0400
Received: from foss.arm.com ([217.140.110.172]:52414 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbfHZC3n (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Aug 2019 22:29:43 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77760344;
        Sun, 25 Aug 2019 19:29:42 -0700 (PDT)
Received: from [10.162.43.136] (p8cg001049571a15.blr.arm.com [10.162.43.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EB213F718;
        Sun, 25 Aug 2019 19:29:32 -0700 (PDT)
Subject: Re: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
To:     Mark Rutland <mark.rutland@arm.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
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
 <20190809114450.GF48423@lakrids.cambridge.arm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <652ae041-2033-1cf8-e559-6dcf85dd2fdd@arm.com>
Date:   Mon, 26 Aug 2019 07:59:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190809114450.GF48423@lakrids.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 08/09/2019 05:14 PM, Mark Rutland wrote:
> On Fri, Aug 09, 2019 at 03:16:33AM -0700, Matthew Wilcox wrote:
>> On Fri, Aug 09, 2019 at 01:03:17PM +0530, Anshuman Khandual wrote:
>>> Should alloc_gigantic_page() be made available as an interface for general
>>> use in the kernel. The test module here uses very similar implementation from
>>> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
>>> needs to be exported through a header.
>>
>> Why are you allocating memory at all instead of just using some
>> known-to-exist PFNs like I suggested?
> 
> IIUC the issue is that there aren't necessarily known-to-exist PFNs that
> are sufficiently aligned -- they may not even exist.
> 
> For example, with 64K pages, a PMD covers 512M. The kernel image is
> (generally) smaller than 512M, and will be mapped at page granularity.
> In that case, any PMD entry for a kernel symbol address will point to
> the PTE level table, and that will only necessarily be page-aligned, as
> any P?D level table is only necessarily page-aligned.

Right.

> 
> In the same configuration, you could have less than 512M of total
> memory, and none of this memory is necessarily aligned to 512M. So
> beyond the PTE level, I don't think you can guarantee a known-to-exist
> valid PFN.
Right a PMD aligned valid PFN might not even exist. This proposed patch
which attempts to allocate memory chunk with required alignment will just
fail indicating that such a valid PFN does not exist and hence will skip
any relevant tests. At present this is done for PUD aligned allocation
failure but we can similarly skip PMD relevant tests as well if PMD
aligned memory chunk is not allocated.

> 
> I also believe that synthetic PFNs could fail pfn_valid(), so that might
> cause us pain too...

Agreed. So do we have an agreement that it is better to use allocated
memory with required alignment for the tests than known-to-exist PFNs ?

- Anshuman
