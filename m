Return-Path: <linux-mips+bounces-11820-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD968BF7AEE
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C81E44EBF0C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0957734EEF5;
	Tue, 21 Oct 2025 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bk35bp5z"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7938034DB7B;
	Tue, 21 Oct 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064394; cv=none; b=sEiizJ5H6S5inb4fqZAPurCOdyNa8FS6pwuQFSTFWpeyABrhkGYTxFuBsqsEYwn5F0xNtIarj6xKZ//Js+P912P9dZKplk6ejlGbMUkSpP7PVZM8+Z5d4c4KmRVdTVraq+GHEB2fCfiiVdFVEYTBEQcmPxVuWU8fdNLGMhxaQj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064394; c=relaxed/simple;
	bh=eVMrRTLFu012jIHRJzrysd/z4FK2cRudttyNR7qqrX4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EFjyVk3DO5lEbHUv0LtTAd0YAL7CSHxXoXrzAJZEdqvRBc496+0VQC9d/x1+tcEvNOULSQv0M08fzv+fpYW//7hk54dVOuskVhk8Iw29Rs13+FMWpRvHcEZDIfRQUvkmjsFzPrDQg4ckhW4t7MiKvRbHOAQwpa4nipZy7LcsZOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bk35bp5z; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 965874E41241;
	Tue, 21 Oct 2025 16:33:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6166960680;
	Tue, 21 Oct 2025 16:33:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFCAD102F23EA;
	Tue, 21 Oct 2025 18:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064385; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=aN99o7OkOHWybNH2qjnfg/oT5mK0uPFrJ+4ao/bPan4=;
	b=Bk35bp5z/HmjI09zpUheBUxeeY8DX1bjpIabg+gBb9ThCzjKu/do7w/IuA/3agfidF977f
	772od6VR7YP+nodGEw/O1D6LbR0UfrclDv3CrR4comS8ZxjpzWSBiC1igP9ZVAMqn2fpcV
	VNZ8EzJ0V9UWwfX510ooHsFA/LlB91j+tJWp09neCUyVkgA0TPlbIqy2UER/pyvWT6ndj9
	70Tzba+s5Ici7nHW8qKJlVi2ePG3pJ5g61oTMBD7RegY/x6NKZIUCrFdEfdpj7Ja3pT5pi
	9b9ad3M/t6FKkbg/D+r33rsN2OK7c/qXVZrJu9bqtcm6+WoHnjYsj4ODb8WVzw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next 00/12] net: macb: EyeQ5 support (alongside generic
 PHY driver in syscon)
Date: Tue, 21 Oct 2025 18:32:41 +0200
Message-Id: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKm192gC/x3MQQqAIBBG4avErBtQQYKuEi1K/2oWWWlEEd49a
 fkt3nspIQoStdVLEZck2UKBrityyxBmsPhiMspYrYzidXAj48FheYJxymt411gqwR4xyf3POgo
 4OeA+qc/5A5GaO7pmAAAA
X-Change-ID: 20251020-macb-eyeq5-fe2c0d1edc75
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
 Andrew Lunn <andrew@lunn.ch>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This series' goal is adding support to the MACB driver for EyeQ5 GEM.
The specifics for this compatible are:

 - HW cannot add dummy bytes at the start of IP packets for alignment
   purposes. The behavior can be detected using DCFG6 so it isn't
   attached to compatible data.

 - The hardware LSO/TSO is known to be buggy: add a compatible
   capability flag to force disable it.

 - At init, we have to wiggle two syscon registers that configure the
   PHY integration.

   In past attempts [0] we did it in macb_config->init() using a syscon
   regmap. That was far from ideal so now a generic PHY driver
   abstracts that away. We reuse the bp->sgmii_phy field used by some
   compatibles.

   We have to add a phy_set_mode() call as the PHY power on sequence
   depends on whether we do RGMII or SGMII.

I want drivers/phy/phy-eyeq5-eth.c to appear in this series for
review-ability, but that leads to this series having many patches
unrelated to net & MACB:

 - [02/12] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
   [07/12] phy: Add driver for EyeQ5 Ethernet PHY wrapper
   [09/12] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs

   Add the generic PHY driver that lives in the OLB register region.
   In Linux, we model that with auxiliary devices (spawned by clk-eyeq).

   [08/12] clk: eyeq: use the auxiliary device creation helper
   [10/12] reset: eyeq: drop device_set_of_node_from_dev() done by parent

   Auxiliary devices don't inherit a dev->of_node by default. Previously
   we addressed that with a call to device_set_of_node_from_dev() from
   each clk-eyeq children device probe. Jerome Brunet improved the
   situation with creation helpers that do the call in the parent. We
   take that patch to ensure we get a dev->of_node assigned to our PHY
   device. [1]

Merging all this won't be easy, sorry. Is this split across trees OK?
The net-next part is pretty evident, it is the rest that appears
complex to merge to me. I can resend the series exploded if useful
(or at least split net-next versus the rest).

=> net-next
[PATCH net-next 01/12] dt-bindings: net: cdns,macb: add Mobileye EyeQ5 ethernet interface
[PATCH net-next 03/12] net: macb: match skb_reserve(skb, NET_IP_ALIGN) with HW alignment
[PATCH net-next 04/12] net: macb: add no LSO capability (MACB_CAPS_NO_LSO)
[PATCH net-next 05/12] net: macb: rename bp->sgmii_phy field to bp->phy
[PATCH net-next 06/12] net: macb: Add "mobileye,eyeq5-gem" compatible
=> linux-phy
[PATCH net-next 02/12] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
[PATCH net-next 07/12] phy: Add driver for EyeQ5 Ethernet PHY wrapper
=> linux-clk
[PATCH net-next 08/12] clk: eyeq: use the auxiliary device creation helper
[PATCH net-next 09/12] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
=> linux-reset
[PATCH net-next 10/12] reset: eyeq: drop device_set_of_node_from_dev() done by parent
=> linux-mips
[PATCH net-next 11/12] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
[PATCH net-next 12/12] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

About potential conflicts, Benoît Monin has a series [5] touching
dt-bindings, clk-eyeq, reset-eyeq and the Mobileye MAINTAINERS section.
Maybe [02/12] dt-bindings of OLB shouldn't go to the linux-phy tree (?).

Thanks,
Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com/
[2]: https://lore.kernel.org/lkml/20250903-clk-eyeq7-v1-19-3f5024b5d6e2@bootlin.com/

Past versions of the MACB EyeQ5 patches:
 - March 2025: [PATCH net-next 00/13] Support the Cadence MACB/GEM
   instances on Mobileye EyeQ5 SoCs
   https://lore.kernel.org/lkml/20250321-macb-v1-0-537b7e37971d@bootlin.com/
 - June 2025: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM
   instances on Mobileye EyeQ5 SoCs
   https://lore.kernel.org/lkml/20250627-macb-v2-0-ff8207d0bb77@bootlin.com/
 - August 2025: [PATCH net v3 00/16] net: macb: various fixes & cleanup
   https://lore.kernel.org/lkml/20250808-macb-fixes-v3-0-08f1fcb5179f@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Jerome Brunet (1):
      clk: eyeq: use the auxiliary device creation helper

Théo Lebrun (11):
      dt-bindings: net: cdns,macb: add Mobileye EyeQ5 ethernet interface
      dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
      net: macb: match skb_reserve(skb, NET_IP_ALIGN) with HW alignment
      net: macb: add no LSO capability (MACB_CAPS_NO_LSO)
      net: macb: rename bp->sgmii_phy field to bp->phy
      net: macb: Add "mobileye,eyeq5-gem" compatible
      phy: Add driver for EyeQ5 Ethernet PHY wrapper
      clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
      reset: eyeq: drop device_set_of_node_from_dev() done by parent
      MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
      MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

 .../devicetree/bindings/net/cdns,macb.yaml         |  10 +
 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  |   7 +-
 MAINTAINERS                                        |   1 +
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |  26 +++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  47 ++++
 drivers/clk/clk-eyeq.c                             |  60 ++---
 drivers/net/ethernet/cadence/macb.h                |   6 +-
 drivers/net/ethernet/cadence/macb_main.c           |  92 ++++++--
 drivers/phy/Kconfig                                |  13 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-eyeq5-eth.c                        | 254 +++++++++++++++++++++
 drivers/reset/reset-eyeq.c                         |  24 +-
 12 files changed, 454 insertions(+), 87 deletions(-)
---
base-commit: 3ff9bcecce83f12169ab3e42671bd76554ca521a
change-id: 20251020-macb-eyeq5-fe2c0d1edc75

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


