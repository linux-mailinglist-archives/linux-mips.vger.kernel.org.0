Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79D26924A3
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 18:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjBJRi4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 12:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbjBJRiv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 12:38:51 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A977879B31;
        Fri, 10 Feb 2023 09:38:50 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ba1so5789725wrb.5;
        Fri, 10 Feb 2023 09:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWIrI7GlbPy0iZefry4elWWnc1hRjMVBj4i9Rxqr8Yc=;
        b=AewavYUNMs+O3DcWuqDhUscBXSXxCghisTHyTVN53BMLafVtiGKXHfHi1L8MIa8bXq
         DDImyJM+j2tqjg4FX+f/89iJxjFJWxGQYqmRN4ADO950PRiKZsqkM5n05nwka1EYAEgd
         cvbHBq7AsOJG5n4xR0nDR6TuBWxwgDEPwpTejTBEVGTNuyB+d0aOtnd1e64hQ2DT/HxX
         10Rwv17fxBJN6lEwTn3/4fI+/9IAO7tM3kFOLV/6y+JWqHhzf4cVLM3atoC3SV+4aGvp
         H2jErORbQLO0/hXfvxlWwtMgXrdLoiBOjmtSr+xye6+1/HgGRCeD27wTogUzFJUB60C5
         LNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWIrI7GlbPy0iZefry4elWWnc1hRjMVBj4i9Rxqr8Yc=;
        b=ZQu3bptvQDBnYC9rJLIf9VSk660glDktIiK+AOfQG54df7jLceBmUsxwawuI/eWhVU
         WahtnLfs1bz1MqvBcKIVPiXXMlEEw+JXNewPXmVpia7hTUiQczb6MkNXn1U0bDvbSKza
         AgruEPDwvsg4I1C1dUXym6rdSj1LFf9knUXI73+ocQLljQBus5mIG0vEXPJeV2zO5CHO
         0VAWKu/iFRilzbXDHOayymU5wmJ84O14OyYnP+pKKoSeClQ3nuNyT96ZTdEBNruRmu3w
         ePMSX9A2YYd0PqvBcJNbZHtS82LXb5xSTA7cXRsx5OLSQqokrAFbaBme9deCacntLZvx
         ktlw==
X-Gm-Message-State: AO0yUKX+PfgffCxL66FaJqd3USCnAiRJFsoq62viuX+ePYbABeuHDlOC
        JVpSf15Z2syTViaYKjx+X7A5lcsFdac=
X-Google-Smtp-Source: AK7set+OcbVazuOGm8Yxky0/ZTVijKOujMqhTBQqhKOMxc58yu3KG8iTNEs9FgudWZjwd8Y14eQK6Q==
X-Received: by 2002:a5d:42cf:0:b0:2c3:efe7:607c with SMTP id t15-20020a5d42cf000000b002c3efe7607cmr13823006wrr.6.1676050728829;
        Fri, 10 Feb 2023 09:38:48 -0800 (PST)
Received: from localhost.localdomain (23.red-88-10-60.dynamicip.rima-tde.net. [88.10.60.23])
        by smtp.gmail.com with ESMTPSA id t2-20020a0560001a4200b002c3ef7e74bdsm4024184wry.73.2023.02.10.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:38:48 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v3 3/4] watchdog: mt7621-wdt: avoid static global declarations
Date:   Fri, 10 Feb 2023 18:38:40 +0100
Message-Id: <20230210173841.705783-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210173841.705783-1-sergio.paracuellos@gmail.com>
References: <20230210173841.705783-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of using static global definitions in driver code, refactor code
introducing a new watchdog driver data structure and use it along the
code.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/watchdog/mt7621_wdt.c | 102 ++++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
index a8aa3522c..40fb2c9ba 100644
--- a/drivers/watchdog/mt7621_wdt.c
+++ b/drivers/watchdog/mt7621_wdt.c
@@ -31,8 +31,11 @@
 #define TMR1CTL_RESTART			BIT(9)
 #define TMR1CTL_PRESCALE_SHIFT		16
 
-static void __iomem *mt7621_wdt_base;
-static struct reset_control *mt7621_wdt_reset;
+struct mt7621_wdt_data {
+	void __iomem *base;
+	struct reset_control *rst;
+	struct watchdog_device wdt;
+};
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
@@ -40,27 +43,31 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static inline void rt_wdt_w32(unsigned reg, u32 val)
+static inline void rt_wdt_w32(void __iomem *base, unsigned reg, u32 val)
 {
-	iowrite32(val, mt7621_wdt_base + reg);
+	iowrite32(val, base + reg);
 }
 
-static inline u32 rt_wdt_r32(unsigned reg)
+static inline u32 rt_wdt_r32(void __iomem *base, unsigned reg)
 {
-	return ioread32(mt7621_wdt_base + reg);
+	return ioread32(base + reg);
 }
 
 static int mt7621_wdt_ping(struct watchdog_device *w)
 {
-	rt_wdt_w32(TIMER_REG_TMRSTAT, TMR1CTL_RESTART);
+	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
+
+	rt_wdt_w32(drvdata->base, TIMER_REG_TMRSTAT, TMR1CTL_RESTART);
 
 	return 0;
 }
 
 static int mt7621_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
 {
+	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
+
 	w->timeout = t;
-	rt_wdt_w32(TIMER_REG_TMR1LOAD, t * 1000);
+	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1LOAD, t * 1000);
 	mt7621_wdt_ping(w);
 
 	return 0;
@@ -68,29 +75,31 @@ static int mt7621_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
 
 static int mt7621_wdt_start(struct watchdog_device *w)
 {
+	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
 	u32 t;
 
 	/* set the prescaler to 1ms == 1000us */
-	rt_wdt_w32(TIMER_REG_TMR1CTL, 1000 << TMR1CTL_PRESCALE_SHIFT);
+	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, 1000 << TMR1CTL_PRESCALE_SHIFT);
 
 	mt7621_wdt_set_timeout(w, w->timeout);
 
-	t = rt_wdt_r32(TIMER_REG_TMR1CTL);
+	t = rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL);
 	t |= TMR1CTL_ENABLE;
-	rt_wdt_w32(TIMER_REG_TMR1CTL, t);
+	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, t);
 
 	return 0;
 }
 
 static int mt7621_wdt_stop(struct watchdog_device *w)
 {
+	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
 	u32 t;
 
 	mt7621_wdt_ping(w);
 
-	t = rt_wdt_r32(TIMER_REG_TMR1CTL);
+	t = rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL);
 	t &= ~TMR1CTL_ENABLE;
-	rt_wdt_w32(TIMER_REG_TMR1CTL, t);
+	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, t);
 
 	return 0;
 }
@@ -105,7 +114,9 @@ static int mt7621_wdt_bootcause(void)
 
 static int mt7621_wdt_is_running(struct watchdog_device *w)
 {
-	return !!(rt_wdt_r32(TIMER_REG_TMR1CTL) & TMR1CTL_ENABLE);
+	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
+
+	return !!(rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL) & TMR1CTL_ENABLE);
 }
 
 static const struct watchdog_info mt7621_wdt_info = {
@@ -121,30 +132,39 @@ static const struct watchdog_ops mt7621_wdt_ops = {
 	.set_timeout = mt7621_wdt_set_timeout,
 };
 
-static struct watchdog_device mt7621_wdt_dev = {
-	.info = &mt7621_wdt_info,
-	.ops = &mt7621_wdt_ops,
-	.min_timeout = 1,
-	.max_timeout = 0xfffful / 1000,
-};
-
 static int mt7621_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	mt7621_wdt_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mt7621_wdt_base))
-		return PTR_ERR(mt7621_wdt_base);
+	struct watchdog_device *mt7621_wdt;
+	struct mt7621_wdt_data *drvdata;
+	int err;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
 
-	mt7621_wdt_reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (!IS_ERR(mt7621_wdt_reset))
-		reset_control_deassert(mt7621_wdt_reset);
+	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
 
-	mt7621_wdt_dev.bootstatus = mt7621_wdt_bootcause();
+	drvdata->rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (!IS_ERR(drvdata->rst))
+		reset_control_deassert(drvdata->rst);
 
-	watchdog_init_timeout(&mt7621_wdt_dev, mt7621_wdt_dev.max_timeout,
-			      dev);
-	watchdog_set_nowayout(&mt7621_wdt_dev, nowayout);
-	if (mt7621_wdt_is_running(&mt7621_wdt_dev)) {
+	mt7621_wdt = &drvdata->wdt;
+	mt7621_wdt->info = &mt7621_wdt_info;
+	mt7621_wdt->ops = &mt7621_wdt_ops;
+	mt7621_wdt->min_timeout = 1;
+	mt7621_wdt->max_timeout = 0xfffful / 1000;
+	mt7621_wdt->parent = dev;
+
+	mt7621_wdt->bootstatus = mt7621_wdt_bootcause();
+
+	watchdog_init_timeout(mt7621_wdt, mt7621_wdt->max_timeout, dev);
+	watchdog_set_nowayout(mt7621_wdt, nowayout);
+	watchdog_set_drvdata(mt7621_wdt, drvdata);
+
+	if (mt7621_wdt_is_running(mt7621_wdt)) {
 		/*
 		 * Make sure to apply timeout from watchdog core, taking
 		 * the prescaler of this driver here into account (the
@@ -154,17 +174,25 @@ static int mt7621_wdt_probe(struct platform_device *pdev)
 		 * we first disable the watchdog, set the new prescaler
 		 * and timeout, and then re-enable the watchdog.
 		 */
-		mt7621_wdt_stop(&mt7621_wdt_dev);
-		mt7621_wdt_start(&mt7621_wdt_dev);
-		set_bit(WDOG_HW_RUNNING, &mt7621_wdt_dev.status);
+		mt7621_wdt_stop(mt7621_wdt);
+		mt7621_wdt_start(mt7621_wdt);
+		set_bit(WDOG_HW_RUNNING, &mt7621_wdt->status);
 	}
 
-	return devm_watchdog_register_device(dev, &mt7621_wdt_dev);
+	err = devm_watchdog_register_device(dev, &drvdata->wdt);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, drvdata);
+
+	return 0;
 }
 
 static void mt7621_wdt_shutdown(struct platform_device *pdev)
 {
-	mt7621_wdt_stop(&mt7621_wdt_dev);
+	struct mt7621_wdt_data *drvdata = platform_get_drvdata(pdev);
+
+	mt7621_wdt_stop(&drvdata->wdt);
 }
 
 static const struct of_device_id mt7621_wdt_match[] = {
-- 
2.25.1

