Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7743A596F
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jun 2021 17:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhFMP6o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Jun 2021 11:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhFMP6n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Jun 2021 11:58:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68B5C061574
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 08:56:28 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id s70-20020a1ca9490000b02901a589651424so8303326wme.0
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U+7KMa4x9I3RPmCk8B+EWnxSMOxLFlMAChoVtPf3+Qw=;
        b=sRm83kHP9pj1mh8p6uprSQKuZQ6IIpJJsIzwqx/4odMzL6Wu/nmAdp3Wo0rDx0BoS1
         JHba3I5flCsPV8zuUgmX7K2JLppXNEA4tUYKwk22HuaHtMjDEIz0Vk1r/c7UVSCfsyaR
         7kwV5kJk9EEbcTWU321+6uORYPzY/D9/rOHZSu5JU1YeXs3m8hIAiJP0TmtLWRPjX+51
         im/kshnLGPKDHrlSS6fADgYx2UpmfN8pm9nP4GR6CD9dnDGbjHXjYnqsRCBWIQMPkOsM
         DUoFyQHWWj1KYkeiva2qpPztAMaqD193akrzzL4nJCTieV03+mSgs8zhBdZR5bxxUA9V
         xV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U+7KMa4x9I3RPmCk8B+EWnxSMOxLFlMAChoVtPf3+Qw=;
        b=iBoFSr8SFg1KVYu4ak+STLn4OjOpigGtnsSmzGculDxc4s6vEiMaUmVHGH+1qwpwWT
         ICtcHTJtMJUXMzcOLPpKhkJlJMB1AxjqYVOVe7hwMvWXUOxaAo+9OJnTHSOLsWFs1e+V
         D2UQRTrpJ7E4nRHUTngx8LDwgCBd89Nu5Xo8opmLi82lT1w78XuW3P1j4Gc9tQuPAE9B
         R3calr1JQRuuE9E8oxvXQEkF0BtwEE6INjroAW3fEfGFl71b4qBcqC9XzyMQJKLun0L3
         5aT5BkWtes7e7DAmmnC3sY4EC1IySETO6DglccqKlYGd3FtFLFWJOZUhuyIO1qiptj8J
         s8gA==
X-Gm-Message-State: AOAM531ym1bXA/aDQDgd37N1EEmg4S/ByQoK4IZ9yg8zg6lwYaZhAwFz
        FfS1kqzW71iBCTU7XGf++qo=
X-Google-Smtp-Source: ABdhPJzQDoc9eMI4+h5ulG+lDOYp9zHS4rPC0Q1y6HneU/Rmfd5s6SYJsNeVGLIe5V3qB8L8sP6OAw==
X-Received: by 2002:a05:600c:230b:: with SMTP id 11mr12292290wmo.81.1623599787334;
        Sun, 13 Jun 2021 08:56:27 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id g17sm17539746wrh.72.2021.06.13.08.56.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Jun 2021 08:56:27 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH 2/3] staging: mt7621-pci: remove 'mt7621_pci_parse_request_of_pci_ranges'
Date:   Sun, 13 Jun 2021 17:56:22 +0200
Message-Id: <20210613155623.17233-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
References: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After 'PCI_IOBASE' is defined for ralink, ranges are properly parsed
using pci generic APIS and there is no need to parse anything
manually. So function 'mt7621_pci_parse_request_of_pci_ranges'
used for this can be enterely removed. Since we have to configure
iocu memory regions and pci io windows resources must be retrieved
accordly from 'bridge->windows' but there is no need to store
anything as driver private data.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 100 +++++++-----------------
 1 file changed, 27 insertions(+), 73 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index b0b5700cbfec..691030e1a5ed 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -86,10 +86,7 @@ struct mt7621_pcie_port {
 /**
  * struct mt7621_pcie - PCIe host information
  * @base: IO Mapped Register Base
- * @io: IO resource
- * @mem: pointer to non-prefetchable memory resource
  * @dev: Pointer to PCIe device
- * @io_map_base: virtual memory base address for io
  * @ports: pointer to PCIe port information
  * @resets_inverted: depends on chip revision
  * reset lines are inverted.
@@ -97,9 +94,6 @@ struct mt7621_pcie_port {
 struct mt7621_pcie {
 	void __iomem *base;
 	struct device *dev;
-	struct resource io;
-	struct resource *mem;
-	unsigned long io_map_base;
 	struct list_head ports;
 	bool resets_inverted;
 };
@@ -213,75 +207,33 @@ static inline void mt7621_control_deassert(struct mt7621_pcie_port *port)
 		reset_control_assert(port->pcie_rst);
 }
 
-static void setup_cm_memory_region(struct mt7621_pcie *pcie)
+static int setup_cm_memory_region(struct pci_host_bridge *host)
 {
-	struct resource *mem_resource = pcie->mem;
+	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
 	struct device *dev = pcie->dev;
+	struct resource_entry *entry;
 	resource_size_t mask;
 
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (!entry) {
+		dev_err(dev, "Cannot get memory resource\n");
+		return -EINVAL;
+	}
+
 	if (mips_cps_numiocu(0)) {
 		/*
 		 * FIXME: hardware doesn't accept mask values with 1s after
 		 * 0s (e.g. 0xffef), so it would be great to warn if that's
 		 * about to happen
 		 */
-		mask = ~(mem_resource->end - mem_resource->start);
+		mask = ~(entry->res->end - entry->res->start);
 
-		write_gcr_reg1_base(mem_resource->start);
+		write_gcr_reg1_base(entry->res->start);
 		write_gcr_reg1_mask(mask | CM_GCR_REGn_MASK_CMTGT_IOCU0);
 		dev_info(dev, "PCI coherence region base: 0x%08llx, mask/settings: 0x%08llx\n",
 			 (unsigned long long)read_gcr_reg1_base(),
 			 (unsigned long long)read_gcr_reg1_mask());
 	}
-}
-
-static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
-{
-	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
-	struct device *dev = pcie->dev;
-	struct device_node *node = dev->of_node;
-	struct of_pci_range_parser parser;
-	struct resource_entry *entry;
-	struct of_pci_range range;
-	LIST_HEAD(res);
-
-	if (of_pci_range_parser_init(&parser, node)) {
-		dev_err(dev, "missing \"ranges\" property\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * IO_SPACE_LIMIT for MIPS is 0xffff but this platform uses IO at
-	 * upper address 0x001e160000. of_pci_range_to_resource does not work
-	 * well for MIPS platforms that don't define PCI_IOBASE, so set the IO
-	 * resource manually instead.
-	 */
-	for_each_of_pci_range(&parser, &range) {
-		switch (range.flags & IORESOURCE_TYPE_BITS) {
-		case IORESOURCE_IO:
-			pcie->io_map_base =
-				(unsigned long)ioremap(range.cpu_addr,
-						       range.size);
-			pcie->io.name = node->full_name;
-			pcie->io.flags = range.flags;
-			pcie->io.start = range.cpu_addr;
-			pcie->io.end = range.cpu_addr + range.size - 1;
-			pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
-			set_io_port_base(pcie->io_map_base);
-			break;
-		}
-	}
-
-	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
-	if (!entry) {
-		dev_err(dev, "Cannot get memory resource");
-		return -EINVAL;
-	}
-
-	pcie->mem = entry->res;
-	pci_add_resource(&res, &pcie->io);
-	pci_add_resource(&res, entry->res);
-	list_splice_init(&res, &host->windows);
 
 	return 0;
 }
@@ -510,15 +462,23 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 	write_config(pcie, slot, PCIE_FTS_NUM, val);
 }
 
-static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
+static int mt7621_pcie_enable_ports(struct pci_host_bridge *host)
 {
+	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
 	struct device *dev = pcie->dev;
 	struct mt7621_pcie_port *port;
+	struct resource_entry *entry;
 	int err;
 
+	entry = resource_list_first_type(&host->windows, IORESOURCE_IO);
+	if (!entry) {
+		dev_err(dev, "Cannot get io resource\n");
+		return -EINVAL;
+	}
+
 	/* Setup MEMWIN and IOWIN */
 	pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE);
-	pcie_write(pcie, pcie->io.start, RALINK_PCI_IOBASE);
+	pcie_write(pcie, entry->res->start, RALINK_PCI_IOBASE);
 
 	list_for_each_entry(port, &pcie->ports, list) {
 		if (port->enabled) {
@@ -581,25 +541,19 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = mt7621_pci_parse_request_of_pci_ranges(bridge);
-	if (err) {
-		dev_err(dev, "Error requesting pci resources from ranges");
-		goto remove_resets;
-	}
-
-	/* set resources limits */
-	ioport_resource.start = pcie->io.start;
-	ioport_resource.end = pcie->io.end;
-
 	mt7621_pcie_init_ports(pcie);
 
-	err = mt7621_pcie_enable_ports(pcie);
+	err = mt7621_pcie_enable_ports(bridge);
 	if (err) {
 		dev_err(dev, "Error enabling pcie ports\n");
 		goto remove_resets;
 	}
 
-	setup_cm_memory_region(pcie);
+	err = setup_cm_memory_region(bridge);
+	if (err) {
+		dev_err(dev, "Error setting up iocu mem regions\n");
+		goto remove_resets;
+	}
 
 	return mt7621_pcie_register_host(bridge);
 
-- 
2.25.1

