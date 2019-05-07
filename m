Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5782C16DB3
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 01:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfEGXDz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 19:03:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38782 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfEGXDy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 19:03:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id u21so6665750lja.5;
        Tue, 07 May 2019 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YCO9eai/elcMyDJTY4ZF6twzD/0maEHb+2ajw9eNMYA=;
        b=GcR0z1fyOgKTa18jfuHdBgqzs8/MwQIZD5MZAeNHqmFkV9lT73tcI+0Gq/zF84eefZ
         Wu7N81HKmRdudd/eFEsbP9UaBHQ2irgQH8NYTS2MNsh0MJQWbT1chjXAZhET/Idf/u00
         IPooib9QXibN7RQVFbdLcjcpup6IRlU8mx+j/kukqtRORc9NH3oNkaAexerXhUieNqxz
         XqW60nZYbhlrWaGLno7QL4vCQ5sCt1j9EV8ydM7S2nVoKwJYYZQJCrFvszcm4Uf2mzj7
         5uzOHBwEycCyFeju611RH9RMFx6pji2jnzA/CYAqDlnZS9cDC9Z0wIv1w3dcGdKb6HWr
         u6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCO9eai/elcMyDJTY4ZF6twzD/0maEHb+2ajw9eNMYA=;
        b=RpCohmXSuQDpbEldyW72gwQSCgcp1oQIXa46wa1E08bfwTyaUg6mQRoisZ+XzmhP21
         L8rtsLsUO682twdlssB3Au3gYhqSdqHwE3gIqUQ4eRu1RbBu8O3mjx9PqOeuD9HqMSkj
         ymSFsV8+Q7AEm4cNWKhGn5aKdcPuF7ZOOTRuZLeRnp8rz3DNTDFR2MdMQ9ndLV5fcubS
         Bkx/jGDsV4K2eDRyzomLFEBatbE6+UOpTtPGjVVnJXJbxTUy85t7F/ey2Prl53Ro92SS
         3+RuvTGLoxvOPn3K6sWSvaoYItz3qxozNpiuI9Jav34i8NqcZc4K6od+HM9DoH9t8YJM
         4vhA==
X-Gm-Message-State: APjAAAXSGuRkGtMyFIe2HSj4j+YW38GDRE5zW9xr3ZKELm+Xss3RjLMy
        1Sm5lkr6xSGfwUxdJgItfrg=
X-Google-Smtp-Source: APXvYqzFfhMmo+sEqkGmbUYErpdz2pgowR0QnjpvB9McqLIEQjU0eMueQavyEnEmopbofjiCUYINKg==
X-Received: by 2002:a2e:9002:: with SMTP id h2mr3703362ljg.164.1557270232490;
        Tue, 07 May 2019 16:03:52 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id r9sm281044ljb.79.2019.05.07.16.03.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 16:03:51 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] mips: Print the kernel virtual mem layout on debugging
Date:   Wed,  8 May 2019 02:03:20 +0300
Message-Id: <20190507230320.23074-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503175041.7949-4-fancer.lancer@gmail.com>
References: 
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
Changelog v3
- Add MLM_ROUNDUP() and use it to calculate the low memory addresses range.
- Print KB instead of kB for kilobyte quantities.
- Check constants inconsistancies for systems with HIGHMEM only.
---
 arch/mips/mm/init.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index bbb196ad5f26..40558b979f96 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -31,6 +31,7 @@
 #include <linux/gfp.h>
 #include <linux/kcore.h>
 #include <linux/initrd.h>
+#include <linux/sizes.h>
 
 #include <asm/bootinfo.h>
 #include <asm/cachectl.h>
@@ -56,6 +57,55 @@ unsigned long empty_zero_page, zero_page_mask;
 EXPORT_SYMBOL_GPL(empty_zero_page);
 EXPORT_SYMBOL(zero_page_mask);
 
+/*
+ * Print out the kernel virtual memory layout
+ */
+#define MLK(b, t) (void *)b, (void *)t, ((t) - (b)) >> 10
+#define MLM(b, t) (void *)b, (void *)t, ((t) - (b)) >> 20
+#define MLK_ROUNDUP(b, t) (void *)b, (void *)t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
+#define MLM_ROUNDUP(b, t) (void *)b, (void *)t, DIV_ROUND_UP(((t) - (b)), SZ_1M)
+static void __init mem_print_kmap_info(void)
+{
+#ifdef CONFIG_DEBUG_KERNEL
+	pr_notice("Kernel virtual memory layout:\n"
+		  "    lowmem  : 0x%px - 0x%px  (%6td MB)\n"
+		  "      .text : 0x%px - 0x%px  (%6td KB)\n"
+		  "      .data : 0x%px - 0x%px  (%6td KB)\n"
+		  "      .init : 0x%px - 0x%px  (%6td KB)\n"
+		  "      .bss  : 0x%px - 0x%px  (%6td KB)\n"
+		  "    vmalloc : 0x%px - 0x%px  (%6ld MB)\n"
+#ifdef CONFIG_HIGHMEM
+		  "    pkmap   : 0x%px - 0x%px  (%6ld MB)\n"
+#endif
+		  "    fixmap  : 0x%px - 0x%px  (%6ld KB)\n",
+		  MLM_ROUNDUP((void *)PAGE_OFFSET, high_memory),
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
+	BUILD_BUG_ON(FIXADDR_TOP < PAGE_OFFSET);
+	BUG_ON(FIXADDR_TOP < (unsigned long)high_memory);
+#endif
+#endif /* CONFIG_DEBUG_KERNEL */
+}
+#undef MLK
+#undef MLM
+#undef MLK_ROUNDUP
+#undef MLM_ROUNDUP
+
 /*
  * Not static inline because used by IP27 special magic initialization code
  */
@@ -479,6 +529,7 @@ void __init mem_init(void)
 	setup_zero_pages();	/* Setup zeroed pages.  */
 	mem_init_free_highmem();
 	mem_init_print_info(NULL);
+	mem_print_kmap_info();
 
 #ifdef CONFIG_64BIT
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
-- 
2.21.0

