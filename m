Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8FE247263
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 20:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389221AbgHQSmF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 14:42:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730096AbgHQSlp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 14:41:45 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6055220578;
        Mon, 17 Aug 2020 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597689704;
        bh=qiszeG2DETfNLk1h6LSV90irfUrBtYajyeWRmTxA694=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lv2IgNnZkzv+mgS45C9KIxlOTvkSf7h5MH8+Iv2FkzTFNjx3mof2bkTNavcAtcIfL
         e+cXrZwa+NHWgNQ1SFZ4cqU9Gk5AL4YjEN0uavWL8VEnpEfU1e8ISYgOdZmBq6HTfp
         SUaGcskUd1ARRz1e73RekcSM0nCSqpLWRklimvOk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/2] MAINTAINERS: Add linux-mips mailing list to JZ47xx entries
Date:   Mon, 17 Aug 2020 20:41:31 +0200
Message-Id: <20200817184131.907-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817184131.907-1-krzk@kernel.org>
References: <20200817184131.907-1-krzk@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The entries for JZ47xx SoCs and its drivers lacked MIPS mailing list.
Only MTD NAND driver pointed linux-mtd.  Add linux-mips so the relevant
patches will get attention of MIPS developers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Paul Cercueil <paul@crapouillou.net>

---

Changes since v1:
1. Do not update DMA driver entry
2. Add ack
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ab3a7fd6451..33d0ea35d8b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8583,11 +8583,13 @@ F:	samples/bpf/ibumad_user.c
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	drivers/mtd/nand/raw/ingenic/
 
 INGENIC JZ47xx SoCs
 M:	Paul Cercueil <paul@crapouillou.net>
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
 F:	arch/mips/include/asm/mach-jz4740/
-- 
2.17.1

