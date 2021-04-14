Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8849E35EB4D
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbhDNDNs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbhDNDNk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:40 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD05C06138F;
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id d10so13390132pgf.12;
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MEVWTDjaKURrh58TF/87I+8ZbA6Ugd6pjE5oioMoAPY=;
        b=KYIfk4vhMnu0oFpPLZ+Ozcu44449T31i1HIbcAs82xVtXjLgSy/6fU3ZP+Xv2kue2E
         wIjiUhhS5EITHrQrZG84n/x5RhBd8ocFkRChMpH6CSJoqC7G4p7jnOoq8DFwtHI4LzTw
         EdNK/kun4Pveg2DqFIe0v0VhbZYhMMrc4+GpKeMt7W2S+wis+8ZpG5BWS/PaWWnMj9u1
         3ZFkmCglLpVeGFkFwsDC+PCwYGuXM5iPJ7cH5t0CviAhjQh0LRYdIJcBwkt3RSlEUzUb
         L/5A0PUplsPfJnTeu0e8Y0yeGO6Pj3G3ksjSTr8RjNXJeSIBsa3H/34960vF2aUmiDib
         2QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEVWTDjaKURrh58TF/87I+8ZbA6Ugd6pjE5oioMoAPY=;
        b=AdGmymH4HxbLfrtNZlPB1fTJLsimyxW1a7WM3fDZtX5MguFfRkWciHCS7umUX23PaE
         UFBLjpFLKLI2SqO6wGj3QIY7s7dBYsvLCs9dqkK4kgMOtHZ2hweUQqnzehVq84ALQ+/6
         JDMJwZ8LiWnylNPdiAnBLiX8sS5/ATnL+daXo2wJ2v5HDLjVUsuALopmNPIMNXv0brMp
         S4QdkGfsc9Dn9YFLp/rD/W0bt8SPnC9ERzHsYV2Wcj6N2yO2Bhc0HbGX6oDCjC20L27I
         gLQKUuLtnir65pOByoCRbq0SthQExrDNxbvP6F8qmLpJpRRNY8VUZDxhtOoPeOpwZZNA
         3qLw==
X-Gm-Message-State: AOAM532bQKLg5J5NlNRwaAQLZLJiQsxD9t2srVaPBxS+kWkf6ypxN7FJ
        tJu2SP0vb1XBJsfBGdcT3E0=
X-Google-Smtp-Source: ABdhPJy/Saqg7s5/Xx6OiPJkkhUC9ul7t4rrjSgher/YbcDRTvXEF/BFmR9DPeJ7wFZgXsnnRU6yKA==
X-Received: by 2002:a65:420d:: with SMTP id c13mr4328951pgq.370.1618369974274;
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v2 6/8] MIPS: pci-legacy: remove redundant info messages
Date:   Tue, 13 Apr 2021 20:12:38 -0700
Message-Id: <20210414031240.313852-7-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
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

