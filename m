Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DA63D4697
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234868AbhGXIbW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:31:22 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:36477 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbhGXIbQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:31:16 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08514146|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.126259-0.000608439-0.873133;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047202;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KpqAhCg_1627117898;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpqAhCg_1627117898)
          by smtp.aliyun-inc.com(10.147.41.121);
          Sat, 24 Jul 2021 17:11:45 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 1/2] dt-bindings: remoteproc: Add bindings for new Ingenic SoCs.
Date:   Sat, 24 Jul 2021 17:11:37 +0800
Message-Id: <1627117898-125239-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627117898-125239-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627117898-125239-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the remoteproc bindings for the JZ4760 SoC, the JZ4760B SoC,
the JZ4775 SoC, and the JZ4780 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 .../bindings/remoteproc/ingenic,vpu.yaml           | 74 ++++++++++++++++------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
index d0aa91b..6154596 100644
--- a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
@@ -17,31 +17,52 @@ maintainers:
 
 properties:
   compatible:
-    const: ingenic,jz4770-vpu-rproc
+    enum:
+      - ingenic,jz4760-vpu-rproc
+      - ingenic,jz4760b-vpu-rproc
+      - ingenic,jz4770-vpu-rproc
+      - ingenic,jz4775-vpu-rproc
+      - ingenic,jz4780-vpu-rproc
 
   reg:
-    items:
-      - description: aux registers
-      - description: tcsm0 registers
-      - description: tcsm1 registers
-      - description: sram registers
+    oneOf:
+      - items:
+          - description: aux registers
+          - description: tcsm0 registers
+          - description: tcsm1 registers
+          - description: sram registers
+      - items:
+          - description: aux registers
+          - description: tcsm registers
+          - description: sram registers
 
   reg-names:
-    items:
-      - const: aux
-      - const: tcsm0
-      - const: tcsm1
-      - const: sram
+    oneOf:
+      - items:
+          - const: aux
+          - const: tcsm0
+          - const: tcsm1
+          - const: sram
+      - items:
+          - const: aux
+          - const: tcsm
+          - const: sram
 
   clocks:
-    items:
-      - description: aux clock
-      - description: vpu clock
+    oneOf:
+      - items:
+          - description: aux clock
+          - description: vpu clock
+      - items:
+          - description: vpu clock
 
   clock-names:
-    items:
-      - const: aux
-      - const: vpu
+    oneOf:
+      - items:
+          - const: aux
+          - const: vpu
+      - items:
+          - const: vpu
 
   interrupts:
     maxItems: 1
@@ -60,7 +81,7 @@ examples:
   - |
     #include <dt-bindings/clock/jz4770-cgu.h>
 
-    vpu: video-decoder@132a0000 {
+    video-decoder@132a0000 {
       compatible = "ingenic,jz4770-vpu-rproc";
 
       reg = <0x132a0000 0x20>, /* AUX */
@@ -75,3 +96,20 @@ examples:
       interrupt-parent = <&cpuintc>;
       interrupts = <3>;
     };
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    video-decoder@132a0000 {
+      compatible = "ingenic,jz4780-vpu-rproc";
+
+      reg = <0x132a0000 0x20>, /* AUX */
+            <0x132c0000 0x8000>, /* TCSM */
+            <0x132f0000 0x4000>; /* SRAM */
+      reg-names = "aux", "tcsm", "sram";
+
+      clocks = <&cgu JZ4780_CLK_VPU>;
+      clock-names = "vpu";
+
+      interrupt-parent = <&intc>;
+      interrupts = <62>;
+    };
-- 
2.7.4

