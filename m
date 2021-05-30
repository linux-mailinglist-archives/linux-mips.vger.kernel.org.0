Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB10039524F
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhE3RUv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:20:51 -0400
Received: from aposti.net ([89.234.176.197]:37896 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229783AbhE3RUu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:50 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 8/8] MIPS: ingenic: rs90: Add dedicated VRAM memory region
Date:   Sun, 30 May 2021 18:18:02 +0100
Message-Id: <20210530171802.23649-9-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a 1 MiB memory area dedicated to the video driver. This area will be
managed by Linux' CMA, so that the ingenic-drm driver can be sure to
always be able to allocate contiguous buffers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/rs90.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/rs90.dts b/arch/mips/boot/dts/ingenic/rs90.dts
index 4eb1edbfc155..74fee7f01352 100644
--- a/arch/mips/boot/dts/ingenic/rs90.dts
+++ b/arch/mips/boot/dts/ingenic/rs90.dts
@@ -16,6 +16,18 @@ memory {
 		reg = <0x0 0x2000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vmem: video-memory@1f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x1f00000 0x100000>;
+			reusable;
+		};
+	};
+
 	vcc: regulator {
 		compatible = "regulator-fixed";
 
@@ -300,6 +312,8 @@ &tcu {
 };
 
 &lcd {
+	memory-region = <&vmem>;
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_lcd>;
 };
-- 
2.30.2

