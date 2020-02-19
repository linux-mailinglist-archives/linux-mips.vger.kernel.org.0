Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DCE163F17
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 09:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgBSIaZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 03:30:25 -0500
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:40100 "EHLO
        out28-98.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgBSIaY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 03:30:24 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4939859|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.236101-0.0277202-0.736179;DS=CONTINUE|ham_regular_dialog|0.0107653-0.000613517-0.988621;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03294;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.Gpe8RV3_1582100997;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gpe8RV3_1582100997)
          by smtp.aliyun-inc.com(10.147.40.2);
          Wed, 19 Feb 2020 16:30:13 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de, maz@kernel.org,
        jason@lakedaemon.net, sboyd@kernel.org, mturquette@baylibre.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH 1/4] dt-bindings: timer: Add X1000 bindings.
Date:   Wed, 19 Feb 2020 16:29:31 +0800
Message-Id: <1582100974-129559-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the timer bindings for the X1000 Soc from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 Documentation/devicetree/bindings/timer/ingenic,tcu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
index 0b63ceb..91f7049 100644
--- a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
+++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
@@ -10,6 +10,7 @@ Required properties:
   * ingenic,jz4740-tcu
   * ingenic,jz4725b-tcu
   * ingenic,jz4770-tcu
+  * ingenic,x1000-tcu
   followed by "simple-mfd".
 - reg: Should be the offset/length value corresponding to the TCU registers
 - clocks: List of phandle & clock specifiers for clocks external to the TCU.
-- 
2.7.4

