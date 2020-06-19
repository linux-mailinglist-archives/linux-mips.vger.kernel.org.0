Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A8B201DD7
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 00:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgFSWL1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 18:11:27 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:39107 "EHLO
        out28-197.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbgFSWLY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 18:11:24 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1225308|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00699901-0.00107133-0.99193;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HpPfw4y_1592604655;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HpPfw4y_1592604655)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sat, 20 Jun 2020 06:11:20 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com,
        tsbogend@alpha.franken.de, ak@linux.intel.com,
        keescook@chromium.org, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 2/3] dt-bindings: MIPS: Add Ingenic X1830 based boards.
Date:   Sat, 20 Jun 2020 06:10:30 +0800
Message-Id: <20200619221031.33558-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200619221031.33558-1-zhouyanjie@wanyeetech.com>
References: <20200619221031.33558-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add bindings for Ingenic X1830 based board, prepare for later dts.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
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

