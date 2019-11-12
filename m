Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2D8CF890C
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2019 07:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfKLGwf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Nov 2019 01:52:35 -0500
Received: from foss.arm.com ([217.140.110.172]:56522 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727399AbfKLGwe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741C81FB;
        Mon, 11 Nov 2019 22:52:33 -0800 (PST)
Received: from [10.163.1.187] (unknown [10.163.1.187])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA6A3F52E;
        Mon, 11 Nov 2019 22:55:07 -0800 (PST)
Subject: Re: [PATCH V9] mm/debug: Add tests validating architecture page table
 helpers
To:     Ingo Molnar <mingo@kernel.org>
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
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1573532326-24084-1-git-send-email-anshuman.khandual@arm.com>
 <20191112062951.GA100264@gmail.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <fe6b8140-1017-d081-570c-62213fe39624@arm.com>
Date:   Tue, 12 Nov 2019 12:22:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191112062951.GA100264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/12/2019 11:59 AM, Ingo Molnar wrote:
> 
> * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> +config DEBUG_VM_PGTABLE
>> +	bool "Debug arch page table for semantics compliance"
>> +	depends on MMU
>> +	depends on DEBUG_VM
>> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE
>> +	help
>> +	  This option provides a debug method which can be used to test
>> +	  architecture page table helper functions on various platforms in
>> +	  verifying if they comply with expected generic MM semantics. This
>> +	  will help architecture code in making sure that any changes or
>> +	  new additions of these helpers still conform to expected
>> +	  semantics of the generic MM.
>> +
>> +	  If unsure, say N.
> 
> Since CONFIG_DEBUG_VM is generally disabled in distro kernel packages, 
> why not make this 'default y' to maximize testing coverage? The code size 
> increase should be minimal, and DEBUG_VM increases size anyway.

Sure, will do.

> 
> Other than that this looks good to me:
> 
>   Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thank you.

> 
> Thanks,
> 
> 	Ingo
> 
