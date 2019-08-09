Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC4CA879AD
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2019 14:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfHIMTa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Aug 2019 08:19:30 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:41366 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbfHIMTa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Aug 2019 08:19:30 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 94651A1868;
        Fri,  9 Aug 2019 14:19:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id Pp7MNIOa9meR; Fri,  9 Aug 2019 14:19:19 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3 v3] dt-bindings: mips: Add gardena vendor prefix and board description
Date:   Fri,  9 Aug 2019 14:19:17 +0200
Message-Id: <20190809121918.25047-2-sr@denx.de>
In-Reply-To: <20190809121918.25047-1-sr@denx.de>
References: <20190809121918.25047-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds the vendor prefix for gardena and a short description
including the compatible string for the "GARDENA smart Gateway" based
on the MT7688 SoC.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
v3:
- New patch

 .../devicetree/bindings/mips/ralink/gardena.txt          | 9 +++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml   | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ralink/gardena.txt

diff --git a/Documentation/devicetree/bindings/mips/ralink/gardena.txt b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
new file mode 100644
index 000000000000..4022fe61a8ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
@@ -0,0 +1,9 @@
+GARDENA smart Gateway (MT7688)
+
+This board is based on the MediaTek MT7688 and equipped with 128 MiB
+of DDR and 8 MiB of flash (SPI NOR) and additional 128MiB SPI NAND
+storage.
+
+------------------------------
+Required root node properties:
+- compatible = "gardena,smartGatewayMT7688";
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbbbffab..73166adfd4ad 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -337,6 +337,8 @@ patternProperties:
     description: Freescale Semiconductor
   "^fujitsu,.*":
     description: Fujitsu Ltd.
+  "^gardena,.*":
+    description: GARDENA GmbH
   "^gateworks,.*":
     description: Gateworks Corporation
   "^gcw,.*":
-- 
2.22.0

