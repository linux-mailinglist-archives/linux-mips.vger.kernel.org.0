Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5399777894
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 14:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387523AbfG0MEk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 08:04:40 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53832 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbfG0MEk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 08:04:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so50042605wmj.3;
        Sat, 27 Jul 2019 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4kSVEDcmQr1Nb3uJXmjNz/yN7iR4LqR8NFALM+dMleo=;
        b=HyQqTs0/aWlDT2JvsTHbRHvhdADWk6LHbsHnCmS0/SfT/uXyiFE1V0WAZ1L/V62aZJ
         6XJ+8i70sp7YqhcmJ9wZtC8hsvN6SJAh//fF0CamOOz4iTlAAoaxvj2uZt3ZMBdRghSG
         xy+POw+++pnuVPL2j2VnMUvXJ2ywu/L6Gt6TzwooeUSA2vPub4ZdSUYM8LGSZuiauiuh
         BaYTSiZ9pwJqh/qe2hIV/+Onjnp9wYGtGfm6Kc4BZ038Vab04fVWYEWXbqBSf4tfJixs
         IuLLntlQiE9NwrIG4mvsd0lK33vsxV6aVgyJzEYXh3Iz/qDOY1JvRsf70v2bx7XAhgMO
         hstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4kSVEDcmQr1Nb3uJXmjNz/yN7iR4LqR8NFALM+dMleo=;
        b=miSe49SHqAXsYWKvdCf5UG4guHGjb7Lt9Re49m+iNT49MH1866Ynap31RF0SSoFAdK
         gZ+kMS/Mbkanc/4meWV40ymnItDieSbE//7W2Uc1AAYgoYp4g3ecIwszBq35wjuCb0uL
         cq/ljjJS6SNlzv2fhjAPcmUCRhydXPawWok5Vx3QOQlsbGlveZPqURmcF+OmItYSO6AS
         eFOkRw+ogT6iCL5RgaGPkkA7zshNOpEUXpfJ9z5kglpHzq18hgD2q9PRpyMbdhiMxNIj
         bC7G22PG362yAcYGuyAlj7LPmpyQZrYYd6MrdmCfda6FFR8MT+8Ad9MiG0NlvAdVKLIK
         i/8A==
X-Gm-Message-State: APjAAAU/28M3olto6YPmaoIY2sb59qfTC1V5LyFWtG2nUnQI6Nzs4P8g
        Eljv68+BJ27VHtCFsaqtICF7LmUF
X-Google-Smtp-Source: APXvYqwY2xhevHzxnzOPeIn/BuBKfg7fNfhpSrQho6ymXsa6YfHWp28wwnPBeQ6b5AKgwKTVRh5T3Q==
X-Received: by 2002:a7b:c202:: with SMTP id x2mr87071172wmi.49.1564229076741;
        Sat, 27 Jul 2019 05:04:36 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id r5sm58596219wmh.35.2019.07.27.05.04.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 05:04:36 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, paul.burton@mips.com,
        ralf@linux-mips.org
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        mark.rutland@arm.com, ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe PHYs
Date:   Sat, 27 Jul 2019 14:04:12 +0200
Message-Id: <20190727120415.15859-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
References: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
The IP block contains settings for the PHY and a PLL.
The PLL mode is configurable through a dedicated #phy-cell in .dts.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 95 +++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
new file mode 100644
index 000000000000..8a56a8526cef
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/lantiq,vrx200-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq VRX200 and ARX300 PCIe PHY Device Tree Bindings
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  "#phy-cells":
+    const: 1
+    description: selects the PHY mode as defined in <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
+
+  compatible:
+    enum:
+      - lantiq,vrx200-pcie-phy
+      - lantiq,arx300-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PHY module clock
+      - description: PDI register clock
+
+  clock-names:
+    items:
+      - const: phy
+      - const: pdi
+
+  resets:
+    items:
+      - description: exclusive PHY reset line
+      - description: shared reset line between the PCIe PHY and PCIe controller
+
+  resets-names:
+    items:
+      - const: phy
+      - const: pcie
+
+  lantiq,rcu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the RCU syscon
+
+  lantiq,rcu-endian-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: the offset of the endian registers for this PHY instance in the RCU syscon
+
+  lantiq,rcu-big-endian-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: the mask to set the PDI (PHY) registers for this PHY instance to big endian
+
+  big-endian:
+    description: Configures the PDI (PHY) registers in big-endian mode
+    type: boolean
+
+  little-endian:
+    description: Configures the PDI (PHY) registers in big-endian mode
+    type: boolean
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - lantiq,rcu
+  - lantiq,rcu-endian-offset
+  - lantiq,rcu-big-endian-mask
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie0_phy: phy@106800 {
+        compatible = "lantiq,vrx200-pcie-phy";
+        reg = <0x106800 0x100>;
+        lantiq,rcu = <&rcu0>;
+        lantiq,rcu-endian-offset = <0x4c>;
+        lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
+        big-endian;
+        clocks = <&pmu 32>, <&pmu 36>;
+        clock-names = "phy", "pdi";
+        resets = <&reset0 12 24>, <&reset0 22 22>;
+        reset-names = "phy", "pcie";
+        #phy-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h b/include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
new file mode 100644
index 000000000000..95a7896356d6
--- /dev/null
+++ b/include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#define LANTIQ_PCIE_PHY_MODE_25MHZ		0
+#define LANTIQ_PCIE_PHY_MODE_25MHZ_SSC		1
+#define LANTIQ_PCIE_PHY_MODE_36MHZ		2
+#define LANTIQ_PCIE_PHY_MODE_36MHZ_SSC		3
+#define LANTIQ_PCIE_PHY_MODE_100MHZ		4
+#define LANTIQ_PCIE_PHY_MODE_100MHZ_SSC		5
-- 
2.22.0

