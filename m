Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C133B6858
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 20:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbhF1SXd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 14:23:33 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:34426 "EHLO
        out28-98.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234507AbhF1SX0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 14:23:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.53124|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0604461-0.00470573-0.934848;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KZOO9TY_1624904444;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KZOO9TY_1624904444)
          by smtp.aliyun-inc.com(10.147.42.253);
          Tue, 29 Jun 2021 02:20:57 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v5 07/11] dt-bindings: clock: Add documentation for JZ4775 and X2000 bindings.
Date:   Tue, 29 Jun 2021 02:20:40 +0800
Message-Id: <1624904444-2618-8-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation for the clock bindings of the JZ4775 SoC and the
X2000 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.

 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
index 6d6236e..5d699b3 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -25,9 +25,11 @@ select:
           - ingenic,jz4760-cgu
           - ingenic,jz4760b-cgu
           - ingenic,jz4770-cgu
+          - ingenic,jz4775-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
           - ingenic,x1830-cgu
+          - ingenic,x2000-cgu
   required:
     - compatible
 
@@ -54,9 +56,11 @@ properties:
           - ingenic,jz4760-cgu
           - ingenic,jz4760b-cgu
           - ingenic,jz4770-cgu
+          - ingenic,jz4775-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
           - ingenic,x1830-cgu
+          - ingenic,x2000-cgu
       - const: simple-mfd
     minItems: 1
 
-- 
2.7.4

