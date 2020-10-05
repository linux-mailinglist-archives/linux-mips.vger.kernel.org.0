Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7754A28415A
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729837AbgJEUgo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:44 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33407 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgJEUg2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:28 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MDhQt-1kH2ss02o3-00AnRe; Mon, 05 Oct 2020 22:35:57 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXD8-0004Ws-Og; Mon, 05 Oct 2020 22:35:55 +0200
Received: (nullmailer pid 10401 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:41 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        James Hartley <james.hartley@sondrel.com>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v7 12/12] MIPS: DTS: img: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:51 +0200
Message-Id: <20201005203451.9985-13-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 07736050a5de048e796b12253fbde497
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:p4vODZJGo9+t9tn9s8bm4upQ45uAf97K+kjoIIIPTinrUJiiStE
 rpcrEB7DJRk32pGB4QvhMU2kgfy+90tUnfDra74bIY6U6B04OzthKrpNFh7xKKN1Gylf3ML
 M3fkSZXJlDQJ5SC3TXFZ1Hzj09ektnkRJBP44ne1uXMx4Mhh69+N0DcUbRBP5wlygsn30tu
 hA0wVNMjT6H/AFtUGeUbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lKjCGNqN9aQ=:4OCCRZ6yOVkWOUuDTdYsdd
 4ItDgizdlZGX+PKDphO+HBFjymNxyMfq5iQMT7m+y46EQz/WLOocZVFdys6DIc6yvFEBq8NkR
 1PEPPIsQ+C/aPYgYDndLnparpbI87W9bD+5cdQ3RjkqO2kMhiYt9t/Cvfcn1j/QCUlltsHSIz
 H9+pqdrYEIBKuQJFbKU+zbmvwIO+T/0cJR9m1PY0nLXSJyj1fgVqiejlsQ+qVss4Z/92Ztw5o
 fTRSUJOBdXUAjKuevujspz5h9FF8MVKB4MAgYa0nz4TFeXq4o0SE8BZvbVt/xI6F8koLv75AD
 DIXSHxUS8oAGoV2iFIWtCBDlxINivP2hEO45HCrfbKGMiIlHr7uNdgY6VnRJecAd7oLovXw19
 wIflGa0BkD4W/l8gSP7zxisvaQZRoiy/Xk473WxxSTKHaJ4sBvju04Ye1bZNtccGuK886JNif
 whQBFSbiE4tM5jUXrzdcqCHOK0ug5T+24DJ2MxtMm9apcSV0teO3k02eeQOKOQBsViwG1GMnA
 Ewm9REB/gOkrmHqWwSHhMMkg7KnXpvQOVQ5bPlnHSt3tBdJbiuXX9qYbq45261ONAuenYT4gV
 OZryUDfGG6MI5PaTqRPLRsOZJ3MwaQWGvJ9Q0FqaMj0CI+vocuswaJaLW6v8h334y3DFv9HgI
 O2tvTNh1+2hkqLAsoI/KJHgNbSN/ee5aJUhLZtPgvLT+vkC0UDArgbbPHsf7/D3WY8YbU7Gsf
 x+MKhNdXBS+MXiW1YPe8fJ//KX6NC38CCmf2AavA/CxngY6yVnmJ5133JGz6n0S0xrzTHqzaa
 g1YTtDFMNZlmhVFKgmyRQiYmedSUiLJJOj/gSCLF41mChCXp+E8nZwK7qmRbYDSCiWl7BpQ
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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

