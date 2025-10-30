Return-Path: <linux-mips+bounces-11963-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BF7C22727
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 22:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A401F189732D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA500314B90;
	Thu, 30 Oct 2025 21:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y00uQ3SN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A934D38B
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860549; cv=none; b=doPD7T6EKDAFjdlqoK3KNMZWloY2v9T/Qz4UWnOcH/6oxwpljZd1NvbS28AhQA9zBOse73FRe6tD8yuuMi8wdqv+TgepUylJORzHcB8imVm2/hNqS63qY1sdw5YvRbR6ZfCueutH8fz1NKmZjAG+8skxsxc3O9Rb2QSfni5HoxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860549; c=relaxed/simple;
	bh=TvNDWVdmpvbEbvmft7H46461xn5+3cCucjLuAiYQSuY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GOmAmmQ7Xpiuldr0H2FAXwr2MkDYK4JXDorAkEJ+QEO9weRbReYMOZA82BtldDW8u+HHpcK/ozGwIcKGylFcst6IqrB9Fyud6ckcLn6FwTKwapXtSd7lcoIXQ04Xf4qEKEaGdOKLqkAZFV4mxXM79hldiprpWvwvDGS5MqAfqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y00uQ3SN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b5e19810703so225812166b.2
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860546; x=1762465346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjUgQuKKSNZeUncCHSxC9aLRNOsmNXtDbAw5szG7GiA=;
        b=Y00uQ3SNMk4jOExM9mDdUX0wNumhzLiI8hGf6+KvOXNSiZHa4BH8n/QNPMEOfAxsoK
         8BqLA6Tfq7Jg3VqYvevLAGeYUvSQVtP1UkCOUoIo12qziJUrfE9ZWKqfdBKjrrs+N09T
         T7oRXEN/5VjObxSz9on+B5pIatciGMnbzInDCVfNKmOvLbU04WGD0PjbqH+Mq+7dAGgo
         XY4i+npw3xBOzQKDb7WxPrbzZqy6ZEewIo6b75MGQGUI/L2aJlRGSgK1VCuCKgRgfKrv
         gRlEvS4j6waPC6CWRAMFfSLiAytHwPLFf1ptYBdvqGEETKIhH9TVoLG6W8A0JrKiYtak
         R+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860546; x=1762465346;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjUgQuKKSNZeUncCHSxC9aLRNOsmNXtDbAw5szG7GiA=;
        b=KGz6nBMx9Aet8Zkd40H4rUXNmc+zDy4x+bC/9DEbjp4Epqpuozt5P1I5pm1FOi9hDi
         UIuD3iVbchlfc4blta6eyoLFAuUQksQxTkyuuHDVo5wDmW4V1g7lhxF0D722YqMY1vvk
         MjeuyoF9npFapzfxf3AwSS6hc0+im+AM0M1C1OY3O42hVwNRrtKZ7XGhOEtYLu5+APge
         8K3TxKFQL0p9mZeIVAXiMA3q5zzxyf29N7wB2QXdL3LwaspzM4fzIvUBaxCAADXYJax2
         vOIC8+oyBD3Ijb9HLBQc70s5oO9UROur9w4+EWmAC51cbdu5q86ClTokjP6RlZyNOi0s
         HYTA==
X-Forwarded-Encrypted: i=1; AJvYcCVsqZ/nVdWSQuYeXjl4DTh1a3+xTXKimUZIxvR9H5r8LGGjHV21h3Hbusgf4/JfsyFoFtKNKRTMgLC1@vger.kernel.org
X-Gm-Message-State: AOJu0YwkqNsGwPqd7VJYaZ367V7G74zY2aqzyuTKLgjcnPGvBnVfTXHE
	Tgc9YATQSArjCOw4+dtj/sn1NZUkZJJzAB/bsdEkAOHO/CZWCzUqQJfh
X-Gm-Gg: ASbGncsnj6opwgd01S05k2LMTlKog7nvxCg1RDBLIpZ6cDpqQMvd34wuY0mN/zVG6bP
	KY2Fx4p8yKxkK1ZC0alTIyLE6ZWWPkHYDzcAgw7ayEE9YPsgq1u/ufITDu9rkT43B5uOt/LF6EA
	m44uSqzhtIDLwGGQJGovx22+T6rKacxa6HRw5ABPW8dt7RO5x9CBpLRrbX0zaBIKcjpaZBUcfqm
	fVParJkSyustSD2qW5cStFJM/xA2Sd0a2r7Mopd/918h+B5S4yOMj+gTghlmwS+Ta6Gsl0NY1Vl
	EZaUJ7TaVO9Mt0DuE4MVUQsZd4yKFbpNVwAOVGt8bHorjrM2MtMVoTiqaGBHhpR3vc9F4okCD9M
	ABUjXNsdTGk1Pg0PT/T8wYIiWTBSFuhXSGEogUqi1rw6bbKY1I9aDeIswtfStMQP7Sq44ZfcJVd
	iUF5tEx7EPGVye1EvfSAvzbsw/GmZSUonSKSr8tdFiLKgdaOBDL3ww7YErQxAgJfGGY1KuTnJk9
	vO5pgYeqv86ggVvdbfBLLQVHuHq3IWkqnQK3BkwrUc=
X-Google-Smtp-Source: AGHT+IERJM08TZ8bXx+ck0uj2d1X7qOQAV88F/tMs34SYSvoPqnMtrIfOQ8jsjc5sU98I59xCP9tTA==
X-Received: by 2002:a17:906:9fc4:b0:b6d:a7ad:2fda with SMTP id a640c23a62f3a-b70700b5861mr123536666b.12.1761860546056;
        Thu, 30 Oct 2025 14:42:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308cc6sm1866709666b.12.2025.10.30.14.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:42:25 -0700 (PDT)
Message-ID: <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
Date: Thu, 30 Oct 2025 22:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In case of coldfire/5272 a fixed phy is used, which so far is created
by platform code, using fixed_phy_add(). This function has a number of
problems, therefore create a potentially needed fixed phy here, using
fixed_phy_register_100fd.

Note 1: This includes a small functional change, as coldfire/5272
created a fixed phy in half-duplex mode. Likely this was by mistake,
because the fec MAC is 100FD-capable, and connection is to a switch.

Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
only be 0 or 1.

Due to lack of hardware, this is compile-tested only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/Kconfig    |  1 +
 drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index bbef47c34..e2a591cf9 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -28,6 +28,7 @@ config FEC
 	depends on PTP_1588_CLOCK_OPTIONAL
 	select CRC32
 	select PHYLIB
+	select FIXED_PHY if M5272
 	select PAGE_POOL
 	imply PAGE_POOL_STATS
 	imply NET_SELFTESTS
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index c60ed8bac..0b71e4c15 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -52,6 +52,7 @@
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/phy_fixed.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/prefetch.h>
@@ -2476,11 +2477,8 @@ static int fec_enet_parse_rgmii_delay(struct fec_enet_private *fep,
 static int fec_enet_mii_probe(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct phy_device *phy_dev = NULL;
-	char mdio_bus_id[MII_BUS_ID_SIZE];
-	char phy_name[MII_BUS_ID_SIZE + 3];
-	int phy_id;
-	int dev_id = fep->dev_id;
+	struct phy_device *phy_dev;
+	int ret;
 
 	if (fep->phy_node) {
 		phy_dev = of_phy_connect(ndev, fep->phy_node,
@@ -2492,30 +2490,28 @@ static int fec_enet_mii_probe(struct net_device *ndev)
 		}
 	} else {
 		/* check for attached phy */
-		for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
-			if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
-				continue;
-			if (dev_id--)
-				continue;
-			strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
-			break;
-		}
+		phy_dev = phy_find_first(fep->mii_bus);
+		if (fep->dev_id && phy_dev)
+			phy_dev = phy_find_next(fep->mii_bus, phy_dev);
 
-		if (phy_id >= PHY_MAX_ADDR) {
+		if (!phy_dev) {
 			netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
-			strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
-			phy_id = 0;
+			phy_dev = fixed_phy_register_100fd();
+			if (IS_ERR(phy_dev)) {
+				netdev_err(ndev, "could not register fixed PHY\n");
+				return PTR_ERR(phy_dev);
+			}
 		}
 
-		snprintf(phy_name, sizeof(phy_name),
-			 PHY_ID_FMT, mdio_bus_id, phy_id);
-		phy_dev = phy_connect(ndev, phy_name, &fec_enet_adjust_link,
-				      fep->phy_interface);
-	}
+		ret = phy_connect_direct(ndev, phy_dev, &fec_enet_adjust_link,
+					 fep->phy_interface);
+		if (ret) {
+			if (phy_is_pseudo_fixed_link(phy_dev))
+				fixed_phy_unregister(phy_dev);
+			netdev_err(ndev, "could not attach to PHY\n");
+			return ret;
+		}
 
-	if (IS_ERR(phy_dev)) {
-		netdev_err(ndev, "could not attach to PHY\n");
-		return PTR_ERR(phy_dev);
 	}
 
 	/* mask with MAC supported features */
@@ -3622,8 +3618,9 @@ static int
 fec_enet_close(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
+	struct phy_device *phy_dev = ndev->phydev;
 
-	phy_stop(ndev->phydev);
+	phy_stop(phy_dev);
 
 	if (netif_device_present(ndev)) {
 		napi_disable(&fep->napi);
@@ -3631,7 +3628,10 @@ fec_enet_close(struct net_device *ndev)
 		fec_stop(ndev);
 	}
 
-	phy_disconnect(ndev->phydev);
+	phy_disconnect(phy_dev);
+
+	if (!fep->phy_node && phy_is_pseudo_fixed_link(phy_dev))
+		fixed_phy_unregister(phy_dev);
 
 	if (fep->quirks & FEC_QUIRK_ERR006687)
 		imx6q_cpuidle_fec_irqs_unused();
-- 
2.51.1



