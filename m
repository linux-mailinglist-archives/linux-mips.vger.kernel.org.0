Return-Path: <linux-mips+bounces-8269-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA5FA6C30F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CFA27A7F62
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7824222FE07;
	Fri, 21 Mar 2025 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AYdMzyoi"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0C13C914;
	Fri, 21 Mar 2025 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584446; cv=none; b=VgYpNHIW+8ttU4BeFSQgI/b7hAyHg5HlKlqyU0fWB9530ZaZCiEPeUswIfkyEgyJ/9X+IQFMnQdW0TRbCrSTnuCKsUxe3CScVfWClHcHza3tT16u/ZUxnVCqg7hnusAK5v6tTXtAKiCtasuemjUBFdRWIFxqMkOCtg7VVSPpm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584446; c=relaxed/simple;
	bh=k/PBgt4a9h5ig/uH/xMlB6D72uDmaauMvOmb7yre5Sg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lsi5pE1hkN33fxss25OA+MwF4SpCHJnRwBFDGcrzjRARY1VLciQ8sZLKOAXK5A8bPQEzT/hhaSPWcRTRX90TgomMeaUmOxDQuFGcsF+iwqLfEW8OHDt6fnCypJkV4V93xNoPzaQIAPD2OvMhThSpULSbkolOulvgb1yaFta260g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AYdMzyoi; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6F2C4454F;
	Fri, 21 Mar 2025 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xcBqvduohD6gqiPxLsI52qzDZm7lLSAqNmPHQXXkRpY=;
	b=AYdMzyoiVaWwgmUgyFKnzDYw3VV+1Z1ETfmA/Jc1sDbVffVb3a68IIos9v9ZoKZEEfFg1y
	1oW2QtSxBMdBjhoyGg0p4RLJ3cxxMUq/QqcAmxhOYAAzBcsGb7w99o+OSFRzEqpkehBjFV
	cASIaOo/2KB48KY1claSJKPEmoJVh42BKfySynrQausAa7xni8kFKJDy8juoeGXEanW2Ud
	SlLqvcZ6ouv9GojEVqYEbRsNxi+zAB/SIcYTHlYYOWkgVqiyqFnqmLWftMrClX/650Fcq0
	AVuFBRDRLl9GxBudXpfkTQtJX3yM8NAAvlvxNDQ6Oipwyd22/d/u/jLiANRb4g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next 00/13] Support the Cadence MACB/GEM instances on
 Mobileye EyeQ5 SoCs
Date: Fri, 21 Mar 2025 20:09:31 +0100
Message-Id: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGu53WcC/x3MQQqAIBBA0avErBPU0KKrRIvJxppFFhohhHdPW
 j74/BcSRaYEY/NCpIcTn6FCtQ24HcNGgtdq0FIb2SklDnSLsAZ7j4NFr1ao6RXJc/43EwS6RaB
 8w1zKB0b7cctgAAAA
X-Change-ID: 20250311-macb-65a7fa86af1d
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
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefgeevheeiveffieegudduieefgfejueegvedtgfelffevgfejheekveffudekueenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgeskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Mobileye EyeQ5 SoCs provides two GEM IP blocks. The end result is
working networking on the EyeQ5 eval board. It isn't just a new
macb_config & compatible, here are each commit with a brief note:

 - Let's get the cleanup patches out of the way first:

   [PATCH net-next 04/13] net: macb: use BIT() macro for capability definitions
   [PATCH net-next 06/13] net: macb: simplify macb_probe() code touching match data
   [PATCH net-next 08/13] net: macb: introduce DMA descriptor helpers (is 64bit? is PTP?)
   [PATCH net-next 09/13] net: macb: sort #includes

 - LSO has been observed to be buggy, even though HW reports it is
   supported. We add a capability to force-disable it:

   [PATCH net-next 05/13] net: macb: add no LSO capability (MACB_CAPS_NO_LSO)

 - The MACB driver code has an issue: the HW inserts two dummy bytes at
   the start of Rx buffers, for IP header alignment (ie skb_reserve is
   done AFTER writing the addr in DMA descriptors). But the driver
   assumes that alignment is NET_IP_ALIGN. We appear to be facing the
   first SoC where that isn't the case.

   Happy to get comments & discuss the approach proposed.

   [PATCH net-next 07/13] net: macb: move HW IP alignment value to macb_config

 - We want cache coherent memory through a CM3 IO Coherency Unit (IOCU).
   To route through that, DMA addresses must have BIT(36) enabled.

   We do that in platform-specific code and hook our dma_map_ops through
   a notifier block.

   [PATCH net-next 11/13] MIPS: mobileye: add EyeQ5 DMA IOCU support

 - dt-bindings improvements:

   [PATCH net-next 02/13] dt-bindings: net: cdns,macb: allow tsu_clk without tx_clk
   [PATCH net-next 03/13] dt-bindings: net: cdns,macb: allow dma-coherent

 - Add the hardware to:
    - dt-bindings: new compatible, new phandle property,
    - the driver: macb_config, compatible and a custom init callback
      (that needs a regmap to the system-controller),
    - the DTS: both the SoC GEM instances and the eval board PHYs.

   [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add Mobileye EyeQ5 ethernet interface
   [PATCH net-next 10/13] net: macb: Add "mobileye,eyeq5-gem" compatible
   [PATCH net-next 12/13] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
   [PATCH net-next 13/13] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

Have a nice day,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (13):
      dt-bindings: net: cdns,macb: add Mobileye EyeQ5 ethernet interface
      dt-bindings: net: cdns,macb: allow tsu_clk without tx_clk
      dt-bindings: net: cdns,macb: allow dma-coherent
      net: macb: use BIT() macro for capability definitions
      net: macb: add no LSO capability (MACB_CAPS_NO_LSO)
      net: macb: simplify macb_probe() code touching match data
      net: macb: move HW IP alignment value to macb_config
      net: macb: introduce DMA descriptor helpers (is 64bit? is PTP?)
      net: macb: sort #includes
      net: macb: Add "mobileye,eyeq5-gem" compatible
      MIPS: mobileye: add EyeQ5 DMA IOCU support
      MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
      MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

 .../devicetree/bindings/net/cdns,macb.yaml         |  25 +-
 MAINTAINERS                                        |   2 +-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |  26 ++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  34 +++
 arch/mips/mobileye/Kconfig                         |   1 +
 arch/mips/mobileye/Makefile                        |   2 +
 arch/mips/mobileye/eyeq5-iocu-dma.c                | 160 +++++++++++
 drivers/net/ethernet/cadence/macb.h                |  51 ++--
 drivers/net/ethernet/cadence/macb_main.c           | 309 +++++++++++++--------
 9 files changed, 470 insertions(+), 140 deletions(-)
---
base-commit: ddf9c6d982ae7472a4da982e0497be2a140a194b
change-id: 20250311-macb-65a7fa86af1d

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


