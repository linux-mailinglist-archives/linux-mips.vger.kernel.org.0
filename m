Return-Path: <linux-mips+bounces-3259-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B22E8C46EA
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 20:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0B6AB20FB4
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 18:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ADF3B29D;
	Mon, 13 May 2024 18:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XXsztQv1"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D23D54B;
	Mon, 13 May 2024 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715625292; cv=none; b=LsqsXzAawMg7lqkZVHxzvbjsbrR1kKhb0FKswkUP3hMeObx93uOr5M6PK8nRsGpuCTCX/1JPHXqOjFVL3Dr+p/Ssonj/OiHQRlI8GqSQCqICWQDsxQ2YmvVAhX4b4NzXMgt/UZ1Gbv+W3eamRtl0kOz9T2glhWR77O4DLSxgH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715625292; c=relaxed/simple;
	bh=HXFxENjHeeaUS0wXDH0GkY7JhUlPp+rSjq6vsVlEVec=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ue2tB4x5lNRzsxMAmiMMfLdnfYghWsfArYT6zRmpaURyYWJT6BX2GPV3cb9mRcxaLvGV1pY+Wbv5Atm/RMXmyOsKRqmQWrR75XB/kp7G5XhI78QnTYXCPvZXVAo/f5/tnGBLUqz0SZaziIuvdOFE+nJfMpmQwpWcG+wIUbTGHa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XXsztQv1; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD86B1BF205;
	Mon, 13 May 2024 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715625282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5+0NVHVw8b5N42HywH5UM3iz0YZiUn5hPRXWVQ4hEOQ=;
	b=XXsztQv1XREJs9HWerdo9thZsoDyg7x91znPVXUBq9VkBVepKoNkFlEcWRGPBqHFoXAOEq
	fCaQgb6nM/g8Vx07eoeFK0/Xeu8R+bXy2MZvhYyRfOrKU79tNn/ieN+huVBErezNGX90Wa
	m4m9w2AjPuOsiK2BTMD1cIPqR7cJ/L5zYDIV8eHmVGp3xUVXovubxXT0/NMVP2mqPnw1d7
	/qnZSJ/opUujhW12CNZj/fF4dPwQI8blDdhK9dMhFrD8EjTcgnjB5Gdb7GqoXkNchE86nd
	G3kSw57mWLk3opyZv1fVrg7FcZ+wJd0Uc6qXk2KUZKnpIi+49+8rvfrOK+V8cA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/3] Add support for the Mobileye EyeQ6H SoC
Date: Mon, 13 May 2024 20:34:14 +0200
Message-Id: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACZdQmYC/2XMQQ7CIBCF4as0sxZDEUhw5T1MFwUHmURBoSE2D
 XcXu3X5v7x8GxTMhAXOwwYZKxVKsYc4DODCHO/I6NYbBBeSK64ZrvjWgXnp1GyU5YYb6OdXRk+
 fHbpOvQOVJeV1d+v4W/+IOjLOvDBWCW2ck6eLTWl5UDy69ISptfYFKr8hXZ4AAAA=
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3194;
 i=gregory.clement@bootlin.com; h=from:subject:message-id;
 bh=HXFxENjHeeaUS0wXDH0GkY7JhUlPp+rSjq6vsVlEVec=;
 b=owGbwMvMwCTIzSbRJ1JkfZXxtFoSQ5pTrP2L8B1ls8WjVrmfe1dtoVLAaSWmcV7ikkXM0VqX3
 XM+yj3oiGVhEGRikBVTZJFYWXBGvFzfY5td83WYOaxMIEMYuDgFYCJCDxkWdBjmr/P/Ouv8iy13
 KtrXqPlt9zvNwrBgaX89s/6dPQ8Cr8bd/RrTs28L4+dlAA==
X-Developer-Key: i=gregory.clement@bootlin.com; a=openpgp;
 fpr=18A970CC17772F48B63E83D70B06188E14723BD5
X-GND-Sasl: gregory.clement@bootlin.com

Hello,

Following the support of the EyeQ5 SoC, this series adds the initial
support for a newer SoC, the EyeQ6H.

The EyeQ6H (or "High") from Mobileye is still based on the MIPS I6500
architecture as the EyeQ5. The 2 clusters of this SoC contain 4 cores
each, which are capable of running 4 threads per core. Besides this,
it features multiple controllers such as the classic UART, high-speed
I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
also includes a Hardware Security Module, Functional Safety Hardware,
and video encoders, among other features.

For now, this series just adds initial support with UART and Pinctrl
support. Another current limitation pointed out in patch 3 is that
only one CPU is actually running. This limitation will be solved with
upcoming series.

The main change in this new version is the use of the new way to name
the clock nodes.

Regards,

Gregory

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v2:

- Renamed clock node names based on
  https://lore.kernel.org/all/20240430180415.657067-1-robh@kernel.org/>
- Use "eyeq6h" instead of "eyeq6" for the compatible string
- Move compatible string as the first property
- Link to v1: https://lore.kernel.org/r/20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com

---
Gregory CLEMENT (3):
      dt-bindings: mips: Add bindings for a new Mobileye SoC EyeQ6H
      MIPS: mobileye: Add EyeQ6H device tree
      MIPS: mobileye: Add EyeQ6H support

 .../devicetree/bindings/mips/mobileye.yaml         |   5 +
 arch/mips/Kbuild.platforms                         |   2 +-
 arch/mips/Kconfig                                  |   7 +-
 arch/mips/boot/dts/Makefile                        |   2 +-
 arch/mips/boot/dts/mobileye/Makefile               |   1 +
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts        |  22 ++++
 .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     |  52 ++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi       |  88 ++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  98 ++++++++++++++++++
 arch/mips/configs/eyeq5_defconfig                  |   1 +
 arch/mips/configs/eyeq6_defconfig                  | 111 +++++++++++++++++++++
 arch/mips/mobileye/Kconfig                         |  26 +++++
 arch/mips/mobileye/Platform                        |   1 +
 13 files changed, 411 insertions(+), 5 deletions(-)
---
base-commit: 07e6a6d7f1d9fa4685003a195032698ba99577bb
change-id: 20240506-eyeq6h-f4c5a95b0909

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


