Return-Path: <linux-mips+bounces-4025-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3BB91C373
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 18:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC16D1C236AE
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 16:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE861CB30B;
	Fri, 28 Jun 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="avkLpDCE"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55F1C2328;
	Fri, 28 Jun 2024 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591121; cv=none; b=tavoI4y1KVQx3c8gDOwFeeV0Tmxo1bNRTYb60ZcsJc0F7I040VKkc9Uv/hH+ffYBXibAhB4HnwBrNQE/EYGJA4z4jXzRlnRw8QAfEFMclpoIyBmYf1699KLPPk4t/kgbqisJTmO5adAT++4mltH/oY7+QSeONkuDca4I/Iv+GLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591121; c=relaxed/simple;
	bh=WCpPTY6hVz1rGadArmb9ve2eLH4oOG1hs3HYHr8WtPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fVMZrUuTIz6a5VynEpvFROTDbow9pIvoTx4yrY6+MFm2DKt1Q5bvtO4yZQQnDVuDR4v8se6bnJISieh+Euu7rtyrDxmedQA9rtU+dVnQCkOPXkE8bvygwUcdWQDq/D93Q0yyzS37rAoPZmNMFDMqKENYOGoqn0E/LaOLT5IcLco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=avkLpDCE; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09BB01BF20B;
	Fri, 28 Jun 2024 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719591112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0+XZ/J7ChAoDDnmgTOp5O552jiS9D3wRjEpJyYaEgKg=;
	b=avkLpDCEk04mH/baQvo2E/lGrJTDbpP+TDvGkPMvwW1GbGE6rCDV9IjHMNh+3vKnDr5Ckz
	pLMnvydTy/CWmJNDSuEsVTEYKXDM8htZvBOPq+jvBSVEot4SeR+KHgjGLvRdrdGScyD2KP
	peffJYw8SrC+byjJpeCBt7ForyGIZafsPnEVaVkvIwZ7UhH1/by9n1fc7x0acWRNVfnGJy
	7WK/z/cEjiam7M87N8+5nRVUAX/mHKlj4eWhs625v6zypt9UE9F2PNr3B6RmfgVdEU4X9M
	tyvaX6l1CyrWAyjn+DLFDdXkVZ1yJ6vtjT3lhWUsI1vIdAJpDyMcolmLBRcNWA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/3] MIPS: Add Mobileye EyeQ OLB system-controller
Date: Fri, 28 Jun 2024 18:11:49 +0200
Message-Id: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMXgfmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3dyknErd3MyCYt00kzRT07RkI3MLE3MloPqCotS0zAqwWdGxtbU
 Av6w+OFsAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev-13183
X-GND-Sasl: theo.lebrun@bootlin.com

This is a new iteration on the Mobileye system-controller series [0].
It has been split into separate series to facilitate merging.

This series contains a dt-bindings defining the system-controller
(called OLB) used on EyeQ5, EyeQ6L and EyeQ6H. It then modifies the
EyeQ5 devicetree to exploit that system-controller.

The last patch adds entries in MAINTAINERS for all related files. This
is done in a single commit to avoid conflicts across trees.

Related series are targeted at clk [1], reset [2] and pinctrl [3].

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com/
[1]: https://lore.kernel.org/lkml/20240628-mbly-clk-v1-0-edb1e29ea4c1@bootlin.com/
[2]: https://lore.kernel.org/lkml/20240628-mbly-reset-v1-0-2a8294fd4392@bootlin.com/
[3]: https://lore.kernel.org/lkml/20240628-mbly-pinctrl-v1-0-c878192d6b0a@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes since OLB v3 [0]:
 - MAINTAINERS: Move changes into a separate commit to avoid merge
   conflicts. This commit is in the present series.
 - dt-bindings: Take Reviewed-by: Rob Herring.

---
Théo Lebrun (3):
      dt-bindings: soc: mobileye: add EyeQ OLB system controller
      MIPS: mobileye: eyeq5: add OLB system-controller node
      MAINTAINERS: Mobileye: add OLB drivers and dt-bindings

 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 .../{eyeq5-fixed-clocks.dtsi => eyeq5-clocks.dtsi} |  54 +--
 arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi        | 125 +++++++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  22 +-
 5 files changed, 541 insertions(+), 39 deletions(-)
---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240628-mbly-mips-f4f55fc27847

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


