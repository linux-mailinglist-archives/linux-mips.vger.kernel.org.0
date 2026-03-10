Return-Path: <linux-mips+bounces-13437-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDmhDnO2r2lzbwIAu9opvQ
	(envelope-from <linux-mips+bounces-13437-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:13:07 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D83D5245BA3
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0037930ACB68
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 06:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD90F3148C5;
	Tue, 10 Mar 2026 06:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+iwtnIp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6053A314A86
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123143; cv=none; b=mmr4uAIL2+PT/8AYmrGEh60ADe7t469jMrbggVuRIWWPM1JdEsWYYgwBgwMGxyfcJm81NXTVKyoyZ793IsnRUFiHLYMhYn60JQN2iKKFhO8kNxGbuOupxYosq8aBKenOuul09UFYIrlTLb9xvUGCAeilCKDO5xmKj3w3k/6c7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123143; c=relaxed/simple;
	bh=GiBQRQwmwilpQYyY+FBB4dRdiEVi8kF7ZMt0+wdAXH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkzG1o96vxzReG4lEvPghLEImbkoTEU4gP+pqOVtGIphb4yndyOGxjgZs+UtacqiuC3oNvoHzwVgWFUqwWBTPveVIBENSaxZNc+PNEkg5J4wv4gPN2ldyHas5TBSDxjkAPcOZOI6WLsMh/1L55XiPWn/WFTqAk7tiwO/WpwCobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+iwtnIp; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso8270472eec.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123141; x=1773727941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rN4V1kFQ4B979w9z8IfxCTP5Tip9YLt5+/xSuLcGnc=;
        b=d+iwtnIpdl2OMrgWqNKHapuaTxYtfhxFLhZ9FwyKuS1zXMUcC2VHWCiCWTMIo8ByW/
         12ygTFnHrgxN6jRtwjur4pXJnT3IMYb3NjDL0dI/Zbi+ToKiQG1o7ker1mwlysWGu5LM
         +oERDolTp+1yDKNBQwZYNX6d20rxIohFpFE7yQrZeJ+zrA3mQUIb9mlL5OM3PvAspiAu
         spyX/km1qtQ/fHp9iPc1s/pY/uVyqeh0HKxGvI+VndUOaaKaoRFE9zGYMc1ilys2dLqa
         in5VSqQ7jBfGlrolXVsIrPhHAWtwOy5EiD6h/Bz0QXXW8ecBpX3VrD1J2Tmr7JRoqYX6
         rguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123141; x=1773727941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rN4V1kFQ4B979w9z8IfxCTP5Tip9YLt5+/xSuLcGnc=;
        b=RHI52ZcR27MuMWw2LE2QFdzV/+VHhoHe1XC/yZPnKtlroLKLhRD9DFR+oQ1YhskFPb
         Lt2EoJJaDrzHVy2Y51fbYSQEL4ng36Wp9sqv9Rtzf/Ni8kAdqlX++i29aV14ZAjBI7WH
         VCwob3BQaUn/jZ80seGdM5UV2H76161C7wrweFb4W3Rkt1Otco01AMI3HR3DxIKXU7Ra
         2oeB635qQvwrb9MQdF1YcX0LUJ0ODN31wOQsiqgABPzgRdi4RRDEqYZDTIyrSs4wwXQG
         L7Hhzs2bgjacsCZKIvI5UGXRQHGDGviR7Yf9gsjL5hNNaAxpuA2y9sgZGCJcKxvA4SeA
         jWoQ==
X-Gm-Message-State: AOJu0YzWCCqmS/qIo8L6UIgnLa+NEyiCMCpWeiUvqYXQ2vBGqK9mcbS7
	fuTCCYclKb+vKAwP67hQ/bd0Nlqm6bUGxmBIUwj4jcSjueyqKC0KlNQHFK2Wew==
X-Gm-Gg: ATEYQzzMfiU489Lu/L0PXw5ob0xQ0BDY8VEBB8Kg6jpsWf1bIwpCmQdXLGn/Xjj+7Vc
	T8sFMBUv9pjLmgp7jojl1WuEa/gozZ7Sr4/Y49K0fuxMg7/k+8m9yHpsGHFPrs6exdYBYM5ZVJB
	yc5WfPRcqlHephq+NUasSBW2A5QAsqzv6gwbDXIR3/6HIfn3gv1DQAEXw7fFwDheqguo3TSD3j9
	FxVvh+/Ivd0H4vZKF5kOwRhwa0gVoP0OA7voRYJtXBTuI34WyoPCjHAONAXZdalJC1Jnt+LPx0q
	uXtr+JBS+pO+eU9qeu5SBsDHo8GtSiIL7HPOhbnMCSjfz1lgXRIEQPkyLGU6VGjiI9cWxaXwYnI
	6Nuo/zuzQK40vcSZuYocweD88ckHzxsVg+nkEv+4J/xKMCv4FB8+HQiUUZi2xFMwcoAxftqKkyh
	vmqC+Rs5Eq4tV2gx6Bvvt0bRM6S9SbC37OTen7vCHmmroc5vIxYXNrN4ghrMjNqMGxr35O2nDO5
	y9WZbgu45C4yIg=
X-Received: by 2002:a05:693c:60ce:b0:2be:6693:9b4d with SMTP id 5a478bee46e88-2be7a0dbcd1mr683634eec.9.1773123141276;
        Mon, 09 Mar 2026 23:12:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa32sm11787106eec.26.2026.03.09.23.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:12:20 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 09 Mar 2026 23:11:59 -0700
Subject: [PATCH 2/4] MIPS: alchemy: db1000: use nodes attached to GPIO
 chips in properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-alchemy-v1-2-f55e9dc60ba1@gmail.com>
References: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
In-Reply-To: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Rspamd-Queue-Id: D83D5245BA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13437-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes by doing identity matching instead of
matching on node names. Switch to using software nodes attached to gpio
chips instead of using freestanding software nodes.

Also stop supplying platform data for the spi-gpio controller since
spi-gpio driver can derive number of chipselect lines from device
properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/mips/alchemy/devboards/db1000.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 6984cd5169b5..d9dffacc5f5a 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -19,7 +19,6 @@
 #include <linux/property.h>
 #include <linux/pm.h>
 #include <linux/spi/spi.h>
-#include <linux/spi/spi_gpio.h>
 #include <asm/mach-au1x00/au1000.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
 #include <asm/mach-au1x00/au1000_dma.h>
@@ -375,20 +374,14 @@ static struct platform_device db1100_mmc1_dev = {
 
 /******************************************************************************/
 
-static const struct software_node db1100_alchemy2_gpiochip = {
-	.name	= "alchemy-gpio2",
-};
-
-static const struct property_entry db1100_ads7846_properties[] = {
-	PROPERTY_ENTRY_U16("ti,vref_min", 3300),
-	PROPERTY_ENTRY_GPIO("pendown-gpios",
-			    &db1100_alchemy2_gpiochip, 21, GPIO_ACTIVE_LOW),
-	{ }
-};
-
 static const struct software_node db1100_ads7846_swnode = {
 	.name		= "ads7846",
-	.properties	= db1100_ads7846_properties,
+	.properties	= (const struct property_entry[]){
+		PROPERTY_ENTRY_U16("ti,vref_min", 3300),
+		PROPERTY_ENTRY_GPIO("pendown-gpios",
+				    &alchemy_gpio2_node, 21, GPIO_ACTIVE_LOW),
+		{ }
+	},
 };
 
 static struct spi_board_info db1100_spi_info[] __initdata = {
@@ -403,32 +396,26 @@ static struct spi_board_info db1100_spi_info[] __initdata = {
 	},
 };
 
-static const struct spi_gpio_platform_data db1100_spictl_pd __initconst = {
-	.num_chipselect = 1,
-};
-
 /*
  * Alchemy GPIO 2 has its base at 200 so the GPIO lines
  * 207 thru 210 are GPIOs at offset 7 thru 10 at this chip.
  */
 static const struct property_entry db1100_spi_dev_properties[] __initconst = {
 	PROPERTY_ENTRY_GPIO("miso-gpios",
-			    &db1100_alchemy2_gpiochip, 7, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 7, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("mosi-gpios",
-			    &db1100_alchemy2_gpiochip, 8, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 8, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("sck-gpios",
-			    &db1100_alchemy2_gpiochip, 9, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 9, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("cs-gpios",
-			    &db1100_alchemy2_gpiochip, 10, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 10, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
 static const struct platform_device_info db1100_spi_dev_info __initconst = {
 	.name		= "spi_gpio",
 	.id		= 0,
-	.data		= &db1100_spictl_pd,
-	.size_data	= sizeof(db1100_spictl_pd),
-        .dma_mask	= DMA_BIT_MASK(32),
+	.dma_mask	= DMA_BIT_MASK(32),
 	.properties	= db1100_spi_dev_properties,
 };
 
@@ -481,7 +468,6 @@ int __init db1000_dev_setup(void)
 		pfc |= (1 << 0);	/* SSI0 pins as GPIOs */
 		alchemy_wrsys(pfc, AU1000_SYS_PINFUNC);
 
-		software_node_register(&db1100_alchemy2_gpiochip);
 		spi_register_board_info(db1100_spi_info,
 					ARRAY_SIZE(db1100_spi_info));
 

-- 
2.53.0.473.g4a7958ca14-goog


