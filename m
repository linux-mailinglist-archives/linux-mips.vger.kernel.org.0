Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C1DF0F0E
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 07:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbfKFGlM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 01:41:12 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:39227 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfKFGlM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 Nov 2019 01:41:12 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 477H450GyXz9v00D;
        Wed,  6 Nov 2019 07:41:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=uDQK58sa; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id NP7mUVlPVLBt; Wed,  6 Nov 2019 07:41:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 477H445kq5z9v00C;
        Wed,  6 Nov 2019 07:41:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1573022468; bh=ldK6jtPphgl+yNa6VSaAerjL+prNDwgkLRC6nRKEIeI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uDQK58saIN0zvehZkL7oENgA4DemT8lDWmLXhETHs2fgk7tiYooqK7uit5oPw6kqK
         UOoMgZlJGvnNPw1TVCdC6OsuYDkWv6rJFk3JlidSUeiN1jyfI5kOdxu8g2Q0UGfHfG
         nJ9ksEtevKFg7K5FRpbJoChZCjEM1dr9rYK/i7Rk=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 973408B82D;
        Wed,  6 Nov 2019 07:41:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id A7VVbo-RdBde; Wed,  6 Nov 2019 07:41:09 +0100 (CET)
Received: from [172.25.230.101] (unknown [172.25.230.101])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 27E838B7CC;
        Wed,  6 Nov 2019 07:41:09 +0100 (CET)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr>
Date:   Wed, 6 Nov 2019 07:41:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 06/11/2019 à 04:22, Anshuman Khandual a écrit :
> 
> 
> On 10/28/2019 10:59 AM, Anshuman Khandual wrote:
>> +    -----------------------
>> +    |         arch |status|
>> +    -----------------------
>> +    |       alpha: | TODO |
>> +    |         arc: | TODO |
>> +    |         arm: | TODO |
>> +    |       arm64: |  ok  |
>> +    |         c6x: | TODO |
>> +    |        csky: | TODO |
>> +    |       h8300: | TODO |
>> +    |     hexagon: | TODO |
>> +    |        ia64: | TODO |
>> +    |        m68k: | TODO |
>> +    |  microblaze: | TODO |
>> +    |        mips: | TODO |
>> +    |       nds32: | TODO |
>> +    |       nios2: | TODO |
>> +    |    openrisc: | TODO |
>> +    |      parisc: | TODO |
>> +    |     powerpc: | TODO |
>> +    |       ppc32: |  ok  |

Note that ppc32 is a part of powerpc, not a standalone arch.

Maybe something like the following would be more correct:
|  powerpc/32: |  ok  |
|  powerpc/64: | TODO |

Christophe

>> +    |       riscv: | TODO |
>> +    |        s390: | TODO |
>> +    |          sh: | TODO |
>> +    |       sparc: | TODO |
>> +    |          um: | TODO |
>> +    |   unicore32: | TODO |
>> +    |         x86: |  ok  |
>> +    |      xtensa: | TODO |
>> +    -----------------------
> 
> While here, are there some volunteers to test this on any of the
> 'yet to be tested and supported' platforms ?
> 
> - Anshuman
> 
