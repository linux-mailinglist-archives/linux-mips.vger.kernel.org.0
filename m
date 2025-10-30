Return-Path: <linux-mips+bounces-11967-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACFC22754
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 22:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D26F1188E836
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67534334363;
	Thu, 30 Oct 2025 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELFpy20B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED49524D1
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860790; cv=none; b=YW031cb+BFec+/+etvMPVGGWGrw94Gjtqlb9RbMznX4Awo3/Tuqed3umuAd+lN2IdYRPVHHCQfCyw6p3c0vbLmHHkwkQ9kaL+0yAH3yxyT6+4dC0n8d930r5sNCBBylw+NBCEDwOn1Vc9jYU+dOvM+7fq7yqmHUdWMQDJUuzNJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860790; c=relaxed/simple;
	bh=ogoAOc8noYnRP40EX7FiNgpoMABPPHmz1IvTtOqk89A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qOlY40DYA4z5KyYOsZqYa/g4eQM/3h3BYFfwlp8DxJqG5n0jiiLj3OvGpuR0EhN6Vricxzb869aYo4ov1581iTTxGJpi299+DVmEZKED3ZRNPoBWn4utOf1bjybiTIOv7GdR/WmwHztoAKFzd9yAuEqyiWofJf/cIJhlin0qfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELFpy20B; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3e9d633b78so393189466b.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860787; x=1762465587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2bmKsWX27KxcoODJGcbcMlZnZNIE40/bwILX8cp33g=;
        b=ELFpy20B4Debi7/9dj33sL2VbcfQCHr/v+fWcXiyQOHShZ7GB6Kv+9JCGtkx4kIZjP
         RRrUkZdl26HsF6V7QW2FxRgrVGQ5UVdimz5P1kfrSiwLGzy4ZDh4apPFErU/cXo+Nkq2
         /vvFiUTrm6JCab+EQiVB3iVGOivHvm4/JLZUlHPfUPeQ1KzP1bYlzVHNRtiJcaGZqbMZ
         yBHKa2SNScXK2+TF/aQC4pLSsqhtGRCMKu1pMET60AXo0bWez4odkiZbDD1Z6XLICIdp
         Go1hQ2SxC4mIq1ERKwwduNZ3TvNF89BWvVD9vsgxzknOwhjiyKM5W339camuhUJCA9T9
         vKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860787; x=1762465587;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2bmKsWX27KxcoODJGcbcMlZnZNIE40/bwILX8cp33g=;
        b=idl0bWrTfjBcLZbQ0zQPtsQhsbJWxVUwfcbx0Y5tMHsYN3B7V7nosrYw0Df/y+0234
         wS0zWpQXj8Y35mJeq4o3jD/btPe3i9+hIx6ioNqdgBGAzYsMuohiPB9pncR5q8mthXq9
         t7bSRgbP+2eEFEGYgof9aolsjQ/4xkRnn8nRcIR8BsQU0xIk0QnlZcCyiLrc/PQ+mBGy
         oUtH8R3b+3PYrUd053qxf4LnvheLZHtXi4g0A9HkAJ7maWTsVjsgKUNY/usM7q0vtOdu
         hkOldEXKwFRgNTHIdUTnRnIT951HhXaUC2kWFWzp4TOiXHS6aPmPxaZETrWF+LBaTp5K
         fbPA==
X-Forwarded-Encrypted: i=1; AJvYcCWoZ3rzco8jv8EdrOO7bWIVVqRnwXZaCldipPMfhy0Z3EvbTq/JjiGuVcCHj9n2geoSsQRHiNcyImbP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1zCKMa/JmXz8JTSadzCtS8iC6/kPz9RzP2+r/oMsc60vYwPvW
	ohO1E7I7AsDw5hcNHh+H2Ih9kNwk1A3eCQzfk/g1YyQxZT5IkDCtmyxr
X-Gm-Gg: ASbGncvFqmntma3yLIAnmpj8YDV71lgV3ESFhNQWjxpMfGdX3Awmwn9jmWbFWdn+3jL
	aVwhpPXnlNECivN1TJqUaFwjjGtE6Jcw/cphWI4f3MCqXAnxnBxFZwwitMEdDnCFeJqXcgQ67MY
	29XvCWPSNQ7ff5QZMuG+mUyA2SFtss0Bz0lbm6dFvxVMtDmVlckRjapdU+FkgORlcCCtb3DkEIo
	pfUCPqHlK1/PtZqei7EAYLWM104TbwPbW7xn6H/03OFdt6LKlGAy+8CyWo4/qdVgH12knvx9S4y
	vV96rP6Fr/e4VI1AKK1SpYQjCmLXUfK9tD6Cxzegacu0UaZZdZFjMWZXUW1SNWGHh5wdWvoEMsx
	zvuiQrOYaq66J2vBSlAHfEfdbcrJa6KQL6VnGWkTQpOMUVJ63ucTskFVbAljirDLTwN5+qmGRU4
	xvl7j7SegjwWKG1TUK+BqKGGdPCux0dG4ER/LApuiLhEAVJ/Q/Do5xIzeKST0pLv5JYSvMiPruF
	p6X1+SQUpEMZwRYjRjTpLTJIh3QUDI9P8SPmQ+dHad4Ymm1p77Itw==
X-Google-Smtp-Source: AGHT+IHttdY4o9D7grpTruZsKEHKhDpt1ULxInoDSp8EgrLjir/7gRBnIDXS9Eo/IhcDhnQCnC8tcQ==
X-Received: by 2002:a17:907:2d25:b0:b4b:dd7e:65eb with SMTP id a640c23a62f3a-b706e5833c5mr157151366b.25.1761860786678;
        Thu, 30 Oct 2025 14:46:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85359687sm1864847366b.23.2025.10.30.14.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:46:26 -0700 (PDT)
Message-ID: <bee046a1-1e77-4057-8b04-fdb2a1bbbd08@gmail.com>
Date: Thu, 30 Oct 2025 22:46:32 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 6/6] net: phy: fixed_phy: remove fixed_phy_add
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

fixed_phy_add() has a number of problems/disadvantages:
- It uses phy address 0 w/o checking whether a fixed phy with this
  address exists already.
- A subsequent call to fixed_phy_register() would also use phy address 0,
  because fixed_phy_add() doesn't mark it as used.
- fixed_phy_add() is used from platform code, therefore requires that
  fixed_phy code is built-in.

Now that for the only two users (coldfire/5272 and bcm47xx) fixed_phy
creation has been moved to the respective ethernet driver (fec, b44),
we can remove fixed_phy_add().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/fixed_phy.c | 6 ------
 include/linux/phy_fixed.h   | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index bdc3a4bff..d498d8a9b 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -131,12 +131,6 @@ static int __fixed_phy_add(int phy_addr,
 	return 0;
 }
 
-void fixed_phy_add(const struct fixed_phy_status *status)
-{
-	__fixed_phy_add(0, status);
-}
-EXPORT_SYMBOL_GPL(fixed_phy_add);
-
 static DEFINE_IDA(phy_fixed_ida);
 
 static void fixed_phy_del(int phy_addr)
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 08275ef64..8bade9998 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -17,7 +17,6 @@ struct net_device;
 
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
-void fixed_phy_add(const struct fixed_phy_status *status);
 struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 				      struct device_node *np);
 struct phy_device *fixed_phy_register_100fd(void);
@@ -27,7 +26,6 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
 			int (*link_update)(struct net_device *,
 					   struct fixed_phy_status *));
 #else
-static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
 static inline struct phy_device *
 fixed_phy_register(const struct fixed_phy_status *status,
 		   struct device_node *np)
-- 
2.51.1



