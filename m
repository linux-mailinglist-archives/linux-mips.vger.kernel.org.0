Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD6228416F
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgJEUhA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:37:00 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37855 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgJEUgY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:24 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mf0uq-1krT710Xnu-00gc2C; Mon, 05 Oct 2020 22:35:49 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXD0-0004Vs-2D; Mon, 05 Oct 2020 22:35:47 +0200
Received: (nullmailer pid 10299 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:35 -0000
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
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v7 01/12] leds: pwm: Remove platform_data support
Date:   Mon,  5 Oct 2020 22:34:40 +0200
Message-Id: <20201005203451.9985-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 60b617cbd4bf9c2e08b69b262f748e48
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:F6CgTqFAM3Qqi3ZE0tnTBE4mNujqwFryfVD6rzRWENkVcmWDhRr
 ou4O8IwayvYCgYv1NB2QHjUyKASNO7CpeAclu6bjzPbL58Yz1gjVaTbdDBLPyxkddbNmtuS
 u/zezbz5ZKHIwKkOlUPALYQ/zqHv8QRZ0g1AFFM4I9nHeiA/U1S+TTqF/YMxJ9jyNM1FNbS
 lbO7btq+DmlmbcWrsSohA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dEdS/I+Xl2I=:PiLtBsHPvNdnKu/d/mxmsJ
 rEdBMUdvRuwWDDKxyaDMAHPYxYM88Oedh0ZKhZCTBisht7o/bSAwwCmh5yLjH++jYj4GKdY7h
 iKf9faeQjYQ8Ul4FLjZDsbZIstFJNoq8pwE7EckpgkTRHOVrrokkfm5tODmAzdlLvH34+xPJh
 mXYvgsGtDDL2pCp03/03mON0DCWPhB8XG0B2w+LcGABS23CL035nuH2fHjD/Xe4YfBvLBaaGV
 OsUZlv6HNVFtuUgrjhxmj4iwkoPovo/J3QCJ3651JqQUcbDtx6V1urdeVT7QyFvQ0IZsF+z54
 /zUMHwh75CMpvTC9OWDjTLDWGYoXwCg6i4tsD4YZ6yTIRXSea9xId5KCg6Gs06SXX63UrrTbO
 AZpMIvSUeqlk3KM1a9fxNa9vr2cV9HKYu/G584ctHMX803O3BHZL5qe7267p8pKo2HTpfnOpv
 AvSbJMMgZ9LWEiTRg6XCaBS5pvXx6EwASb20FVKHtAX1sNf9dko+psaZplMFMh2r25Nn1LAQx
 CuWxdse3MucWTkS3+d4Uws/qJ7L2thzCqLDJ/EjVWtA3LuLBLhXxAoTE2B7L3Vx929KdAv7AJ
 lDtKP1Um9mgL0Jehee0bzE3MedQbE4oRQ3Fgg3bgbIyxVnvgm21DKOcXWFmkqqGTwsrvJuc1r
 ZfGlonYTZeJIeu3YQqUy4gapBGXY0N24kLYZmeD/ygjyKgSyusCoz8l/Ymf3n85CCdzO0N4Ga
 B3dHGs6BYAKGvKUYWYRaGPLF+l9pHvmSMgRx1RKA8i0KLNenqDT+W+t9hlBIW86kFKkRDIcKp
 7r7xrzNZi6L+vlKt/FWCmHM/PrxbfGJw1EMyW0qrs8fB7ujLAO/XY0VmcS9HjeU1LiAtIqw
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
interface is not usable from outside and there seems to be no in tree
user anymore.  All in-tree users of the leds-pwm driver seem to use DT
currently.  Getting rid of the old platform interface allows the
leds-pwm driver to switch over from 'devm_led_classdev_register()' to
'devm_led_classdev_register_ext()'.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Cc: Denis Osterland-Heim <denis.osterland@diehl.com>
Reviewed-by: Marek Behún <marek.behun@nic.cz>
---

Notes:
    v6 -> v7:
      * (no changes on this patch)
    
    v5 -> v6:
      * added Reviewed-by from Marek
      * minimal commit message rewording, because a later patch was
        already applied
    
    v5:
      * added this patch to series (replacing another patch with a not
        working, different approach)

 drivers/leds/leds-pwm.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 2a16ae0bf022..f53f9309ca6c 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -24,11 +24,6 @@ struct led_pwm {
 	unsigned int	max_brightness;
 };
 
-struct led_pwm_platform_data {
-	int		num_leds;
-	struct led_pwm	*leds;
-};
-
 struct led_pwm_data {
 	struct led_classdev	cdev;
 	struct pwm_device	*pwm;
@@ -60,6 +55,7 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	return pwm_apply_state(led_dat->pwm, &led_dat->pwmstate);
 }
 
+__attribute__((nonnull))
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
@@ -73,10 +69,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	led_data->cdev.max_brightness = led->max_brightness;
 	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
 
-	if (fwnode)
-		led_data->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
-	else
-		led_data->pwm = devm_pwm_get(dev, led->name);
+	led_data->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
 	if (IS_ERR(led_data->pwm))
 		return dev_err_probe(dev, PTR_ERR(led_data->pwm),
 				     "unable to request PWM for %s\n",
@@ -139,15 +132,11 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 static int led_pwm_probe(struct platform_device *pdev)
 {
-	struct led_pwm_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct led_pwm_priv *priv;
-	int count, i;
 	int ret = 0;
+	int count;
 
-	if (pdata)
-		count = pdata->num_leds;
-	else
-		count = device_get_child_node_count(&pdev->dev);
+	count = device_get_child_node_count(&pdev->dev);
 
 	if (!count)
 		return -EINVAL;
@@ -157,16 +146,7 @@ static int led_pwm_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	if (pdata) {
-		for (i = 0; i < count; i++) {
-			ret = led_pwm_add(&pdev->dev, priv, &pdata->leds[i],
-					  NULL);
-			if (ret)
-				break;
-		}
-	} else {
-		ret = led_pwm_create_fwnode(&pdev->dev, priv);
-	}
+	ret = led_pwm_create_fwnode(&pdev->dev, priv);
 
 	if (ret)
 		return ret;
-- 
2.20.1

