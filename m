Return-Path: <linux-mips+bounces-13238-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO8EOutLoGnvhwQAu9opvQ
	(envelope-from <linux-mips+bounces-13238-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:34:35 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 933EA1A6A17
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B98AB3033D05
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 13:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9713563E5;
	Thu, 26 Feb 2026 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BX6N22JA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30AA13AD26;
	Thu, 26 Feb 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112856; cv=none; b=Svy5EPWcBKHsOkrAFP9FNP77YvLHuqOPRYsScAiHnmHrsoyapo5UVtQEMwA84m6uPZWysRIfUcxYdLm+nbZnUmXlnFxdDGwqxuX/PFTf8QE3whIAdyD2+9MIURzGeGtLGyAe42gPihqhZ34ammkn1iE67OySCfrOQhP5Ekh0U6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112856; c=relaxed/simple;
	bh=inF0Rec8kRjif8psK7qHMdrR+Qdw5AFkArf6MiWBHYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aGzM06MSY6t5lDeEkpsRAdCJzAHHdwSdH+tIbf6fHp605mewroiVIW8P+qhvtw9UU7ZO/5SJd9ectEVzwfs5iEDxWrXua8XOTyyw9n8DYN3wV6Qs9hSUeYCQhgPN5lCqpl2GXgTB6Hu7RoQUcHS5YE5DsTgOr1S7PrVzmBEku5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BX6N22JA; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2BA70C40694;
	Thu, 26 Feb 2026 13:34:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6585FDEB;
	Thu, 26 Feb 2026 13:34:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09A57103691E1;
	Thu, 26 Feb 2026 14:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=C0MlNRFaPweCUwFJ0+FGivIJOsgUvRHSdsJfmril1fs=;
	b=BX6N22JAnwc9iKmmTO8+R8D3txp7StzLOYIWwdeMt3ReIFkL7DaNB5TgXf/KSTBimt423A
	tjfEZTE28ZsCHB4hrf4XZgmzCAlI0gcD6drGShpaqlP9l3wr/ANKfNhpD4llLDUaFEb161
	fSK8yr+HVaHNIDJ5r0K92s5PDHSorlvl2nYNmxddubyo3LK+xGlGTIDyfBewwFzDhFvP36
	QgddIFOE83MAkFXcqpOcdNyUy5VOgBVKuzsF5qbZae1UJkLX2uKbeVXoNyom0F/HZxS+Ey
	RWNBam9qnnu6DpIbdbSHr0b/B3rQ99p40o10XoaoLV0bmFWe3z8uyJyyUxplvA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 00/13] Introducing the Mobileye EyeQ6Lplus SoC
Date: Thu, 26 Feb 2026 14:33:44 +0100
Message-Id: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALhLoGkC/1WPy26DMBBFfwV5XUeeIZiHoqr/UXWB7aFYAkxsY
 hVF+fca2JDlHemcuffJAnlLgTXZk3mKNlg3pZB/ZEz37fRL3JqUGQosALDitNJdDvPwCLyWoGU
 uOlFfBUvA7Kmzf7vs+yfl3obF+XV3R9iuhwahPGsicMGp1kaZvO2uGr+Uc8tgp4t2I9tEEU8w5
 m8wJlgb6AyCgQr1O/w6anm6P9K05ejGRgqh3ac12S1ZpUAs+Nhqxed+5bFMTikLZSoJtSng7Pz
 clqo2EE9htEuTxfIiuNeQvr3+AfQkMVNQAQAA
X-Change-ID: 20251128-eyeq6lplus-961c630f0940
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13238-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:url,bootlin.com:email]
X-Rspamd-Queue-Id: 933EA1A6A17
X-Rspamd-Action: no action

The Eyeq6Lplus is a new system-on-chip part of Mobileye's EyeQ family
of SoC aimed at Advanced Driver Assistance Systems (ADAS). It is built
around a multicore MIPS I6500 with 2 cores and 8 threads and integrates
controllers and accelerators dedicated to driving assistance.

This patchset adds the initial support for the EyeQ6Lplus and its
evaluation board with the following list of controllers:
* The OLB ("Other Logic Block") providing clocks, resets and pin controls.
* One UART from DesignWare.
* One GPIO controller from DesignWare.
* Two SPI controllers from DesignWare, one in host mode and one in target
  mode.
* One octoSPI flash controller from Cadence, identical to the one found
  in the EyeQ5.
* Two I2C controllers from Designware.

The patch series adds the device tree bindings for the SoC and the OLB.
It also adds the Kconfig entry for the EyeQ6Lplus, the SoC and evaluation
board device tree, and the defconfig. For the OLB, the series adds the
match data to the clk-eyeq, reset-eyeq and pinctrl-eyeq5 drivers.

It also brings three other changes. One is for the pinctrl-eyeq5 driver
to access the pin descriptions, pin functions, and pin bank registers
via the match data instead of directly. This is needed to add support
for the EyeQ6Lplus alongside the EyeQ5 to the pinctrl driver.

To be able to match against compatible entries, an OF node is needed
but the pinctrl-eyeq5 does not have one as it is an auxiliary device
of clk-eyeq. As part of his MACB phy series[1], Théo switched to
devm_auxiliary_device_create() to register the auxiliary devices, and
this helper sets the OF node of the auxiliary device.

So this series depends on Théo's patchset so that eq5p_probe() can use
the OF node to get the match data, similar to what is done in eqr_probe()
in reset-eyeq.

The two other changes are in the clk-eyeq driver. First we skip the
post-divisor when computing the PLL frequency in the clk-eyeq driver,
to match how the clock signal is wired internally in all EyeQ PLL and
compute the correct frequency for the PLL of the EyeQ6Lplus. Second we
adjust the accuracy and down spreading computation of the PLL frequency
as the spread spectrum of all EyeQ PLL is in 1/1024 and not in 1/1000
as previously thought.

[1]: https://lore.kernel.org/lkml/20260225-macb-phy-v7-0-665bd8619d51@bootlin.com/

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v3:
- Rebase series on v7.0-rc1 + Théo's patchset[1].
- Refresh the defconfig.
- Add missing cdns,fifo-depth entry in octospi node of the SoC device tree.
- Simplify eq5p_probe() now that the OF node is set in clk-eyeq driver.
- Link to v2: https://lore.kernel.org/r/20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com

Changes in v2:
- Rebased on v6.19-rc2.
- Drop spidev nodes from the evaluation board DT, they were
  here for test only.
- Fix bug in eq5p_pinconf_set() using uninitialized value.
- Link to v1: https://lore.kernel.org/r/20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com

---
Benoît Monin (13):
      dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
      dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
      MIPS: Add Mobileye EyeQ6Lplus support
      reset: eyeq: Add Mobileye EyeQ6Lplus OLB
      pinctrl: eyeq5: Use match data
      pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
      clk: eyeq: Skip post-divisor when computing PLL frequency
      clk: eyeq: Adjust PLL accuracy computation
      clk: eyeq: Add Mobileye EyeQ6Lplus OLB
      MIPS: Add Mobileye EyeQ6Lplus SoC dtsi
      MIPS: Add Mobileye EyeQ6Lplus evaluation board dts
      MIPS: config: add eyeq6lplus_defconfig
      MAINTAINERS: Mobileye: Add EyeQ6Lplus files

 .../devicetree/bindings/mips/mobileye.yaml         |   5 +
 .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 ++++++++++
 MAINTAINERS                                        |   4 +-
 arch/mips/boot/dts/mobileye/Makefile               |   1 +
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts    | 103 +++++
 arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi   |  84 ++++
 arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi        | 170 ++++++++
 arch/mips/configs/eyeq6lplus_defconfig             | 117 ++++++
 arch/mips/mobileye/Kconfig                         |   3 +
 arch/mips/mobileye/Platform                        |   1 +
 drivers/clk/Kconfig                                |   4 +-
 drivers/clk/clk-eyeq.c                             |  90 ++++-
 drivers/pinctrl/Kconfig                            |   4 +-
 drivers/pinctrl/pinctrl-eyeq5.c                    | 437 +++++++++++++++------
 drivers/reset/Kconfig                              |   4 +-
 drivers/reset/reset-eyeq.c                         |  31 ++
 .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++
 17 files changed, 1156 insertions(+), 147 deletions(-)
---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20251128-eyeq6lplus-961c630f0940
prerequisite-message-id: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
prerequisite-patch-id: 68a9ce9820cf78e8a0705505ea29ff981b518570
prerequisite-patch-id: 40a406305a44a0ea0d0b861d34c199907750f84c
prerequisite-patch-id: dda6d7c3d7d7d8e49b31015887d1a7308f65559a

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


