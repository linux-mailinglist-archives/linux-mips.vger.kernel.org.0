Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A42D35D7F0
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344998AbhDMGWc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344988AbhDMGW3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6C4C061756;
        Mon, 12 Apr 2021 23:22:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d8so7634243plh.11;
        Mon, 12 Apr 2021 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdjBbv3W8zOpO+oAoTMTaxs43N139rhZL18fdEB0EnQ=;
        b=D2yYBGSHV1ar0ltzK0Nq+lwi3hBMgls83vEBeh+MKJJG3BokCS5iDjiHuh94qxASU+
         USAtJma2DuynLgwpcKNppc7AbOQk/GzjrGGdfYBbeDjzGY0VoE+PUX3fB7cLwEJSP/9d
         gqYldt4Tv149+SzK0v6UTk7VWWelg6wbeUdOcwPFekzOkh4JJ7XI8gLKILTju38GeO+F
         eo2kCBmCkEObvWhhdojbV+4q1OHMlnUesShGLPnfwHATWNX/zlDRL/gDHlb0qInU/86B
         3ZCcmUbetqvtHDRCr0c4kCH8lDiNzY2YZNtlvUNLBr5CfiVG1CwyGpkKt+zdCoyoOTVq
         9ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdjBbv3W8zOpO+oAoTMTaxs43N139rhZL18fdEB0EnQ=;
        b=mZlMPQCV3hGBegzPoOGDi5DtbrMZMfG1DEj/C//GzVH5c52TF7ZkumYzvvzekGyRbw
         ZGyIkSXTC0+jLNoPuqNlkXicUfOj58sbv8tCQ5h2WGG2nqOvF2TV8jkUGl3gzT97QcS+
         U5uujIDvIeeE/dIe2hp9w/Kxql72cP7XIH5F6A8VXLztEDQf92Tj2yDf2rZJ4211wImt
         gndxQ6Ladp5dlyvoHjL6yiGDmj9UDBWACluTTr40q6lDNGnjxw3kNcmVx88lBs4rD/vR
         wBly71pZmO1ZnKtPLYkWYA5Byf2psC3l3NUSmkdWBIygq1D4lqaWYK558wiIPl47QYLL
         RssA==
X-Gm-Message-State: AOAM531IreVEn7RqpQDAHJzeaqhsJ5iayzjW3zTcYgAaXrZRulUKQASW
        HXHDpuALHAqoEnuNY32AUhg=
X-Google-Smtp-Source: ABdhPJyuAZzzouB2S51KR//Ovy8FgwhC6NRgjMjWcEEEeeWmHeNQbXZfS6nX8SAnTwsn5MUhiHX6Ng==
X-Received: by 2002:a17:902:d104:b029:eb:6d3:1436 with SMTP id w4-20020a170902d104b02900eb06d31436mr7254886plw.1.1618294930190;
        Mon, 12 Apr 2021 23:22:10 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 8/8] MIPS: pci-legacy: use generic pci_enable_resources
Date:   Mon, 12 Apr 2021 23:21:46 -0700
Message-Id: <20210413062146.389690-9-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Follow the reasoning from commit 842de40d93e0 ("PCI: add generic
pci_enable_resources()"):

  The only functional difference from the MIPS version is that the
  generic one uses "!r->parent" to check for resource collisions
  instead of "!r->start && r->end".

That should have no effect on any pci-legacy driver.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/pci/pci-legacy.c | 40 ++------------------------------------
 1 file changed, 2 insertions(+), 38 deletions(-)

diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index 78c22987bef0..c24226ea0a6e 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -241,47 +241,11 @@ static int __init pcibios_init(void)
 
 subsys_initcall(pcibios_init);
 
-static int pcibios_enable_resources(struct pci_dev *dev, int mask)
-{
-	u16 cmd, old_cmd;
-	int idx;
-	struct resource *r;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	old_cmd = cmd;
-	for (idx=0; idx < PCI_NUM_RESOURCES; idx++) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1<<idx)))
-			continue;
-
-		r = &dev->resource[idx];
-		if (!(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
-			continue;
-		if ((idx == PCI_ROM_RESOURCE) &&
-				(!(r->flags & IORESOURCE_ROM_ENABLE)))
-			continue;
-		if (!r->start && r->end) {
-			pci_err(dev,
-				"can't enable device: resource collisions\n");
-			return -EINVAL;
-		}
-		if (r->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (r->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-	if (cmd != old_cmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", old_cmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-	return 0;
-}
-
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
-	int err;
+	int err = pci_enable_resources(dev, mask);
 
-	if ((err = pcibios_enable_resources(dev, mask)) < 0)
+	if (err < 0)
 		return err;
 
 	return pcibios_plat_dev_init(dev);
-- 
2.31.1

