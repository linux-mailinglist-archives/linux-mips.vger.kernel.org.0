Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBE1230E08
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 17:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730978AbgG1Phd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 11:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730991AbgG1Pha (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 11:37:30 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9002C061794;
        Tue, 28 Jul 2020 08:37:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id D3C771FF09;
        Tue, 28 Jul 2020 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595950648; bh=VLcqu2Ivh35PD2HBiBBKha1ArumuZ3NeJK/M/tYHAUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VN30X+2rK223FQEmIG/zmekak9iwkE/qBoxVc/ine1a34ms8nShfG+lLO0gKYFVaq
         zZCMvzJAliNesI1YBu5DOzEZybtkbohbzci2wFdrAmUqmhVeksKwmjaBCGKSQ/cud5
         HGoI0hK2ub0VGYSrR28qEi6ncdUNFLDfKhZSqphbkX8Efaa5ZzvUHp3sFh8ZewCyNr
         36xqEMinFWXecg1j+MG6gVefYvrIk1R9wti473/k4YC+fQVLBPUU9Ci4Vx5Egl2YMW
         G7fgPF2pVOOMPJgIvH0Ek/dqPIcvhkrt4A1FODgRpviajAgcv6JHR73kOtcY1aucx1
         CGg6LXMX6GTUw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] of_address: Add bus type match for pci ranges parser
Date:   Tue, 28 Jul 2020 23:36:55 +0800
Message-Id: <20200728153708.1296374-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So the parser can be used to parse range property of ISA bus.

As they're all using PCI-like method of range property, there is no need
start a new parser.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>

--
v2: Drop useless check, fix some na for bus_addr
	add define of of_range_parser_init according to
	Rob's suggestion.
v3: Abstract out has_flags. simplify define.
---
 drivers/of/address.c       | 29 +++++++++++++++++------------
 include/linux/of_address.h |  4 ++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8eea3f6e29a4..813936d419ad 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -49,6 +49,7 @@ struct of_bus {
 	u64		(*map)(__be32 *addr, const __be32 *range,
 				int na, int ns, int pna);
 	int		(*translate)(__be32 *addr, u64 offset, int na);
+	bool	has_flags;
 	unsigned int	(*get_flags)(const __be32 *addr);
 };
 
@@ -364,6 +365,7 @@ static struct of_bus of_busses[] = {
 		.count_cells = of_bus_pci_count_cells,
 		.map = of_bus_pci_map,
 		.translate = of_bus_pci_translate,
+		.has_flags = true,
 		.get_flags = of_bus_pci_get_flags,
 	},
 #endif /* CONFIG_PCI */
@@ -375,6 +377,7 @@ static struct of_bus of_busses[] = {
 		.count_cells = of_bus_isa_count_cells,
 		.map = of_bus_isa_map,
 		.translate = of_bus_isa_translate,
+		.has_flags = true,
 		.get_flags = of_bus_isa_get_flags,
 	},
 	/* Default */
@@ -698,9 +701,10 @@ static int parser_init(struct of_pci_range_parser *parser,
 
 	parser->node = node;
 	parser->pna = of_n_addr_cells(node);
-	parser->na = of_bus_n_addr_cells(node);
-	parser->ns = of_bus_n_size_cells(node);
 	parser->dma = !strcmp(name, "dma-ranges");
+	parser->bus = of_match_bus(node);
+
+	parser->bus->count_cells(parser->node, &parser->na, &parser->ns);
 
 	parser->range = of_get_property(node, name, &rlen);
 	if (parser->range == NULL)
@@ -732,6 +736,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	int na = parser->na;
 	int ns = parser->ns;
 	int np = parser->pna + na + ns;
+	int busflag_na = 0;
 
 	if (!range)
 		return NULL;
@@ -739,12 +744,13 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + np > parser->end)
 		return NULL;
 
-	if (parser->na == 3)
-		range->flags = of_bus_pci_get_flags(parser->range);
-	else
-		range->flags = 0;
+	range->flags = parser->bus->get_flags(parser->range);
+
+	/* A extra cell for resource flags */
+	if (parser->bus->has_flags)
+		busflag_na = 1;
 
-	range->pci_addr = of_read_number(parser->range, na);
+	range->bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
 
 	if (parser->dma)
 		range->cpu_addr = of_translate_dma_address(parser->node,
@@ -759,11 +765,10 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	/* Now consume following elements while they are contiguous */
 	while (parser->range + np <= parser->end) {
 		u32 flags = 0;
-		u64 pci_addr, cpu_addr, size;
+		u64 bus_addr, cpu_addr, size;
 
-		if (parser->na == 3)
-			flags = of_bus_pci_get_flags(parser->range);
-		pci_addr = of_read_number(parser->range, na);
+		flags = parser->bus->get_flags(parser->range);
+		bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
 		if (parser->dma)
 			cpu_addr = of_translate_dma_address(parser->node,
 					parser->range + na);
@@ -774,7 +779,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 
 		if (flags != range->flags)
 			break;
-		if (pci_addr != range->pci_addr + range->size ||
+		if (bus_addr != range->bus_addr + range->size ||
 		    cpu_addr != range->cpu_addr + range->size)
 			break;
 
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 763022ed3456..88bc943405cd 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -6,8 +6,11 @@
 #include <linux/of.h>
 #include <linux/io.h>
 
+struct of_bus;
+
 struct of_pci_range_parser {
 	struct device_node *node;
+	struct of_bus *bus;
 	const __be32 *range;
 	const __be32 *end;
 	int na;
@@ -119,6 +122,7 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
 	return NULL;
 }
 #endif
+#define of_range_parser_init of_pci_range_parser_init
 
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
 extern const __be32 *of_get_pci_address(struct device_node *dev, int bar_no,
-- 
2.28.0.rc1

