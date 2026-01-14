Return-Path: <linux-mips+bounces-12918-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8ED1DCC7
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 11:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14CCC3000929
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 10:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD163389E1D;
	Wed, 14 Jan 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0UtB14DJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FEA318BB2;
	Wed, 14 Jan 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385135; cv=none; b=QnEQRJSbtyKIq5rPVYsLQbG5f4KTexIEO67jdg7bdSle3sN0cFcTkctMmbTxhj8jg1Kik9jn03tMnAokn918UbiwLHu1cHk3jk5EdBi2csxPWBqKvy0wZxSkH8+RBOlvki4/3U1E1UzZNzBri2cN4B7+auizJyeT/QEJZRxwvRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385135; c=relaxed/simple;
	bh=P9hutvhxVwR7+A5OtEvDq/7/FT0WtB/zpV6jXOTb0aw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gHFH/mz+4J12Oj0dEV+ZCNsyjI82hvOVOOKJfJC6LEvOgsNgqSMTGa+v6DsEHg0Li2GcME0KShHxP0vHeNkrWzCz3B3ovuUuEIhQUE5j7dVP36asENu7RGtEQZMCKos/KZrE4gplpaOmitNynEgvi9UfUEeGG7enrC8/qcUwUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0UtB14DJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7BFA21A285D;
	Wed, 14 Jan 2026 10:05:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DC866074A;
	Wed, 14 Jan 2026 10:05:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6011F103C895C;
	Wed, 14 Jan 2026 11:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=chnjBshvJ/tp9fbcrD1HbQC5RjzfH0UcDYW9cIo/NgM=;
	b=0UtB14DJlsp7oeNSfrslH8AjiprVue40+nLa4C1SmEw+BtPo62WDw3VRenBJ0pIUV89JBg
	lachQ9UcZNdYXimVBQuWmX/IVaK9ZlqfAR6zvCIfZR7L8nhyAjh67D7tpegMdxmIi2QZUG
	cFzLQotZMAG49R/BZHdSCq6gGMz91NQgOjkR5YCyDtCTjq4Qqvje6/QAOUcT2K8UOSxiQJ
	tw1ZWbMlqSzeQgo6URGgtG+1L1bxV1bEU6Y2gCXNtwvpr6vPpT9/DNd5Ks0bO2b6EpDqV/
	+iNmIQwlNdF2SANpnCa1WvEyrTYS41RjYyfnTqDpElnrQrtL+rpL7+HUfODoFQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 00/10] Add clock and reset support for Mobileye EyeQ7H
Date: Wed, 14 Jan 2026 11:05:04 +0100
Message-Id: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFBqZ2kC/1WPwW7DIBBEf8XiXKplAQM+9T+qHgysG1THJMaxG
 kX59xJbatPj7O68nbmxQnOiwrrmxmZaU0l5qkK+NCwc+umTeIpVMwTUYMHwMH5xutLZ8MGFlno
 lo5CW1fvTTEP63ljvH1UfUlnyfN3Qq3hMd4oD+URZBQcuBw2ovI4t4ZvPeRnT9BrykT04K/56B
 aJ69mL1WmGUiqJuo/vvve+hZjpfaq9lT/ZXq2s2pEC74drxNF4Kd60IrYQBnIKuvq4M3xfilXh
 MS9c4pax21iMGDcH22ntjeidAEkblBiFVcNrY+v7+AxC8vuteAQAA
X-Change-ID: 20250807-clk-eyeq7-f9c6ea43d138
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sari Khoury <sari.khoury@mobileye.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This patchset brings the support of the Other Logic Blocks (OLB)
found in the first Mobileye SoC based on the RISC-V architecture, the
EyeQ7H. Despite the change from MIPS to RISC-V, the Other Logic Blocks
provide similar clock and reset functions to the controllers of the
chip. This series introduces the device tree bindings of the SoC and
the necessary changes to the clock and reset eyeq drivers.

Since this series affects drivers used on Mobileye MIPS SoCs, mainly
clk-eyeq, I tested that it does not introduce regressions on EyeQ5,
EyeQ6H, and EyeQ6Lplus evaluation boards.
    
In detail, the first patch adds the dt-bindings yaml and headers for
the EyeQ7H OLB.

Patch 2 adds the compatible entries to the reset-eyeq driver, and the
necessary changes for the reset domains found in the EyeQ7H OLB.

Patches 3 and 4 rework the handling of parent clocks in
__clk_hw_register_fixed_factor() to make it identical to other clock types
like divider or gate. This allows simplifying the registration functions
built on top of the now exported __clk_hw_register_fixed_factor(). A
new clk_hw_register_fixed_factor_pdata() is added that will be used in
clk-eyeq later in the series.

Patch 5 renames the defines and functions related to the PLL with the
PLL type fracg, to make room for the other types of PLL found the in
EyeQ7H OLB.

Patch 6 introduces a new generic type of clock structure that can
represents all clocks found in OLB. Then patch 7 and 8 converts all
clocks defined in the driver to the new struct eqc_clock and remove all
the previous separate clocks structures.

Patch 9 adds the list of clocks as match data for the 14 OLB present
in the EyeQ7H SoC, and the functions needed to probe the two PLL types
found in the chip.

Finally patch 10 adds an entry for Mobileye RISC-V SoCs to the MAINTAINERS
file for the newly added dt-bindings files.

This series depends on the EyeQ6Lplus support patchset posted
previously[1]. In particular on the patch adding the dt-binding header
and the ones modifying the clk-eyeq driver:
      dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
      clk: eyeq: Skip post-divisor when computing PLL frequency
      clk: eyeq: Adjust PLL accuracy computation
      clk: eyeq: Add Mobileye EyeQ6Lplus OLB

[1]: https://lore.kernel.org/all/20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com/

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v3:
- Fix eyeq7h-olb DT bindings following Krzysztof review.
- Link to v2: https://lore.kernel.org/r/20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com

Changes in v2:
- Move the dt-bindings to their own files and sort the compatibles.
- Reorder the changes in reset-eyeq and make the register access more
  readable.
- Drop the validity check on even divider. Unnecessary since it is
  always called from a clock .set_rate().
- Drop the parameters check on divider registration. Will be posted
  separately.
- Switch to a new generic struct for describing the clocks.
- Add an entry to MAINTAINERS.
- Link to v1: https://lore.kernel.org/r/20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com

---
Benoît Monin (10):
      dt-bindings: soc: mobileye: Add EyeQ7H OLB
      reset: eyeq: Add EyeQ7H compatibles
      clk: fixed-factor: Rework initialization with parent clocks
      clk: fixed-factor: Export __clk_hw_register_fixed_factor()
      clk: eyeq: Prefix the PLL registers with the PLL type
      clk: eyeq: Introduce a generic clock type
      clk: eyeq: Convert clocks declaration to eqc_clock
      clk: eyeq: Drop PLL, dividers, and fixed factors structs
      clk: eyeq: Add EyeQ7H compatibles
      MAINTAINERS: Add entry for Mobileye RISC-V SoCs

 .../bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml |  192 +++
 MAINTAINERS                                        |   13 +-
 drivers/clk/clk-eyeq.c                             | 1244 +++++++++++++-------
 drivers/clk/clk-fixed-factor.c                     |   72 +-
 drivers/reset/reset-eyeq.c                         |  268 ++++-
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    |  119 ++
 include/linux/clk-provider.h                       |   56 +-
 7 files changed, 1467 insertions(+), 497 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20250807-clk-eyeq7-f9c6ea43d138
prerequisite-change-id: 20251128-eyeq6lplus-961c630f0940:v2
prerequisite-patch-id: ee24f0dcdb893f3850e9dd0d54e848782a1b9ed7
prerequisite-patch-id: 781c4ae465c2af54c28ef4ad7a3c142da8390cf0
prerequisite-patch-id: 5de50e537525f326cd3478f8cf88df947c66a7ee
prerequisite-patch-id: cbb05dadd49dbf4ef54548b1016bba1e80c90805
prerequisite-patch-id: 235ce9ae215732262730062ad0d94b192456b492
prerequisite-patch-id: 1ee9fc5cf027bc9211c1a5e1547036e33d30fcf7
prerequisite-patch-id: 30f092cffaae6e2adc8f6520af6073b9cd20c59e
prerequisite-patch-id: 90361e8b03b1160a73257cc7d69e32435f319423
prerequisite-patch-id: 5db4ab27d470485e90f50a95ab7fc423ae63f5c8
prerequisite-patch-id: e87f2d3a017960908b7fd4ca285c643403b3bcb5
prerequisite-patch-id: 27c86e0ecfdabca4bca4bdc44e1bc9db8c27634a
prerequisite-patch-id: f46c35cfd0f9493e5f8ee2a4a5f53442c3846336
prerequisite-patch-id: a8952e1ae521fd6f757ebed446f15523791003ac

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


