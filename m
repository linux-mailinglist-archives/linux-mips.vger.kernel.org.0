Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447641335C
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbfECRv4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:51:56 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40797 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728820AbfECRvn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:51:43 -0400
Received: by mail-lf1-f65.google.com with SMTP id o16so4986114lfl.7;
        Fri, 03 May 2019 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v/LR8SgjCFeSasZGBO3FAtfYGfrjDhMD48wHn2t6CEQ=;
        b=cae9601wLSgRgqYUW45HHj8WE00Rab3oTgbbv7YEKZ7iWuBEXqVcvBvBFDC+Lj2rdF
         kxx5F4fsKKh+497U9XtItDjTmZ62zzgTWNSYrCQcMslr1pmTmJr8enHEs86QHdIV57uU
         hLlKQP6tr3OOlH9naxjGISBIjanifWnb7VUAVTXD0u5EVuSlo9FpA81YGfhpCnN+qY5w
         QofuZIULE2XmBTGzzy2a4of6xPWOzqC1p9gRvMT16chmiUccDlYQ6mtRwvw+544Fa3qv
         Z4LpBQwqFfR8w7EGMu50RdlZxXPR0yn9ZEkSeeuvdtft5vgKAU7FrZUB0SdPUl4efqW4
         oVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v/LR8SgjCFeSasZGBO3FAtfYGfrjDhMD48wHn2t6CEQ=;
        b=g/2BGS8qWtdsCB0vlJfMAt0KS2y9VbVVB5RONiZfcXrD2b7Imqew+bIRSMkEG6Ivi7
         SvLidOU0UMqWXh49sRZMdHKey3ichsx6BQjrViEOXYSxHMhZzwadF1ZkTK7FNgmoW+BK
         UHGprCoFDhSQDBqRfDkNxR9UaovcB4KXpjZBLdj1yvoR4r/bst75T6H9nzxpebyi/46B
         GBEKjAvl7g/I4IImYUbOl53wQRdWHz7afcYUHMgBBqy3X7fb9msgC7CC+mb7QJf4Csbf
         zpWDqr0SjA+WN9GGj85rGlakynIvCm0CCbI4CDMP2siIqPza50KZjSYXr2IdRkJsu80w
         XM1w==
X-Gm-Message-State: APjAAAUe4Zu/WYejTGL7URR+a79Cd8xQMEsPbkU7Rimc0hfT5LFCcGN2
        MfE+I/OvQCHriRivEWnLfmM=
X-Google-Smtp-Source: APXvYqzaIswhZ16M/uyPSnSlhWFL6tGG02DM5yowGMDH/6Efa/U4+5qG1flLBtIwbdscxjig2TYs8w==
X-Received: by 2002:ac2:44b2:: with SMTP id c18mr5577711lfm.86.1556905901150;
        Fri, 03 May 2019 10:51:41 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z30sm533435lfb.87.2019.05.03.10.51.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:51:40 -0700 (PDT)
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
Subject: [PATCH v2 4/5] mips: Make sure dt memory regions are valid
Date:   Fri,  3 May 2019 20:50:40 +0300
Message-Id: <20190503175041.7949-5-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503175041.7949-1-fancer.lancer@gmail.com>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are situations when memory regions coming from dts may be
too big for the platform physical address space. This especially
concerns XPA-capable systems. Bootloader may determine more than 4GB
memory available and pass it to the kernel over dts memory node, while
kernel is built without XPA/64BIT support. In this case the region
may either simply be truncated by add_memory_region() method
or by u64->phys_addr_t type casting. But in worst case the method
can even drop the memory region if it exceeds PHYS_ADDR_MAX size.
So lets make sure the retrieved from dts memory regions are valid,
and if some of them aren't, just manually truncate them with a warning
printed out.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/prom.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 437a174e3ef9..28bf01961bb2 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -41,7 +41,19 @@ char *mips_get_machine_name(void)
 #ifdef CONFIG_USE_OF
 void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 {
-	return add_memory_region(base, size, BOOT_MEM_RAM);
+	if (base >= PHYS_ADDR_MAX) {
+		pr_warn("Trying to add an invalid memory region, skipped\n");
+		return;
+	}
+
+	/* Truncate the passed memory region instead of type casting */
+	if (base + size - 1 >= PHYS_ADDR_MAX || base + size < base) {
+		pr_warn("Truncate memory region %llx @ %llx to size %llx\n",
+			size, base, PHYS_ADDR_MAX - base);
+		size = PHYS_ADDR_MAX - base;
+	}
+
+	add_memory_region(base, size, BOOT_MEM_RAM);
 }
 
 int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
-- 
2.21.0

