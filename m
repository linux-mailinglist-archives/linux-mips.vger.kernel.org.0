Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28735F7EE
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2019 14:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfGDMXm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jul 2019 08:23:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40321 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbfGDMXm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Jul 2019 08:23:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so95471wrl.7;
        Thu, 04 Jul 2019 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6dJKLTHNCoVnpIo4cp69g8LpZGuj3U2OQHvpO1gnaUc=;
        b=lzwiC9KgmLBszIzRQ5tfK4M6I7kXW14FC/vRZGu1xlmH3CMaYsGqvwYOZbN5CXyVrf
         wfksJEaHvGwqO2FvbFfM0CKEgzAs5qQxT73T8ZxzLGG6IUK2u9cq88sPLHf4cN3tJKSI
         bpBmoMryDQH2m5OXR0eF7G01hRLne2sYLac7znhXLIq3aO8Ej+IOLSJmn/HAiDQXqkNx
         1OFat8Ofydud3Vc8/wh8+K2jEySseK0nfRurMRj7EbyOZTOX4A2MllVIYEDgIJv6kgXH
         aKeMrJUM3ozhzozLyX/Ao9dL6zydUX9d7CFW7R9GasoUFM5UmpLyfxrRDhhjKMdYW8H2
         cZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6dJKLTHNCoVnpIo4cp69g8LpZGuj3U2OQHvpO1gnaUc=;
        b=pd/AyL+jHxoJXIsqN+Z/DNKM1ECDUxHda98zDoe8z3PBLemqgYAvCPCGoUhuE+uFwi
         ni5e36dcAaiT4vLggQcXadtIcUogQYQtoK2/Jo7v7NWVR8AQS9wqtmfs839q0/6SchTB
         caWnLE1GRXTHbMoMmSLbfdIm9fRPxpSqr0+E5oOI7gpcAcVAiUsZkL2OVy9ZWmfR2AhQ
         seIfCTOvDHVhyrjxfK4xNh7Cx6bMLPeGV87ZHikUg5wNhqu/SZ4TY1XwHm5OHF48lTD7
         Q+QksV7Z96nx9D2JLbOFU8ZQy8Tw/rVhnHuhSSYod4TfSgKx9DBKhAokxFOZ9cL8Twtd
         0Gkw==
X-Gm-Message-State: APjAAAVRfQTmIn5frb9dg/sAsLx6p7AklFkR6kVji/AGlrkLCFTmWB29
        t30lO/tFdkmDpdg7YJkUfAaURgYX
X-Google-Smtp-Source: APXvYqxLyUSUs228O8TsQJhzTfGpG136v3hLQDITzNawKyECj6Ua5qbuZrKY/VPO907MuRHcp5m5Nw==
X-Received: by 2002:adf:a55b:: with SMTP id j27mr27549341wrb.154.1562243018608;
        Thu, 04 Jul 2019 05:23:38 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D6200090FB6F2A0C02D39B.dip0.t-ipconnect.de. [2003:f1:33d6:2000:90fb:6f2a:c02:d39b])
        by smtp.googlemail.com with ESMTPSA id w10sm5141825wru.76.2019.07.04.05.23.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 05:23:38 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/4] dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe PHYs
Date:   Thu,  4 Jul 2019 14:23:16 +0200
Message-Id: <20190704122319.8983-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
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

