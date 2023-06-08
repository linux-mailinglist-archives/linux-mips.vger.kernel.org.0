Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1A527287F6
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jun 2023 21:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbjFHTQx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jun 2023 15:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjFHTQv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jun 2023 15:16:51 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9F430C1
        for <linux-mips@vger.kernel.org>; Thu,  8 Jun 2023 12:16:17 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-bacfb7acdb7so1065655276.0
        for <linux-mips@vger.kernel.org>; Thu, 08 Jun 2023 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251670; x=1688843670;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=2n/XtD7AqYzwMObmNTcTXdhdmtrivr6xS0a6hxh2028Gq3sNV9XO29gB5O2y3L9l/t
         L2rqH6x4Pz17FgKoR1Y4rQPo+pjlVHFvq4Uxf6V5Z1hVLY+dk3dbsKixOg2g0+O6MH3o
         wHR7UhzFBUpyNSTJP8nVTqWIyYA0el7GHtc3GU+0DrUYPDVBZCtJf3wyrCUqLLZR09lv
         VqBAJ8/LNlL6ViTV2apFi54AS+jw7a1Zjo/eBl1kmHqeluHIV3N/nqy10dITHeklJsgD
         IGKWlS4umLi9ypWs+T7OEHIYU3YkWJ3FbGyXJ6NMN9TADYksX23kqJlAINxQPvIJDTtX
         gwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251670; x=1688843670;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=enESGwxp4CptVW+wXD3Ff+kgXJBlGpVjlQPZxIVCEGiqhgdLL8jEqkm0Z4qBRnItvO
         N5Zo1MPL/5Hw/9yY96WXarUG+1shpmfzCK6P+2WaZz99inPmxqMudYc9fEeGWRYvyf3Z
         m8yEJfI8OHKHClorNf8fGKyZBxiEbHVQrjv369Swn/LyYFp/CoK282soVSSt/u/w6gcy
         nKvV40+aJFj3CWPdrSW4uv3ZKQaIbYnSId9OSnsWJoT+7h+hGgjRqsVV39ClNSWUSy4y
         sm8DXiCUWMjhkUMWULIQMAovDTH5mHA73cSM6fBTTQVB8GHXWv9axyRNUV8LglSutiWN
         EAmQ==
X-Gm-Message-State: AC+VfDwbY6e142PzquOfh8+sIYWdA7HH9uvX23ntE/6V7fnxOfS51h7y
        ykYYRLiN3y7nCOD1TOe3lWcnvg==
X-Google-Smtp-Source: ACHHUZ7aUiIh5IKg+O5kgdrTnFDUinQat6T8kg6GewL/1W4sBHj9jDkDghROqTlVL3SjDvy6zEmR9Q==
X-Received: by 2002:a25:e302:0:b0:bb1:5a06:70ed with SMTP id z2-20020a25e302000000b00bb15a0670edmr543635ybd.19.1686251670430;
        Thu, 08 Jun 2023 12:14:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id e10-20020a25874a000000b00b9e5b28dbd8sm429689ybn.17.2023.06.08.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:14:29 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:14:26 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 04/23] ia64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <1c2c7837-bfea-9640-a74-985379fcc5a@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/ia64/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index 78a02e026164..adc49f2d22e8 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -41,7 +41,7 @@ huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud) {
 		pmd = pmd_alloc(mm, pud, taddr);
 		if (pmd)
-			pte = pte_alloc_map(mm, pmd, taddr);
+			pte = pte_alloc_huge(mm, pmd, taddr);
 	}
 	return pte;
 }
@@ -64,7 +64,7 @@ huge_pte_offset (struct mm_struct *mm, unsigned long addr, unsigned long sz)
 			if (pud_present(*pud)) {
 				pmd = pmd_offset(pud, taddr);
 				if (pmd_present(*pmd))
-					pte = pte_offset_map(pmd, taddr);
+					pte = pte_offset_huge(pmd, taddr);
 			}
 		}
 	}
-- 
2.35.3

