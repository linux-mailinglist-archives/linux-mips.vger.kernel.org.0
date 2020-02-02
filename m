Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFBEB14FC4F
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2020 09:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgBBIb0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Feb 2020 03:31:26 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:36663 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726813AbgBBIbZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Feb 2020 03:31:25 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 489PLc2Pfyz9tyWF;
        Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=jxSd4bcB; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 0yWRy2TLi9QC; Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 489PLc0zVpz9tyWB;
        Sun,  2 Feb 2020 09:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580632280; bh=gJ+YBiU1siNA6yw0ERrSRXytsUyJ6J4mmY1g8irtvMg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jxSd4bcBMPwDDkQQtltYvbDM7RjmY7wn3YHePmJyrQoSpGxb+srr+7WWVT07acbk4
         Gd8wx/ElVf48v1NQ7kacblPWNxOSr0bIjH1lQW4QiWnAuYKH9BZIwizDmpyvIglx32
         bf4U9cZQC+HCcZh0MgO0YttEmPTxX2H/LjarVNYo=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E45E88B762;
        Sun,  2 Feb 2020 09:31:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id wqc16BLAbHuO; Sun,  2 Feb 2020 09:31:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id A80498B752;
        Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
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
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
 <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <ad5ad414-3524-2efa-df16-1ee357e6e2e4@arm.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e1e046d7-bf1d-eaec-1d0b-fe056b83b84c@c-s.fr>
Date:   Sun, 2 Feb 2020 09:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ad5ad414-3524-2efa-df16-1ee357e6e2e4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 02/02/2020 à 08:18, Anshuman Khandual a écrit :
> On 01/30/2020 07:43 PM, Christophe Leroy wrote:
>>
>>
>> Le 30/01/2020 à 14:04, Anshuman Khandual a écrit :
>>>
>>> On 01/28/2020 10:35 PM, Christophe Leroy wrote:
>>
>>>
>>>> I think we could make it standalone and 'default y if DEBUG_VM' instead.
>>>
>>> Which will yield the same result like before but in a different way. But
>>> yes, this test could go about either way but unless there is a good enough
>>> reason why change the current one.
>>
>> I think if we want people to really use it on other architectures it must be possible to activate it without having to modify Kconfig. Otherwise people won't even know the test exists and the architecture fails the test.
>>
>> The purpose of a test suite is to detect bugs. If you can't run the test until you have fixed the bugs, I guess nobody will ever detect the bugs and they will never be fixed.
>>
>> So I think:
>> - the test should be 'default y' when ARCH_HAS_DEBUG_VM_PGTABLE is selected
>> - the test should be 'default n' when ARCH_HAS_DEBUG_VM_PGTABLE is not selected, and it should be user selectable if EXPERT is selected.
>>
>> Something like:
>>
>> config DEBUG_VM_PGTABLE
>>      bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>>      depends on MMU
> 
> (ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT) be moved along side MMU on the same line ?

Yes could also go along side MMU, or could be a depend by itself:
	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT

> 
>>      default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
>>      default 'y' if DEBUG_VM
> 
> This looks good, at least until we get all platforms enabled. Will do all these
> changes along with s390 enablement and re-spin.

Christophe
