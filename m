Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C928D1B80DA
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 22:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgDXUfL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 16:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgDXUfB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 16:35:01 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8CDC09B049;
        Fri, 24 Apr 2020 13:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587760499;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=urc2KwT6CTpps7J1q4E2AK0qOM+8Jk0H0NWeScBSbMI=;
        b=kBMvY7QyaiBRNw9VI3KorDOv74GzyGe1Qs6oZ/ATeYGqlgDSiez4iztUA1AG9aT89o
        7o2MUj6c2qnkhL+Q9AWxN0UybY2TuJ/L+Ax6x6tOW6HyI4+pQo50d99XVdky5cGnA2ru
        WVS8LTX5hJujsgHJVKwPcexYh1cuoo86YD2yIl/K1vfNKmX3iXSVD/XwclzlFxQlX+LG
        EB9GQhfnQHCHxPctoxO2WRcJyKJ1x3+jFHA4XBgOK44btLdTOleDEUaGZ6+nzwxKytvp
        z6MKc0CMM7QJ5KkUByRaJrf9YmazMgbFk31tGzS8ASrmxQJ0n5aen+ec4HxzR897zvrC
        8CzQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GK44R2FE"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3OKYOEVG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 24 Apr 2020 22:34:24 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
Date:   Fri, 24 Apr 2020 22:34:11 +0200
Message-Id: <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jonathan Bakker <xc-racer2@live.ca>

All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.

There is no external regulator for it so it can be enabled by default.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 2ad642f51fd9..abbdda205c1b 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
 			#interrupt-cells = <1>;
 		};
 
+		gpu: gpu@f3000000 {
+			compatible = "samsung,s5pv210-sgx540-120";
+			reg = <0xf3000000 0x10000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <10>;
+			clock-names = "core";
+			clocks = <&clocks CLK_G3D>;
+
+			assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
+			assigned-clock-rates = <0>, <66700000>;
+			assigned-clock-parents = <&clocks MOUT_MPLL>;
+		};
+
 		fimd: fimd@f8000000 {
 			compatible = "samsung,s5pv210-fimd";
 			interrupt-parent = <&vic2>;
-- 
2.25.1

