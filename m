Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71DC6FD52D
	for <lists+linux-mips@lfdr.de>; Wed, 10 May 2023 06:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbjEJEn4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 May 2023 00:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjEJEny (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 May 2023 00:43:54 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86553C3B
        for <linux-mips@vger.kernel.org>; Tue,  9 May 2023 21:43:51 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-55a00da4e53so120896337b3.0
        for <linux-mips@vger.kernel.org>; Tue, 09 May 2023 21:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683693831; x=1686285831;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgvg6hJeX3BMksFNsRntaPo5LAnqTckLGOVnbotKcuE=;
        b=XSdzuZPhWyo8ejurmvHVm33GJPjVUgijuALNChj5du7O2iYt4Q9Jq2Q59opuXgmszK
         vq4MYv/Ooq0tJSiRkeuI3pPx9DX2hUCIacbsKIYs/Pr4tOgH5bBu2nqMFCUfyb6E02pf
         jBk8Kt3LARkTDDVXin2DqNhLRNsinTPL45U22h6RflNgwq03hTBYZXyT9mTDfKsms4Zh
         4IIRYWo2iyv3RHOXtIB0KC/5A3EJw7nNYEHLsDPx36g0ObzRlzcFoxapfv0z0w7dMYbs
         CoJBrp445oAQqRN0sKHpj5OzjqC03ok8JMyhyd58GQQ6Bw92QvpdqQzmSHjTpSRLST1k
         j19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683693831; x=1686285831;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgvg6hJeX3BMksFNsRntaPo5LAnqTckLGOVnbotKcuE=;
        b=R1i2oVFaTVUMXJkra6esTARsPQeLSOO4EfUMhkvccaH8Z4C0MZbSdeUSkZVkllfyrq
         93YNuFYAxVFLWrwaqRm00qNGu6Jcl1/3wkgrUnTQ5Qd5XtQEdocZEJ3UROTvrEUPVIYP
         AlMf4JvVINbddYg8lE6EnGOI3FZSJw6yEPqye1wLFJI5OkFhaasplUMnBl/U1pXI3EAo
         wwesUbGlSf0WrOgxyXdAhN0Jh3X/i2RMMQEjiPjqOrDWbo+wEGyI8wrGJ5tydxfQrB8I
         ouPXsspGxouUePgDcbfyUUgoFh6xfH/1x1LqakCizLAN6hQBCVnFvEDbnS62sL8gDtz5
         QnRw==
X-Gm-Message-State: AC+VfDzEp9S63UzSIxA5z0YqxTYyPprUbL6SModQC8anA8IfYVUDEN9T
        uol3j217BBbCxDGJCDsLeyxH+A==
X-Google-Smtp-Source: ACHHUZ4VcJ8uys5Wg+XhQi/AqGcqZN5zPbzkOujNssPmQqlmUArRuZ8YDG3LYugsQYwQAHxQcBQMpA==
X-Received: by 2002:a0d:d955:0:b0:55a:ad0a:766 with SMTP id b82-20020a0dd955000000b0055aad0a0766mr17833906ywe.10.1683693830970;
        Tue, 09 May 2023 21:43:50 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id p185-20020a0dcdc2000000b0055a72f6a462sm2214413ywd.19.2023.05.09.21.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:43:50 -0700 (PDT)
Date:   Tue, 9 May 2023 21:43:47 -0700 (PDT)
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
Subject: [PATCH 02/23] arm64: allow pte_offset_map() to fail
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <e72f6f3e-a8d4-3ed-2b4-5d3ced41484@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/arm64/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 9e0db5c387e3..a58780d5fac4 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -177,6 +177,9 @@ static void show_pte(unsigned long addr)
 			break;
 
 		ptep = pte_offset_map(pmdp, addr);
+		if (!ptep)
+			break;
+
 		pte = READ_ONCE(*ptep);
 		pr_cont(", pte=%016llx", pte_val(pte));
 		pte_unmap(ptep);
-- 
2.35.3

