Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE47150970
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2020 16:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgBCPO2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 10:14:28 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:44923 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728918AbgBCPO2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Feb 2020 10:14:28 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 48BBF846fMz9v3ls;
        Mon,  3 Feb 2020 16:14:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=OGtzFIa+; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 5VszB6UW2Yif; Mon,  3 Feb 2020 16:14:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 48BBF82h8pz9v3lm;
        Mon,  3 Feb 2020 16:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580742860; bh=i4hAG7YwdO6LNDmYZ4wBEtikutj9N76WG5xl/PwnPrw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OGtzFIa+5ZhSxgd/BuHky5Jny2LDfnoF42zPtabwjmhorMsQSP8od+tqTvY9oMk3O
         ug6+KKaiRNlh/wtS69Y4UVsFdUJC1Vu36ZVhY++cHIlyr4PBVDhCfDbWqmvxtfLxhX
         pBTvZSaYZbiw2B0JwaU6kwU/pCLUp2ai2uhwAOdA=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DE228B7B0;
        Mon,  3 Feb 2020 16:14:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id unrhNEULKrXy; Mon,  3 Feb 2020 16:14:25 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 12E638B7AC;
        Mon,  3 Feb 2020 16:14:25 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Qian Cai <cai@lca.pw>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>, linux-mm@kvack.org,
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
        x86@kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev <kasan-dev@googlegroups.com>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
Date:   Mon, 3 Feb 2020 16:14:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 02/02/2020 à 12:26, Qian Cai a écrit :
> 
> 
>> On Jan 30, 2020, at 9:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>> config DEBUG_VM_PGTABLE
>>     bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>>     depends on MMU
>>     default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
>>     default 'y' if DEBUG_VM
> 
> Does it really necessary to potentially force all bots to run this? Syzbot, kernel test robot etc? Does it ever pay off for all their machine times there?
> 

Machine time ?

On a 32 bits powerpc running at 132 MHz, the tests takes less than 10ms. 
Is it worth taking the risk of not detecting faults by not selecting it 
by default ?

[    5.656916] debug_vm_pgtable: debug_vm_pgtable: Validating 
architecture page table helpers
[    5.665661] debug_vm_pgtable: debug_vm_pgtable: Validated 
architecture page table helpers

Christophe
