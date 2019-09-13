Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED87B185E
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 08:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfIMGcQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 02:32:16 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:40505 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbfIMGcQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Sep 2019 02:32:16 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 46V5Qj000Sz9vKGb;
        Fri, 13 Sep 2019 08:32:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=VJ4CF4p8; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id tJ-xaM53VrCX; Fri, 13 Sep 2019 08:32:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 46V5Qh5lbpz9vKGZ;
        Fri, 13 Sep 2019 08:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1568356332; bh=ReBvPV0Z/m9MUram7yhwHTiidcmJNZL+BD+hfnsloLA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VJ4CF4p8hg1KKGgIhCeAsV4qMKvXYlzNNehQ7ceZ4a6ZuNVr4zWlfLC2C/d+4Vx6x
         bOBxjzejDmg2+91ZvpNauetOhqSmZP1lVWbg5kakCMndFFbJsOS+UyolY/r68IIfBa
         7Uu12tw9w30LmD65sqocpmha8manvmPDWe4ylXUw=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id A62D88B7FD;
        Fri, 13 Sep 2019 08:32:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id LcWRvZH4vQC7; Fri, 13 Sep 2019 08:32:13 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 334838B770;
        Fri, 13 Sep 2019 08:32:13 +0200 (CEST)
Subject: Re: [PATCH V2 0/2] mm/debug: Add tests for architecture exported page
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
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <527edfce-c986-de4c-e286-34a70f6a2790@c-s.fr>
 <1b467d7a-0324-eb2c-876a-f04a99b9c596@arm.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ba2314ff-54c1-0deb-b207-b591647fac9d@c-s.fr>
Date:   Fri, 13 Sep 2019 08:32:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1b467d7a-0324-eb2c-876a-f04a99b9c596@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 13/09/2019 à 08:24, Anshuman Khandual a écrit :
> 
> 
> On 09/12/2019 08:12 PM, Christophe Leroy wrote:
>> Hi,
>>
>> I didn't get patch 1 of this series, and it is not on linuxppc-dev patchwork either. Can you resend ?
> 
> Its there on linux-mm patchwork and copied on linux-kernel@vger.kernel.org
> as well. The CC list for the first patch was different than the second one.
> 
> https://patchwork.kernel.org/patch/11142317/
> 
> Let me know if you can not find it either on MM or LKML list.
> 

I finaly found it on linux-mm archive, thanks. See my other mails and my 
fixing patch.

Christophe
