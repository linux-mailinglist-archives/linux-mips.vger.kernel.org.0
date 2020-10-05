Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C6E284137
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729750AbgJEUgT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:19 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57027 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgJEUgS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:18 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N5VPg-1kRAoj34jS-016sx1; Mon, 05 Oct 2020 22:35:47 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXCz-0004Vl-00; Mon, 05 Oct 2020 22:35:45 +0200
Received: (nullmailer pid 10331 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:37 -0000
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
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v7 04/12] ARM: dts: at91: smartkiz: Reference led node directly
Date:   Mon,  5 Oct 2020 22:34:43 +0200
Message-Id: <20201005203451.9985-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 883e206fe91cc1c75a414c154095e545
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:5ZDmDCrnMLx3t8rF84LEdt0tTtR8Fz7PUe/C49eHIKrHHckpnKI
 5cF2sq0KusblA1UyT1LyDWK4Lx3bF2aGfk1iGUgsONivlyK4O/264pTjy+QcghGG2DeLQH1
 NcN82XoGOPMsQsXJUt4vEYFcYLi+iiiCSJmwy/4vR1Kgc2x6lQRitMzLFvjv7+VfHbgGy8U
 6rpzJAtAU5CdOrFJ8KNpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6z4X9w84V2Y=:Bk5QOnfSm45rYOQ9PzKPFb
 tRoe/FQgeDv8ozAY3XzzIgvx3Qau2hcSwYdJmzqUCpsdqETs4iHEPplJYXOc2FjzddjkxvM5X
 WKRv6zShH7A6vROm3qL02gfuYHiPpqIPk4+GBiGixiySzCoeDras5b96TXcNw6iUgXtisgtaE
 THcbqftbFfCHzilD2fy5mBRgouhoPtvXToaJrnKAltiLj2MOL3lKu+ChrhkbBP+GZDWQhQSsz
 ivPU0NzehlAJVhcVh3u7eQsgX7tpd8RIxx6YAWI/mC4fALmtyfr3p/2+phofXbyzO1UvrGDrr
 uQN2CrteXXfHnDFaEFY55sQ8+Ug33ofX9uB8EsQctv4l8BUk8afPVLzSRckd0fwiOX/ycfdti
 RjXiPILw7fp0Ljo/MAUeDfljGJinYU7EvwLOmy4XTjH/uOieGBtGor1EDTPwetypMyJkVE+QW
 14X7JXL2wKrrUN7wROmvZajT282/Ywma09Bxuz7CGkx9jh12y7yT4+RMGeCzr2xHjbIvCqny4
 X219GbiHDKvgzFlio1pmfPIzuwlZ4/mOBwCAXiCIFkBRYyXKL3tZ+6eTQyj2h0eTm/obw4L+n
 W+uxFbme/925gxoOoC17Aj4BGZSfuZIp/ZcOvqKZDej4TpThQl9ACpW5RP/AbnVkSP77yJhe9
 8vgD2EAokOfTio92ICoJrgHBbmC23DSz3E0q16TCnNVrMVM7KlNhx479k6cXUO9pOj7HBE277
 9NYOObU322OrY5PYWu/cAyj5MmomAVxu/+jvX3UmiwnGrXfag17KHPevc61mVWoLGtOLXKbJy
 yu+w9NadE7z2Yfgam0QeuxVW0hIHn3ZmN50+JUIPteo3I2NDQoihbc59+cqf9u5qj05HQr6
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Do it the simple way like for the other kizbox boards.  This will allow
renaming the led controller node name later without breaking things.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * (no changes on this patch)
    
    v6:
      * added this patch to series

 arch/arm/boot/dts/at91-smartkiz.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91-smartkiz.dts b/arch/arm/boot/dts/at91-smartkiz.dts
index 106f23ba4a3b..b76a6b5ac464 100644
--- a/arch/arm/boot/dts/at91-smartkiz.dts
+++ b/arch/arm/boot/dts/at91-smartkiz.dts
@@ -84,10 +84,8 @@
 	status = "okay";
 };
 
-&leds {
-	blue {
-		status = "okay";
-	};
+&led_blue {
+	status = "okay";
 };
 
 &adc0 {
-- 
2.20.1

