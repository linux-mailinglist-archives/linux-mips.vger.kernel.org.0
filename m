Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A424135D7EE
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244480AbhDMGWb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344977AbhDMGW2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:28 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692FCC061756;
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so789378pjb.1;
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MEVWTDjaKURrh58TF/87I+8ZbA6Ugd6pjE5oioMoAPY=;
        b=sxVlCAtQhSrQmZAIRSM/Jh9aj43J+pzf0KAGxhPwqnb2jyri0uO4p8mN1rN4j6FaQR
         XymyaJeyjQzmJV98AYGbalxACDRC/fJLKEUCFa76dGa0URTPwzvCOb4k5ETIexMnfsUr
         uRf5Gqbp22mrWOb3Nsgahkz1nrCw5V+8uyM+9PP0wVIcorniSFzaCLiNRO3ya8uvx0BE
         BZJyoJLv6Hat3bxT5xOsDgly4o0Be55Y7ztlNUmOQgHTuHCvPomYCorIhYtmJ1H0AgbX
         BEKt2wx+RDltGbs0Qlf52GWy+mQ/LHixWKP+r/sOpOQxGY1je90m+4QAJMBtFDNiqhg5
         r0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEVWTDjaKURrh58TF/87I+8ZbA6Ugd6pjE5oioMoAPY=;
        b=A/9d+DUiaAqULK0sdlqVXs532ZLpHcLKEthKIPsdEQzHt36OYAxD4opSmLEu+fAtRe
         eUHLUSRhGH8l4UJhSDebfW75TAQgZN6I7BuRghX+6JyMYjFz8B0kcu4GjA1XFaAznnNv
         k4iQfXzgdqduVudXxzmcnHVCm0Q8yXKWsBKjlBz9Jp0IfNPe127xopu39DBIbU5DeCb1
         U8Db94esKWvT8KIkOjQaCcYNH0F25LL3SGZEMh8FvdaFP4PE6bVe+Xag+Q+bYWTF7ict
         jFdLkd/bYJHZZvhyx2mLhiXBLBDukCaFtXmpHrPIcLDsS8tvHb3shM2RP1G2Xv8vt4sD
         Qp0A==
X-Gm-Message-State: AOAM532bTYcib7gte3dI3JPqPa70oeHWOA76cQHLmi2IyIoacYFTBzbw
        B5QZAYmIquRf0a/y6ppFSTk=
X-Google-Smtp-Source: ABdhPJzlKD462hC0hjV6NA6oOmHjVatoLSZcP/j4KdWz5pVSjvkzQAO4LoTgswlPu5k82b8jslbTzQ==
X-Received: by 2002:a17:902:aa87:b029:ea:fe2b:e59c with SMTP id d7-20020a170902aa87b02900eafe2be59cmr8486531plr.53.1618294929010;
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 6/8] MIPS: pci-legacy: remove redundant info messages
Date:   Mon, 12 Apr 2021 23:21:44 -0700
Message-Id: <20210413062146.389690-7-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the following pci-legacy message:
  PCI host bridge /pci@440000/host-bridge ranges:
   MEM 0x0000000020000000..0x000000002fffffff
    IO 0x0000000000460000..0x000000000046ffff

It is followed shortly by the same data from pci_register_host_bridge:
  PCI host bridge to bus 0000:00
  pci_bus 0000:00: root bus resource [mem 0x20000000-0x2fffffff]
  pci_bus 0000:00: root bus resource [io  0x460000-0x46ffff]

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/pci/pci-legacy.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index 3a909194284a..ec3f52ade72d 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -140,7 +140,6 @@ void pci_load_of_ranges(struct pci_controller *hose, struct device_node *node)
 	struct of_pci_range range;
 	struct of_pci_range_parser parser;
 
-	pr_info("PCI host bridge %pOF ranges:\n", node);
 	hose->of_node = node;
 
 	if (of_pci_range_parser_init(&parser, node))
@@ -151,18 +150,12 @@ void pci_load_of_ranges(struct pci_controller *hose, struct device_node *node)
 
 		switch (range.flags & IORESOURCE_TYPE_BITS) {
 		case IORESOURCE_IO:
-			pr_info("  IO 0x%016llx..0x%016llx\n",
-				range.cpu_addr,
-				range.cpu_addr + range.size - 1);
 			hose->io_map_base =
 				(unsigned long)ioremap(range.cpu_addr,
 						       range.size);
 			res = hose->io_resource;
 			break;
 		case IORESOURCE_MEM:
-			pr_info(" MEM 0x%016llx..0x%016llx\n",
-				range.cpu_addr,
-				range.cpu_addr + range.size - 1);
 			res = hose->mem_resource;
 			break;
 		}
-- 
2.31.1

