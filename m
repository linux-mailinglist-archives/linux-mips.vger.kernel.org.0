Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F873A5FB0
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 12:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhFNKI3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 06:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbhFNKI2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 06:08:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE254C061574
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:06:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id c9so13872865wrt.5
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U+7KMa4x9I3RPmCk8B+EWnxSMOxLFlMAChoVtPf3+Qw=;
        b=ri7gFhMP/nBzhc/hFq0ftuZCNTZIix/tCuEuVdnuYr8GKDRoOjxKqtvj8k+u5J+oIP
         Y+0sp5k6yHZwvPHT0OCB504wk8e77SY5HoswYwsTvjAHriY8DCgljE5Yi/UM36sfNtoD
         h0RzL2u44+7mnWAmae5Ou5ZVvywhUrDlEqlggwcwInXMsdmopeHKQFz2sBma0VFQfoXT
         QF/M9AnD/Gq4YgnDHkJiTtxROqys3qIG9dHjKEWjrjClCO0n5aGLun8F7t/fGxFdA1gL
         YfG8+Tn6LKY790iGi6mYICwnVYiosiT0XNNa96sadV9iU6H6pQ9/5SLdIzvUbL32ve8J
         L3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U+7KMa4x9I3RPmCk8B+EWnxSMOxLFlMAChoVtPf3+Qw=;
        b=FabaeMBUhfpZItwB+YIGaGsRKhXD39g6U6jx7oL3zTj/GkqrMxemAeYPBFMm7Xdvtu
         UT3c5NDg7cUHUPh8oEUPSkN1MLpmrT2HUaGhvIMEztxqJ6Xedfi4j6J2j+iUDJh061xG
         fmk7co54vcEi7+bcDQcsYmiBp969fUzNfHGMpuvt4lLbAmEaM3NC/IKBeFi4E7BBXCwv
         zzIfgwG0GEwU5u1Zid49In37we63ueG1W96xSjFZUHj+mBgDlji1HAOWFi7oyLNdSxHi
         JzwL6tZ10BxBoyKt13CjRi2LPccIx/z1R8QT9mTV1U4R98nzSf5WCllzS6nZDiEJLWLE
         tldg==
X-Gm-Message-State: AOAM5335/jfi4shf8ZVfT906mlUxjogw1GCSE77v637T51bSxY7QxmYT
        6cvVKFbKrvJ1lkYBCX/bv2I=
X-Google-Smtp-Source: ABdhPJzGDQwVT0svJUq+IYNQz6SmADbXkgPWvW/PKnib42t3b8iw7xJUEdpzQex89k3Qdho4yExDGA==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr17788354wrs.355.1623665180889;
        Mon, 14 Jun 2021 03:06:20 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k5sm16476566wrv.85.2021.06.14.03.06.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:06:20 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH v2 2/3] staging: mt7621-pci: remove 'mt7621_pci_parse_request_of_pci_ranges'
Date:   Mon, 14 Jun 2021 12:06:16 +0200
Message-Id: <20210614100617.28753-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
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

