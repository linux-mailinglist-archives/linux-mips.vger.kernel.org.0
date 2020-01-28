Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8139914AFA8
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 07:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgA1GRj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 01:17:39 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:56701 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgA1GRj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 01:17:39 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 486Gcc0WVCz9v22Q;
        Tue, 28 Jan 2020 07:17:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=lgZskWmS; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id UkHPZqpb554O; Tue, 28 Jan 2020 07:17:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 486Gcb627Gz9v22N;
        Tue, 28 Jan 2020 07:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580192255; bh=+DPt49RKHi9mO1gnM2058SFaj+Fq0ceAMy7haYJU1NM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lgZskWmSj1VA5v5b98S9ZEmr7USU9rrof5MnKymq+rXgWJyl99vDSXQIZX47bFjeC
         /6k5GZov6uOPE4UU+Xi9hVhZlNd3ZPIeokTTE6E9eAr6ycFttvMUe986W6/vBNtjV8
         Ykd6Kd6ETlhEILSsCQYi5j6eBswWvSBhAxwf3fzs=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8873F8B7C2;
        Tue, 28 Jan 2020 07:17:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id RqoGVOoiJ5M4; Tue, 28 Jan 2020 07:17:36 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id DC9498B75B;
        Tue, 28 Jan 2020 07:17:33 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Qian Cai <cai@lca.pw>,
        Anshuman Khandual <Anshuman.Khandual@arm.com>
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
References: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
 <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
Date:   Tue, 28 Jan 2020 07:17:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 28/01/2020 à 06:48, Qian Cai a écrit :
> 
> 
>> On Jan 27, 2020, at 11:58 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>
>> As I had mentioned before, the test attempts to formalize page table helper semantics
>> as expected from generic MM code paths and intend to catch deviations when enabled on
>> a given platform. How else should we test semantics errors otherwise ? There are past
>> examples of usefulness for this procedure on arm64 and on s390. I am wondering how
>> else to prove the usefulness of a debug feature if these references are not enough.
> 
> Not saying it will not be useful. As you mentioned it actually found a bug or two in the past. The problem is that there is always a cost to maintain something like this, and nobody knew how things could be broken even for the isolated code you mentioned in the future given how complicated the kernel code base is. I am not so positive that many developers would enable this debug feature and use it on a regular basis from the information you gave so far.
> 
> On the other hand, it might just be good at maintaining this thing out of tree by yourself anyway, because if there isn’t going to be used by many developers, few people is going to contribute to this and even noticed when it is broken. What’s the point of getting this merged apart from being getting some meaningless credits?
> 

It is 'default y' so there is no much risk that it is forgotten, at 
least all test suites run with 'allyes_defconfig' will trigger the test, 
so I think it is really a good feature.

Christophe
