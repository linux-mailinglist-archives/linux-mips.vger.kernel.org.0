Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52BD715F1D1
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 19:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731660AbgBNSDh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 13:03:37 -0500
Received: from out28-219.mail.aliyun.com ([115.124.28.219]:43940 "EHLO
        out28-219.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388470AbgBNSDg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 13:03:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08323406|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.656193-0.0159137-0.327893;DS=CONTINUE|ham_system_inform|0.00787412-0.000299377-0.991826;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.GoAKeCh_1581703384;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoAKeCh_1581703384)
          by smtp.aliyun-inc.com(10.147.42.253);
          Sat, 15 Feb 2020 02:03:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Subject: [PATCH v4 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Date:   Sat, 15 Feb 2020 02:02:37 +0800
Message-Id: <1581703360-112557-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
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
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Change the two Document from txt to yaml.
    
    v2->v3:
    Fix formatting errors.
    
    v3->v4:
    Fix bugs in the two yaml files.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 53 ++++++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,soc.yaml         | 35 ++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 create mode 100755 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
new file mode 100644
index 00000000..cb600ae
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
+      - const: ingenic,xburst
+      - const: ingenic,xburst2
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
+examples:
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
diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
new file mode 100644
index 00000000..11e5cde
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
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
+      - const: ingenic,jz4740
+      - const: ingenic,jz4725b
+      - const: ingenic,jz4760
+      - const: ingenic,jz4760b
+      - const: ingenic,jz4770
+      - const: ingenic,jz4780
+      - const: ingenic,x1000
+      - const: ingenic,x1000e
+      - const: ingenic,x1500
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

