Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BC82258E0
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 09:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgGTHoU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 03:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgGTHoT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 03:44:19 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7E2C061794;
        Mon, 20 Jul 2020 00:44:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 9FD911FEB6;
        Mon, 20 Jul 2020 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595231059; bh=ppF9iNqy67ZPTRkf1vgXb7LZOcBdhZaOBonX3SkJVGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i2JU3TROrrt5CtDbCpBqWqSRfK4eBGwmdFElYgPYXy1S3RSqspe+tko2+cz0YR82b
         Ml5JpRvDueZxRWhiOZlo55fRNkUHFK/kbm8pnGaQv4/zvDw10jJWEi9ohJgVaeYveM
         DgwizZEuQ6L4M8NdNTROuTIcv6nRNGUNrKKsok/sBJ1EVu3UXwcPxvowYtU8x0SuTa
         G/xXUQGStVk4by1UQesLgnGTedQeQonW3IJTOhseOLBZtNBI0kqEXMmpn1P7s15Mg6
         q3XAngsjMxzmjdir2izIl4NDbOyY7g3AKi1mgjnw1V10SySRX85c8IJoeraL5y6aB6
         mgDILXBUw0hMA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] of_address: Add bus type match for pci ranges parser
Date:   Mon, 20 Jul 2020 15:42:34 +0800
Message-Id: <20200720074249.596364-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So the parser can be used to parse range property of different bus
types, such as ISA bus.

As they're all using PCI-like method of range property, there is no need
start a new parser.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/of/address.c       | 15 +++++++++++----
 include/linux/of_address.h |  3 +++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8eea3f6e29a4..250c91767648 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -702,6 +702,10 @@ static int parser_init(struct of_pci_range_parser *parser,
 	parser->ns = of_bus_n_size_cells(node);
 	parser->dma = !strcmp(name, "dma-ranges");
 
+	parser->bus = of_match_bus(node);
+	if (!parser->bus)
+		return -ENOENT;
+
 	parser->range = of_get_property(node, name, &rlen);
 	if (parser->range == NULL)
 		return -ENOENT;
@@ -732,6 +736,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	int na = parser->na;
 	int ns = parser->ns;
 	int np = parser->pna + na + ns;
+	int bus_na = 0;
 
 	if (!range)
 		return NULL;
@@ -739,8 +744,10 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + np > parser->end)
 		return NULL;
 
-	if (parser->na == 3)
-		range->flags = of_bus_pci_get_flags(parser->range);
+	parser->bus->count_cells(parser->node, &bus_na, NULL);
+
+	if (parser->na == bus_na)
+		range->flags = parser->bus->get_flags(parser->range);
 	else
 		range->flags = 0;
 
@@ -761,8 +768,8 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 		u32 flags = 0;
 		u64 pci_addr, cpu_addr, size;
 
-		if (parser->na == 3)
-			flags = of_bus_pci_get_flags(parser->range);
+		if (parser->na == bus_na)
+			flags = parser->bus->get_flags(parser->range);
 		pci_addr = of_read_number(parser->range, na);
 		if (parser->dma)
 			cpu_addr = of_translate_dma_address(parser->node,
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 763022ed3456..3929b4637033 100644
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
-- 
2.28.0.rc1

