Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EA022E0F9
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 17:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgGZP44 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 11:56:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgGZP44 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 11:56:56 -0400
Received: from localhost.localdomain (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22F0520714;
        Sun, 26 Jul 2020 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595779015;
        bh=v13Fxhc84IN1axB88Du7lE/qbL3kockSOUNFFm3PwLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L7k3bNuchI6J7q85gstyyJGj9DVLqYIPWtl2Iz1ybboZmf8HR7kHFI63b6Xu/+Ger
         UosG0vy04u6lE2tFKYlrKBVHu9LhYy3n9AC/+IBL56xIrJQIdkBJKp7zJGwKEDJKv8
         OD7p+oc0w7tnPqsNVESsJ0Qdf/eVXf1Hm7eAc2eY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/2] MAINTAINERS: Add linux-mips mailing list to JZ47xx entries
Date:   Sun, 26 Jul 2020 17:55:59 +0200
Message-Id: <20200726155559.4650-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200726155559.4650-1-krzk@kernel.org>
References: <20200726155559.4650-1-krzk@kernel.org>
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
index 362863cae239..d1cc0afe0762 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8544,11 +8544,13 @@ F:	samples/bpf/ibumad_user.c
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

