Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22343239A4
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhBXJjo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234652AbhBXJjm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:39:42 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5586AC06174A;
        Wed, 24 Feb 2021 01:39:01 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j187so1199341wmj.1;
        Wed, 24 Feb 2021 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z16RBQaPjgen70OUy/dy1ubKpbXqrtR0Ljnoj8GZjuU=;
        b=cu/xzAGNIQnNa10kv3uKWGCs/2PNIyuEyDjLiWjHGc2Lw6Rdbfdbu294zPMWzePjnz
         WQ6qv1WnRLMfPM2PNlGzCAVyDJkCMCB5fz6zmIPCIt6YUqmJH5+Bi4DOiXoj7kq0KNdY
         v2MAmyg8sItexuKgU5zgE2yO7ImWVdsdsXwSdc+ln/+CFSXbkTY5M1xiam/7w7pXtUDq
         TwBxAxdHCRmzAJxpI4iEo1nESaRP1LSKAO+tWWKYaq+wFlxGTUnFyt3uhXdiZYlmAsTa
         xKI3xR9mLQKSuZXbL6mBdJ6l1k4MB0UnxqAG2b3/V9AOUNHHyoLipAV9NMSV1np5slI2
         LkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z16RBQaPjgen70OUy/dy1ubKpbXqrtR0Ljnoj8GZjuU=;
        b=Ar6ioARwTkqUhqcra1snGoZCUu4H14voPCrRrh1PGCoO8N9lK+DtBr4Z3JxZjNen0O
         smzOvEOpXdbBThsTay5//sdhClh9a5PW2qwmjzKTyNrvIW/yYLtTDMHQg7YXgJnoW9JD
         xsuTEhHX7U6BVZn+//j54Vo+wkeGjN5CsK4wzHVFD2MVPpuzL+VAA0NUW+4xtK/98jmD
         OV3OpJsqtPW1EXczPfbryb8CypO+K8RmucAsPxA/p3IskdDY3p9I731WygjyzDcAf+5b
         cYRqgHNcKh1xYJ8xrPrMUtzJG0zC6BxtWTf3BlGpMjwXj07T7MwdjPGIWsgmSElWxAJW
         UfRA==
X-Gm-Message-State: AOAM532Qi83m3eL/BQWn8Nj4zZmRrlHuMU/fCCfPSnQlgH6Od3p3XbIE
        r6lL+WWZBDY5xgibNmBRKcA=
X-Google-Smtp-Source: ABdhPJzZ6evsm/tiXA7JghpwAWrjzh4E1q+a/zBrqdjfdOxsQJ5bkcr7IHmGrJMtyHDtAilUr/SzUQ==
X-Received: by 2002:a05:600c:358d:: with SMTP id p13mr2968018wmq.152.1614159539945;
        Wed, 24 Feb 2021 01:38:59 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:38:59 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/7] mips: dts: brcm: allow including header files
Date:   Wed, 24 Feb 2021 10:38:50 +0100
Message-Id: <20210224093856.2021-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224093856.2021-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
 <20210224093856.2021-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change /include/ with #include in order to be able to include header files
from dt-bindings.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts    | 2 +-
 arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts | 2 +-
 arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts   | 2 +-
 arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts   | 2 +-
 arch/mips/boot/dts/brcm/bcm93384wvg.dts                | 2 +-
 arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts          | 2 +-
 arch/mips/boot/dts/brcm/bcm96368mvwg.dts               | 2 +-
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts               | 2 +-
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts              | 4 ++--
 arch/mips/boot/dts/brcm/bcm97358svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm97360svmb.dts               | 2 +-
 arch/mips/boot/dts/brcm/bcm97362svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm97420c.dts                  | 2 +-
 arch/mips/boot/dts/brcm/bcm97425svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm97435svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm9ejtagprb.dts               | 2 +-
 16 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts b/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts
index ed6023a91763..d702a843c74a 100644
--- a/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts
+++ b/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm3368.dtsi"
+#include "bcm3368.dtsi"
 
 / {
 	compatible = "netgear,cvg834g", "brcm,bcm3368";
diff --git a/arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts b/arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts
index 8d010b919de2..b511bc7125d5 100644
--- a/arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts
+++ b/arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm63268.dtsi"
+#include "bcm63268.dtsi"
 
 / {
 	compatible = "comtrend,vr-3032u", "brcm,bcm63268";
diff --git a/arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts b/arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts
index 53e57cc29291..c646690ee3df 100644
--- a/arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts
+++ b/arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm6358.dtsi"
+#include "bcm6358.dtsi"
 
 / {
 	compatible = "sfr,nb4-ser", "brcm,bcm6358";
diff --git a/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts b/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts
index 3e83bee5b91e..f83d95ca0514 100644
--- a/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts
+++ b/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm6362.dtsi"
+#include "bcm6362.dtsi"
 
 / {
 	compatible = "sfr,nb6-ser", "brcm,bcm6362";
diff --git a/arch/mips/boot/dts/brcm/bcm93384wvg.dts b/arch/mips/boot/dts/brcm/bcm93384wvg.dts
index 601e4d9293ab..7d3f181b8980 100644
--- a/arch/mips/boot/dts/brcm/bcm93384wvg.dts
+++ b/arch/mips/boot/dts/brcm/bcm93384wvg.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm3384_zephyr.dtsi"
+#include "bcm3384_zephyr.dtsi"
 
 / {
 	compatible = "brcm,bcm93384wvg", "brcm,bcm3384";
diff --git a/arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts b/arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts
index 938a8e66128c..f845faa0d682 100644
--- a/arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts
+++ b/arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm3384_viper.dtsi"
+#include "bcm3384_viper.dtsi"
 
 / {
 	compatible = "brcm,bcm93384wvg-viper", "brcm,bcm3384-viper";
diff --git a/arch/mips/boot/dts/brcm/bcm96368mvwg.dts b/arch/mips/boot/dts/brcm/bcm96368mvwg.dts
index 6d772c394e41..f5e955085308 100644
--- a/arch/mips/boot/dts/brcm/bcm96368mvwg.dts
+++ b/arch/mips/boot/dts/brcm/bcm96368mvwg.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm6368.dtsi"
+#include "bcm6368.dtsi"
 
 / {
 	compatible = "brcm,bcm96368mvwg", "brcm,bcm6368";
diff --git a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
index 79e9769f7e00..bda5f796251a 100644
--- a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7125.dtsi"
+#include "bcm7125.dtsi"
 
 / {
 	compatible = "brcm,bcm97125cbmb", "brcm,bcm7125";
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index 28370ff77eeb..9f73735e815c 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7346.dtsi"
-/include/ "bcm97xxx-nand-cs1-bch24.dtsi"
+#include "bcm7346.dtsi"
+#include "bcm97xxx-nand-cs1-bch24.dtsi"
 
 / {
 	compatible = "brcm,bcm97346dbsmb", "brcm,bcm7346";
diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 41c1b510c230..522f2c40d6e6 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7358.dtsi"
-/include/ "bcm97xxx-nand-cs1-bch4.dtsi"
+#include "bcm7358.dtsi"
+#include "bcm97xxx-nand-cs1-bch4.dtsi"
 
 / {
 	compatible = "brcm,bcm97358svmb", "brcm,bcm7358";
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 9f6c6c9b7ea7..01f215b08dba 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7360.dtsi"
+#include "bcm7360.dtsi"
 
 / {
 	compatible = "brcm,bcm97360svmb", "brcm,bcm7360";
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index df8b755c390f..97aeb51b6831 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7362.dtsi"
-/include/ "bcm97xxx-nand-cs1-bch4.dtsi"
+#include "bcm7362.dtsi"
+#include "bcm97xxx-nand-cs1-bch4.dtsi"
 
 / {
 	compatible = "brcm,bcm97362svmb", "brcm,bcm7362";
diff --git a/arch/mips/boot/dts/brcm/bcm97420c.dts b/arch/mips/boot/dts/brcm/bcm97420c.dts
index 086faeaa384a..cc70c2dd4d85 100644
--- a/arch/mips/boot/dts/brcm/bcm97420c.dts
+++ b/arch/mips/boot/dts/brcm/bcm97420c.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7420.dtsi"
+#include "bcm7420.dtsi"
 
 / {
 	compatible = "brcm,bcm97420c", "brcm,bcm7420";
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index 0ed22217bf3a..9efecfe1e05c 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7425.dtsi"
-/include/ "bcm97xxx-nand-cs1-bch24.dtsi"
+#include "bcm7425.dtsi"
+#include "bcm97xxx-nand-cs1-bch24.dtsi"
 
 / {
 	compatible = "brcm,bcm97425svmb", "brcm,bcm7425";
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index 2c145a883aef..b653c6ff74b5 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm7435.dtsi"
-/include/ "bcm97xxx-nand-cs1-bch24.dtsi"
+#include "bcm7435.dtsi"
+#include "bcm97xxx-nand-cs1-bch24.dtsi"
 
 / {
 	compatible = "brcm,bcm97435svmb", "brcm,bcm7435";
diff --git a/arch/mips/boot/dts/brcm/bcm9ejtagprb.dts b/arch/mips/boot/dts/brcm/bcm9ejtagprb.dts
index 8d58c1971b30..615d2b97770e 100644
--- a/arch/mips/boot/dts/brcm/bcm9ejtagprb.dts
+++ b/arch/mips/boot/dts/brcm/bcm9ejtagprb.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-/include/ "bcm6328.dtsi"
+#include "bcm6328.dtsi"
 
 / {
 	compatible = "brcm,bcm9ejtagprb", "brcm,bcm6328";
-- 
2.20.1

