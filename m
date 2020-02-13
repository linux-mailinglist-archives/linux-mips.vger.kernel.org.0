Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9364115B712
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2020 03:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgBMCQI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 21:16:08 -0500
Received: from foss.arm.com ([217.140.110.172]:40570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729469AbgBMCQI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Feb 2020 21:16:08 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0600030E;
        Wed, 12 Feb 2020 18:16:07 -0800 (PST)
Received: from [192.168.0.129] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 017A33F68E;
        Wed, 12 Feb 2020 18:15:52 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Ingo Molnar <mingo@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <20200210153716.GB9283@E121110.arm.com>
 <b169ff9d-7b87-91f4-b3d0-e97f86680d0c@arm.com>
 <20200212185548.3274ec2e@thinkpad>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <085cdec7-1759-82c6-7a65-9b7d28c1c458@arm.com>
Date:   Thu, 13 Feb 2020 07:45:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200212185548.3274ec2e@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 02/12/2020 11:25 PM, Gerald Schaefer wrote:
> On Wed, 12 Feb 2020 15:12:54 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>>>> +/*
>>>> + * On s390 platform, the lower 12 bits are used to identify given page table
>>>> + * entry type and for other arch specific requirements. But these bits might
>>>> + * affect the ability to clear entries with pxx_clear(). So while loading up
>>>> + * the entries skip all lower 12 bits in order to accommodate s390 platform.
>>>> + * It does not have affect any other platform.
>>>> + */
>>>> +#define RANDOM_ORVALUE	(0xfffffffffffff000UL)  
>>>
>>> I'd suggest you generate this mask with something like
>>> GENMASK(BITS_PER_LONG, PAGE_SHIFT).  
>>
>> IIRC the lower 12 bits constrains on s390 platform might not be really related
>> to it's PAGE_SHIFT which can be a variable, but instead just a constant number.
>> But can definitely use GENMASK or it's variants here.
>>
>> https://lkml.org/lkml/2019/9/5/862
> 
> PAGE_SHIFT would be fine, it is 12 on s390. However, in order to be
> more precise, we do not really need all 12 bits, only the last 4 bits.
> So, something like this would work:
> 
> #define RANDOM_ORVALUE GENMASK(BITS_PER_LONG - 1, 4)
> 
> The text in the comment could then also be changed from 12 to 4, and
> be a bit more specific on the fact that the impact on pxx_clear()
> results from the dynamic page table folding logic on s390:
> 
> /*
>  * On s390 platform, the lower 4 bits are used to identify given page table
>  * entry type. But these bits might affect the ability to clear entries with
>  * pxx_clear() because of how dynamic page table folding works on s390. So
>  * while loading up the entries do not change the lower 4 bits.
>  * It does not have affect any other platform.
>  */

Sure, will update accordingly.
