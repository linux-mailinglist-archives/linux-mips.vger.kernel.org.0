Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D34395249
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhE3RUh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:20:37 -0400
Received: from aposti.net ([89.234.176.197]:37834 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229956AbhE3RUf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:35 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 6/8] MIPS: ingenic: jz4780: Fix I2C nodes to match DT doc
Date:   Sun, 30 May 2021 18:18:00 +0100
Message-Id: <20210530171802.23649-7-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The "ingenic,jz4780-i2c" should have "ingenic,jz4770-i2c" as a fallback
compatible, as per the Device Tree documentation found in
Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 8d01feef7ff5..9e34f433b9b5 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -339,7 +339,7 @@ uart4: serial@10034000 {
 	};
 
 	i2c0: i2c@10050000 {
-		compatible = "ingenic,jz4780-i2c";
+		compatible = "ingenic,jz4780-i2c", "ingenic,jz4770-i2c";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -357,7 +357,7 @@ i2c0: i2c@10050000 {
 	};
 
 	i2c1: i2c@10051000 {
-		compatible = "ingenic,jz4780-i2c";
+		compatible = "ingenic,jz4780-i2c", "ingenic,jz4770-i2c";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x10051000 0x1000>;
@@ -374,7 +374,7 @@ i2c1: i2c@10051000 {
 	};
 
 	i2c2: i2c@10052000 {
-		compatible = "ingenic,jz4780-i2c";
+		compatible = "ingenic,jz4780-i2c", "ingenic,jz4770-i2c";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x10052000 0x1000>;
@@ -391,7 +391,7 @@ i2c2: i2c@10052000 {
 	};
 
 	i2c3: i2c@10053000 {
-		compatible = "ingenic,jz4780-i2c";
+		compatible = "ingenic,jz4780-i2c", "ingenic,jz4770-i2c";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x10053000 0x1000>;
@@ -408,7 +408,7 @@ i2c3: i2c@10053000 {
 	};
 
 	i2c4: i2c@10054000 {
-		compatible = "ingenic,jz4780-i2c";
+		compatible = "ingenic,jz4780-i2c", "ingenic,jz4770-i2c";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x10054000 0x1000>;
-- 
2.30.2

