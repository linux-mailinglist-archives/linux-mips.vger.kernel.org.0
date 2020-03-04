Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCF61789F1
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 06:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgCDFTd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 00:19:33 -0500
Received: from foss.arm.com ([217.140.110.172]:55908 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgCDFTc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Mar 2020 00:19:32 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE0E31B;
        Tue,  3 Mar 2020 21:19:31 -0800 (PST)
Received: from [10.163.1.88] (unknown [10.163.1.88])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDBA3F6CF;
        Tue,  3 Mar 2020 21:19:16 -0800 (PST)
Subject: Re: [RFC 1/3] mm/vma: Define a default value for
 VM_DATA_DEFAULT_FLAGS
To:     Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Cc:     Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Salter <msalter@redhat.com>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Brian Cain <bcain@codeaurora.org>,
        Tony Luck <tony.luck@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Jonas Bonn <jonas@southpole.se>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jeff Dike <jdike@addtoit.com>, Chris Zankel <chris@zankel.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
 <b243be54-7b5e-c6e9-fb68-46369d7d7aa4@suse.cz>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <8b0f4c1b-f693-e139-4f66-ee4e1e88b95c@arm.com>
Date:   Wed, 4 Mar 2020 10:49:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b243be54-7b5e-c6e9-fb68-46369d7d7aa4@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/03/2020 10:55 PM, Vlastimil Babka wrote:
> On 3/2/20 7:47 AM, Anshuman Khandual wrote:
>> There are many platforms with exact same value for VM_DATA_DEFAULT_FLAGS
>> This creates a default value for VM_DATA_DEFAULT_FLAGS in line with the
>> existing VM_STACK_DEFAULT_FLAGS. While here, also define some more macros
>> with standard VMA access flag combinations that are used frequently across
>> many platforms. Apart from simplification, this reduces code duplication
>> as well.
>>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: Vineet Gupta <vgupta@synopsys.com>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Mark Salter <msalter@redhat.com>
>> Cc: Guo Ren <guoren@kernel.org>
>> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Cc: Brian Cain <bcain@codeaurora.org>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Michal Simek <monstr@monstr.eu>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Cc: Paul Burton <paulburton@kernel.org>
>> Cc: Nick Hu <nickhu@andestech.com>
>> Cc: Ley Foon Tan <ley.foon.tan@intel.com>
>> Cc: Jonas Bonn <jonas@southpole.se>
>> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
>> Cc: Rich Felker <dalias@libc.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Guan Xuetao <gxt@pku.edu.cn>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Jeff Dike <jdike@addtoit.com>
>> Cc: Chris Zankel <chris@zankel.net>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-alpha@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-c6x-dev@linux-c6x.org
>> Cc: uclinux-h8-devel@lists.sourceforge.jp
>> Cc: linux-hexagon@vger.kernel.org
>> Cc: linux-ia64@vger.kernel.org
>> Cc: linux-m68k@lists.linux-m68k.org
>> Cc: linux-mips@vger.kernel.org
>> Cc: nios2-dev@lists.rocketboards.org
>> Cc: openrisc@lists.librecores.org
>> Cc: linux-parisc@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-um@lists.infradead.org
>> Cc: linux-xtensa@linux-xtensa.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Nit:
> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index b0e53ef13ff1..7a764ae6ab68 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -342,6 +342,21 @@ extern unsigned int kobjsize(const void *objp);
>>  /* Bits set in the VMA until the stack is in its final location */
>>  #define VM_STACK_INCOMPLETE_SETUP	(VM_RAND_READ | VM_SEQ_READ)
>>  
>> +#define TASK_EXEC ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0)
>> +
>> +/* Common data flag combinations */
>> +#define VM_DATA_FLAGS_TSK_EXEC	(VM_READ | VM_WRITE | TASK_EXEC | \
>> +				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>> +#define VM_DATA_FLAGS_NON_EXEC	(VM_READ | VM_WRITE | VM_MAYREAD | \
>> +				 VM_MAYWRITE | VM_MAYEXEC)
>> +#define VM_DATA_FLAGS_EXEC	(VM_READ | VM_WRITE | VM_EXEC | \
>> +				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>> +
>> +#ifndef VM_DATA_DEFAULT_FLAGS		/* arch can override this */
>> +#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
>> +				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
> 
> Should you use VM_DATA_FLAGS_EXEC here? Yeah one more macro to expand, but it's
> right above this.

Sure, can do that.

> 
>> +#endif
>> +
>>  #ifndef VM_STACK_DEFAULT_FLAGS		/* arch can override this */
>>  #define VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
>>  #endif
>>
> 
> 
> 
