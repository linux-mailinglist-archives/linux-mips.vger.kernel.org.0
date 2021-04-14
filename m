Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19BE35EB44
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhDNDNn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbhDNDNh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C57EC06175F;
        Tue, 13 Apr 2021 20:12:51 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id o123so12788726pfb.4;
        Tue, 13 Apr 2021 20:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I49umDhAy7qrhKAAA8aKGdOxSjLinV+njhS2bMCqgfY=;
        b=bhkXHTTqR/s8ug91Yn6OIvjfTBzExldD6y/nmhUcOGl4ldG87l65Wp2xO+jmmvQWzw
         pwV9SGjcB8Z4JRBWaoMjBX5z2MTqPNTP9sWxcDsISNyjPeak35OVooZh5gphCyJjPXCp
         lvuClb6b9GhyMJtrlYDWXmJTGAiOJ7LBbHhECfmeyUVr6AE693D9h61SkGXu+QnHivAl
         lzWgr7XH/20abQPSatBAE31yB7V6ZAcnSCMAz1L/5TUdJhhBLDLe6W3G68cmS4N2zAuo
         3Db6/gEr3yfyUVIVwDG5h5kRse5LNB1kIasLHoL87B+41/n9lgZ+UInlw3cpk1brTXSO
         5qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I49umDhAy7qrhKAAA8aKGdOxSjLinV+njhS2bMCqgfY=;
        b=crkgtbzcBo0UH7ReywHJeQmLFoXppGOWV5BRWC0t4LfLytfCfxgN3A7dh9VhQOsuAk
         Am0RNb+LI+kGA4dZMxbHZ4TOUff3Z9DKkUtiohLlrLP6dIfNRYwyMlRCsRm59gfrBtFq
         Y+ZhIHQv0frRA0fLMEzXQGdqrYbn8XlAmgHB1wJk382VMGaR6CG/Z9jFigbXmrp/koED
         JTwIe3urH6nQ7dSAQXU5elJ2wGBDKV/tKHaFYbaML9yP7gQVqOQ0e7OSZ7Hr2t8P9hj+
         9XSqgIQrgMaJ+NAiXxMhhoTsv0WO6xHZhpGq3nP07DEBzxFfNCtCk4w+auZwTgJy7/sg
         2zmw==
X-Gm-Message-State: AOAM532X+YK2hAySdLYkGhQO27I2WLg9tphcC4d+vBI67YEfd8926RmZ
        B0xWo0kmX+FVvXXn8ndj9qg=
X-Google-Smtp-Source: ABdhPJw9ED5YxT7WO7q0lRu/5avk8uwbp+MVNObH6Hg4mcHDJQVZCFIW4KP2A1DIN+tLLAOHGO0R4g==
X-Received: by 2002:a63:130b:: with SMTP id i11mr15243105pgl.302.1618369971232;
        Tue, 13 Apr 2021 20:12:51 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:50 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v2 2/8] MIPS: pci-rt2880: remove unneeded locks
Date:   Tue, 13 Apr 2021 20:12:34 -0700
Message-Id: <20210414031240.313852-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mirror pci-rt3883 fix from commit e5067c718b3a ("MIPS: pci-rt3883:
Remove odd locking in PCI config space access code"). pci-rt2880 shares
the driver layout with pci-rt3883 and the same reasons apply.

Caller (generic PCI code) already does proper locking, so no need to add
another one here. Local PCI read/write functions are never called
simultaneously, also they do not require synchronization with the PCI
controller ops, since they are used before the controller registration.

Suggested-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/pci/pci-rt2880.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/mips/pci/pci-rt2880.c b/arch/mips/pci/pci-rt2880.c
index f1538d2be89e..e9dd01431f21 100644
--- a/arch/mips/pci/pci-rt2880.c
+++ b/arch/mips/pci/pci-rt2880.c
@@ -41,7 +41,6 @@
 #define RT2880_PCI_REG_ARBCTL		0x80
 
 static void __iomem *rt2880_pci_base;
-static DEFINE_SPINLOCK(rt2880_pci_lock);
 
 static u32 rt2880_pci_reg_read(u32 reg)
 {
@@ -63,17 +62,14 @@ static inline u32 rt2880_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
 static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
-	unsigned long flags;
 	u32 address;
 	u32 data;
 
 	address = rt2880_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
 					 PCI_FUNC(devfn), where);
 
-	spin_lock_irqsave(&rt2880_pci_lock, flags);
 	rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
 	data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
-	spin_unlock_irqrestore(&rt2880_pci_lock, flags);
 
 	switch (size) {
 	case 1:
@@ -93,14 +89,12 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
 static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
 				   int where, int size, u32 val)
 {
-	unsigned long flags;
 	u32 address;
 	u32 data;
 
 	address = rt2880_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
 					 PCI_FUNC(devfn), where);
 
-	spin_lock_irqsave(&rt2880_pci_lock, flags);
 	rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
 	data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
 
@@ -119,7 +113,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	rt2880_pci_reg_write(data, RT2880_PCI_REG_CONFIG_DATA);
-	spin_unlock_irqrestore(&rt2880_pci_lock, flags);
 
 	return PCIBIOS_SUCCESSFUL;
 }
@@ -151,31 +144,25 @@ static struct pci_controller rt2880_pci_controller = {
 
 static inline u32 rt2880_pci_read_u32(unsigned long reg)
 {
-	unsigned long flags;
 	u32 address;
 	u32 ret;
 
 	address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
 
-	spin_lock_irqsave(&rt2880_pci_lock, flags);
 	rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
 	ret = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
-	spin_unlock_irqrestore(&rt2880_pci_lock, flags);
 
 	return ret;
 }
 
 static inline void rt2880_pci_write_u32(unsigned long reg, u32 val)
 {
-	unsigned long flags;
 	u32 address;
 
 	address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
 
-	spin_lock_irqsave(&rt2880_pci_lock, flags);
 	rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
 	rt2880_pci_reg_write(val, RT2880_PCI_REG_CONFIG_DATA);
-	spin_unlock_irqrestore(&rt2880_pci_lock, flags);
 }
 
 int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-- 
2.31.1

