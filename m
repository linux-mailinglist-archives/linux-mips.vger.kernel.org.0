Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D252321DF52
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2020 20:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbgGMSHQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jul 2020 14:07:16 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:42997 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730098AbgGMSHP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jul 2020 14:07:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1160357|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00699902-0.00107133-0.99193;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03302;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1D8Ndo_1594663624;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1D8Ndo_1594663624)
          by smtp.aliyun-inc.com(10.147.40.7);
          Tue, 14 Jul 2020 02:07:12 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, paulburton@kernel.org,
        paul@crapouillou.net, ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 2/3] dt-bindings: MIPS: Add Ingenic X1830 based boards.
Date:   Tue, 14 Jul 2020 02:06:39 +0800
Message-Id: <20200713180640.3990-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200713180640.3990-1-zhouyanjie@wanyeetech.com>
References: <20200713180640.3990-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add bindings for Ingenic X1830 based board, prepare for later dts.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.

 Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
index d1175030781a..feb695be9f66 100644
--- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -8,7 +8,8 @@ title: Ingenic XBurst based Platforms Device Tree Bindings
 
 maintainers:
   - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
-description: |
+
+description:
   Devices with a Ingenic XBurst CPU shall have the following properties.
 
 properties:
@@ -32,8 +33,13 @@ properties:
           - const: img,ci20
           - const: ingenic,jz4780
 
-      - description: YSH & ATIL General Board CU Neo
+      - description: YSH & ATIL General Board, CU1000 Module with Neo Backplane
         items:
           - const: yna,cu1000-neo
-          - const: ingenic,x1000
+          - const: ingenic,x1000e
+
+      - description: YSH & ATIL General Board, CU1830 Module with Neo Backplane
+        items:
+          - const: yna,cu1830-neo
+          - const: ingenic,x1830
 ...
-- 
2.11.0

