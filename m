Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2D24257D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgHLGce (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgHLGbf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B30EC061787;
        Tue, 11 Aug 2020 23:31:35 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l2so919877wrc.7;
        Tue, 11 Aug 2020 23:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jAiHwMnOPDo8GdW4OpJqCPwuUyomPqMUpFNc5HXUXbQ=;
        b=Ede5anAHzvM+Z/8K+VioqgIlszBQMLS4PY08g2uB7PCbdx0S1obu0CJHyB4sbvcAb7
         Vd9Lc4Skp8sPzWetRJqFzkHp5cPqfMvJqhpLWMiZVZXE1YvA98m1NEvNhGqLlW5WsHMU
         V1CE5xC2BGRfC46e1uCOER4HChhZHtL1KZyTZcuO/3XaQxHYX3S465bkK/FJsgRiVnaH
         HuhLFNsRb6WQ3lh0sj5P9l63gxklsdoalcYzn2bw2IiEUrO8DPwBEbDkfOvQEh6FJI//
         VorTGLnu6j1e8UW65HW/DocaAP2TIUn1i+GpsGpQid1O17B7AcltNpvzVJk19dpCGPP4
         FZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAiHwMnOPDo8GdW4OpJqCPwuUyomPqMUpFNc5HXUXbQ=;
        b=WNHW7fPOluuKf48+t6cb1KgaSORUUbWGNKcLhh8TZo+uv3Q+DInjqZ4MqJfSBNV3AC
         t/QrULr0QNB4oiTCgTl4XXwb8587FGLgadXMqy/yJuG+mDwYwitFyEqoxt+hl/bRAD+I
         bvXcsqR0CllrS1DNfTc0eqaqrBTLP1kZVXe8c+wF/58J0z1b3kGZR62aTYtHsiYQ6HBH
         KSOMXZ6N/UVXAAAx4IABpiHmK7N6EqNYmVhRFgkFhrn+c6zvU9i/LiLqLu7+u2fchhu7
         DeJAo+mKBqS3gHC5MTICPTTCyqmHWE2m58QV9lseHezoL4RXU+16BWWuQajkDVkKH8YX
         GRyQ==
X-Gm-Message-State: AOAM533YPWF7welkNnipBWrfFdwe4ZN6b4AZAL+a/iecnmQX5sZL78OZ
        9eNSZRvLjtXNvx4LGJTv3IQ=
X-Google-Smtp-Source: ABdhPJz0rWF9v83Lhc7heAUxipoQpxmokvmh5ZnZ6VrkH/pCaqg55ZU089SW59VAXPthyD+QU5L0NA==
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr33385345wrx.139.1597213893931;
        Tue, 11 Aug 2020 23:31:33 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:33 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 01/14] mips: dts: brcm: allow including header files
Date:   Wed, 12 Aug 2020 08:31:16 +0200
Message-Id: <20200812063129.361862-2-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063129.361862-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change /include/ with #include in order to be able to include header files
from dt-bindings.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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
2.28.0

