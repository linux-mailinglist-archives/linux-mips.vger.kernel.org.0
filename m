Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FADB3B3239
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 17:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhFXPJG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 11:09:06 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:50849 "EHLO
        out28-170.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhFXPJE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Jun 2021 11:09:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3756574|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0213955-0.00269967-0.975905;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047204;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KXPsfY8_1624547190;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KXPsfY8_1624547190)
          by smtp.aliyun-inc.com(10.147.40.200);
          Thu, 24 Jun 2021 23:06:41 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v3 2/4] dt-bindings: clock: Add documentation for MAC PHY control bindings.
Date:   Thu, 24 Jun 2021 23:06:27 +0800
Message-Id: <1624547189-61079-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624547189-61079-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624547189-61079-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Update the CGU binding documentation, add mac-phy-ctrl as a
pattern property.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v3:
    New patch.

 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
index c65b945..ee9b5fb 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -93,6 +93,8 @@ required:
 patternProperties:
   "^usb-phy@[a-f0-9]+$":
     allOf: [ $ref: "../phy/ingenic,phy-usb.yaml#" ]
+  "^mac-phy-ctrl@[a-f0-9]+$":
+    allOf: [ $ref: "../net/ingenic,mac.yaml#" ]
 
 additionalProperties: false
 
-- 
2.7.4

