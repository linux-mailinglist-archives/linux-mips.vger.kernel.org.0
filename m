Return-Path: <linux-mips+bounces-3112-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB878BD25F
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 18:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE42E1F21AED
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF754156962;
	Mon,  6 May 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F93uVRTS"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6A155757;
	Mon,  6 May 2024 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012207; cv=none; b=M3bSUls3xf/zNZfE7ONWd1INDCyrRXt+T/fvw+gf+rN80AHmHsC3GZ+QdlKAVx6rniY+mPDLvhEJN95z+A0uJkeOr30V4y6e1DRtOdCf0TyVJsq0hIaYPrdnLf3lsv5Jh1jyV+TRwVfIqCO04oADl9ITPbZKIb42L6Jq2YAFcxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012207; c=relaxed/simple;
	bh=zZyAr/JVIET1qMTPelI+mJUy4YIQlIMFARhVctDDnrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IlhoGOW+Crgihxo0v8aa3urcaySQ/E5fRRx+jtUd98286EdR77p/v3RORLA7xSR2PhaW2ATJSl6PO5uXgj6aDGIx3nVSCiBNv4OdUnySChkd5kBFvglBgLNEJIsOFZEV4MEXN8XYKrPlkWQrl9M23ZWVh35OxEZKwUi3EhX4+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F93uVRTS; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66F601C0002;
	Mon,  6 May 2024 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715012202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ECoO8kUgpclDri0KjQcfY0pQjcpg9p60sgmfiXjbp7Q=;
	b=F93uVRTSx4Dt+Jxmc7DRTW3JiXagTva6J7tfG5fz51BgWGcWOiS22oT6JjrzCS8dDf3rE7
	BVoHU9lYpC+7OtfTHqaNaufPltu9+2hzEM6jJZAyFbFPPS1fUuSjldFrNkq6mPfMKeEJuH
	zvzZhQszBiqeV8Z9PwvrrTHN0b5Pxku7oUlPz3+RO/LXxBC8BDuwItDURodVarKCNF4vP7
	79Cc6yNkxZv26gbfoHsPwuyqq0s7b2zEARf67FbDkAUmvQPrV5sWtyF1XbIiNnhG6EGryi
	ZDUudWIBy3OdIU3AX2g5okg93iy134/cjaM6aVhz0q63GIJJqZ5Vr0L9S23EXg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/3] Add support for the Mobileye EyeQ6H SoC
Date: Mon, 06 May 2024 18:16:09 +0200
Message-Id: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEkCOWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwMz3dTK1EKzDN00k2TTREvTJANLA0sloOKCotS0zAqwQdGxtbUAizI
 xrlgAAAA=
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2772;
 i=gregory.clement@bootlin.com; h=from:subject:message-id;
 bh=zZyAr/JVIET1qMTPelI+mJUy4YIQlIMFARhVctDDnrM=;
 b=owGbwMvMwCTIzSbRJ1JkfZXxtFoSQ5olU2a2I4OdU9GMud8dWLdzJl/saEvw6zTzvHr+9ZRrD
 z5rzwzriGVhEGRikBVTZJFYWXBGvFzfY5td83WYOaxMIEMYuDgFYCLudgzzvb7yOfdnf77+4Nq/
 6wuX5bcvimjOYVgw79rpzfzvZs/Zy+7wdXtU9dqu00qpAA==
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
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  99 ++++++++++++++++++
 arch/mips/configs/eyeq5_defconfig                  |   1 +
 arch/mips/configs/eyeq6_defconfig                  | 111 +++++++++++++++++++++
 arch/mips/mobileye/Kconfig                         |  26 +++++
 arch/mips/mobileye/Platform                        |   1 +
 13 files changed, 412 insertions(+), 5 deletions(-)
---
base-commit: 07e6a6d7f1d9fa4685003a195032698ba99577bb
change-id: 20240506-eyeq6h-f4c5a95b0909

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


