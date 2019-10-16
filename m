Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88179D8D04
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 11:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404352AbfJPJyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 05:54:12 -0400
Received: from foss.arm.com ([217.140.110.172]:34420 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404266AbfJPJyM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Oct 2019 05:54:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6076142F;
        Wed, 16 Oct 2019 02:54:11 -0700 (PDT)
Received: from [10.163.1.216] (unknown [10.163.1.216])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD8023F6C4;
        Wed, 16 Oct 2019 02:53:56 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] mm/debug: Add tests validating architecture page
 table helpers
To:     Qian Cai <cai@lca.pw>, linux-mm@kvack.org
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
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571131302-32290-3-git-send-email-anshuman.khandual@arm.com>
 <1571162982.5937.42.camel@lca.pw>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <7cd03155-6713-3116-1e88-f81f84dd794f@arm.com>
Date:   Wed, 16 Oct 2019 15:24:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1571162982.5937.42.camel@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/15/2019 11:39 PM, Qian Cai wrote:
> On Tue, 2019-10-15 at 14:51 +0530, Anshuman Khandual wrote:
>> +static unsigned long __init get_random_vaddr(void)
>> +{
>> +	unsigned long random_vaddr, random_pages, total_user_pages;
>> +
>> +	total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
>> +
>> +	random_pages = get_random_long() % total_user_pages;
>> +	random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
>> +
>> +	WARN_ON(random_vaddr > TASK_SIZE);
>> +	WARN_ON(random_vaddr < FIRST_USER_ADDRESS);
> 
> It would be nice if this patch does not introduce a new W=1 GCC warning here on
> x86 because FIRST_USER_ADDRESS is 0, and GCC think the code is dumb because
> "random_vaddr" is unsigned,
> 
> In file included from ./arch/x86/include/asm/bug.h:83,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/gfp.h:5,
>                  from mm/debug_vm_pgtable.c:13:
> mm/debug_vm_pgtable.c: In function ‘get_random_vaddr’:
> mm/debug_vm_pgtable.c:359:23: warning: comparison of unsigned expression < 0 is
> always false [-Wtype-limits]
>   WARN_ON(random_vaddr < FIRST_USER_ADDRESS);
>                        ^
> ./include/asm-generic/bug.h:113:25: note: in definition of macro ‘WARN_ON’
>   int __ret_warn_on = !!(condition);    \
>                          ^~~~~~~~~

The test checks against an erroneous unsigned long overflow when
FIRST_USER_ADDRESS is not 0 but a positive number. Wondering if
the compiler will still complain if we merge both the WARN_ON()
checks as || on a single statement.
