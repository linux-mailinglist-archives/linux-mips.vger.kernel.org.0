Return-Path: <linux-mips+bounces-12006-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF68BC27A19
	for <lists+linux-mips@lfdr.de>; Sat, 01 Nov 2025 09:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 278F93BFB81
	for <lists+linux-mips@lfdr.de>; Sat,  1 Nov 2025 08:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E2C2BD036;
	Sat,  1 Nov 2025 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A2VnnmlP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0A2765DF;
	Sat,  1 Nov 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761987239; cv=none; b=Y9u/LUxVGDev+OPEuJPuc7NG7r6PHBZNJhXBptUV5fnjxDEWGNWi6aBvBxlap0/eNv7gTMwW1mIOZfNVItYgJQGhcwnCo9raqUupQ69ztoElUQV7XhtPnZ0DpXtCPOkzffA3nGRv4dRATev8B3A90wNivTUcs33F83CLE6WYRS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761987239; c=relaxed/simple;
	bh=7aX/PBEQrcbuyC9aErsxSQEAD1hQ8eoMRzgU5nSYlKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PsD0I5gKGaPkqebcWRQLsXHTdkVnRJVXkBXTTkWqdu/S44xqYt1nkY/78pDrAlEX72afTxUr1b2zqnHfdxjdTCvWz8vZljfnbp+nBTZ299m17+28DkGFtxIZo56pQsOZnR5yoaNNSEECXCVh1UEZ5W8TYGQUiE2X9Z1svqm3C1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A2VnnmlP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B59C4E4145E;
	Sat,  1 Nov 2025 08:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD3FD6070B;
	Sat,  1 Nov 2025 08:53:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 558F411818085;
	Sat,  1 Nov 2025 09:53:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761987227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5WyJ7KLCTmA5rRb0bRTlxs5HWJzEizch8fWH5kQRtnI=;
	b=A2VnnmlPLPE5gbwOjgo02mjFmC3ZBtPbAW+WKC2SYyheozrWVVXP3kdPCVOp9LDd+VJpke
	lppza4wAilTS5Q0nmctwJI9Z78Eszhjx0Bc4Ddj+D+lvUmIIwXww1vJblT6MuNBjIesYLA
	mIVGxxHVERptfNxlePu5Bl2eLnrjrTC0TvcuhHnWQ/mewmNWOv3KA3oUUHF46otE0sOLWs
	QWK46IQ4VxqWvPyNxL0jQDjJTUL3cxFNiCQM6ICRZje5fnUm00iZaw654mrNUEgSdhGAex
	PfRgHqVpAM2ulBkhGJBXs6jUectxbkRPaqcDjiIdk55lMdNNZ6hvPgsmAeeldA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v2 0/7] Add generic PHY driver used by MACB/GEM on EyeQ5
Date: Sat, 01 Nov 2025 09:53:28 +0100
Message-Id: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIjKBWkC/23MQQ7CIBCF4as0sxYDE03VlfdougA6yCQWGmiIT
 cPdxa5d/i8v3w6ZElOGR7dDosKZY2iBpw6s1+FFgqfWgBKvSiKKWVsjFr8JVMZeSE3OmB7afUn
 k+HNQw9jac15j2g65qN/6BylKSOHw7vDmNPWonibG9c3hbOMMY631C2tZV8uiAAAA
X-Change-ID: 20251022-macb-phy-21bc4e1dfbb7
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

EyeQ5 SoCs integrate two GEM instances. A system-controller register
region named "OLB" has some control over the Ethernet PHY integration.

Past iterations [0] touched those syscon registers directly from MACB.
It was a bad idea. Extend the current OLB ecosystem with a new generic
PHY driver.
 - OLB is carried by one main platform driver: clk-eyeq.
 - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
 - We add a new one: phy-eyeq5-eth.

Here is a DT overview:

   olb: system-controller@e00000 {
           compatible = "mobileye,eyeq5-olb", "syscon";
           reg = <0 0xe00000 0x0 0x400>;
           // ...
           #reset-cells = <2>;
           #clock-cells = <1>;
           #phy-cells = <1>; // <= this is new
   };

   macb0: ethernet@2a00000 {
           compatible = "mobileye,eyeq5-gem";
           phys = <&olb 0>; // <= GEM device consumes the PHY
           // ...
   };

   macb1: ethernet@2b00000 {
           compatible = "mobileye,eyeq5-gem";
           phys = <&olb 1>; // <= same thing for the second instance
           // ...
   };

The Linux MACB driver already consumes a generic PHY for some other
compatibles, this is nothing new. The MACB series [1] has been merged
into net-next/main.

--

One topic to talk about: the whole "we must assign child->of_node
manually". Auxiliary driver core does not do it automatically, so
either the parent (clk-eyeq) or the children must do it.

In OLB land, until now, children were doing it with a
device_set_of_node_from_dev(dev, dev->parent) call in probe.

Recently, Jerome Brunet added devm_auxiliary_device_create():
eaa0d30216c1 ("driver core: auxiliary bus: add device creation
helpers"). Using that cleans up clk-eyeq but means we must remove
device_set_of_node_from_dev() from reset-eyeq in the same patch series,
as the helpers do the dev->of_node assignement from the parent driver.

That explains why the ideal patch:
[PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
Turned into those three:
[PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
[PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
[PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by parent

--

About merging, it'll probably be complex. I see no build dependencies,
but the board will be in an odd state if only some patches are applied.
Some dev_warn() at boot and dev->of_node refcounting issues at unload.

 - [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
   We touch dt-bindings because OLB becomes a PHY provider.
   => linux-mips (?)

 - [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
   We add the generic PHY driver in drivers/phy/phy-eyeq5-eth.c with the
   usual Kconfig, Makefile and MAINTAINERS changes.
   => linux-phy (?)

 - [PATCH 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
   [PATCH 7/7] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs
   DTS patches to add both the #phy-cells of OLB and the MACB instances.
   => linux-mips

 - [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
   We must update clk-eyeq because it instantiates a new auxdev.
   => linux-clk

 - [PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
   [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by parent
   With the dev->of_node assignement, we must also correct reset-eyeq.
   => separate them into linux-clk and linux-reset?

Have a nice day,
Thanks,
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/
[2]: https://lore.kernel.org/all/20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v2:
- Take Acked-by: Conor Dooley on dt-bindings-patch.
- s/%ld/%tu/ for printing ptrdiff_t; warnings on 32-bit archs.
  Reported by NIPA's netdev/build_32bit test.
  https://patchwork.kernel.org/project/netdevbpf/patch/20251021-macb-eyeq5-v1-7-3b0b5a9d2f85@bootlin.com/
  https://netdev.bots.linux.dev/static/nipa/1014126/14277857/build_32bit/stderr
- Link to v1: https://lore.kernel.org/r/20251022-macb-phy-v1-0-f29f28fae721@bootlin.com

Changes since MACB V1:
- Drop the old "mobileye,olb" properties from DT patches; found while
  running dtbs_check and dt_binding_check.
- Drop all patches targeting net-next. That is MACB dt-bindings patch
  and MACB driver code. See there here [1].
- Link to v1: https://lore.kernel.org/lkml/20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com/

Past versions of MACB patches:
 - March 2025: [PATCH net-next 00/13] Support the Cadence MACB/GEM
   instances on Mobileye EyeQ5 SoCs
   https://lore.kernel.org/lkml/20250321-macb-v1-0-537b7e37971d@bootlin.com/
 - June 2025: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM
   instances on Mobileye EyeQ5 SoCs
   https://lore.kernel.org/lkml/20250627-macb-v2-0-ff8207d0bb77@bootlin.com/
 - August 2025: [PATCH net v3 00/16] net: macb: various fixes & cleanup
   https://lore.kernel.org/lkml/20250808-macb-fixes-v3-0-08f1fcb5179f@bootlin.com/

---
Jerome Brunet (1):
      clk: eyeq: use the auxiliary device creation helper

Théo Lebrun (6):
      dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
      phy: Add driver for EyeQ5 Ethernet PHY wrapper
      clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
      reset: eyeq: drop device_set_of_node_from_dev() done by parent
      MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
      MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  |   7 +-
 MAINTAINERS                                        |   1 +
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |  26 +++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  45 ++++
 drivers/clk/clk-eyeq.c                             |  60 ++---
 drivers/phy/Kconfig                                |  13 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-eyeq5-eth.c                        | 254 +++++++++++++++++++++
 drivers/reset/reset-eyeq.c                         |  24 +-
 9 files changed, 363 insertions(+), 68 deletions(-)
---
base-commit: 01cc760632b875c4ad0d8fec0b0c01896b8a36d4
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


