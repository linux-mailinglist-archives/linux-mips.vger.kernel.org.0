Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2BF35D7E6
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244468AbhDMGW1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344965AbhDMGW0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:26 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358BAC061756;
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id i4so7928205pjk.1;
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FtKBAsvc7cP/9k3yGtb2tbU5XcFAujb/4U8g9ZMjXlc=;
        b=YZ3upqSWzBebTRthDEIPNBTcOnRSB9M7m5Ojkb4A3SuvRLMFSVJ+wfZG7i20LQmjcI
         IYPrkiecnpC29BCtWvsim39EE6VcyQyyKOvY1/sETJ1ua/9Hci0diqRw2jKu6WDVpBof
         0QE4++NYYlWSKBojOAUx7BDtls6bkyneAwpiYRJCWzraoxnzyD29saKVqosTKe4WKwSN
         PWdwPNog+pqjiTKB0dO4Z0bno8L0IHQb3CktgqyxcXG6J0dK72uMF7RY64gjeWA5B6Uz
         kxIB0USKLJnPB4o0fug6OWW4+8e4b2WB8ZXNfNGFK1tVxsgqw21e8G7anlZCD3N2780/
         Zwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FtKBAsvc7cP/9k3yGtb2tbU5XcFAujb/4U8g9ZMjXlc=;
        b=eobuS5KMk52ImhcNHfKQN/3ktsNVlBnUUIYmSWA4WRHRrA2epqXwYwPg3kzXQsW8j9
         lx5XTyWySZ1RRBie2pAnaQQZrDn/NiPp+m5Kg3FrwEYzQYES6wrfKe1J4df6Ah2m0WRw
         /hIIFIYkdOx3oXhxHzAW+kAOsUDS9A8loul92hL02drzIDhhTq1H1ilV9LD4ng/2w5Q9
         tO/YljMy0CcAU19/0iMvmF/YUbqz+zaVqj2bfv7BOIwFh5RrfdpDM7IwGIYJ79ywZKdT
         GBJo7CU42q8eFh94ZFAkbcl6Q5D69X7e3UrNp/KHkq8dMisuilwe/ZyK12IbXEXTMf1j
         sCmg==
X-Gm-Message-State: AOAM530V4+kysyuz0ug6ZheXz3LRGOShaYQ/4M1FzZezWZUDuPSl1ihx
        OhV6GqKTBab1kkwdqnDJVGw=
X-Google-Smtp-Source: ABdhPJyQnC+BBsdjOUgQP6rlKPhZD8T0oolxh6oGOm9hXMhj2DlSHkqm2lh6UzRW4ns4pU53X9FfHg==
X-Received: by 2002:a17:90a:e28b:: with SMTP id d11mr3198895pjz.53.1618294926838;
        Mon, 12 Apr 2021 23:22:06 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:06 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: [PATCH 2/8] MIPS: pci-rt2880: remove unneeded locks
Date:   Mon, 12 Apr 2021 23:21:40 -0700
Message-Id: <20210413062146.389690-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
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
index 19f7860fb28b..b4ee07cbcf2a 100644
--- a/arch/mips/pci/pci-rt2880.c
+++ b/arch/mips/pci/pci-rt2880.c
@@ -41,7 +41,6 @@
 #define RT2880_PCI_REG_ARBCTL		0x80
 
 static void __iomem *rt2880_pci_base;
-static DEFINE_SPINLOCK(rt2880_pci_lock);
 
 static u32 rt2880_pci_reg_read(u32 reg)
 {
@@ -63,7 +62,6 @@ static inline u32 rt2880_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
 static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
-	unsigned long flags;
 	u32 address;
 	u32 data;
 	int busn = 0;
@@ -74,10 +72,8 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
 	address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
 					 where);
 
-	spin_lock_irqsave(&rt2880_pci_lock, flags);
 	rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
 	data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
-	spin_unlock_irqrestore(&rt2880_pci_lock, flags);
 
 	switch (size) {
 	case 1:
@@ -97,7 +93,6 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
 static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
 				   int where, int size, u32 val)
 {
-	unsigned long flags;
 	u32 address;
 	u32 data;
 	int busn = 0;
@@ -108,7 +103,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
 	address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
 					 where);
 
-	spin_lock_irqsave(&rt2880_pci_lock, flags);
 	rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
 	data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
 
@@ -127,7 +121,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	rt2880_pci_reg_write(data, RT2880_PCI_REG_CONFIG_DATA);
-	spin_unlock_irqrestore(&rt2880_pci_lock, flags);
 
 	return PCIBIOS_SUCCESSFUL;
 }
@@ -159,31 +152,25 @@ static struct pci_controller rt2880_pci_controller = {
 
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

