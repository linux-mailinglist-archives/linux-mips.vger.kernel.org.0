Return-Path: <linux-mips+bounces-6585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA449B7F1E
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C76F282412
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E713E1A705C;
	Thu, 31 Oct 2024 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rtj5Cvxz"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F21A08BC;
	Thu, 31 Oct 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389986; cv=none; b=JgQFeH2h7nf2CVNtULlPKtqg6h9GbwtAKHq7rTvE+2VmGrdbvOS71n6FNbZGj4LU0a2eDZFVA1dMzZu6piBXfvncXQxMJLXLvanMtnSxwz6nSXXTN/3LgI2YXaJk16f0wgCMYLYUxPa7dRQo+awU1JqAUNtRmg7/BtRNl1hH4JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389986; c=relaxed/simple;
	bh=N830fVWifhGbcBBF89ZXJ7M4a+ROGpe3UDtbyB5q86M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hcXYfC2gstsYCpu3pZtESAEEYHhbe8eFyL633enGod0g1Qezo8u2Stq9gRKgitneXhW1iTT7ZR6quwGO8Mj3MZrZfuoBAKRQjM9/5/RaxB9BkkcQhQ/lRn20tC/RSu0m9jGXgDkcbIIS2T91HK34X+xOcImtWGqCk6NCm+Zkz+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rtj5Cvxz; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25C8B1C000A;
	Thu, 31 Oct 2024 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cD7mOQi0O8DNIiJK2VQkN3iQGCMRlI3qOZoMIXSbWvw=;
	b=Rtj5Cvxz36AnsVkCFlb4MRNYB7q8Soi6mUnk9GhLvpPSDKBmTqVlaCoOjijSTEkLwo+S0F
	UKTK1LUQUddBuG9P/sJbQ0JGQTQ21We/IQqXfjqIgb7TjWIXC7g0PKl6yDKxOhN1AyDKBq
	oh7U+6GTb1ms5598eT6xcRufgyWGTiERT/4/YJFycZ5x3OmW/bmCYKz5HkYG2vu7gl6mjT
	yqZ0lkSngG9WHkY1a6Yozlon68IRKfg1DoaAj8Bk5abQ4fl90IuIjkl4IAJM2owtUvJFSO
	qE0GtsiFO+doaKFQzkqBonoNzYT0L+0pVF4MQq78/15kJoF5Kz/9S/x63koVqA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 00/13] Usable clocks on Mobileye EyeQ5 & EyeQ6H
Date: Thu, 31 Oct 2024 16:52:50 +0100
Message-Id: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANKnI2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA2MD3dyknErd5Jxs3UQLc/M0Y3NL49QkIyWg8oKi1LTMCrBR0bG1tQD
 VCv/qWgAAAA==
X-Change-ID: 20241030-mbly-clk-a877f3793eb2
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Now that clk-eyeq is in the clk-next tree, we can add the small(-ish)
details required to make the platform work fully. The work is mostly
about updating devicetrees to rely on the system-controller nodes as
clock providers.

--

Things we do:

 - In EyeQ5 devicetrees, remove all fixed-factor clocks that are derived
   from clk-eyeq PLLs. We expose those directly from clk-eyeq (using
   match data info). This is simpler to reason about.

   [PATCH 02/13] dt-bindings: clock: eyeq: add Mobileye EyeQ5 core clocks
   [PATCH 03/13] dt-bindings: clock: eyeq: add Mobileye EyeQ5 peripheral clocks
   [PATCH 06/13] clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
   [PATCH 08/13] clk: eyeq: add fixed factor clocks infrastructure
   [PATCH 09/13] clk: eyeq: add EyeQ5 fixed factor clocks
   [PATCH 12/13] MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks

 - EyeQ6H devicetrees used fixed-clocks and didn't have
   system-controllers defined. Remove all that and define our syscons.

   [PATCH 04/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H central clocks
   [PATCH 05/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H west clocks
   [PATCH 10/13] clk: eyeq: add EyeQ6H central fixed factor clocks
   [PATCH 11/13] clk: eyeq: add EyeQ6H west fixed factor clocks
   [PATCH 13/13] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks

 - Our bindings used to say that some compatibles require a clock cell
   (those that expose multiple clocks) and others do not. Remove that
   subtlety and enforce a clock cell for everyone.

   The goal is to make it easier to add clocks to compatibles that
   previously exposed a single one. It happens for two compatibles in
   this patch series (EyeQ6H central and west).

   This is a "revert". I had been advised in the initial patch that the
   behavior was a bad idea. I 100% agree with those comments.

   [PATCH 01/13] dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
   [PATCH 07/13] clk: eyeq: require clock index with phandle in all cases

--

In which tree patches should go:

 - clk:
   [PATCH 02/13] dt-bindings: clock: eyeq: add Mobileye EyeQ5 core clocks
   [PATCH 03/13] dt-bindings: clock: eyeq: add Mobileye EyeQ5 peripheral clocks
   [PATCH 04/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H central clocks
   [PATCH 05/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H west clocks
   [PATCH 06/13] clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
   [PATCH 07/13] clk: eyeq: require clock index with phandle in all cases
   [PATCH 08/13] clk: eyeq: add fixed factor clocks infrastructure
   [PATCH 09/13] clk: eyeq: add EyeQ5 fixed factor clocks
   [PATCH 10/13] clk: eyeq: add EyeQ6H central fixed factor clocks
   [PATCH 11/13] clk: eyeq: add EyeQ6H west fixed factor clocks

 - MIPS:
   [PATCH 01/13] dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
   [PATCH 12/13] MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks
   [PATCH 13/13] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks

Reasoning: we need the clock indexes from dt-bindings headers to avoid
breaking the driver build, so patches 2-5 must go in clk-next.

Note about devicetree patches 12-13: other patches on the same
devicetrees are in the mailing-lists, with which I expect conflicts.
All should be straight-forward to resolve.

--

Question: I am a bit afraid about the process for clocks in the future.
Say we want to add I2C on EyeQ5 [0]. Steps will be:
 - The dt-bindings headers will get a new offset.
 - The clk-eyeq driver will get its private clocks indexes updated.
 - Then the clocks will be accessible from devicetree.

Those are somewhat unrelated to a series that is enabling I2C on a
platform. Should I expose the few clocks I already know we'll be
needing soon enough (I2C, SPI, EMMC)? The rest, I am unsure about the
structure and I'd prefer not exposing them.

Thanks,
Have a nice day,
Théo

[0]: https://lore.kernel.org/all/20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (13):
      dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
      dt-bindings: clock: eyeq: add Mobileye EyeQ5 core clocks
      dt-bindings: clock: eyeq: add Mobileye EyeQ5 peripheral clocks
      dt-bindings: clock: eyeq: add Mobileye EyeQ6H central clocks
      dt-bindings: clock: eyeq: add Mobileye EyeQ6H west clocks
      clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
      clk: eyeq: require clock index with phandle in all cases
      clk: eyeq: add fixed factor clocks infrastructure
      clk: eyeq: add EyeQ5 fixed factor clocks
      clk: eyeq: add EyeQ6H central fixed factor clocks
      clk: eyeq: add EyeQ6H west fixed factor clocks
      MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks
      MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks

 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  |  24 +-
 arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi      | 270 ---------------------
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  30 ++-
 .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     |  52 ----
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  73 +++++-
 drivers/clk/clk-eyeq.c                             | 204 ++++++++++++++--
 drivers/clk/clk-fixed-factor.c                     |  11 +
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  17 ++
 include/linux/clk-provider.h                       |   3 +
 9 files changed, 307 insertions(+), 377 deletions(-)
---
base-commit: 11713909beb7debd3d466a6dc302a33d91298be0
change-id: 20241030-mbly-clk-a877f3793eb2

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


