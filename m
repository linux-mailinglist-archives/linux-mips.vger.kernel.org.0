Return-Path: <linux-mips+bounces-9535-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0616AEB273
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3CC561BF0
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5E92DA75D;
	Fri, 27 Jun 2025 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kQ/Jcgki"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892CA2D979A;
	Fri, 27 Jun 2025 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015399; cv=none; b=cN3rtMyudYxf5L7NV7s38npbLVHQL6XaM7cZ3PbhUpkeGIeijJ7zxi1sXCYfHAy/cUvy6wxf/olaR4sx+Q9ZqKOF/UTn9O+OgWsSagBc8moBcga9HswlJpTzU4qx983WfzTF28u3PdcslhvyAelh7Jiaasuugz/rYt5p9ifeeqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015399; c=relaxed/simple;
	bh=HMcGeng6GdApxgpmXogy29JLEunDQe70RuYk/d3AUrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7GGabyLE5rKXEk/JnDoj8lOywviHPB2HQIZNftu0xCznImLMgk3ydNmhcDOqfi0gm7fV21AAGJdWiD4LsuTY0bnbAIdv4dyhHgiqx8bq5ekILfh5GUKtVFnmD692O6K30Ioz0I7s2rAVH8PTQHXBzTfyP6P4WDEa3ktlxl+VCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kQ/Jcgki; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C556E4391D;
	Fri, 27 Jun 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASRiFVp5ZFhKvwm/2Lsajqh0Hrof/9pCxPbZ+iqYjHE=;
	b=kQ/Jcgki2tmSJyior01LIrOt1jFieJEVoPTJGuWxJMaOYnYQF79onv+z57Z5HP6Fe3Rp+3
	AupmOzJ1ICFrv77bDPt4adn7E9/JduZ3ul6qNrDSgxT+vtoR0GilVi9BTjcNGTJrJsTk5o
	yUI+myeztHe9jCyl3c980ZIY5eNV4AFFcjoKwLY5DAY2/2AQflVPHZ+kuVQTFqEfAVbYtg
	ZQlrgTxA36+jLKzMhFLD4GPrUZqntgRj7bIeuYEx/PzKhAwGvvdfOjmY65ROi9KZQxiYQL
	akWLuyPrNB5x245ewRC9Qspfthp+LegJ5CxADwkwbnk2M6Ge4Aj7N92VUszk2w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:09:04 +0200
Subject: [PATCH net-next v2 18/18] MIPS: mobileye: eyeq5-epm: add two
 Cadence GEM Ethernet PHYs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-18-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeffedprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com

The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
index 6898b2d8267dfadeea511a84d1df3f70744f17bb..3d8af5b4675b24c2fa284a52e537a4366226acc2 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -21,3 +21,29 @@ memory@0 {
 		      <0x8 0x02000000 0x0 0x7E000000>;
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
2.50.0


