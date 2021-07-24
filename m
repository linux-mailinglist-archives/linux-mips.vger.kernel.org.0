Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1AC3D4553
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 08:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234063AbhGXF4t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 01:56:49 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:39202 "EHLO
        out28-147.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233980AbhGXF4s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 01:56:48 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1261665|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00672983-0.000334258-0.992936;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Kpjyp2k_1627108627;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kpjyp2k_1627108627)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 24 Jul 2021 14:37:18 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X2100.
Date:   Sat, 24 Jul 2021 14:36:43 +0800
Message-Id: <1627108604-91304-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X2100 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index a4846d78..a12d0ce 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -19,10 +19,10 @@ description: >
   pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
   and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, the JZ4725B,
   the X1000 and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128
-  pins. The X2000 contains 5 GPIO ports, PA to PE, for a total of 160 pins.
-  The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains 6 GPIO
-  ports, PA to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO ports,
-  PA to PG, for a total of 224 pins.
+  pins. The X2000 and the X2100 contains 5 GPIO ports, PA to PE, for a total of
+  160 pins. The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains
+  6 GPIO ports, PA to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO
+  ports, PA to PG, for a total of 224 pins.
 
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
@@ -47,6 +47,7 @@ properties:
           - ingenic,x1500-pinctrl
           - ingenic,x1830-pinctrl
           - ingenic,x2000-pinctrl
+          - ingenic,x2100-pinctrl
       - items:
           - const: ingenic,jz4760b-pinctrl
           - const: ingenic,jz4760-pinctrl
@@ -85,6 +86,7 @@ patternProperties:
           - ingenic,x1500-gpio
           - ingenic,x1830-gpio
           - ingenic,x2000-gpio
+          - ingenic,x2100-gpio
 
       reg:
         items:
-- 
2.7.4

