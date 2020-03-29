Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C3A196EDA
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgC2Rik (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:38:40 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:19695 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgC2Rij (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503517;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=b0jJGA39xmvMSBMWkb+iC5+Dn3MX1LxN2wPchhSznQM=;
        b=Jb7yKyoWvFmOM7402R9XQmKQzOWi4PjEPCi+gBeJiMDAjHkSaOgXgqs4dtGkDruzCM
        MUTIjJ2h9DsOmI41HqQ4tiZSu19vzXxZtTLboK/K5rAiaMkhcRpr4eHnxQoQLWSx0fh3
        SiG/fEuNtHXOrXawMlZJ4az6jCRoAI9wIvFwttV1hqlN21lU5CSdEUECa0dnP5vhEfJf
        h265A8cHW16lvQ3y5idnnjTnyUeSy56WUNpwtRwBgaJssw1fouOZlPiB4v7U4ZmC+uEW
        Qke10WHajlVe408r4MJYA1luiOwmo7JxQ1sb6k8CkAkmtZ6i/l7etq000XF6B2VjDiBu
        cj/w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THcSBMk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:38:28 +0200 (CEST)
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
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date:   Sun, 29 Mar 2020 19:38:20 +0200
Message-Id: <720967ec44f65973a2ba81a39fb55fb1bac7fa04.1585503505.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503505.git.hns@goldelico.com>
References: <cover.1585503505.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # BeagleBone Black
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 41dcfb37155a..cbdd85a1e4b0 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -497,7 +497,7 @@ aes: aes@0 {
 			};
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
@@ -516,10 +516,11 @@ target-module@56000000 {
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x1000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,am3352-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x00 0x1000000>;	/* 16 MB */
+				interrupts = <37>;
+			};
 		};
 	};
 };
-- 
2.25.1

