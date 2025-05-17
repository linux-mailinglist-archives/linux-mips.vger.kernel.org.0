Return-Path: <linux-mips+bounces-9021-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62776ABAC7B
	for <lists+linux-mips@lfdr.de>; Sat, 17 May 2025 22:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8348A17FB97
	for <lists+linux-mips@lfdr.de>; Sat, 17 May 2025 20:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A45215078;
	Sat, 17 May 2025 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAU9HIKz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6948F6F;
	Sat, 17 May 2025 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514131; cv=none; b=pzrhrVTj87EUZ4nBtHBPlMk35hIKozFPkJJo3JVOo+fdxvdRlZKkc/WCxFiR/smgS8SiGC+rYl55GCFYM2H+yNz47DrRO8TsLQB5rCY0u5zWoICmy1zYf/2WQ5WQOdr4Pt5AmCD6WoRb5XvvSdkqtDg05Kp5p75DcKPXPYAurtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514131; c=relaxed/simple;
	bh=sxJ4S+7OHxq5uVjnMm35F+xQcHYY/w8+n4+k0TKxX2U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XAESD8hvJqyglAzsw5PbCPUbbngMTC215lXBKGSIjfo8oIrj1hfOy2Cdcup1UFFyZUSpwNf4N8Z+uKk2CKvz+zGKSEO6CAAmm2ZMP5AAlXexgB1nHLjXuiLItkfO/h/fdhbZmF9tMp2pBYPt4IrU6uuqRrtr5MHotufiNYr/nMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAU9HIKz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so2170408f8f.0;
        Sat, 17 May 2025 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747514127; x=1748118927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yeYtdXooewJM1V7Y4zdslEynnFR4/j/XkiY7sDjWucw=;
        b=iAU9HIKzwxqDS//PmQv8kMWZD9qKbKZCEnLM9HzhWGFQT8w8o6ImeRpuHEnoDZFzGq
         5W404bTjIztMInM0StIDcUtI1HeyNbbQVgYHO464hncE8/8/3/7KSbjNqCHjDhG3STw/
         ckWmkkc9/qkx/16Vl1En3OuvQmLMi8ZbauSfi9U9qAGvR120LDx32btqtwI0BArnf7FM
         Pq8qt+DBM+pfmUClh68e7bbRRh9806bV9UXOVKKSUeVNkx91aj6AU4BNIzZYWN3aBI7m
         or7bx1vbOSP7ZgwX+mptB2lauZK5Dw8669zUrsZiImqVEJwmHuZ5zX9OfaU6AXYvEYc6
         cE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747514127; x=1748118927;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeYtdXooewJM1V7Y4zdslEynnFR4/j/XkiY7sDjWucw=;
        b=qAgBrFcezQnrO7Brhpqbzc2nXYUAA023XlyR07S6hOm5FGIbAakHQywC18B1z5QI1d
         IVpkInBhtTTQPXfzroVMIji90CnXa8B1wuDVzFw/HDc7TN5hI4za5TJVRBV8rjZKD3DY
         cGbt7/uW67pkw2O2Bt60rHw7P21Hl/Y98cHzD/cHiS5BjJ/WS4Ui/HqsSIyxwXvmAcDX
         tAoPmGU58U5/fgGCO3i190VDHOiiDFdYfGvDdpwSj2lX5FKn62HmxA6nChLPNfFZ1Ju+
         FrbMQ7SjsgbIYPRG4dT9ZKM5EesB1M/QJNh0Gwt5p6dVsE3cJGNLC1I5vUNKbu7a/gQz
         Kl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEs3+Wt38qscVYuOITeH0mIrwbIuNCLa6vhLoU1xjsI8DmrrrYwuxCcbzSmJTBFRoLC0APhlCsLXh0@vger.kernel.org, AJvYcCVdjLRxz2BL9PoLbCDt+bh/JPcSOgsy38E5KnrXZjBohbWwDdll/SdQ0+lYCRzWTn29wvg99A3t@vger.kernel.org, AJvYcCWvU+5BHRhblSsZKPYn29t6dIiKuwrr0V5vX2JavJp6nbk+1GptTUJ/MZVWSLIBqde7Ec4FjMSt3wq/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Vt+Me4kzSi8WlG+k2IzZ8xe0XPZtWNVmG8ognWyFkrneKOkA
	uLkeDm5gmMZDDzsZ16X1XPw1ifQXIl4SWDII/kOsfQVh6ge+vbEofF0F
X-Gm-Gg: ASbGncsnD/bhiE6jKKpjp+Fg+T8XqcYoNDlrH/Ff+a4r0+wuL3Ul7698IEIbdE6gXBS
	kxm8QlPXpqTJXT6IcXU3S7Y/APnrnitflpAMRhuEZ/DKdpPVXROkGgNnIhgRd3mAJQ7k0CEOaHp
	aAFV32zQLPHoOjikmIZx/o8OUke7fvvwTwX2rVnaA/ZfH2NHd+JhCYGHTnl5dqjBcgswY5P7PY5
	2buxe9RoW/TtHvvcJ3zzE/C9AL5FRVjtQIoVgx2vbkudr5+KrivmjtMcAf9OGSalW3t5LE1nqUg
	tx73DkIEWf+sDmbjKU9+ROslEtV3ZJZ2fmIGxxwt5CN9gm7mrgrFeTX/ZYnWzJqdGiEUzflTJaG
	mLLxwk3Cwr77KV7bYa/lDqQUIrgxNC8ukt46v/gZf2Tbs5C/dsP0E+1d9Uhq/m5zKJWLdTQkNAZ
	Qs2jk9Vt7OYfsg7K8=
X-Google-Smtp-Source: AGHT+IHoHbVmG+gf2LZZn95l/+svQIV15+WUG6r1o+bIhLUndeydv9M6yA2X7Gm9FkEmuLKM3sMR1Q==
X-Received: by 2002:a05:6000:3108:b0:3a0:b565:f1ea with SMTP id ffacd0b85a97d-3a35c834fbdmr6295752f8f.5.1747514127414;
        Sat, 17 May 2025 13:35:27 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f37:2700:a4c5:88ff:c972:1238? (p200300ea8f372700a4c588ffc9721238.dip0.t-ipconnect.de. [2003:ea:8f37:2700:a4c5:88ff:c972:1238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8c7sm151026725e9.38.2025.05.17.13.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 13:35:27 -0700 (PDT)
Message-ID: <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>
Date: Sat, 17 May 2025 22:35:56 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/3] net: phy: fixed_phy: remove irq argument from
 fixed_phy_register
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All callers pass PHY_POLL, therefore remove irq argument from
fixed_phy_register().

Note: I keep the irq argument in fixed_phy_add_gpiod() for now,
for the case that somebody may want to use a GPIO interrupt in
the future, by e.g. adding a call to fwnode_irq_get() to
fixed_phy_get_gpiod().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/dsa/dsa_loop.c                   |  2 +-
 drivers/net/ethernet/broadcom/bgmac.c        |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c |  2 +-
 drivers/net/ethernet/faraday/ftgmac100.c     |  2 +-
 drivers/net/mdio/of_mdio.c                   |  2 +-
 drivers/net/phy/fixed_phy.c                  |  5 ++---
 drivers/net/usb/lan78xx.c                    |  2 +-
 include/linux/phy_fixed.h                    | 11 +++++------
 8 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/dsa/dsa_loop.c b/drivers/net/dsa/dsa_loop.c
index adbab544c..d8a35f25a 100644
--- a/drivers/net/dsa/dsa_loop.c
+++ b/drivers/net/dsa/dsa_loop.c
@@ -405,7 +405,7 @@ static int __init dsa_loop_init(void)
 	unsigned int i, ret;
 
 	for (i = 0; i < NUM_FIXED_PHYS; i++)
-		phydevs[i] = fixed_phy_register(PHY_POLL, &status, NULL);
+		phydevs[i] = fixed_phy_register(&status, NULL);
 
 	ret = mdio_driver_register(&dsa_loop_drv);
 	if (ret)
diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index a461ec612..3e9c57196 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1446,7 +1446,7 @@ int bgmac_phy_connect_direct(struct bgmac *bgmac)
 	struct phy_device *phy_dev;
 	int err;
 
-	phy_dev = fixed_phy_register(PHY_POLL, &fphy_status, NULL);
+	phy_dev = fixed_phy_register(&fphy_status, NULL);
 	if (IS_ERR(phy_dev)) {
 		dev_err(bgmac->dev, "Failed to register fixed PHY device\n");
 		return PTR_ERR(phy_dev);
diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 71c619d2b..b6437ba7a 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -625,7 +625,7 @@ static int bcmgenet_mii_pd_init(struct bcmgenet_priv *priv)
 			.asym_pause = 0,
 		};
 
-		phydev = fixed_phy_register(PHY_POLL, &fphy_status, NULL);
+		phydev = fixed_phy_register(&fphy_status, NULL);
 		if (IS_ERR(phydev)) {
 			dev_err(kdev, "failed to register fixed PHY device\n");
 			return PTR_ERR(phydev);
diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 17ec35e75..a98d5af3f 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1906,7 +1906,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 			goto err_phy_connect;
 		}
 
-		phydev = fixed_phy_register(PHY_POLL, &ncsi_phy_status, np);
+		phydev = fixed_phy_register(&ncsi_phy_status, np);
 		if (IS_ERR(phydev)) {
 			dev_err(&pdev->dev, "failed to register fixed PHY device\n");
 			err = PTR_ERR(phydev);
diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 2f4fc664d..98f667b12 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -458,7 +458,7 @@ int of_phy_register_fixed_link(struct device_node *np)
 	return -ENODEV;
 
 register_phy:
-	return PTR_ERR_OR_ZERO(fixed_phy_register(PHY_POLL, &status, np));
+	return PTR_ERR_OR_ZERO(fixed_phy_register(&status, np));
 }
 EXPORT_SYMBOL(of_phy_register_fixed_link);
 
diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index 34a71f223..ea002a137 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -222,8 +222,7 @@ static struct gpio_desc *fixed_phy_get_gpiod(struct device_node *np)
 }
 #endif
 
-struct phy_device *fixed_phy_register(unsigned int irq,
-				      struct fixed_phy_status *status,
+struct phy_device *fixed_phy_register(struct fixed_phy_status *status,
 				      struct device_node *np)
 {
 	struct fixed_mdio_bus *fmb = &platform_fmb;
@@ -245,7 +244,7 @@ struct phy_device *fixed_phy_register(unsigned int irq,
 	if (phy_addr < 0)
 		return ERR_PTR(phy_addr);
 
-	ret = fixed_phy_add_gpiod(irq, phy_addr, status, gpiod);
+	ret = fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, gpiod);
 	if (ret < 0) {
 		ida_free(&phy_fixed_ida, phy_addr);
 		return ERR_PTR(ret);
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 8c2488563..759dab980 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2639,7 +2639,7 @@ static struct phy_device *lan78xx_register_fixed_phy(struct lan78xx_net *dev)
 	netdev_info(dev->net,
 		    "No PHY found on LAN7801 – registering fixed PHY (e.g. EVB-KSZ9897-1)\n");
 
-	return fixed_phy_register(PHY_POLL, &fphy_status, NULL);
+	return fixed_phy_register(&fphy_status, NULL);
 }
 
 /**
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 316bb4ded..634149a73 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -18,9 +18,8 @@ struct net_device;
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
 int fixed_phy_add(int phy_id, struct fixed_phy_status *status);
-extern struct phy_device *fixed_phy_register(unsigned int irq,
-					     struct fixed_phy_status *status,
-					     struct device_node *np);
+struct phy_device *fixed_phy_register(struct fixed_phy_status *status,
+				      struct device_node *np);
 
 extern void fixed_phy_unregister(struct phy_device *phydev);
 extern int fixed_phy_set_link_update(struct phy_device *phydev,
@@ -32,9 +31,9 @@ static inline int fixed_phy_add(int phy_id,
 {
 	return -ENODEV;
 }
-static inline struct phy_device *fixed_phy_register(unsigned int irq,
-						struct fixed_phy_status *status,
-						struct device_node *np)
+static inline struct phy_device *
+fixed_phy_register(struct fixed_phy_status *status,
+		   struct device_node *np)
 {
 	return ERR_PTR(-ENODEV);
 }
-- 
2.49.0



