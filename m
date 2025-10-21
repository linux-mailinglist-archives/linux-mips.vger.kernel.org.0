Return-Path: <linux-mips+bounces-11831-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09511BF7B96
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19D1D484ADF
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E36F34A771;
	Tue, 21 Oct 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gb8fpeWi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A534DB68
	for <linux-mips@vger.kernel.org>; Tue, 21 Oct 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064425; cv=none; b=rLM72cUifZgcnQ16pSaY3DfEpbBgu58cpGZiWaQUmZCQvMIoEgItfUleW8pKfufWglL2YShtNAN9pO7g04f1duOJbHHDmtK/RJeGqPH4nUwGVFFS0sDuN03vlf2bbJmOX6uX9isnaog3zbUJNRSLaCGxju5ArDZrktMR/dhGYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064425; c=relaxed/simple;
	bh=nBWa0ag7woJY2vPCiQSnDe7vW7z+266sYVbZE0b/SD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSQ2BcL+9Aii69A/nzLcr9kpVO0nC+IEikIbOo/sdOnH2Z23JK5tHpW9Jzjo3iskRZ4Lx10E/vo3Rf3ST/8szwL4rdQ99HW+A6+0KHMJvI0QJaaA6R6B8GEMv48OwaHkp7sT0kh2g5Vkjg9ij/gzGs85C+OrWVAG+4M6c+CysZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gb8fpeWi; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 145AE4E41242;
	Tue, 21 Oct 2025 16:33:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDE9E60680;
	Tue, 21 Oct 2025 16:33:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 184FE102F241C;
	Tue, 21 Oct 2025 18:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iTiW6J9ezHzkr5T/PBNfpX9M9qHogdCahO4t6SNr+IY=;
	b=gb8fpeWij1R7TR5EcR9xOhp65un2u2vMHve52XCk+CehX/rN5+aYJSr+eMRz3+OvkDLRyh
	IUezuhhx2r/AsGirkrBvcBxXD4oku6EdoNgZkkyufPIJXarnFSCuJe6wFqIFcx6r5ftBaO
	ZOXmi+t5SkBCwJ8lJlGbWY1V98BgkmrsfRNj6jhsz1zUSdOA7+by2/t32456j/bttUccBY
	0JbncKWdr7jfGXY2jheA2XhglDCJXoP1SB5Qoxqx1SnM+tcthz6CTEOHkj13G9wHf0ruwP
	cZnPE1kdUpwKCuSnl3vwuo/KoWF/wg8UsPUjGgQxGhJPnkRGNZT77PgnU47ZGQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 21 Oct 2025 18:32:53 +0200
Subject: [PATCH net-next 12/12] MIPS: mobileye: eyeq5-epm: add two Cadence
 GEM Ethernet PHYs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-macb-eyeq5-v1-12-3b0b5a9d2f85@bootlin.com>
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
In-Reply-To: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
index 9fc1a1b0a81b..babf52731ea6 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -29,3 +29,29 @@ temperature-sensor@48 {
 		label = "U60";
 	};
 };
+
+&macb0 {
+	phy-mode = "sgmii";
+	phy-handle = <&macb0_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		macb0_phy: ethernet-phy@e {
+			reg = <0xe>;
+		};
+	};
+};
+
+&macb1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&macb1_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		macb1_phy: ethernet-phy@e {
+			reg = <0xe>;
+		};
+	};
+};

-- 
2.51.1


