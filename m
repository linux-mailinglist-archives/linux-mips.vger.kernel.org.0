Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6302514AF8B
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 07:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgA1GNL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 01:13:11 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:50715 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgA1GNL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 01:13:11 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 486GWR2cqXz9v22Q;
        Tue, 28 Jan 2020 07:13:07 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=C70j0unK; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id tf9SBshBmIx8; Tue, 28 Jan 2020 07:13:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 486GWR19WTz9v22N;
        Tue, 28 Jan 2020 07:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580191987; bh=pcrCnDSka2qoXBfBeA3afQal2h0amq4PFi2jmMQwdpk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=C70j0unKrMF6yDixdWedTQC2P5T5/vAYpEmpZheamqM8tUIvuDuoyzTfclHpLcmBs
         zFelibkah4ATRqmpbd//5eGzB63dcgYhxVJrzK4IvtVG6rBysf1zACi5HU+mamJ97b
         k3ddSc1LOjJeLmYIAzLxKGYzTukejGmyrGraiJB8=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id DCAFB8B7C2;
        Tue, 28 Jan 2020 07:13:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id UqMMVHvL2Had; Tue, 28 Jan 2020 07:13:07 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FF9D8B75B;
        Tue, 28 Jan 2020 07:13:05 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Qian Cai <cai@lca.pw>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
 <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
Date:   Tue, 28 Jan 2020 07:13:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 28/01/2020 à 04:33, Qian Cai a écrit :
> 
> 
>> On Jan 27, 2020, at 10:06 PM, Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>>
>>
>> On 01/28/2020 07:41 AM, Qian Cai wrote:
>>>
>>>
>>>> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>>>
>>>> This adds tests which will validate architecture page table helpers and
>>>> other accessors in their compliance with expected generic MM semantics.
>>>> This will help various architectures in validating changes to existing
>>>> page table helpers or addition of new ones.
>>>>
>>>> This test covers basic page table entry transformations including but not
>>>> limited to old, young, dirty, clean, write, write protect etc at various
>>>> level along with populating intermediate entries with next page table page
>>>> and validating them.
>>>>
>>>> Test page table pages are allocated from system memory with required size
>>>> and alignments. The mapped pfns at page table levels are derived from a
>>>> real pfn representing a valid kernel text symbol. This test gets called
>>>> right after page_alloc_init_late().
>>>>
>>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>>>> arm64. Going forward, other architectures too can enable this after fixing
>>>> build or runtime problems (if any) with their page table helpers.
>>
>> Hello Qian,
>>
>>>
>>> What’s the value of this block of new code? It only supports x86 and arm64
>>> which are supposed to be good now.
>>
>> We have been over the usefulness of this code many times before as the patch is
>> already in it's V12. Currently it is enabled on arm64, x86 (except PAE), arc and
>> ppc32. There are build time or runtime problems with other archs which prevent
> 
> I am not sure if I care too much about arc and ppc32 which are pretty much legacy
> platforms.
> 
>> enablement of this test (for the moment) but then the goal is to integrate all
>> of them going forward. The test not only validates platform's adherence to the
>> expected semantics from generic MM but also helps in keeping it that way during
>> code changes in future as well.
> 
> Another option maybe to get some decent arches on board first before merging this
> thing, so it have more changes to catch regressions for developers who might run this.
> 

ppc32 an indecent / legacy platform ? Are you kidying ?

Powerquicc II PRO for instance is fully supported by the manufacturer 
and widely used in many small networking devices.

Christophe
