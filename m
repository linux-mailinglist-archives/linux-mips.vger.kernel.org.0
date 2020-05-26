Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20B91E27F2
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 19:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgEZRH7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 13:07:59 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:42632 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgEZRH7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 13:07:59 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1391001|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0227803-0.000153134-0.977067;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.HdyIWoB_1590512865;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HdyIWoB_1590512865)
          by smtp.aliyun-inc.com(10.147.43.230);
          Wed, 27 May 2020 01:07:53 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, tsbogend@alpha.franken.de, hns@goldelico.com,
        paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
Date:   Wed, 27 May 2020 01:07:22 +0800
Message-Id: <20200526170722.17206-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200526170722.17206-1-zhouyanjie@wanyeetech.com>
References: <20200526170722.17206-1-zhouyanjie@wanyeetech.com>
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
 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
new file mode 100644
index 000000000000..afb02071a756
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
@@ -0,0 +1,57 @@
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
+
+description:
+  Ingenic XBurst family CPUs shall have the following properties.
+
+properties:
+  compatible:
+    oneOf:
+
+      - description: Ingenic XBurst®1 CPU Cores
+        items:
+          enum:
+            - ingenic,xburst-mxu1.0
+            - ingenic,xburst-fpu1.0-mxu1.1
+            - ingenic,xburst-fpu2.0-mxu2.0
+
+      - description: Ingenic XBurst®2 CPU Cores
+        items:
+          enum:
+            - ingenic,xburst2-fpu2.1-mxu2.1-smt
+
+  reg:
+    maxItems: 1
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
+    		compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+    		reg = <0>;
+    	};
+
+    	cpu1: cpu@1 {
+    		device_type = "cpu";
+    		compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+    		reg = <1>;
+    	};
+    };
+...
-- 
2.11.0

