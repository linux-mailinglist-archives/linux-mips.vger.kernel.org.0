Return-Path: <linux-mips+bounces-12497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755FCC7FB1
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5378B30974AD
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA73733C522;
	Wed, 17 Dec 2025 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="to6fZldY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2C335091;
	Wed, 17 Dec 2025 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978580; cv=none; b=hSiOk12UeCMr5j2H+bMyzJqYPzuwv/DDn5COpZHpWs5eyNDyBib8dkIPHO62h9Yp8FoK/Cx7kV2bIoq5FxjnKFvwnAJFBG6++O4PmoG0yHUugif4Xb9bOjdpGO7Kao2FVcseDCoCGaK2CnBLjBc9x/DHCuC3LIqqDr2pBP08XWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978580; c=relaxed/simple;
	bh=BG5WjneFUAcYerU4QAtzF9PfZciUrUH9GPXPrWL5Ik4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HUAI0u92aCyKkPLnDigMSQhir9M9ZFUPnT1sWm3p1ZIFyJwH+0m6yXn9NvWSgbIAFkoUD/yZPD10PsldVLLa9mWErd5PL6I9woORcP/4KpCgunOC3tlCaerA+xYyV/wAiuyRIGjRVmMu9OVd73X7PglbffDZjXJx9Oq6V/d5DVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=to6fZldY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5031C1A59D;
	Wed, 17 Dec 2025 13:35:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 344F56072F;
	Wed, 17 Dec 2025 13:36:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C6A3102F0AD2;
	Wed, 17 Dec 2025 14:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YMEO4XGsTesQV2me7FMOZ81Y5IcMWo887Z9CgZajqyk=;
	b=to6fZldYjVFS4arTIkGZex72ttLVnNNpfUGa584NixIVwN7a7kXWOZMiRxziZQsBlEagSL
	dm7P9SGxgVlCyVv721R+SHWBIArFuAvHswn1BYuNI1vXIc/hcpg0de79GfdCLAgQ5U0WnP
	g3nddTawnOi04/IwJFMN0r5bOU0AeKDEu3RDXIWkdgH4YsU+aRFy2mH9mSZBXZyHFfIDKS
	wkhf5kVJ7WZTY8OrnU1gEYsaJQoJ2roJBYJ0mRqzxivTdN4NUfto9Mrq3Y/EMQN3I9G36T
	nvIpFNoZgU1rSVoSTh15GNM3KbOgFZ53+JmBsf8ca9fyIkD79bFfQH5pNKQvEw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH 00/13] Introducing the Mobileye EyeQ6Lplus SoC
Date: Wed, 17 Dec 2025 14:35:50 +0100
Message-Id: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALaxQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3dTK1EKznIKc0mJdSzPDZDNjgzQDSxMDJaCGgqLUtMwKsGHRsbW
 1AHIwZwhcAAAA
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
Benoît Monin (13):
      dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
      dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
      MIPS: Add Mobileye eyeQ6Lplus support
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
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts    | 112 +++++
 arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi   |  84 ++++
 arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi        | 169 ++++++++
 arch/mips/configs/eyeq6lplus_defconfig             | 119 ++++++
 arch/mips/mobileye/Kconfig                         |   3 +
 arch/mips/mobileye/Platform                        |   1 +
 drivers/clk/Kconfig                                |   4 +-
 drivers/clk/clk-eyeq.c                             |  90 +++-
 drivers/pinctrl/Kconfig                            |   4 +-
 drivers/pinctrl/pinctrl-eyeq5.c                    | 462 +++++++++++++++------
 drivers/reset/Kconfig                              |   4 +-
 drivers/reset/reset-eyeq.c                         |  31 ++
 .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++
 17 files changed, 1192 insertions(+), 146 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251128-eyeq6lplus-961c630f0940

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


