Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03BFE439E
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2019 08:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391649AbfJYGfA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Oct 2019 02:35:00 -0400
Received: from foss.arm.com ([217.140.110.172]:35572 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388289AbfJYGfA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Oct 2019 02:35:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB71328;
        Thu, 24 Oct 2019 23:34:58 -0700 (PDT)
Received: from [10.162.41.137] (p8cg001049571a15.blr.arm.com [10.162.41.137])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DD333F718;
        Thu, 24 Oct 2019 23:37:36 -0700 (PDT)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
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
        Mike Kravetz <mike.kravetz@oracle.com>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
 <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <5ce5a76c-ea89-c2a1-6665-7d75bce5fb87@arm.com>
Date:   Fri, 25 Oct 2019 12:05:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/25/2019 11:22 AM, Qian Cai wrote:
> 
> 
>> On Oct 24, 2019, at 11:45 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>
>> Nothing specific. But just tested this with x86 defconfig with relevant configs
>> which are required for this test. Not sure if it involved W=1.
> 
> No, it will not. It needs to run like,
> 
> make W=1 -j 64 2>/tmp/warns

Ahh, so we explicitly ask for it.

Unfortunately compiler still flags it as an warning. Just wondering why this
is still a problem if the second condition for an OR expression is always false.
Because evaluation still needs to be performed for the first condition anyways,
before arriving at the result.

  DESCEND  objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      mm/debug_vm_pgtable.o
In file included from ./arch/x86/include/asm/bug.h:83:0,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from mm/debug_vm_pgtable.c:13:
mm/debug_vm_pgtable.c: In function ‘get_random_vaddr’:
mm/debug_vm_pgtable.c:314:17: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
   (random_vaddr < FIRST_USER_ADDRESS));
                 ^
./include/asm-generic/bug.h:113:25: note: in definition of macro ‘WARN_ON’
  int __ret_warn_on = !!(condition);    \
                         ^~~~~~~~~

As you mentioned GCC is quite stubborn here. Anyways, lets keep it unchanged.
