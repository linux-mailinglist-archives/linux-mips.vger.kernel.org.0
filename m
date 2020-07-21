Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD462281CC
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 16:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgGUOSB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 10:18:01 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41522 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOSB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jul 2020 10:18:01 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id CC7861FEB5;
        Tue, 21 Jul 2020 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595341080; bh=D0DW9zGWsTVh06Cmjv5mAPfrY20c/r0QK5RxrIUjHH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JYF7CgUk4I+/NMzJfGochZ/0hyyhwBvkeprmNQE0+bvsJAxJgBt6FxK/o54cJhoWg
         TwauTtBohj2frnRGq66nLy1CqB/XdV3WBt2oG4DaN30WF5k/MJVSVi7ifVh7onYMZ/
         5egWjlzkyY54sVsgEfOTOAEwRELqajYizeGBOvMsOu1QPi44IUQo6PQVM8rQThkt5t
         iewih0qNvFQ7KsF2OvjXsRsh1CSB/tAlIfYM34FV0mQWtvyjUUNsPbFKK5lzfbGkp4
         KVTGCQVlwjwS0Z+fw++qTXdhSacJn+23DVd9lyIGKgfLuKXZfvNAFIGiayvl0fBeA1
         +K9pO6R6vJFFQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] of_address: Add bus type match for pci ranges parser
Date:   Tue, 21 Jul 2020 22:17:29 +0800
Message-Id: <20200721141742.996350-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
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
---
 drivers/of/address.c       | 27 +++++++++++++++------------
 include/linux/of_address.h |  5 +++++
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8eea3f6e29a4..7406636cea87 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -698,9 +698,10 @@ static int parser_init(struct of_pci_range_parser *parser,
 
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
@@ -732,6 +733,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	int na = parser->na;
 	int ns = parser->ns;
 	int np = parser->pna + na + ns;
+	int busflag_na = 0;
 
 	if (!range)
 		return NULL;
@@ -739,12 +741,14 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + np > parser->end)
 		return NULL;
 
-	if (parser->na == 3)
-		range->flags = of_bus_pci_get_flags(parser->range);
-	else
-		range->flags = 0;
+	range->flags = parser->bus->get_flags(parser->range);
+
+	/* PCI and ISA have a extra cell for resource flags */
+	if (strcmp(parser->bus->name, "pci") ||
+	    strcmp(parser->bus->name, "isa"))
+		busflag_na = 1;
 
-	range->pci_addr = of_read_number(parser->range, na);
+	range->bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
 
 	if (parser->dma)
 		range->cpu_addr = of_translate_dma_address(parser->node,
@@ -759,11 +763,10 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
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
@@ -774,7 +777,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 
 		if (flags != range->flags)
 			break;
-		if (pci_addr != range->pci_addr + range->size ||
+		if (bus_addr != range->bus_addr + range->size ||
 		    cpu_addr != range->cpu_addr + range->size)
 			break;
 
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 763022ed3456..3e8d6489cbf1 100644
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
@@ -53,6 +56,7 @@ extern const __be32 *of_get_address(struct device_node *dev, int index,
 
 extern int of_pci_range_parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node);
+#define of_range_parser_init of_pci_range_parser_init
 extern int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node);
 extern struct of_pci_range *of_pci_range_parser_one(
@@ -83,6 +87,7 @@ static inline int of_pci_range_parser_init(struct of_pci_range_parser *parser,
 {
 	return -ENOSYS;
 }
+#define of_range_parser_init of_pci_range_parser_init
 
 static inline int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node)
-- 
2.28.0.rc1

