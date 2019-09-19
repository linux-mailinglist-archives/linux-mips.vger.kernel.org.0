Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75642B72CD
	for <lists+linux-mips@lfdr.de>; Thu, 19 Sep 2019 07:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfISFon (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Sep 2019 01:44:43 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:35572 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfISFon (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Sep 2019 01:44:43 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 46Ym523Fvpz9vBnB;
        Thu, 19 Sep 2019 07:44:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=FtPM45xR; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id E1DzxbKi3YAE; Thu, 19 Sep 2019 07:44:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 46Ym521sh9z9vBn5;
        Thu, 19 Sep 2019 07:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1568871878; bh=u3IPZEW+32C7DaDMfn0DvIJKyx2qRHLH39Ao90Ba2vI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FtPM45xRRq+ZMAt65+IvhdTxuzxace0VwgaQdf3cKJJT4y/Eahg1dC/4UOdaGCdh8
         2keyDA6ggFlB3Ny+FMd2SlwiqZK/16OHJduDKueIBvHCwUrv+TaOH/TmV6EmcQ6aZD
         62XuqZlFMWXmXNg2d+icfo4iXGpGWnUP9d4AjRIg=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BE5C8B80C;
        Thu, 19 Sep 2019 07:44:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id kqE2oHvK7TMH; Thu, 19 Sep 2019 07:44:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C1DA68B783;
        Thu, 19 Sep 2019 07:44:36 +0200 (CEST)
Subject: Re: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-s390@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        linux-arm-kernel@lists.infradead.org,
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
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <cb338e2e-23b1-b8af-811c-57feb6f4e7b4@arm.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <cc28ebaf-4167-6bc7-54a7-630cd5ab827c@c-s.fr>
Date:   Thu, 19 Sep 2019 07:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cb338e2e-23b1-b8af-811c-57feb6f4e7b4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 18/09/2019 à 09:32, Anshuman Khandual a écrit :
> 
> 
> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
>> Fix build failure on powerpc.
>>
>> Fix preemption imbalance.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   mm/arch_pgtable_test.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
>> index 8b4a92756ad8..f2b3c9ec35fa 100644
>> --- a/mm/arch_pgtable_test.c
>> +++ b/mm/arch_pgtable_test.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/swap.h>
>>   #include <linux/swapops.h>
>>   #include <linux/sched/mm.h>
>> +#include <linux/highmem.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/pgtable.h>
>>   
>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
>>   	p4d_clear_tests(p4dp);
>>   	pgd_clear_tests(mm, pgdp);
>>   
>> +	pte_unmap(ptep);
>> +
>>   	pmd_populate_tests(mm, pmdp, saved_ptep);
>>   	pud_populate_tests(mm, pudp, saved_pmdp);
>>   	p4d_populate_tests(mm, p4dp, saved_pudp);
>>
> 
> Hello Christophe,
> 
> I am planning to fold this fix into the current patch and retain your
> Signed-off-by. Are you okay with it ?
> 

No problem, do whatever is convenient for you. You can keep the 
signed-off-by, or use tested-by: as I tested it on PPC32.

Christophe
