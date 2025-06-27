Return-Path: <linux-mips+bounces-9517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEBAEB223
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964B616A6AC
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A09129347C;
	Fri, 27 Jun 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JsmPJ7h5"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D554A0C;
	Fri, 27 Jun 2025 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015363; cv=none; b=aV5bWJEK1iYFNvr5pWBQSv4+12zM6yRpCIib8SNlbn14eYaEEDJTTt2fb30Z/ezhXQDL5vem96a/yStREjQBUTgXBIZTLzoMkOec56h3jgaoPsmK/7uqmAbp8ZZbO3CN2tTeKziqQ7VEF4peZoQcyJRzGsw0f1zVn9K9xcxHX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015363; c=relaxed/simple;
	bh=k6fkcAaaEMmx4QvVFDQ4NIqn99VksXRfBevLjjptADE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QxVSa6N3cDnM2+UqppKfg/W82XjlafXIiPF6Ka4P+32Gu1FQBm5oVtlt8VTAjeRzXMsv/kaoT8d6cpZoI7wJRlBJplT+MDwX8XZp7i6/eQWdNFsHpzWshH0p7KjvgR3sEdtRHjCjJMt0MTjMnQbljw1Kr+0qHPQFGfz6SCseRU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JsmPJ7h5; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E77DF43205;
	Fri, 27 Jun 2025 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NIVnKjxzCbHl1ZvetN6Qg1M6hQPPdTs79vKBNNUiXBI=;
	b=JsmPJ7h5P4of+yLKxpGh1bVHPYC5AO3ehS2+Eo6Lj4T++4y7QIQP/zfg6HsDx2b6GjTOQ9
	DPwb5re46RIP4A/3zvvgdLAlpTJ0z2ykmCcapjagK4SNg3iCq+k+tS0l7oQg6ZoNn+RhO+
	JWrCDExqujQlxCmBBwnNlPM+YnS2DV+YttwZ9L+26tWnxbosHx/T2ZOquglyBrG1dX/wHO
	6wzk3sqEeAsjyR1SIsFSNIImP6aJ71j3jmk38BySqI5DZ9XIYGHS0I6tKHqBEIf5seEuy1
	+mJTU8DqvnGNjU9E7PEeVtetbPj3vtAqiVQL/0xMXFpg94iVotx6jVCk6fp+Yg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM instances
 on Mobileye EyeQ5 SoCs
Date: Fri, 27 Jun 2025 11:08:46 +0200
Message-Id: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ5fXmgC/y3MSw7CIBSF4a00dyym0FDUkfswHfC4tTexYIA0N
 Q17l6DDk//kOyBhJExw6w6IuFGi4OsQpw7sov0TGbm6QfRC9gPnbNXWsFFqNevLqGfuoF7fEWf
 aG/MAj5l53DNMtSyUcoif5m+89R8l/tTGWc/koIzCQV0Vd3cTQn6RP9uwwlRK+QI6E8SUpAAAA
 A==
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffejfedttdelteffudetkedvueeitdfhhefgffduhedufeehffehheegueejveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeffedprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgur
 hgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com

Mobileye EyeQ5 SoCs provides two GEM IP blocks. The end result of this
series is working 1G networking on the EyeQ5 eval board. It isn't just
a new macb_config & compatible, we also provide some cleanup & fixes
along the way.

dt-bindings:
  [PATCH net-next v2 01/18] dt-bindings: net: cdns,macb: sort compatibles
  [PATCH net-next v2 02/18] dt-bindings: net: cdns,macb: add Mobileye EyeQ5 ethernet interface
  [PATCH net-next v2 03/18] dt-bindings: net: cdns,macb: allow tsu_clk without tx_clk
  [PATCH net-next v2 04/18] dt-bindings: net: cdns,macb: allow dma-coherent

Cleanup:
  [PATCH net-next v2 05/18] net: macb: use BIT() macro for capability definitions
  [PATCH net-next v2 06/18] net: macb: Remove local variables clk_init and init in macb_probe()
  [PATCH net-next v2 07/18] net: macb: drop macb_config NULL checking
  [PATCH net-next v2 08/18] net: macb: introduce DMA descriptor helpers (is 64bit? is PTP?)
  [PATCH net-next v2 09/18] net: macb: sort #includes

Fixes:
  [PATCH net-next v2 10/18] net: macb: remove illusion about TBQPH/RBQPH being per-queue
  [PATCH net-next v2 11/18] net: macb: single dma_alloc_coherent() for DMA descriptors
  [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb, NET_IP_ALIGN) with HW alignment
  [PATCH net-next v2 13/18] net: macb: avoid double endianness swap in macb_set_hwaddr()

EyeQ5 support:
  [PATCH net-next v2 14/18] net: macb: add no LSO capability (MACB_CAPS_NO_LSO)
  [PATCH net-next v2 15/18] net: macb: Add "mobileye,eyeq5-gem" compatible

DTS:
  [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU support
  [PATCH net-next v2 17/18] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
  [PATCH net-next v2 18/18] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

Note: I've categorised [PATCH 12/18] as a fix, but it is also mandatory
for working GEM on EyeQ5 SoCs. Hardware is RSC capable so we mustn't do
the skb_reserve(). It probably is the first platform where
NET_IP_ALIGN=2 and the devices are RSC capable.

Note: I did not extract the platform specific code (2 syscon registers
being written to) from macb_config->init into separate resources. I
cannot dissociate that register write sequence into something more
fluid (modeling clocks/PHYs).

Have a nice day,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v2:
- Rebase upon latest net-next (1ea2e106130a).
- dt-bindings:
  - Add description to mobileye,olb phandle, following a
    `make dt_binding_check` warning reported by Rob's bot.
  - Add "sort compatibles" patch.
  - Take "Acked-by: Rob Herring" on dma-coherent patch.
  - Improve "allow tsu_clk without tx_clk" commit message following
    Rob's comment.
- Take "Reviewed-by: Andrew Lunn" trailer on four patches:
    net: macb: use BIT() macro for capability definitions
    net: macb: add no LSO capability (MACB_CAPS_NO_LSO)
    net: macb: sort #includes
    MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs
- net: macb:
  - Split:
      simplify macb_probe() code touching match data
    into two commits, following comment by Andrew:
      Remove local variables clk_init and init in macb_probe()
      drop macb_config NULL checking
  - Replace match-data IP alignment value by a more robust solution: HW support
    IP alignment if it does not support RSC.
  - use regmap_update_bits() for OLB register writes.
  - fix insertion order of compatible.
  - fix LSO detection comment.
  - move local variables `struct macb_dma_desc_64` inside conditionals,
    in macb_{get,get}_addr().
  - add "remove illusion about TBQPH/RBQPH being per-queue" commit.
  - add "single dma_alloc_coherent() for DMA descriptors" commit.
  - add "avoid double endianness swap in macb_set_hwaddr()" commit.
- DTS: lowercase reg properties of PHYs.
- Link to v1: https://lore.kernel.org/r/20250321-macb-v1-0-537b7e37971d@bootlin.com

---
Théo Lebrun (18):
      dt-bindings: net: cdns,macb: sort compatibles
      dt-bindings: net: cdns,macb: add Mobileye EyeQ5 ethernet interface
      dt-bindings: net: cdns,macb: allow tsu_clk without tx_clk
      dt-bindings: net: cdns,macb: allow dma-coherent
      net: macb: use BIT() macro for capability definitions
      net: macb: Remove local variables clk_init and init in macb_probe()
      net: macb: drop macb_config NULL checking
      net: macb: introduce DMA descriptor helpers (is 64bit? is PTP?)
      net: macb: sort #includes
      net: macb: remove illusion about TBQPH/RBQPH being per-queue
      net: macb: single dma_alloc_coherent() for DMA descriptors
      net: macb: match skb_reserve(skb, NET_IP_ALIGN) with HW alignment
      net: macb: avoid double endianness swap in macb_set_hwaddr()
      net: macb: add no LSO capability (MACB_CAPS_NO_LSO)
      net: macb: Add "mobileye,eyeq5-gem" compatible
      MIPS: mobileye: add EyeQ5 DMA IOCU support
      MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
      MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

 .../devicetree/bindings/net/cdns,macb.yaml         |  38 ++-
 MAINTAINERS                                        |   2 +-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |  26 ++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  34 ++
 arch/mips/mobileye/Kconfig                         |   1 +
 arch/mips/mobileye/Makefile                        |   2 +
 arch/mips/mobileye/eyeq5-iocu-dma.c                | 160 +++++++++
 drivers/net/ethernet/cadence/macb.h                |  56 ++-
 drivers/net/ethernet/cadence/macb_main.c           | 380 ++++++++++++---------
 9 files changed, 498 insertions(+), 201 deletions(-)
---
base-commit: bb26d1066f9db96d9b10d7724798aa14203f3ef8
change-id: 20250311-macb-65a7fa86af1d

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


