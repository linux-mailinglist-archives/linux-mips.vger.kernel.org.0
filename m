Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED3A27F65A
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731287AbgI3Xx1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:53:27 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:44831 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3Xx1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:53:27 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgRYd-1ku3qH3u3T-00hvd8; Thu, 01 Oct 2020 01:47:55 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlp9-0007aF-MT; Thu, 01 Oct 2020 01:47:52 +0200
Received: (nullmailer pid 7817 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:51 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 7/7] MIPS: DTS: img: Fix schema warnings for pwm-leds
Date:   Thu,  1 Oct 2020 01:46:37 +0200
Message-Id: <20200930234637.7573-8-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:0IUo1RRU7aAo8lMj4tzZs2tdPUuRWx/DVg9fWHk99XurY6GYSNC
 hi0k4Y+6Rvd2A96ObtnJkZ9b7FaJC8oTKeQjrqDQoiAJi59zcVISDFtcTQC5r9ppEjXMxT5
 9JZqTtubXCNiBVhQw98FxKkqHLFjh1VvJjlQu5KTRSOTFE3yj4N8WYGh5qJoe9yvg0/N+ST
 0mF0lowsi3Ph4kHDEtMIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ecUuY4q8Gc=:5pdPvjKLRtHGB+jyb6ogsm
 mseida6O/rUXoquHbx//MvOs5Y3069W/7rUsraL6Q8VMaKRBaHaZ9YpMmWMvTvq7Iy/ZM+o1P
 3ug1TRVxllhD2Tf8UGFiH/2z5Jys0wgCL2GSzGszKKP3N1PNfig4vfq/nyvmChwF+JuMJ9cXi
 Th6iZFSTqG3oNsx0attXL+8KxXvon3FZP4eQJmr8/Et5J51O75T5X0KRiIBRSjA4LJUgZb1Op
 g/VsS4wSzaXKAdJof4lmMye/B0gN5CaIe+2gLLb3VkPuIObK9figRjq6Rj9Mdl/+Ok/sJG/YB
 LLRR0lcEsdHllHueRexDH/OALqq0YIGwrqtVEGAlIrBFTNcSa8Tla3btFaOGKtzEVCL2d6ORl
 gPTJ66cs+0DLQtFRKsN4yrKR5a3dK+uVX9/d/uoSSK9SQZjOmNPj3ThYCtJcehN5SvvfmSx2L
 VxhfphV7Zs3o4iQTJ4PJzeqprgdkiAXlVU2x1clPQyGK36NcJv+QYf1F9jV8lISwkPuhnhBja
 o4T03eH4tGYdIDQN+Ahe13cUIMfbzwJ3ZeE0prSRlgsk4Evdn17hiGjQlpkqHRRGSdxHCatZW
 +hDGpSyzd0OmLDV5iuR0zipb8TfWbpH5qTZPuSdU+lFqpWj7O0Voom3reL9mudWxGaf7Q+kl+
 jNf2QwLABuQSrWYMumMB/VYDcnGPy2+pDucow638wMe9uqLVIDFCR/0lnyR7vhFkiOyyGATJQ
 E4bwN7rKHWjSY83PwK/1sawX7PAx17LdSbR0xxmq6pu4pnWOUVSSJK5BQ82GvuO7ZBILyTfur
 l8ArD43Oi4k8MhDuYj7DkA4tfYESO+SfRmRfY98lwTkUG3Je2r2EAXUsKlUuk+kDbePtWiLgR
 A1kGCdoGG2QarQQTjJ5jYuuAxhO1Qv1JpeThZd+cQh8SHDJAuj/10UMVWYp2LsP9UFk+tEp+X
 PrOR5q7Ml2TqA+ghjTVnru/WeaZ/GJR5u6tvwZjqZXjUmJA5Kx1BMIJ4QgLuJVeJwhiKT6It3
 O3eZkORudcdbpEPydJPUv2JXHfS6U5e3n4zKke+jXQWx
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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

