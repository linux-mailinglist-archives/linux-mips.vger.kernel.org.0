Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFD90F2D46
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 12:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388178AbfKGLSR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 06:18:17 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.178]:26787 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388093AbfKGLSR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 06:18:17 -0500
X-Greylist: delayed 707 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 06:18:16 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573125496;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=24fF1xUH22DnXnm6wMQiB8qNar/ohuK/dXnbgHGAvcQ=;
        b=nLgX8SwL+nzyv2Q2tAJL6jpL+lbaYvpIP1s+N9TGjmDWiSUK3REbLhv9F7RyVjqeTz
        eKkcm4/bFF+bp5Z9jZBryJi4S0pqIo0zq0EG22DdMiRxRnAbgZIDXoHxcEGx3hQXUpgX
        FINvsdgPAIsRy5qTkhEAoNdxsg5kwn4zLS24OJlvaMbg1V9eX7oo8NwmTSq3xYPrqQt1
        fDRNDPm1OzPHkQ0eLVzpxx+c4QVo2GvgRS/EnHT6SHh5Ny83Pc6yBibcrMLqsQxsZgpy
        8UkaXh9vKO3HloUAlFEtsjLYEAgu5ugnMcAGSYK3sIKAVgzeuxPSlbBX16b2A+mpGo0V
        fdsA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Ddgt
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:13 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date:   Thu,  7 Nov 2019 12:06:05 +0100
Message-Id: <fbe9f4a20fd55d111afe8f09d03c154a82cf5ba5.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt.

Tested on BeagleBone Black.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index a9d848d50b20..dbfb9d5aa915 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -480,10 +480,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x1000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,am335x-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x00 0x1000000>;	/* 16 MB */
+				interrupts = <37>;
+			};
 		};
 	};
 };
-- 
2.23.0

