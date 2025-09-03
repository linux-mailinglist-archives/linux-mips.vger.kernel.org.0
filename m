Return-Path: <linux-mips+bounces-10992-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B49B41F9D
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E100B7B27D5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3003009CE;
	Wed,  3 Sep 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fo/8eOf/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBBD3002B8
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903659; cv=none; b=P4i5u0FrmpBF/z7U9FcQizjfI16FWjh2mCuFhM5zDTnLqc6cntMr3Beo6lAtAwJnkSb+wpLi8523Mi3wjig62oZb29DAfITcmx7ULrthewUVz3+JGeziNWMCcbU/tvJtM/vWDhLW/XIE1yDYj1JzZtNfmsCRtfXSh0GFQvIUjdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903659; c=relaxed/simple;
	bh=cNRFisRXLFpNEwr6KqKWti7XX70NsMlUMR05LP253yI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BObf9FvoqigJYKcAKdPqFwzOhFHx1dey4LW3pEBiwSvi5yTlUFkM75R+m6KTGWPx6B7/F2xTy8iQjucinqh7WK5NAZqBqo41pWQet1k/03LhJNW2HF70fv1i50cG4xMWlzmkoYyuWUwBzVA5TXYDuL37MNa49Vjocnpdss1ehGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fo/8eOf/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED960C8EC51;
	Wed,  3 Sep 2025 12:47:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBF2C606C3;
	Wed,  3 Sep 2025 12:47:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 103D41C22A4EA;
	Wed,  3 Sep 2025 14:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rHZeM7R9CCkA2R4gaMHWa0k676D0il171o0vPPyB7Z8=;
	b=Fo/8eOf/0cWEkBjA0qSUbhVxlg7jVKPlRWcVOQSlsQb+MmCRXTTdHD2KKJu8Yb31livi6Y
	Hy+1o13RKmNpQjcf1rMl3WLIwr0a4kBMemtJPwEMCrG251zFZxb/+93pUjZlje3Q6blzNU
	eTbAqc014QkBS51t75bA04KTRBFV7lT1vqkt1MWY/9pAvLXSBp4KxrQNk/6wA1JkZ6ZTIv
	nBbYI0Pg2yqtXL7d0oz99EzzAchIGyvl4duifTkgY1azpGLY4uWyrNWyjBXRFev/BfVICO
	hIaY8Mlh9Ns/Xqn+9F8OQ2eLkxYM9JpV96v+dVUeW1hgrdGFnkd/VwDwXT+tEQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH 00/19] Add clock and reset support for Mobileye eyeQ7H
Date: Wed, 03 Sep 2025 14:47:07 +0200
Message-Id: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMs4uGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNz3eScbN3UytRCc900y2Sz1EQT4xRDYwsloPqCotS0zAqwWdGxtbU
 A62g8/VsAAAA=
X-Change-ID: 20250807-clk-eyeq7-f9c6ea43d138
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

This patchset brings the support of the OLB found in the new Mobileye SoC,
the eyeQ7H. Those Other Logic Blocks provide clock and reset functions
to the controllers of the chip. This series also contains changes to the
clock driver and its device tree binding to better match the hardware
found in the eyeQ chips.

In details, patches 1 and 2 rename the dt-binding yaml and header to
eyeq-olb.yaml and eyeq-clk.h. We drop the "5" from the filename since
the binding also applies to other eyeQ SoC (eyeQ6L, eyeQ6H and eyeQ7H).

Patches 3 and 4 add the compatibles entries and the clock indexes to
the dt-binding for the eyeQ7H.

Patch 5 introduces a dt-binding header for the reset indexes of the
eyeQ7H, similar to the header of the clock indexes.

Patch 6 adds the compatible entries to the reset-eyeq driver, and the
needed changes for the reset domain found in the eyeQ7H.

Patch 7 adds clk_hw_register_fixed_factor_with_accuracy to
clk-fixed-factor.c. This function allows registering a fixed factor with
both a parent clock and a known accuracy. This will be used to register
clocks referring to a parent clock registered in early init.

Patch 8 and 9 add validity checks to clk-divider.c. The first ensure that
the divider is even if the flag CLK_DIVIDER_EVEN_INTEGERS is set. The
second rejects the registration of clock with both a table and a flag set
if the flag leads to the table being ignored when computing the divider.

Patch 10 removes the post-divisor in the computation of the PLL frequency
in clk-eyeq.c. This change reflects how the clock signal is routed in
the OLB of all eyeQ SoC.

Patch 11 and 12 allow referencing to a parent clock by name for divider
and fixed fixed factor in clk-eyeq.c. This is needed by the eyeQ5 to
refer to clock registered in early init during probe.

Patch 13 to 15 prepare the introduction of new PLL types present in
the eyeQ7H OLB, by prefixing the PLL defines with the PLL type found in
eyeQ5 and eyeQ6 OLB, renaming the reg64 field and adding a type field
in eqc_pll.

Patch 16 adds the two PLL types found in the eyeQ7H to the clk-eyeq
driver.

Patch 17 adds a parent_name field to the eqc_pll structure. This will
be used to refer to other parent clock for the PLL found in the OLB of
the eyeQ7H.

Patch 18 adds an optional clk_div_table to divider in the clk-eyeq driver.

Finally, patch 19 declares all the compatible entries for the OLB of the
eyeQ7H in the clk-eyeq driver, making use of the changes introduced in
the previous patches.

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Cc: Sari Khoury <sari.khoury@mobileye.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Benoît Monin (19):
      dt-bindings: soc: mobileye: rename to eyeq-olb.yaml
      dt-bindings: clock: mobileye: rename to eyeq-clk.h
      dt-bindings: soc: mobileye: add eyeQ7H compatibles
      dt-bindings: clock: mobileye: add eyeQ7H clock indexes
      dt-bindings: reset: add Mobileye eyeQ
      reset: eyeq: add eyeQ7H compatibles
      clk: fixed-factor: add clk_hw_register_fixed_factor_with_accuracy
      clk: divider: check divider validity for CLK_DIVIDER_EVEN_INTEGERS
      clk: divider: check validity of flags when a table is provided
      clk: eyeq: skip post-divisor when computing pll divisor
      clk: eyeq: rename the parent field to parent_idx
      clk: eyeq: lookup parent clock by name
      clk: eyeq: prefix the PLL registers with the PLL type
      clk: eyeq: rename the reg64 field of eqc_pll
      clk: eyeq: add a type for the PLL
      clk: eyeq: add two PLL types
      clk: eyeq: add a parent field to the pll
      clk: eyeq: add an optional clk_div_table to divider
      clk: eyeq: add eyeQ7H compatibles

 ...ileye,eyeq5-olb.yaml => mobileye,eyeq-olb.yaml} | 137 +++-
 MAINTAINERS                                        |   3 +-
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |   2 +-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |   2 +-
 drivers/clk/clk-divider.c                          |   9 +
 drivers/clk/clk-eyeq.c                             | 876 ++++++++++++++++++---
 drivers/clk/clk-fixed-factor.c                     |  12 +
 drivers/reset/reset-eyeq.c                         | 248 +++++-
 include/dt-bindings/clock/mobileye,eyeq-clk.h      | 175 ++++
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  65 --
 include/dt-bindings/reset/mobileye,eyeq-reset.h    |  75 ++
 include/linux/clk-provider.h                       |   3 +
 12 files changed, 1414 insertions(+), 193 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250807-clk-eyeq7-f9c6ea43d138

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


