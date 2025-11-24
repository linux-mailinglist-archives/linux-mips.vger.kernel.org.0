Return-Path: <linux-mips+bounces-12325-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B52C8114B
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 15:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DAECE4E5B0A
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 14:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EACD283CBF;
	Mon, 24 Nov 2025 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AaVlND9g"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915330C635;
	Mon, 24 Nov 2025 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995279; cv=none; b=huaTv1BkTJp9EPGAO0X7CuNtjkl7HR8dOp3RcD9wPiQSJBTJIJaIn7H1vMptwMkTblEhnG/VvU373lmdsokzpucDFUVhWrlNG7kmpwbtKaEYaK79f82GsVwwgLL4Y/u93CcednOSGM5F4braxjnUIZ5iHrxnYRdSZS/DgIzPctA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995279; c=relaxed/simple;
	bh=ICO9rj3USiVGl8nyzNsfrWMjtUQYUDzh3mfa3lkmSIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hx+zIGcsYsDrdFJLmOKl7By+MHduX2Osi7clHkKo0wLXeOVORCKkUOKGvYEnSrxCEa0jJLHr5WKE43Gi5u0SfJYSegjQoKSp1fBJVy8+G6vcVKmYIoUeQbEXJEm7igjgqZ5dknmh5kN+lO3clsC9RKA/vC0rl855g+egJsyJaXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AaVlND9g; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9F765C139AB;
	Mon, 24 Nov 2025 14:40:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B550606FC;
	Mon, 24 Nov 2025 14:41:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5386E10371DAD;
	Mon, 24 Nov 2025 15:41:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763995272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XPIwJNZx03Vvzm78mhB1NZWFTNNBEuDWnpiIX7z/5mI=;
	b=AaVlND9gLz7P6VTST/tv/MVT9asnk/pfm+ShUrEM7ANpltZebqX49Ok8ltJWlbfJqv9nCJ
	LGmF1QLY3JAgZnFEifyPG6FhrKR0MLELY9IfepRYsxmqBMmwPa6koaK31o7fzlqV9Ho07n
	ojvoXtiaALVRJIID8+Iao5Lvc4NmiPOcR8mw124RSaCn64HC8BCqTR2BWLoYlADL4MiBxW
	3ALsrzseF+iibcEWaR8MVAns4Jwu3pUVhkarCC5/Sbr7uHmL478ckGKxIfbK71/i9KEQMX
	M+R3L0uSKIvpXhpOKH3Zqec4f5hwZgzDEU/LXKBL1V4iv3fnoBqtVJCfvFhZhw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v4 0/7] Add generic PHY driver used by MACB/GEM on EyeQ5
Date: Mon, 24 Nov 2025 15:41:01 +0100
Message-Id: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH1uJGkC/23MTQ6CMBCG4auQrq3pTPl15T2Mi7ZMpYlQUgiRE
 O5uYSNRl99knndhAwVHA7skCws0ucH5Lo70lDDTqO5B3NVxMxSYgUDkrTKa983MEbRJCWqrdcH
 iex/Iuteeut3jbtww+jDv5Qm265/IBFxwi5XF0ioqEK7a+/HpurPxLdsyE34oCDhQjNRABhWRh
 byWv1QeKFQHKiOlShWaoMyV/KLrur4Be4B24RgBAAA=
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
into net-next/main.

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

MACB patches are in and V1/V2/V3 were super calm, can we sync to get
this V4 in before the v6.19 merge window? Patches apply cleanly on the
three linux-{clk,mips,phy} trees.

Have a nice day,
Thanks!
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
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
 drivers/phy/phy-eyeq5-eth.c                        | 254 +++++++++++++++++++++
 drivers/reset/reset-eyeq.c                         |  24 +-
 9 files changed, 363 insertions(+), 68 deletions(-)
---
base-commit: ab7bdf0904dfbc727a64d4edbd51295318e854cf
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


