Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14279332C59
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 17:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhCIQlj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 11:41:39 -0500
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:46025 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhCIQle (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 11:41:34 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1765225|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0354381-0.00423112-0.960331;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JibD5S0_1615308080;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JibD5S0_1615308080)
          by smtp.aliyun-inc.com(10.147.40.44);
          Wed, 10 Mar 2021 00:41:28 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 2/3] dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
Date:   Wed, 10 Mar 2021 00:40:56 +0800
Message-Id: <1615308057-88387-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the JZ4730 SoC, the JZ4750 SoC,
the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 .../bindings/pinctrl/ingenic,pinctrl.yaml          | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 44c04d1..60604fc 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -17,10 +17,12 @@ description: >
   naming scheme "PxN" where x is a character identifying the GPIO port with
   which the pin is associated and N is an integer from 0 to 31 identifying the
   pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
-  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
-  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
-  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
-  pins.
+  and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, the X1000
+  and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128 pins. The
+  X2000 contains 5 GPIO ports, PA to PE, for a total of 160 pins. The JZ4750,
+  the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains 6 GPIO ports, PA
+  to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO ports, PA to PG,
+  for a total of 224 pins.
 
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
@@ -32,20 +34,28 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - ingenic,jz4730-pinctrl
           - ingenic,jz4740-pinctrl
           - ingenic,jz4725b-pinctrl
+          - ingenic,jz4750-pinctrl
+          - ingenic,jz4755-pinctrl
           - ingenic,jz4760-pinctrl
           - ingenic,jz4770-pinctrl
+          - ingenic,jz4775-pinctrl
           - ingenic,jz4780-pinctrl
           - ingenic,x1000-pinctrl
           - ingenic,x1500-pinctrl
           - ingenic,x1830-pinctrl
+          - ingenic,x2000-pinctrl
       - items:
           - const: ingenic,jz4760b-pinctrl
           - const: ingenic,jz4760-pinctrl
       - items:
           - const: ingenic,x1000e-pinctrl
           - const: ingenic,x1000-pinctrl
+      - items:
+          - const: ingenic,x2000e-pinctrl
+          - const: ingenic,x2000-pinctrl
 
   reg:
     maxItems: 1
@@ -62,14 +72,19 @@ patternProperties:
     properties:
       compatible:
         enum:
+          - ingenic,jz4730-gpio
           - ingenic,jz4740-gpio
           - ingenic,jz4725b-gpio
+          - ingenic,jz4750-gpio
+          - ingenic,jz4755-gpio
           - ingenic,jz4760-gpio
           - ingenic,jz4770-gpio
+          - ingenic,jz4775-gpio
           - ingenic,jz4780-gpio
           - ingenic,x1000-gpio
           - ingenic,x1500-gpio
           - ingenic,x1830-gpio
+          - ingenic,x2000-gpio
 
       reg:
         items:
-- 
2.7.4

