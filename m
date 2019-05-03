Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D459313357
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbfECRvm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:51:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34950 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbfECRvm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:51:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id z26so1121805ljj.2;
        Fri, 03 May 2019 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKcAZCZmHBkOFZOBdJVKsgxHPiEdHR2uf5o4k8h8weQ=;
        b=WChiyw+F6v1NPibEOjSPo93/hjGV4IHlTo6QQQEZulhMkYkR+FGVhhrKBG4r4ETKy/
         STMoT/XxuHQdybeo1/fjDFIZ7Nwshv/B7GCnSK1fVWA1DVRwcTQwLHZ3rIj0iOsTkEmp
         rOu4itBno7AWhcELDi9I+hgm/qsIhoVIQbEVEgvZOH+j8Zuma1oeul6CVlhDDcE9+NzA
         wr0eX+LmM140s5Zob19pSVYcUb6nrM69pM18zfH+f3JbXcfCkLjMiesrLJiqdps2JSiX
         U6qqROkFaXqLZNibwNOeS1d/Vdfmyh3ceo/KYNfPuL4c/+yBC6TfLVar31h3POx1NnfF
         QFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKcAZCZmHBkOFZOBdJVKsgxHPiEdHR2uf5o4k8h8weQ=;
        b=RY65x9/M10nX4cMrelIvE0oJ9pPa3EtUfQh5qztzoKPPUiAVUIUlQJ3nOD2BmJCCa/
         CC1r9OhKPmmJPUFmInrux6VL5yRa30j0wIsjY610Q5t6KVxoDeNliGhKVWoekZsZt9ue
         /l0gSjLIs44GFrKYDYtAw8MbNkUMxwvvZwFcATCKv13RJcUel+X8q7wNfiiDqH/dgsa3
         roJMkVgHwBz5iYOLGqMaVz8SLdN3OSRHPJ/DMV8ooXREnanw9howEUpAUR915mMf4WE8
         dAqFIrWl34ADx1TKJa7VKNK6S0zy4Zxbdd3VTMquDVGqoSWYZkGtjoIuraD6LATzLdji
         a5+A==
X-Gm-Message-State: APjAAAUzQ89XZj24M6MM/Dx5JxvlIbJnlFelLzQCifLVYLmijrKT0ylk
        KYnsLqTRH52hVj65ByDsJ1s=
X-Google-Smtp-Source: APXvYqzhP6rnqTPD3xb/yM41UDCfoPG59B2mCl7Nq5G9GnM1Wu/rUlWw0/ZDC6oLtHd2qhYPBH7E5A==
X-Received: by 2002:a2e:89c8:: with SMTP id c8mr5963208ljk.73.1556905899737;
        Fri, 03 May 2019 10:51:39 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z30sm533435lfb.87.2019.05.03.10.51.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:51:39 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on debugging
Date:   Fri,  3 May 2019 20:50:39 +0300
Message-Id: <20190503175041.7949-4-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503175041.7949-1-fancer.lancer@gmail.com>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It is useful at least for debugging to have the kernel virtual
memory layout printed at boot time so to have the full information
about the booted kernel. Make the printing optional and available
only when DEBUG_KERNEL config is enabled so not to leak a sensitive
kernel information.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/mm/init.c | 49 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index bbb196ad5f26..c338bbd03b2a 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -31,6 +31,7 @@
 #include <linux/gfp.h>
 #include <linux/kcore.h>
 #include <linux/initrd.h>
+#include <linux/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/cachectl.h>
@@ -56,6 +57,53 @@ unsigned long empty_zero_page, zero_page_mask;
 EXPORT_SYMBOL_GPL(empty_zero_page);
 EXPORT_SYMBOL(zero_page_mask);
 
+/*
+ * Print out the kernel virtual memory layout
+ */
+#define MLK(b, t) (void *)b, (void *)t, ((t) - (b)) >> 10
+#define MLM(b, t) (void *)b, (void *)t, ((t) - (b)) >> 20
+#define MLK_ROUNDUP(b, t) (void *)b, (void *)t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
+static void __init mem_print_kmap_info(void)
+{
+#ifdef CONFIG_DEBUG_KERNEL
+	pr_notice("Kernel virtual memory layout:\n"
+		  "    lowmem  : 0x%px - 0x%px  (%4ld MB)\n"
+		  "      .text : 0x%px - 0x%px  (%4td kB)\n"
+		  "      .data : 0x%px - 0x%px  (%4td kB)\n"
+		  "      .init : 0x%px - 0x%px  (%4td kB)\n"
+		  "      .bss  : 0x%px - 0x%px  (%4td kB)\n"
+		  "    vmalloc : 0x%px - 0x%px  (%4ld MB)\n"
+#ifdef CONFIG_HIGHMEM
+		  "    pkmap   : 0x%px - 0x%px  (%4ld MB)\n"
+#endif
+		  "    fixmap  : 0x%px - 0x%px  (%4ld kB)\n",
+		  MLM(PAGE_OFFSET, (unsigned long)high_memory),
+		  MLK_ROUNDUP(_text, _etext),
+		  MLK_ROUNDUP(_sdata, _edata),
+		  MLK_ROUNDUP(__init_begin, __init_end),
+		  MLK_ROUNDUP(__bss_start, __bss_stop),
+		  MLM(VMALLOC_START, VMALLOC_END),
+#ifdef CONFIG_HIGHMEM
+		  MLM(PKMAP_BASE, (PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE)),
+#endif
+		  MLK(FIXADDR_START, FIXADDR_TOP));
+
+	/* Check some fundamental inconsistencies. May add something else? */
+#ifdef CONFIG_HIGHMEM
+	BUILD_BUG_ON(VMALLOC_END < PAGE_OFFSET);
+	BUG_ON(VMALLOC_END < (unsigned long)high_memory);
+	BUILD_BUG_ON((PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE) < PAGE_OFFSET);
+	BUG_ON((PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE) <
+		(unsigned long)high_memory);
+#endif
+	BUILD_BUG_ON(FIXADDR_TOP < PAGE_OFFSET);
+	BUG_ON(FIXADDR_TOP < (unsigned long)high_memory);
+#endif /* CONFIG_DEBUG_KERNEL */
+}
+#undef MLK
+#undef MLM
+#undef MLK_ROUNDUP
+
 /*
  * Not static inline because used by IP27 special magic initialization code
  */
@@ -479,6 +527,7 @@ void __init mem_init(void)
 	setup_zero_pages();	/* Setup zeroed pages.  */
 	mem_init_free_highmem();
 	mem_init_print_info(NULL);
+	mem_print_kmap_info();
 
 #ifdef CONFIG_64BIT
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
-- 
2.21.0

