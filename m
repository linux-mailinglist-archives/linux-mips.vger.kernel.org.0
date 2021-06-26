Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3C93B4CFD
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jun 2021 08:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhFZGVP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Jun 2021 02:21:15 -0400
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:51869 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFZGVO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Jun 2021 02:21:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3751867|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0185906-0.00257291-0.978837;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KYGAXY7_1624688322;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KYGAXY7_1624688322)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 26 Jun 2021 14:18:49 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v4 2/5] dt-bindings: clock: Add documentation for MAC PHY control bindings.
Date:   Sat, 26 Jun 2021 14:18:38 +0800
Message-Id: <1624688321-69131-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Update the CGU binding documentation, add mac-phy-ctrl as a
pattern property.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v3:
    New patch.
    
    v3->v4:
    No change.

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

