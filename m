Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FC93D465D
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 10:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbhGXIIt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:08:49 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:41372 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbhGXIIt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:08:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1919396|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0119101-0.0098379-0.978252;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KpoL-m-_1627116542;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpoL-m-_1627116542)
          by smtp.aliyun-inc.com(10.147.43.230);
          Sat, 24 Jul 2021 16:49:19 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, hminas@synopsys.com
Cc:     paul@crapouillou.net, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH 1/2] dt-bindings: dwc2: Add bindings for new Ingenic SoCs.
Date:   Sat, 24 Jul 2021 16:48:40 +0800
Message-Id: <1627116521-124612-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the dwc2 bindings for the JZ4775 SoC, the JZ4780 SoC, the X1000 SoC,
the X1600 SoC, the X1830 SoC, and the X2000 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 10c7d9b..e779d33 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -14,6 +14,12 @@ properties:
     oneOf:
       - const: brcm,bcm2835-usb
       - const: hisilicon,hi6220-usb
+      - const: ingenic,jz4775-otg
+      - const: ingenic,jz4780-otg
+      - const: ingenic,x1000-otg
+      - const: ingenic,x1600-otg
+      - const: ingenic,x1830-otg
+      - const: ingenic,x2000-otg
       - items:
           - const: rockchip,rk3066-usb
           - const: snps,dwc2
-- 
2.7.4

