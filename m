Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872D521E78C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 07:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgGNFdY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 01:33:24 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:41155 "EHLO
        out28-197.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgGNFdM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 01:33:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08660413|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00561206-0.000962136-0.993426;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03275;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1QwJ79_1594704779;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1QwJ79_1594704779)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 14 Jul 2020 13:33:06 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, paulburton@kernel.org,
        paul@crapouillou.net, ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 2/5] dt-bindings: MIPS: Add X1830 based CU1830-Neo and fix bug in CU1000-Neo.
Date:   Tue, 14 Jul 2020 13:32:26 +0800
Message-Id: <20200714053229.33195-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
References: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add bindings for Ingenic X1830 based board, prepare for later dts.
2.The CU1000-Neo board actually uses X1000E instead of X1000, so
  the wrongly written "ingenic,x1000" in bindings should be changed
  to "ingenic,x1000e", the corresponding dts file modification will
  be made in a patch later in this series.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.
    
    v3->v4:
    Modify the commit message and add the change description
    for CU1000-Neo.

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

