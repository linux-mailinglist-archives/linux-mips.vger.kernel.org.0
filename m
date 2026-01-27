Return-Path: <linux-mips+bounces-13025-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMvFC3zxeGmGuAEAu9opvQ
	(envelope-from <linux-mips+bounces-13025-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 18:10:20 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C0983A2
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 18:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BD34300B99D
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 17:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369613624B9;
	Tue, 27 Jan 2026 17:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0YKLmkCm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099BD34F48C;
	Tue, 27 Jan 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533781; cv=none; b=LnjLJDsitac0fXOrN47CdFnkStAGc4I+e4fs9NPEyqMN1BknC2abqwzY8RhPDgxIeimi35Qo3RC7Ru0OhUnNjQGRR5Od/ZQVCF8Wp/zRg+E4qD6p3Gvnk7aI6Wgj1pntdvjpqefaC7GO7nwRmavweIqmJPq54UTSWwH3kXRfeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533781; c=relaxed/simple;
	bh=NubZnecZnkvp6ZJAITtFBvz3k1y+RVSeCCVQn9KFPcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fP2BqOIozMTS86x4lKq52ak1WT5EjjCmSGG5A6C5BZemlHMwiJ8Dn7saOfM2+bd7AqRRjtAXyy+bAVwZhxYgnIjrRF0AqHwnONrWftdWOOxicfbR44ULV1qhiMiZpRALHR2KrKDs1E1NLeNUDtX4NMHdf6AhiZtjdsXM38mDBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0YKLmkCm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40509C211C6;
	Tue, 27 Jan 2026 17:09:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E54DE606F5;
	Tue, 27 Jan 2026 17:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 060AE119A8696;
	Tue, 27 Jan 2026 18:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769533775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cb8JTW51tEAAL3YsAmU++TZYGVfsW7jvVhSBEQLhIiE=;
	b=0YKLmkCm845QEkg69rx5AG82RE4DpOFzdKQqT/lqRxxQDo7Jr4kCTBX6XRPqmkFffQDTE/
	TzMsfnrzyAYlhlIElzF5cXmqh4WeoAYRLhPubJXs6yAao41wdHUe3/gvZLk/FxWUl7xTh/
	Ts7LwvY86ArPr/btTu3QWZZnGVSdykro4w+BcB2zEVhPJonul41/YMjgQ/x/j0l0Sd14ys
	d7y6iJxElzGvQmgTzJ0p9Ts/M6Np0U10nJx7jP+0rdVNw7itUXqI0qL85VkLFVgNsA1XeP
	ZwaQ0Nbz7MxqnGDQ8VSBjFms03w8gbV9SfcB39F44AZrvpdJ9Vwyo9uDB72r2A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v6 0/8] Add generic PHY driver used by MACB/GEM on EyeQ5
Date: Tue, 27 Jan 2026 18:09:28 +0100
Message-Id: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MwY7CIBDG8VcxnGXTGaAtnvY9Nh4GGCyJFtOaR
 mP67otexOjxm8zvfxczT4lnsdvcxcRLmlMey2i3G+EHGg8sUyhbYIMGGkR5Iu/kebhJBOc1Q4j
 OdaK8nyeO6fpM/e3LHtJ8ydPtWV7gcf0SWUA2MqKN2EfiDuHX5Xw5pvHH55N4ZBZ8UWigolioB
 wOWOUIb1CdVFQVbUVUoW+ocQ9+S+kJ1RVFXVBdqjfEtGuqBuk9qXhTBVNQUSjZEJmUDKf1O13X
 9BwDegTGOAQAA
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13025-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,2a00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A22C0983A2
X-Rspamd-Action: no action

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

Any objections to get it in before the next merge window?
The new PHY driver has only seen tiny changes since V1.

Have a nice day,
Thanks!
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v6:
- Rebase upon v6.19-rc7; nothing to report.
- Add new patch "phy: sort Kconfig and Makefile".
- phy-eyeq5-eth: drop useless explicit __iomem cast to
  dev_get_platdata() return value.
- I did *not* drop the Kconfig `default MACH_EYEQ5` nor driver
  `dev_dbg()`. I think both are useful and should be kept. See
  last revision discussion here:
  https://lore.kernel.org/lkml/DFGSMN8268O0.33TYCQDBVHUHZ@bootlin.com/
- Link to v5: https://lore.kernel.org/r/20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com

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

Théo Lebrun (7):
      dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
      phy: sort Kconfig and Makefile
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
 drivers/phy/Kconfig                                |  75 ++++---
 drivers/phy/Makefile                               |   7 +-
 drivers/phy/phy-eyeq5-eth.c                        | 249 +++++++++++++++++++++
 drivers/reset/reset-eyeq.c                         |  24 +-
 9 files changed, 392 insertions(+), 102 deletions(-)
---
base-commit: aaae99475aaae1373d8bbdef6105e8ad2d4c75af
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


