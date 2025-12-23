Return-Path: <linux-mips+bounces-12562-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B13CD8B25
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B89FE3041CE8
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2FF32B981;
	Tue, 23 Dec 2025 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TmX5VajP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0C2C11E4;
	Tue, 23 Dec 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484160; cv=none; b=ajNQeuKxQnj8h5j9ZX4a+OAgCvexj0ufWNHFTDSxPFfjDgDB4DUZD7qa6jZ9FJ7r8Aw/MQKGj/XXg8+glWcUioF2glvCjS0SfBIteCTCU3lSXv4miMYmBUQKHvr+PHMwxyxaBkvpFCJssy4QgSm3fbestQhvcB/pzNsBBHL8hGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484160; c=relaxed/simple;
	bh=7CJYGTSN7WTAdsrk5nTSBNcdB82v5ao3fSIminUpoxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=btnIpICn038k4Rzn+P9OoQl5DR8bbeWcZqaeGmDx1aYkoxzq/fpWODaVS1t0oT5/3IcEqlp/sXA6f+N4sXGbZxOQQDperquq3eR0XrNZaD7GMmTxxiWmdaQNqAZCrh0NYDdEIMTFw04vxJB7IcYQUieJXlYMtJ0ajqtxwp0WFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TmX5VajP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED7BF4E41D5A;
	Tue, 23 Dec 2025 10:02:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8FBD60716;
	Tue, 23 Dec 2025 10:02:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7728010AB09B8;
	Tue, 23 Dec 2025 11:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vKXAVXkQkoVX1RqytPUqRo6pHinh5Q8zwojN9SALFLc=;
	b=TmX5VajPV4iSMDrTOxLZKRMRooArXGamRR0GfkJQtfe1zQwCSGNlcIa20hFyqbfDiBLrbN
	pLIf57C5fmY8cTBf0IqLfo9b6IW8I0QXWfliwBLDdR5bPqRvfxbSUcSPVqO6Dm7MDHiY4v
	sutGtWevHE3dkY7teQ6kzW5d3pEH09F8gfiU7RHuRP+5yqFzhe8VvqwRmwFzGgiVSwr1W9
	JMdEVvQHTP2CMendD3PEAbLHPtpR1y0coisFaK8W93jm7ALCe1ACQIl8EN/Zq9CLzsKgBa
	5deEOxs91I46DWcSY25VbmhCCG/Xn5YJp9QRAztfRP5p2wnbob7se6HxBp7WqQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 00/13] Introducing the Mobileye EyeQ6Lplus SoC
Date: Tue, 23 Dec 2025 11:02:15 +0100
Message-Id: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKdoSmkC/03MQQ6CMBCF4auQWVvTFqyWlfcwLKBMZZJKsUUiI
 b27FTcu/5e8b4OIgTBCXWwQcKFIfswhDwWYoR3vyKjPDZLLkxDywnDFp3KTe0WmlTCq5JbrikM
 +TAEtvXfs1uQeKM4+rLu9iO/6Y6Q4/zOLYJyhNn3Xl62tjLx23s+OxqPxD2hSSh/UiCxYpgAAA
 A==
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

The support for the particularities of the I2C controllers is 
currently under review[1], but basic operations (single read,
single write, write-then-read) work with the compatible fallback to
"snps,designware-i2c".

The patch series adds the device tree bindings for the SoC and the OLB. It
also adds the Kconfig entry for the EyeQ6Lplus, the SoC and evaluation
board device tree, and the defconfig. For the OLB, the series adds the
match data to the clk-eyeq, reset-eyeq and pinctrl-eyeq5 drivers.

It also brings three other changes. One for the pinctrl-eyeq5 driver to
access the pin descriptions, pin functions and pin bank register via
the match data instead of directly. This is needed to add support for
the EyeQ6Lplus alongside the EyeQ5 to the pinctrl driver.

To be able to match against compatible entries, An OF node is needed
but the pinctrl-eyeq5 does not have one as it is an auxiliary device
of clk-eyeq. As part of his MACB phy series[2], Théo switched to
devm_auxiliary_device_create() to register the auxiliary devices and this
helper sets the OF node of the auxiliary device. To avoid a dependency
between the patch series, eq5p_probe() is able to handle both cases,
having the of_node field already set in the device structure or getting
it from the parent device. After both series are merged, a cleanup of
the pinctrl-eyeq5 probe function can be done.

The two other changes are in the clk-eyeq driver. First we skip the
post-divisor when computing the PLL frequency in the clk-eyeq driver,
to match how the clock signal is wired internally in all EyeQ PLL and
compute the correct frequency for the PLL of the EyeQ6Lplus. Second we
adjust the accuracy and down spreading computation of the PLL frequency
as the spread spectrum of all EyeQ PLL is in 1/1024 and not in 1/1000
as previously thought.

[1]: https://lore.kernel.org/all/20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com/
[2]: https://lore.kernel.org/all/20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com/

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
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
 .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 +++++++++
 MAINTAINERS                                        |   4 +-
 arch/mips/boot/dts/mobileye/Makefile               |   1 +
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts    | 103 +++++
 arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi   |  84 ++++
 arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi        | 169 ++++++++
 arch/mips/configs/eyeq6lplus_defconfig             | 119 ++++++
 arch/mips/mobileye/Kconfig                         |   3 +
 arch/mips/mobileye/Platform                        |   1 +
 drivers/clk/Kconfig                                |   4 +-
 drivers/clk/clk-eyeq.c                             |  90 +++-
 drivers/pinctrl/Kconfig                            |   4 +-
 drivers/pinctrl/pinctrl-eyeq5.c                    | 465 +++++++++++++++------
 drivers/reset/Kconfig                              |   4 +-
 drivers/reset/reset-eyeq.c                         |  31 ++
 .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++
 17 files changed, 1185 insertions(+), 147 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251128-eyeq6lplus-961c630f0940

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


