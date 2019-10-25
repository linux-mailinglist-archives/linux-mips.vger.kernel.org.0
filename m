Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C36E4640
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2019 10:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437458AbfJYIw7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Oct 2019 04:52:59 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:34737 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437618AbfJYIw7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Oct 2019 04:52:59 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 46zyYg6BYkz9vC0w;
        Fri, 25 Oct 2019 10:52:55 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=JXqe5sri; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 6HbhFbyFhM8v; Fri, 25 Oct 2019 10:52:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 46zyYg4vJdz9vC0r;
        Fri, 25 Oct 2019 10:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1571993575; bh=4oDjhDK0FsO59rFVGt7Y5o7o8C55+19qgM1BU+899t4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JXqe5sriXNQaQXKes3qqbdy43NSrBpwRBpfMpDtkffnR5YWutoOVXs9BVvi7rzrMY
         QG68soKwprXrLgOAJa7ilqd/FXQFpMspM1kp2DJjaecMsPUGWDU22R2zojRhkImahW
         aYJ8xO9qWW+5AHxKxjlrTglXwCmCdHn/aPTlV1cw=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B9A698B868;
        Fri, 25 Oct 2019 10:52:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Z1aZY1cuISIS; Fri, 25 Oct 2019 10:52:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BC128B895;
        Fri, 25 Oct 2019 10:52:54 +0200 (CEST)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Qian Cai <cai@lca.pw>
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
        Mike Kravetz <mike.kravetz@oracle.com>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
 <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
 <3cfec421-4006-4159-ca32-313ff5196ff9@c-s.fr>
 <763d58b4-f532-0bba-bf2b-71433ac514fb@arm.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d811622e-0d35-3bc6-9568-36abc1bee355@c-s.fr>
Date:   Fri, 25 Oct 2019 10:52:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <763d58b4-f532-0bba-bf2b-71433ac514fb@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 25/10/2019 à 10:24, Anshuman Khandual a écrit :
> 
> 
> On 10/25/2019 12:41 PM, Christophe Leroy wrote:
>>
>>
>> Le 25/10/2019 à 07:52, Qian Cai a écrit :
>>>
>>>
>>>> On Oct 24, 2019, at 11:45 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>>>
>>>> Nothing specific. But just tested this with x86 defconfig with relevant configs
>>>> which are required for this test. Not sure if it involved W=1.
>>>
>>> No, it will not. It needs to run like,
>>>
>>> make W=1 -j 64 2>/tmp/warns
>>>
>>
>> Are we talking about this peace of code ?
>>
>> +static unsigned long __init get_random_vaddr(void)
>> +{
>> +    unsigned long random_vaddr, random_pages, total_user_pages;
>> +
>> +    total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
>> +
>> +    random_pages = get_random_long() % total_user_pages;
>> +    random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
>> +
>> +    WARN_ON((random_vaddr > TASK_SIZE) ||
>> +        (random_vaddr < FIRST_USER_ADDRESS));
>> +    return random_vaddr;
>> +}
>> +
>>
>> ramdom_vaddr is unsigned,
>> random_pages is unsigned and lower than total_user_pages
>>
>> So the max value random_vaddr can get is FIRST_USER_ADDRESS + ((TASK_SIZE - FIRST_USER_ADDRESS - 1) / PAGE_SIZE) * PAGE_SIZE = TASK_SIZE - 1
>> And the min value random_vaddr can get is FIRST_USER_ADDRESS (that's when random_pages = 0)
> 
> That's right.
> 
>>
>> So the WARN_ON() is just unneeded, isn't it ?
> 
> It is just a sanity check on possible vaddr values before it's corresponding
> page table mappings could be created. If it's worth to drop this in favor of
> avoiding these unwanted warning messages on x86, will go ahead with it as it
> is not super important.
> 

But you are checking what ? That the compiler does calculation correctly 
or what ?
As mentionned just above, based on the calculation done, what you are 
testing cannot happen, so I'm having a hard time understanding what kind 
of sanity check it can be.

Can you give an exemple of a situation which could trigger the warning ?

Christophe
