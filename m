Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E49E166285
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 17:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbgBTQZy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 11:25:54 -0500
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:48411 "EHLO
        out28-4.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgBTQZj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 11:25:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07648442|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.498548-0.0165261-0.484926;DS=CONTINUE|ham_regular_dialog|0.0122992-0.000497969-0.987203;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03296;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GqC0FCl_1582215911;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GqC0FCl_1582215911)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 21 Feb 2020 00:25:29 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        geert+renesas@glider.be, krzk@kernel.org, ebiederm@xmission.com,
        miquel.raynal@bootlin.com, keescook@chromium.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH v6 5/7] dt-bindings: MIPS: Document Ingenic SoCs binding.
Date:   Fri, 21 Feb 2020 00:24:47 +0800
Message-Id: <1582215889-113034-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
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
    
    v4->v5:
    No change.
    
    v5->v6:
    Rewrite the two yaml files.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 61 ++++++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,soc.yaml         | 34 ++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
new file mode 100644
index 00000000..ad1fd86
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
@@ -0,0 +1,61 @@
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
+
+      - description: Ingenic XBurst®1 CPU Core
+        items:
+          - const: ingenic,xburst
+
+      - description: Ingenic XBurst®2 CPU Core
+        items:
+          - const: ingenic,xburst2
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
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
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
index 00000000..8943e73
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
@@ -0,0 +1,34 @@
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
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Ingenic JZ47 Series Mobile Application Processor
+        items:
+          - const: ingenic,jz4740
+          - const: ingenic,jz4725b
+          - const: ingenic,jz4760
+          - const: ingenic,jz4760b
+          - const: ingenic,jz4770
+          - const: ingenic,jz4780
+
+      - description: Ingenic X Series IoT Application Processor
+        items:
+          - const: ingenic,x1000
+          - const: ingenic,x1000e
+          - const: ingenic,x1500
+...
-- 
2.7.4

