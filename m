Return-Path: <linux-mips+bounces-12467-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433ACBEE85
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 205AD30517D6
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 16:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ABE30FC1B;
	Mon, 15 Dec 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ao6iCLcQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71952D0C9D;
	Mon, 15 Dec 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816015; cv=none; b=UEWeeXh2aabRSZ0HiKYuZxduA85SV6qNbDHqgXHLTNmB56ADWhVq0xqL4qLutz8cD95+F5QfXq6jFzkeTFdQU0F8qq6lwFg8Kp/2FZFJKlQ40mr1giHe1a7dQAPauzRDJDcI6N5uM8TFzxgv1h/7M86qDe9i90ZfTwgpGOyX/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816015; c=relaxed/simple;
	bh=sWaD/Wi0Pr7c62NPFOlUEI21UtdcvelvEmFoM6yLvkg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ll7PSAetqbf/7gbzRcSAyQVE5Ow2eePpZWYPizGLg7cNwjq7kGNuqoJalB+WwA1ZQAQDzpj9dGrGUBmbBLu6np0D34vlIV4WIiKkJ+fyJNTlTObZELiD06y8mEJtF9CkZCxq4mDqUg45wJkGfuZNXMI2wITRt9snd/HDqq+wLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ao6iCLcQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 205081A21E8;
	Mon, 15 Dec 2025 16:26:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E532860664;
	Mon, 15 Dec 2025 16:26:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48200119427B8;
	Mon, 15 Dec 2025 17:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765816006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5rl3KxG+tLZi8rwlgg6ho0S2qSyMdOaglHTZavWHxDs=;
	b=ao6iCLcQ7Zb0ESFcCTY1UYt3Kv1+M7klLNwtIfyY0W8OrT71Bbdys+YwDu4W2frMF5k932
	z8We866C9i7DctDtd7SybrbpEWaaEQMAzej227vet0vT5PAM2p9A6DULmocJgSYZymcVLQ
	rEbP95aFKH+3+M87yv/z3ayVxaUZhcEeb6Af325wuDAdxyf8lFsMG7T6HAgeJ/Wi8yOQbT
	MF4NIJcIiJ7Mhw3JvQhQVwqjozIkKTue5KTGK/MXYtf1/e5hxQnk5DbfurSBhZVRZQApEt
	JncPr43EaY1ANpUo3lcyyWvlpxnGJcha9v8WlUmGaWVps8DpDs8rlZEiExiBuQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v5 0/7] Add generic PHY driver used by MACB/GEM on EyeQ5
Date: Mon, 15 Dec 2025 17:26:34 +0100
Message-Id: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALo2QGkC/23MQQ6CMBCF4auYrq1hBgrUlfcwLtoylSZCCRAiI
 dzdwsYaWb7JfP/CBuodDex6WlhPkxucb8MQ5xMztWqfxF0VNsMEBSSIvFFG866eOYI2GUFltS5
 YeO96su69p+6PsGs3jL6f9/IE2/UgMgFPuEVpsbSKCoSb9n58ufZifMO2zIRfCglEFAM1IEASW
 cir9J+mEQUZ0TRQkqrQBGWu0gOaRRSziGaBSiFMjkKVoIpfuq7rB+TZXT5TAQAA
X-Change-ID: 20251022-macb-phy-21bc4e1dfbb7
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
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

I always find devicetree the simplest way to understand device
interactions, so here is a DT overview:

    olb: system-controller@e00000 {
            compatible = "mobileye,eyeq5-olb", "syscon";
            reg = <0 0xe00000 0x0 0x400>;
            // ...
            #reset-cells = <2>;
            #clock-cells = <1>;
            #phy-cells = <1>; // <- this is new
    };

    macb0: ethernet@2a00000 {
            compatible = "mobileye,eyeq5-gem";
            phys = <&olb 0>; // <- GEM device consumes the PHY
            // ...
    };

    macb1: ethernet@2b00000 {
            compatible = "mobileye,eyeq5-gem";
            phys = <&olb 1>; // <- same thing for the second instance
            // ...
    };

The Linux MACB driver already consumes a generic PHY for some other
compatibles, this is nothing new. The MACB series [1] has been merged
in v6.19-rc1.

--

About merging, Philipp Zabel gave his ACK for [5/7] to go into
linux-clk. The split is:

 - [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
   [PATCH 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
   [PATCH 7/7] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs
   => linux-mips

 - [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
   => linux-phy

 - [PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
   [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
   [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by parent
   => linux-clk

Have a nice day,
Thanks!
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v5:
- phy-eyeq5-eth:
  - fix #includes: add delay, gfp_types, module and drop array_size,
    bug, cleanup, container_of, lockdep, mutex.
  - eq5_phy_xlate(): avoid magic value, use EQ5_PHY_COUNT.
  - use dev_err_probe() in error cases of devm_phy_create() and
    devm_of_phy_provider_register().
- 3x Reviewed-by: Luca Ceresoli.
- Add Neil Armstrong to Cc as new PHY subsystem reviewer.
- Rebase on v6.19-rc1, tested on hardware, no changes.
- Link to v4: https://lore.kernel.org/r/20251124-macb-phy-v4-0-955c625a81a7@bootlin.com

Changes in v4:
- Append my SoB to Jerome's patch:
  [PATCH v4 3/7] clk: eyeq: use the auxiliary device creation helper
- Rebase on net-next & linux-{clk,mips,phy}. Nothing to report.
- Link to v3: https://lore.kernel.org/r/20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com

Changes in v3:
- Take Philipp Zabel's Reviewed-by & Acked-by trailers on reset patch.
- Take Thomas Bogendoerfer's two Acked-by trailers on DT patches.
- Rebase on net-next & test on target. Nothing to report.
- Link to v2: https://lore.kernel.org/r/20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com

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
 drivers/phy/phy-eyeq5-eth.c                        | 249 +++++++++++++++++++++
 drivers/reset/reset-eyeq.c                         |  24 +-
 9 files changed, 358 insertions(+), 68 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


