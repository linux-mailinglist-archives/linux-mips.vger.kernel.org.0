Return-Path: <linux-mips+bounces-9020-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3E5ABAC76
	for <lists+linux-mips@lfdr.de>; Sat, 17 May 2025 22:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75D8F3BC43C
	for <lists+linux-mips@lfdr.de>; Sat, 17 May 2025 20:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3AE215061;
	Sat, 17 May 2025 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwTf2IMC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DE1DF73C;
	Sat, 17 May 2025 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514046; cv=none; b=LVwjC4SBlAHKdT+wm7y7Ae9+dRBmX1ToV0uR11aIBSKdcTKRaIdYHXBTmLDS++9vJgsQabUOH86dmnKL2LqiwzoE6Rp5kXqzXOA7090lrHP3X5wcwwU8kC/UjRFHbd6Noax39BCoxAzJ9TLXQLhy0YeJWBdv4ZTLYSio8PWEdhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514046; c=relaxed/simple;
	bh=4E/aFFWkVe0vQfX0S6QluHCY4Gqb2WRZhvbrp/lrr+w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ALiJJD67sgRp1IVa3dGVjMbJt7nloTJRg/b89waCh9Z+213rW6rmRafk1kSox0R14ceKL0DkUvl/goh6/tmsZe7pf6HmDw/sC82uX6mMXMJrG9Jv5ILPocWux1XqVgLL2ed+h6tvp50jdoyOHgiL005iuX8XOxoZq+lYwHBIn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwTf2IMC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0be50048eso3105518f8f.0;
        Sat, 17 May 2025 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747514043; x=1748118843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YpuDXqI4S55MWdcng3h5qGQQR58id20p/T1/UmNiWFA=;
        b=dwTf2IMCmGk/tgwtNIsJ9pp10y3TYEPQzXngsnTxoBFZDGAZbXHvMkhYMOx/RCp2Lh
         reTfLe2rC/6M4aoaHB3gxuU3eNxg7ZKI5yJ2wvs+ib4RZwS+4c+oqCdhJkhzHoBILEmH
         bEP/aG+65bnXxHpR3tTvfPHpWIufOMO+vdJWEkOZYw9B7LlFopM4duGLvyiDhoUR9cgk
         /4BEatXhyicvbsM6NtvBd7o/6vo1RdDAYTi8Q8XE2w+4nsLuZO5iAcXNUyru7+2H4Adk
         bD4dgIz/pygHx2wvetP4EfEk98uoyDKW5oTfpYe3MzlTT5nU4IKeI7ZR45V5rz9A1tbI
         DIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747514043; x=1748118843;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpuDXqI4S55MWdcng3h5qGQQR58id20p/T1/UmNiWFA=;
        b=tfwZp6KJgu2DnkcfNmMcNoFGlmbRJf/u9NwbApRt9xe1CpAar62ZyYpGT91L0lHCuQ
         Pwj4pT76TaK+/Q5ghjUod6AeKZJrAxg3UFOZyocASyOzaqadufZf1lZO9GxkpH6fFhNp
         KjgAxGsmxDXuIfvFFyYlp+7kURs1RVHsnQpaH+e1wSvcZoL6B/e7FR06U9vFDyUSQQ8t
         QuIvRcq1iA5lm8YujmbyM2eTYNIKevxPf0eOZDa0DpdgtkKy50kTXb/YBLRXeQLsdF9r
         Y4Nhfk08cKX5XiMc7DGO8XDlPo3Cy7MXZ/hS8zSSqbaUzApGONfuIhZdypCZ2LRBP1vI
         XVvA==
X-Forwarded-Encrypted: i=1; AJvYcCU0rJjM/ZPJBHLMxcMT5nPmq5zYd7q37hW/NZi/QrB39wsZcRLN6gbttdA79OaNzcIZlVRMYwiWae+/@vger.kernel.org, AJvYcCX7ChNACQZ59U5aPW6se84ykofQ4Ohhm/KpZzViCU+Bkgkl2JMwr4d6QKRcshDQu5tUtj0pHhQKD8+y@vger.kernel.org, AJvYcCXoO7l8gUY0iN8DiLVaxVCjyzdIAyJUHjlGIyGYeAP+fn/6iMU71G2kZy4M9hMoGV4eERvhmCya@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6AbrdmwuPlQCB0kpWvtoCHg0yofUTxTPjNkOlvJgEA6Hi1x5
	HdLZDlkZUb/IC1CY1iScTvZA3Zr/IMkROJjK5WHWL7nKX9i0CIH9U5mx
X-Gm-Gg: ASbGncupofeYsJf1/f8994YgyzPpistWDgD02huBTTtVkWMMgNTq9gUlPnrQAiX7L/r
	J134dj+OvMzBh5OjbWuISsistcQKtLG70D3GIKtRTvGrPVmp1qrTQ9/ISJEuZyK+HTZcYL3QSz5
	3PLBDFmWMHIzx60/u7xDOBcxrJPCBJe2OaJcEEv4Ltu9KwdA7pkKzkmdtUF8HCCkjS9//xtQAVu
	cAg7RasLxaC+Cp25oWsGQfUmVBjWwa4UoWdyRjmjuYDPUm0RgCwZQndrjUBr/1gKbckaBjdX3tT
	6ES65b4jTwZMOX40rgCO0s1Va8AuGnDB6tQrLb/e6dqTCdP4xfhQ749QBgJlKKKPgzmIsLBzyAx
	ElA3rIZtHZ0c//HZHNzvtAZamxiHW2w4mfI+6HYPtbaQ6F5WJ2f1yS6xGMBzdKSkTZdt+ZnHH/6
	6XM96PyVUXw/KzWZU=
X-Google-Smtp-Source: AGHT+IHOpOx8CHNtGolc5aunKCnbXvQIEy0fH8gdhLeI/YjQ802knktd4SwoGUfVClicd1bb6TTaZA==
X-Received: by 2002:a05:6000:2311:b0:3a3:6715:afba with SMTP id ffacd0b85a97d-3a36715b0dcmr2779505f8f.44.1747514042861;
        Sat, 17 May 2025 13:34:02 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f37:2700:a4c5:88ff:c972:1238? (p200300ea8f372700a4c588ffc9721238.dip0.t-ipconnect.de. [2003:ea:8f37:2700:a4c5:88ff:c972:1238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caf0sm7164563f8f.82.2025.05.17.13.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 13:34:02 -0700 (PDT)
Message-ID: <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
Date: Sat, 17 May 2025 22:34:32 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/3] net: phy: fixed_phy: remove irq argument from
 fixed_phy_add
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
Content-Transfer-Encoding: 7bit

All callers pass PHY_POLL, therefore remove irq argument from
fixed_phy_add().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/m68k/coldfire/m5272.c  | 2 +-
 arch/mips/bcm47xx/setup.c   | 2 +-
 drivers/net/phy/fixed_phy.c | 5 ++---
 include/linux/phy_fixed.h   | 5 ++---
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 734dab657..5b70dfdab 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
 static int __init init_BSP(void)
 {
 	m5272_uarts_init();
-	fixed_phy_add(PHY_POLL, 0, &nettel_fixed_phy_status);
+	fixed_phy_add(0, &nettel_fixed_phy_status);
 	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 247be207f..de426a474 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
 	bcm47xx_leds_register();
 	bcm47xx_workarounds();
 
-	fixed_phy_add(PHY_POLL, 0, &bcm47xx_fixed_phy_status);
+	fixed_phy_add(0, &bcm47xx_fixed_phy_status);
 	return 0;
 }
 device_initcall(bcm47xx_register_bus_complete);
diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index c91adf246..34a71f223 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -160,10 +160,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
 	return 0;
 }
 
-int fixed_phy_add(unsigned int irq, int phy_addr,
-		  struct fixed_phy_status *status)
+int fixed_phy_add(int phy_addr, struct fixed_phy_status *status)
 {
-	return fixed_phy_add_gpiod(irq, phy_addr, status, NULL);
+	return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
 }
 EXPORT_SYMBOL_GPL(fixed_phy_add);
 
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 3392c09b5..316bb4ded 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -17,8 +17,7 @@ struct net_device;
 
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
-extern int fixed_phy_add(unsigned int irq, int phy_id,
-			 struct fixed_phy_status *status);
+int fixed_phy_add(int phy_id, struct fixed_phy_status *status);
 extern struct phy_device *fixed_phy_register(unsigned int irq,
 					     struct fixed_phy_status *status,
 					     struct device_node *np);
@@ -28,7 +27,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
 			int (*link_update)(struct net_device *,
 					   struct fixed_phy_status *));
 #else
-static inline int fixed_phy_add(unsigned int irq, int phy_id,
+static inline int fixed_phy_add(int phy_id,
 				struct fixed_phy_status *status)
 {
 	return -ENODEV;
-- 
2.49.0



