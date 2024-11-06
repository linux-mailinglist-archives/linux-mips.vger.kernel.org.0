Return-Path: <linux-mips+bounces-6692-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 129469BF289
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E73CB248AC
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC13220651F;
	Wed,  6 Nov 2024 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OZzsrRRC"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9501DCB06;
	Wed,  6 Nov 2024 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909042; cv=none; b=FOW73s0DxHW3sNhfN+Aak7HIrUqPskvWAiE5uSjM4N4rvG/S9tc23czoF9LDmXA9LicxtpZE479LWuCfjyuBFSEOi0B/bisA4jEYOistRdn8BgCKmCuLcGYCHlHnyCOf0vHRKIMGsDlR7OMsyLYFwBmVEm7cX0vZr/8ph063G6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909042; c=relaxed/simple;
	bh=kNMZOxloojlVgJYl446sTR/0XhQacwriWl73D/alcGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=to2YRudjtfQIxBB4L0IVGCiAiAu6+KxIUtR6LMYvGs/TIZctOEwEo6po4KO9BKHnJHs13vVWyDf57OrOGuqUnazp6pJ7z1/x3Uy4r77mRKzoP4XGHTlM7+tmF9nyElK7FiP2/VId29hDRFSgpw/A4NXL9fuP4Rj4hwWF3KJbP2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OZzsrRRC; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1248340002;
	Wed,  6 Nov 2024 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xQ0f6eUzwBnvZvNbGKfAEFJ1fg/LcmINDrTkR6LRI70=;
	b=OZzsrRRC8J1Q47Ti6s+Mcp8knmymb+jObk1EQxnQXsnZDYKpAUbJgpDVdXx+yi8rSrwOWt
	v4BflQJxfdodQbBG9wjWUrs3fgKn07vc/OXbaREi47M1qQaBwzDECjSFfXwSuPsSctFiGU
	t9FIXYuPQylUhGs5QELQsIYtydKXRbaEp+9hgQF5D64okTh6D/CQw3PGTDqdxWDzCkqdSp
	vCpfipYE8YEyMZWS7XxBly50EE33AIPB27oVmRHOY5lfTdmKX952P0gkvE0c0XJ6ATIn8m
	xHVCJikKGQjg36MNOwW24Rp3uwig/IoWF5cAdiYAXP04VER9kAhBwcpkCEI6uw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v2 00/10] Usable clocks on Mobileye EyeQ5 & EyeQ6H
Date: Wed, 06 Nov 2024 17:03:51 +0100
Message-Id: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGeTK2cC/0XMSwqDMBSF4a3IHTclj9LEjrqP4sDEa71UjSQSK
 pK9NxVKh//h8O0QMRBGuFU7BEwUyc8l5KkCN7TzExl1pUFyeRFccTbZcWNufLHWaN0rXSu0Esp
 9CdjT+6AeTemB4urDdshJfNcfIv5IEowzU3fGSoOK8+vder+ONJ+dn6DJOX8AaYGCf6IAAAA=
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

   [PATCH v2 02/10] dt-bindings: clock: eyeq: add more Mobileye EyeQ5/EyeQ6H clocks
   [PATCH v2 03/10] clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
   [PATCH v2 05/10] clk: eyeq: add fixed factor clocks infrastructure
   [PATCH v2 06/10] clk: eyeq: add EyeQ5 fixed factor clocks
   [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks

 - EyeQ6H devicetrees used fixed-clocks and didn't have
   system-controllers defined. Remove all that and define our syscons.

   [PATCH v2 07/10] clk: eyeq: add EyeQ6H central fixed factor clocks
   [PATCH v2 08/10] clk: eyeq: add EyeQ6H west fixed factor clocks
   [PATCH v2 10/10] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks

 - Our bindings used to say that some compatibles require a clock cell
   (those that expose multiple clocks) and others do not. Remove that
   subtlety and enforce a clock cell for everyone.

   The goal is to make it easier to add clocks to compatibles that
   previously exposed a single one. It happens for two compatibles in
   this patch series (EyeQ6H central and west).

   This is a "revert". I had been advised in the initial patch that the
   behavior was a bad idea. I 100% agree with those comments.

   [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
   [PATCH v2 04/10] clk: eyeq: require clock index with phandle in all cases

--

In which tree patches should go:

 - clk:
   [PATCH v2 02/10] dt-bindings: clock: eyeq: add more Mobileye EyeQ5/EyeQ6H clocks
   [PATCH v2 03/10] clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
   [PATCH v2 04/10] clk: eyeq: require clock index with phandle in all cases
   [PATCH v2 05/10] clk: eyeq: add fixed factor clocks infrastructure
   [PATCH v2 06/10] clk: eyeq: add EyeQ5 fixed factor clocks
   [PATCH v2 07/10] clk: eyeq: add EyeQ6H central fixed factor clocks
   [PATCH v2 08/10] clk: eyeq: add EyeQ6H west fixed factor clocks

 - MIPS:
   [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
   [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks
   [PATCH v2 10/10] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks

Reasoning: we need the clock indexes from dt-bindings headers to avoid
breaking the driver build, so patch 2 must go in clk-next.

Note about devicetree patches 9-10: other patches on the same
devicetrees are in the mailing-lists, with which I expect conflicts.
All should be straight-forward to resolve.

Thanks,
Have a nice day,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v2:
- Patch "dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all
         compatibles":
  - Mention that we break ABI (#clock-cells) in commit message, and
    explain why. [0]
- Patches "dt-bindings: clock: eyeq: add * clocks":
  - Squash all four patches into a single one. [1]
  - Improve the commit message, describing the clock tree structure.
  - Expose more EyeQ5 peripheral clocks: SPI, I2C, GPIO, EMMC, PCI.
    We already know those will be used later down the road.
- Patch "clk: eyeq: add EyeQ5 fixed factor clocks":
  - Use enum to auto-number non-exposed EyeQ5 clock indexes.
    Start from the last dt-bindings exposed index plus one.
- Link to v1: https://lore.kernel.org/r/20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com

[0]: https://lore.kernel.org/lkml/20241105133323.GA3064907-robh@kernel.org/
[1]: https://lore.kernel.org/lkml/7ebcdarioght4u2bai4l42pckitcw5iz4rky4ncgp7aqmtrlen@zl7k7pgijloq/

---
Théo Lebrun (10):
      dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
      dt-bindings: clock: eyeq: add more Mobileye EyeQ5/EyeQ6H clocks
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
 drivers/clk/clk-eyeq.c                             | 208 ++++++++++++++--
 drivers/clk/clk-fixed-factor.c                     |  11 +
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  44 +++-
 include/linux/clk-provider.h                       |   3 +
 9 files changed, 327 insertions(+), 388 deletions(-)
---
base-commit: 11713909beb7debd3d466a6dc302a33d91298be0
change-id: 20241030-mbly-clk-a877f3793eb2

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


