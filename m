Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 993A513F258
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 19:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391783AbgAPRYf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 12:24:35 -0500
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:36193 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403768AbgAPRYe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 12:24:34 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1272068|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.633143-0.024116-0.342741;DS=CONTINUE|ham_system_inform|0.00813291-0.000354104-0.991513;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03312;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GdEQRsw_1579195452;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GdEQRsw_1579195452)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 17 Jan 2020 01:24:24 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mips-creator-ci20-dev@googlegroups.com, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com, hns@goldelico.com, paul@boddie.org.uk
Subject: [PATCH v2 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Date:   Fri, 17 Jan 2020 01:23:46 +0800
Message-Id: <1579195429-59828-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the available properties for the SoC root node and the
CPU nodes of the devicetree for the Ingenic XBurst SoCs.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Change the two Document from txt to yaml.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 53 ++++++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,soc,yaml         | 35 ++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
new file mode 100644
index 00000000..91041a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic XBurst family CPUs
+
+maintainers:
+  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+description: |
+  Ingenic XBurst family CPUs shall have the following properties.
+
+properties:
+  compatible:
+    oneOf:
+      - "ingenic,xburst".
+      - "ingenic,xburst2".
+
+  reg:
+    description: |
+      The number of the CPU.
+
+required:
+  - device_type
+  - compatible
+  - reg
+
+Example:
+  - |
+    cpus {
+    	#address-cells = <1>;
+    	#size-cells = <0>;
+
+    	cpu0: cpu@0 {
+    		device_type = "cpu";
+    		compatible = "ingenic,xburst";
+    		reg = <0>;
+
+    		clocks = <&cgu JZ4780_CLK_CPU>;
+    		clock-names = "cpu";
+    	};
+
+    	cpu1: cpu@1 {
+    		device_type = "cpu";
+    		compatible = "ingenic,xburst";
+    		reg = <1>;
+
+    		clocks = <&cgu JZ4780_CLK_CORE1>;
+    		clock-names = "cpu";
+    	};
+    };
+...
diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml
new file mode 100644
index 00000000..6269da7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/ingenic/ingenic,soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic SoCs with XBurst CPU inside.
+
+maintainers:
+  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+description: |
+  Ingenic SoCs with XBurst CPU inside shall have the following properties.
+
+properties:
+  compatible:
+    oneOf:
+      - "ingenic,jz4740".
+      - "ingenic,jz4725b".
+      - "ingenic,jz4760".
+      - "ingenic,jz4760b".
+      - "ingenic,jz4770".
+      - "ingenic,jz4780".
+      - "ingenic,x1000".
+      - "ingenic,x1000e".
+      - "ingenic,x1500".
+
+required:
+  - compatible
+
+examples:
+  - |
+    #address-cells = <1>;
+    #size-cells = <1>;
+    compatible = "ingenic,jz4780";
+...
-- 
2.7.4

