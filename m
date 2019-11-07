Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBD88F2D40
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 12:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387796AbfKGLSN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 06:18:13 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124]:30104 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbfKGLSN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 06:18:13 -0500
X-Greylist: delayed 713 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 06:18:12 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573125491;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=11dnnmhb1p7k4nx66KvKMNZIk0qpx8gkJedgWR7HCNM=;
        b=ZL/wPgP4FtpaKR/gbstWCi906HsW9DzEd297K7hunes5CThWkRfdmNjQKmwjhLfwek
        asflGKdUU2tOF6ddjQTF3PLzKkYdDdQNBvI9vsVFN4/gILeh1GP+YgkoU0TkPiYNFSTm
        CypoO2HAYNWoDTINdZnA/1FK5pNx/+dIxqhH/HRdfKBYnPw10oYpWlkd+rDQZohdsgs9
        AO+jiZiHtKRZbz0SN5kKa91INO9tXtSZsFJ7aani19OvlgD+yWyibiQ43nMeUmSHaFwH
        CQ5BNMGo09Eumt3yWNl39C/jozp1P33ea89iCmDzbpsGt0KaM6D65S6/s4rlKfHsBic8
        lEDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Hdh7
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:17 +0100 (CET)
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
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v2 8/8] MIPS: DTS: jz4780: add sgx gpu node
Date:   Thu,  7 Nov 2019 12:06:11 +0100
Message-Id: <9e5dae8c163c2183e4c6fac5c0c9218782fad665.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt and clocks.

Tested to build for CI20 board and load a (non-working) driver.

Suggested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index c54bd7cfec55..21ea5f4a405b 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -46,6 +46,17 @@
 		#clock-cells = <1>;
 	};
 
+	gpu: gpu@13040000 {
+		compatible = "ingenic,jz4780-sgx540-120", "img,sgx540-120", "img,sgx540", "img,sgx5";
+		reg = <0x13040000 0x4000>;
+
+		clocks = <&cgu JZ4780_CLK_GPU>;
+		clock-names = "gpu";
+
+		interrupt-parent = <&intc>;
+		interrupts = <63>;
+	};
+
 	tcu: timer@10002000 {
 		compatible = "ingenic,jz4780-tcu",
 			     "ingenic,jz4770-tcu",
-- 
2.23.0

