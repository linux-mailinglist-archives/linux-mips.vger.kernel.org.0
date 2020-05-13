Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC571D1DE7
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 20:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390021AbgEMSrF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 14:47:05 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:45294 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390300AbgEMSrE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 14:47:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2028036|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0138233-0.000220315-0.985956;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16368;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.HY8LAU0_1589395602;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HY8LAU0_1589395602)
          by smtp.aliyun-inc.com(10.147.44.118);
          Thu, 14 May 2020 02:47:00 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, tglx@linutronix.de,
        robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v7 4/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Date:   Thu, 14 May 2020 02:46:15 +0800
Message-Id: <1589395578-87441-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589395578-87441-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1589395578-87441-1-git-send-email-zhouyanjie@wanyeetech.com>
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
    
    v6->v7:
    1.Update compatible strings in "ingenic,cpu.yaml".
    2.Fix formatting errors, and enum for compatible strings.
    3.Remove unnecessary "ingenic,soc.yaml".

 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
new file mode 100644
index 00000000..afb0207
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
2.7.4

