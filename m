Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1391D1497
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 15:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgEMNYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 09:24:01 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:11881 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgEMNYA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 09:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589376240; x=1620912240;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jl2hrDxyAORa+XFiEFSn0ilXng4tlUFhSS/e2Ad3yGc=;
  b=ppQ+AT6/eN0pBV1TuwTUq1vgMDPTebCqumvWpiaJWJ4TbxscFaxNjDqa
   47iy2L7fXgLx8MJatG56OgYY4RBFIjtOfcSzJvXcsmVzOviOXvns6xTLh
   kIR/Wfkmj9uZ80OYbGdTNP0VZjDZKj8BP5k59uXFr6rgUAYrs4Ng42Dyx
   xuokhdX2KuTY2dfmfI0kWJcF06jFNV2U0xHeX3Pemes/tHhE92nkpyLXZ
   cuiLH5CkfM+sGztFOnYIOrkgJs7D+hYLPS6rrDuIsSQls0Lu+Qdi8y5/2
   ryei8Q/aPkIdSX5noL2nrmNi3ndl7VCGGHlryYGt4aNW3f5opciGt+63c
   w==;
IronPort-SDR: mWkyqza1Rv+cCTgFnUoPX4RnVh76MFtwDVLZag22z+BsGLH402v6qEdw/EPQ+1WY78cxRHC7wC
 BXyOyKXZ+sVYLzSfSHXY7+D1g69TnH0AJfhOV0cwjslsw0fGsohTs4jBdMipRkTb5YlPwsrZJK
 lyEiE0r7R62BSkGGDPh1ZLEF5Z9ACda438fRu8LEvFN9Sn0FQqQCfC2ui4g4CAjEyiLdml216m
 XQFf0amG6JlU7kCXqwAeHrRsYDMdsSNUWwPjihY8Gyn3zxIFZg7wsS1JCLFq0Qk/X+KfhvkHZQ
 c4A=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="73309689"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 06:23:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 06:23:58 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 06:23:57 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: [PATCH] MIPS: dts: mscc: Updated changed name for miim pinctrl function
Date:   Wed, 13 May 2020 15:23:47 +0200
Message-ID: <20200513132347.24975-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an add-on patch to the main SoC Sparx5 series
(Message-ID: <20200513125532.24585-1-lars.povlsen@microchip.com>).

This changes the miim pinctrl function name from "miim1" to "miim" due
to refactoring in the driver, obsoleting the instance number.

The change in the driver was to better fit new platforms, as the
instance number is redundant information. Specifically, support for
the Microchip Sparx5 SoC is being submitted, where this change became
necessary.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
index 797d336db54d3..f94e8a02ed06b 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -214,7 +214,7 @@ uart2_pins: uart2-pins {

 			miim1: miim1 {
 				pins = "GPIO_14", "GPIO_15";
-				function = "miim1";
+				function = "miim";
 			};

 		};
--
2.26.2
