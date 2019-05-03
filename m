Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 445E61335A
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfECRvq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:51:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45222 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728830AbfECRvo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:51:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id w12so5897809ljh.12;
        Fri, 03 May 2019 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmSxHa0Jb+gcCHv31BEUSC8QaHpRnUhn+EbFUG/B/zA=;
        b=ehXrGeYPBduAiAN+pYlJuxR9myOL9LkDT+SBeozR/GlcyWZD+SjafvDmIg7Jkw3E0C
         +kZ0GRGFXTD1h53u03Ffeaf4Wn48OSpvLm1hRB1pwlZBREvnSGqXyXsKTj5ODB/FxDAa
         +Mm0elBcIu/j3fHc5TrKjiEcZn9GmEcMMUJmEfZtx1oJQsR4Pm9s4utanTWa52cU9ceY
         ZTy4VVmK8ls6SruDF8oGDwT1oKETV6HoQhVC3c4GEBL1ORuhTEa9gPORT4nNuy7Wv1hL
         R5hjEeqeUB0KM2L3i0lD65nE1XI5dpMXWfWCJ0MALzpUED7XngZwiTEMgOpwHacz+wFk
         Km3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmSxHa0Jb+gcCHv31BEUSC8QaHpRnUhn+EbFUG/B/zA=;
        b=iIjyqUB5+85vz7zrqQzPrIfHwDwzl/N4I09bEYQND4WoCrmhLxFYT5TOUBqfDgY4ZA
         /tvWBBcYnl8hKpGsl2B3uEMnyPpFmNPgNYiaBAj+/JbS8+v2q4xW7yzlCOcS0EzylLs6
         78UqFS2g6y90M9EgfdoUlld0LaD6A83GO/8uTvj/SeDJUFbDLGOHZY/xSMOW1ZdD+xGf
         yPJA/3pGXQ+DmN8IvNcyjsKo9xfUHMKEOHS3VehKawGNKM9OoI5oMGDmrmrSVOnWG5rs
         r3u8XBXrrmrMRbKF7Ky691+l9JYMv6MOxB4wp8x6VHEXazxyvdkZPwKc0JxQEwI+iDQy
         sskg==
X-Gm-Message-State: APjAAAUzQeeFjeToV9aWFkE9eOV9WKwR4EwFlvI9AIBMD4IngZR2XiaA
        5QP6Kv+PsPWrl1kSfHM3h1g=
X-Google-Smtp-Source: APXvYqybzXjUUojb/hjhiibGDOipaoKiCg/jrMZK18WrObD2Bjni1MODFWUlZy7imcDg+MIkb4L1vw==
X-Received: by 2002:a2e:9e47:: with SMTP id g7mr5649130ljk.48.1556905902559;
        Fri, 03 May 2019 10:51:42 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z30sm533435lfb.87.2019.05.03.10.51.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:51:41 -0700 (PDT)
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
Subject: [PATCH v2 5/5] mips: Manually call fdt_init_reserved_mem() method
Date:   Fri,  3 May 2019 20:50:41 +0300
Message-Id: <20190503175041.7949-6-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503175041.7949-1-fancer.lancer@gmail.com>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since memblock-patchset was introduced the reserved-memory nodes are
supported being declared in dt-files. So these nodes are actually parsed
during the arch setup procedure when the early_init_fdt_scan_reserved_mem()
method is called. But due to the arch-specific boot mem_map container
utilization we need to manually call the fdt_init_reserved_mem() method
after all the available and reserved memory has been moved to memblock.
The first function call performed before bootmem_init() by the
early_init_fdt_scan_reserved_mem() routine fails due to the lack of any
memblock memory regions to allocate from at that stage.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---
Changelog v2
- Discard forcible selection of OF_RESERVED_MEM config
---
 arch/mips/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index fbd216b4e929..ab349d2381c3 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -27,6 +27,7 @@
 #include <linux/dma-contiguous.h>
 #include <linux/decompress/generic.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -825,6 +826,8 @@ static void __init arch_mem_init(char **cmdline_p)
 	memblock_reserve(__pa_symbol(&__nosave_begin),
 		__pa_symbol(&__nosave_end) - __pa_symbol(&__nosave_begin));
 
+	fdt_init_reserved_mem();
+
 	memblock_dump_all();
 
 	early_memtest(PFN_PHYS(min_low_pfn), PFN_PHYS(max_low_pfn));
-- 
2.21.0

