Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476252C718C
	for <lists+linux-mips@lfdr.de>; Sat, 28 Nov 2020 22:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390730AbgK1V6S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Nov 2020 16:58:18 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:56965 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391454AbgK1V6O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Nov 2020 16:58:14 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MowT0-1kPnaD463C-00qUqX; Sat, 28 Nov 2020 22:55:12 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kj8BR-00028l-4q; Sat, 28 Nov 2020 22:55:10 +0100
Received: (nullmailer pid 4158 invoked by uid 2001);
        Sat, 28 Nov 2020 21:55:08 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        James Hartley <james.hartley@sondrel.com>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v8 5/5] MIPS: DTS: img: Fix schema warnings for pwm-leds
Date:   Sat, 28 Nov 2020 22:53:53 +0100
Message-Id: <20201128215353.3991-6-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 5ccd8535a2f53357608f384c4c8220c3
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:P2Y70kYg3CuoaW8dA2A8duhR9E0iY4+BlupumaHUtNIKfJBeMpE
 OEgb7CJ++1ExB2HMOrc+kjbDjIxt3D/u1QGmQdPN+lwOArjSw/jNEeftA3LbzW6RB+p45FY
 ynTo4IR46hHblnF+KU4SocDdQ3aXarkEBDGX3c+chthToemwFtl50WLmz7arkEAbywCCYX6
 FqGqXip+nP3GxNZD3gwMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mgwv/y2PQyo=:l6g3zbRgOPuTRcX6qX+csU
 0Z0rHM3WEDNVxmydmMlmuKHcygVtROPApeRsUkJltJJaK0JC9miqHjYdGdLwMqVeEnR7GQn1s
 eSXr6yQszpDcnetk0q3TOfwk96e+BtazDmR9J35o5X6nANSnThQxxAHfOHFjfjTQhMONtv3iP
 q9Ux3W2x+3jrHm00xXgB5Yu10DsPHF0JUTygljBbM7Go81k+ILSWltGIPlaoW53WEogsotnUR
 eMRm76Ro80+y/eRcZfc5mRzrvfCEtcfkIlbzHfcOwE1Ncqgu1fSQb75kKFJQetjQSl7yzVR3+
 pEOY4XZaM76uAFsOcjFvphMgjNelgVA81l+nt4AqGTSJxExDC+LLz17vx4FHR9vOnh8ffQCtL
 oFEzQGMkRVJSZXJgkuqNpK+UYUCKo7xCqOLl+B/uHG2k3K7HJHDwdFznlfpzzBeW+7avu3EGA
 FGGytYzNRQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
    
    v6 -> v7:
      * added another explaining sentence to commit message
    
    v6:
      * added this patch to series

 arch/mips/boot/dts/img/pistachio_marduk.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index bf69da96dc8b..a8708783f04b 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -46,9 +46,10 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
-		heartbeat {
+
+		led-1 {
 			label = "marduk:red:heartbeat";
 			pwms = <&pwm 3 300000>;
 			max-brightness = <255>;
-- 
2.20.1

