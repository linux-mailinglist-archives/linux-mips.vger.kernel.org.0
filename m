Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF36118790
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 13:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfLJMDN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 07:03:13 -0500
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:40458 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfLJMDM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 07:03:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.093714|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.525217-0.0198122-0.454971;DS=CONTINUE|ham_system_inform|0.0142513-0.000678578-0.98507;FP=14713798452798378290|3|2|16|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GEHd9lh_1575979374;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GEHd9lh_1575979374)
          by smtp.aliyun-inc.com(10.147.42.197);
          Tue, 10 Dec 2019 20:03:07 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, alexandre.belloni@bootlin.com,
        ralf@linux-mips.org, heiko@sntech.de, icenowy@aosc.io,
        ak@linux.intel.com, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, keescook@chromium.org,
        ebiederm@xmission.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v8 3/4] dt-bindings: MIPS: Add Ingenic XBurst based boards.
Date:   Tue, 10 Dec 2019 20:02:42 +0800
Message-Id: <1575979363-25956-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575979363-25956-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575979363-25956-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Ingenic XBurst based boards, prepare for later dts.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.
    
    v3->v4:
    Adjust the description to make it more reasonable.
    
    v4->v5:
    Adjust item naming to prevent conflicts with
    subsequent "CU Geo" boards.
    
    v5->v6:
    No change.
    
    v6->v7:
    Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
    to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
    the old mailbox is in an unstable state.
    
    v7->v8:
    No change.

 .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
new file mode 100644
index 00000000..78dcf6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/ingenic/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic XBurst based Platforms Device Tree Bindings
+
+maintainers:
+  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+description: |
+  Devices with a Ingenic XBurst CPU shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Qi Hardware Ben NanoNote
+        items:
+          - const: qi,lb60
+
+      - description: Game Consoles Worldwide GCW Zero
+        items:
+          - const: gcw,zero
+
+      - description: MIPS Creator CI20
+        items:
+          - const: img,ci20
+
+      - description: YSH & ATIL General Board CU Neo
+        items:
+          - const: yna,cu1000-neo
+...
-- 
2.7.4

