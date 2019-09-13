Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C04EB1832
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 08:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfIMGXz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 02:23:55 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:5974 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbfIMGXz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Sep 2019 02:23:55 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 46V5F20LG8z9vKGM;
        Fri, 13 Sep 2019 08:23:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=f446T9wp; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id zlMG0g1kYZvK; Fri, 13 Sep 2019 08:23:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 46V5F16D30z9vKGY;
        Fri, 13 Sep 2019 08:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1568355829; bh=pdwAlCDBbA9CsaJmAmYfOp6ncuC/iDPFuNIc/mtHpeE=;
        h=From:Subject:To:Cc:In-Reply-To:Date:From;
        b=f446T9wpDZfLilO9u7fC1JJ5iPPIYtr2YAcUoymNbdzP8LwmjS6SLA7gucXb/2pYd
         VcLEFXtcILm2zGItfCjmRNrmwQSWptgurhi6JAzw/j7ABoblpvS+FvvWWNuWnkMXHB
         2ymh0I7z1GrSxPozeE2BsYVNS2vfgkTIggcJZPx4=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BE6A08B7FD;
        Fri, 13 Sep 2019 08:23:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id PJOZp0medcMg; Fri, 13 Sep 2019 08:23:50 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [172.25.230.101])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 42BBF8B770;
        Fri, 13 Sep 2019 08:23:50 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 17A0F6B760; Fri, 13 Sep 2019 06:23:49 +0000 (UTC)
Message-Id: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] mm/pgtable/debug: Fix test validating architecture page table
 helpers
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
In-Reply-To: <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
Date:   Fri, 13 Sep 2019 06:23:49 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix build failure on powerpc.

Fix preemption imbalance.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 mm/arch_pgtable_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
index 8b4a92756ad8..f2b3c9ec35fa 100644
--- a/mm/arch_pgtable_test.c
+++ b/mm/arch_pgtable_test.c
@@ -24,6 +24,7 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 #include <linux/sched/mm.h>
+#include <linux/highmem.h>
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
 
@@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
 	p4d_clear_tests(p4dp);
 	pgd_clear_tests(mm, pgdp);
 
+	pte_unmap(ptep);
+
 	pmd_populate_tests(mm, pmdp, saved_ptep);
 	pud_populate_tests(mm, pudp, saved_pmdp);
 	p4d_populate_tests(mm, p4dp, saved_pudp);
-- 
2.13.3

