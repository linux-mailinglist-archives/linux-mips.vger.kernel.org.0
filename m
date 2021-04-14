Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B3835EB4E
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhDNDNu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbhDNDNl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:41 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D964C061343;
        Tue, 13 Apr 2021 20:12:56 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id p12so13400066pgj.10;
        Tue, 13 Apr 2021 20:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdjBbv3W8zOpO+oAoTMTaxs43N139rhZL18fdEB0EnQ=;
        b=JjTjIJtUgdP9wPhG5iHFZeDhAi/giO6t/melgnyajlIUqZR7gJY4heAroAI4/D9xNH
         6jkPcZjaq7WnZAZ9HzBGReV32crQh8BdHt396ECFJc9aZ264AVGvYpgw5p7aZPcOUKKc
         OixYrPpx4K75VxK4oR7PrFTZF/OzZmD780Hn/lviljUBFGp1Y12L6OwPSWDb7zViZeKe
         BnYjBsMiYVDld0M2uS+82U10q96redDWQuWw8gX5wIcyS26Ncc+nzDviuPEuBDPfJEO6
         Nsi3qF8AtA10Effjh1mk5o+8PfemzedomPw8cd8rOvSYHbQzlELztEtWnlzQ5ForTkzq
         7P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdjBbv3W8zOpO+oAoTMTaxs43N139rhZL18fdEB0EnQ=;
        b=T7br8S3JXgRdO99XJxr0gxM4DkTIDDiTrrLt9LXxisWekum3hLdnvzKyyb9/zCyHxF
         I3YTxZBCLpBdbl+OhPTqSGm1dvbZW2P6k8Iz1ab3lGVsl/xAvaUkXD4/8pYjrQfOsTpg
         d74wfO7pqMwJHYTxUPX4yiFbR9eSlrGW26geH/3TRyJ7RNfA73lceH9L/5+7apsGze0w
         8Tzx039qHHGtns0kjeJV537SANlFwQttvr7xDdzRdOx5UGrR1lM6LPQj1XZGHXOrfqXC
         nbPCZOU+rHc+wd5fVfcupGDWU9q8Y1zIQ8SFota71gQglMmU1/iP7DZdoPktg32dZlUZ
         eflw==
X-Gm-Message-State: AOAM531o+VcB3q9Lch3GFEwr2L5hYRYoRB5staL7BZ7s0J/JdbYoiI1L
        V1x/aRxMt4ou+SS29HlctiOILfAITrsy790G
X-Google-Smtp-Source: ABdhPJxFD1I9Zx+je5HYP4AF3SFTpE2lxP6xYXGztExaw88d+1NCy/E6D4qUklY41kunmeFeOVrtxQ==
X-Received: by 2002:a63:d05:: with SMTP id c5mr5250463pgl.76.1618369976021;
        Tue, 13 Apr 2021 20:12:56 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:55 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 8/8] MIPS: pci-legacy: use generic pci_enable_resources
Date:   Tue, 13 Apr 2021 20:12:40 -0700
Message-Id: <20210414031240.313852-9-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
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

