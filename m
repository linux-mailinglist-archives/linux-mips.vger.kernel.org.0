Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F635DB10
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 03:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGCBmR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jul 2019 21:42:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37571 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfGCBmR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jul 2019 21:42:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id f17so494242wme.2;
        Tue, 02 Jul 2019 18:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QD7PTDoTKJ7Xg819N/X9fbQ0hWhUP/U0zNIc8U8b15M=;
        b=QHcgFWZuIAWVxoHoyptyZ0vhwJGPMgbUT4AOymWxPnjHiwDGeLycngPGR62hMJXRsW
         oFuOJ7ugVuC/+Eh9Ssm8I+MzGlI8dYOdaXgGJVARGU0icUeSe957hDhmJPVE8rAKa5pi
         SK6zRYV1aSTXnCLc5tWWmAFwg4vIjDMe/rLu0pkSoUkLTVer1SDFw8YpL5g1Vkn9TYMF
         ST2EZM+gaP9AfL9uqzvR2cRHDbHMFVm10EUBd6j8ThaYmHkgHEZIp28Rp/Pwgt/EBnWa
         OeWCbx7iqHBCJ7ZS6jGC99ohwVxFdmMmbO+ArhAKASGRW260fcpfumHpm4mvk2dRNnM1
         fSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QD7PTDoTKJ7Xg819N/X9fbQ0hWhUP/U0zNIc8U8b15M=;
        b=CaqJFNJOGlN47WeMCK3yixvUehLHCrmM9N7+HcZubUWPY0Seya35F1mcd1ETbczV/a
         iAyuFk/X6mZ5+/DoQrDNpo7FZT4SXT8L1i/4eC+nWfNpWF+hoBLoUqIY14jCZlv96SYC
         WcLCwQmuIIgKMYRrYOXbtzkGHaS8zm87SX8YVK6IOSlCyIusifejHcjAwXBVlzYukhAK
         fSNVePOGT4RF3wv/esY3SoWbFb9qjT4VDhrOp1ajZqCKbCAUJxl147cvYisAyB/qE0Ve
         Pjb7Rh9SBR+dy5RKZweBmX+zOZLyS2Wj7icvktw48rWs0ZAApmo65z0cloH07WLAJpyy
         TH/w==
X-Gm-Message-State: APjAAAXec0+sNXndZ/kYmdJQVWv3nCONZxjWBigIQHVAfS8rDw0oEGkE
        wZ2NfRfn4ZVj1G/gSK7LjyBmTiXi
X-Google-Smtp-Source: APXvYqz8QYHBVW4jvwhPk0+4Sg4vtY8mm4+L3Sxs8VHy/Dsb9SdqndHsmTjxO09mij/b/DclZsRk6w==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr4772701wme.81.1562099730087;
        Tue, 02 Jul 2019 13:35:30 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id s12sm100041wmh.34.2019.07.02.13.35.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 13:35:29 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe PHYs
Date:   Tue,  2 Jul 2019 22:35:20 +0200
Message-Id: <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
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
 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 87 +++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
new file mode 100644
index 000000000000..b7b222e772d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    maxItems: 1
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
+        clocks = <&pmu PCIE_PHY>, <&pmu PCIE_PHY_PDI>;
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

