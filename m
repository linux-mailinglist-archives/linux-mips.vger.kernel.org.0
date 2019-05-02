Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADEDB11903
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 14:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfEBM1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 08:27:49 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39110 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfEBM1t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 08:27:49 -0400
Received: by mail-ed1-f67.google.com with SMTP id e24so1930696edq.6;
        Thu, 02 May 2019 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZFjF16+Txv8yNaftrhru/aAz5iyK2bm0MPzvuW4t+RM=;
        b=qHms+JM51wb92F43OP6RbNxVOZ/arwDadKfW48t7CgA7fvL5Vq1aNpw4dhvhvBt7xu
         FWisiSfkPDw/bYsmE9YJcwrCNOZU0m+1lpO0GW2hWooljFb4vBW5/9f2l5JDok0ygIF9
         v6NNHMdryPzv216RpCzX2zMFkBj65HiVSZGH0W2g5jQzh0Qkat8DEFFFgFxOsojtAuXN
         R+KgeFBl4SpGLlJzxu2HIa1tTHL0X5q2IQzAdakQ+OtmXvO2nzoC52s2Yxg2wHh9R7ux
         GUNYwjJ4jeyPwC93gIbW96F1VRGoS05Yu6J9FPDh7LkRZVrBRdYPc7Rmxyp/AKyRbo+m
         UfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZFjF16+Txv8yNaftrhru/aAz5iyK2bm0MPzvuW4t+RM=;
        b=lqDZVL1unxRn+grt4Jn1npXr3xJxQ2lGSmYDJweZqVx9xl0i1fgj0BZ88KMmKj4HJQ
         1GyPtZgGN1AfiAZFwzqfnUd63mtF/hyDM6ptCKHVpRUF0oxax3xHgMxg/00O6/EwVSeN
         xA19zKggJ2mIxyqpDjWoT2/gPdkm8fyTDm0M8c1P8k7aUHcx2R9ilSNFt4aNq3F4m9Y+
         VVWWbXsY4U+YvHzFEuQCucAaJYJ0HaxuaFSDK/UA93puaIcNp3f1IOuVlhFkiFiHpljd
         q/R9n7vVM7NpqJHrKHNVhfSSddWYCfDrwniTTVRRtayoHR3rDX83VNizMg1ayIkzPrDM
         8tdA==
X-Gm-Message-State: APjAAAXNFNYwwuNJPgPM6iu1GYzXwMQcPpNQLbj5IwFIgTtrBdnVpfBS
        Z0hhsDDiX0UO1YKacCknmNPRHtNE
X-Google-Smtp-Source: APXvYqy/Lg18LH5GsRlsy21btrS1XWGpEzHMMPx1ba7UI4/awzkWK7/VVaLJ6MMyT9VzF2YHWzBAPw==
X-Received: by 2002:a17:906:5c7:: with SMTP id t7mr1625836ejt.129.1556800066610;
        Thu, 02 May 2019 05:27:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id k18sm2030453eda.92.2019.05.02.05.27.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 05:27:46 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Subject: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
Date:   Thu,  2 May 2019 14:26:57 +0200
Message-Id: <20190502122657.15577-4-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190502122657.15577-1-jonas.gorski@gmail.com>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that we have a driver for the clock controller, add nodes to allow
devices to make use of it.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm3368.dtsi  | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm6328.dtsi  |  6 ++++++
 arch/mips/boot/dts/brcm/bcm6358.dtsi  | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm6362.dtsi  | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm6368.dtsi  | 12 +++++++++---
 6 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
index 7a3e5c8943ca..69cbef472377 100644
--- a/arch/mips/boot/dts/brcm/bcm3368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@fff8c000 {
+		clkctl: clock-controller@fff8c004 {
+			compatible = "brcm,bcm3368-clocks";
+			reg = <0xfff8c004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@fff8c008 {
 			compatible = "syscon";
-			reg = <0xfff8c000 0xc>;
+			reg = <0xfff8c000 0x4>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@fff8c008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 58790b173bb2..beec24145af7 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@10000000 {
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm63268-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0x14>;
+			reg = <0x10000000 0xc>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@10000008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index bf6716aa425a..af860d06def6 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -51,6 +51,12 @@
 		compatible = "simple-bus";
 		ranges;
 
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm6328-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
 		periph_intc: interrupt-controller@10000020 {
 			compatible = "brcm,bcm6345-l1-intc";
 			reg = <0x10000020 0x10>,
diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index 26ddae5a4247..f21176cac038 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@fffe0000 {
+		clkctl: clock-controller@fffe0004 {
+			compatible = "brcm,bcm6358-clocks";
+			reg = <0xfffe0004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@fffe0008 {
 			compatible = "syscon";
-			reg = <0xfffe0000 0xc>;
+			reg = <0xfffe0000 0x4>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@fffe0008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index c387793525dd..8ae6981735b8 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@10000000 {
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm6362-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0x14>;
+			reg = <0x10000000 0xc>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@10000008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index e116a385525f..449c167dd892 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@10000000 {
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm6368-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@100000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0x14>;
+			reg = <0x10000000 0xc>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@10000008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
-- 
2.13.2

