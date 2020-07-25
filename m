Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C7222D39C
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 03:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgGYBpz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 21:45:55 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41848 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgGYBpy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 21:45:54 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 330641FECB;
        Sat, 25 Jul 2020 01:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595641554; bh=JeCObX3adR6UXgnkTYgrJ8izWYkQo2Pk6pczHjklxIQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xaiSNwckWUf0H8GEOsLkKXU+ocTSDQMWXi9Hz20ohCnWxopu1ECv3xijSHB5C07sS
         cPBTZ7Y+ZbyzagAE491c16Uhm0qk4xiujU7V9a2qZIDIkCHYC7aWFyKJ86beRtjtDm
         UpSZAWGGimp7YWOWOD2wBscrUoK6cMl8tJ/B8D2ePrfwBuciZf8bmr20Rk/VraKk6w
         XK+VQ8SxHCJUKPB82K73o9vOWWivJYUgfA8UqXzUCRqZ+jU9gnTJM7zujpDbVUDiS4
         mr4g/5agQ5e+GfYlDZe3PQ0fIpcdaxXYnu98XgD9KWjhZJtzpEmqRNusBlw5k+nSt1
         z+n1zodvqcxeQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] of_address: Add bus type match for pci ranges parser
Date:   Sat, 25 Jul 2020 09:45:15 +0800
Message-Id: <20200725014529.1143208-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
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

