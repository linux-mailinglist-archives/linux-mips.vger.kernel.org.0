Return-Path: <linux-mips+bounces-13366-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ME/Gl5RqGmztAAAu9opvQ
	(envelope-from <linux-mips+bounces-13366-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:35:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF28202E0E
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF4AC3010777
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 15:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC01A32F751;
	Wed,  4 Mar 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TOKnlZwD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C633A6E0
	for <linux-mips@vger.kernel.org>; Wed,  4 Mar 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637961; cv=none; b=IyQBo8YhDugm/GO5JAyQqPqWLvAo+cX+eC4taTJ8aGWDVSFp2Fqgk1ca+p7NtKw0m0cKyli9KZfz4I5wuAc5CVQ/lF3TkMaboN99o3xZz4FppOkmhxO1BEnQPhohQjjoaipx/H8F8gO0bVgTeQKkqE7nYwAuu63JRJmNFlC9AKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637961; c=relaxed/simple;
	bh=2zTJepp9PeAUecvd2FD/sQLoC97yP4rS/9I24SeT0Y4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F9r8qxx9h6ttv+IrTDwWph77LSb5OyDXs4RJQ8t4MY1a0rH+612wq+UL4zhfYK/gVQh5DAqRVLgv/HYD6C66gNJNgKCtGHfcqWzPBFeSKGmCNsvWH/PMgQzJrUZQ0qNswoWpEL85m72mS2ch8KuITn5bpO8tdm4FohCGnCXrV9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TOKnlZwD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 770AB4E42542;
	Wed,  4 Mar 2026 15:25:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 411C75FF5C;
	Wed,  4 Mar 2026 15:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AC3A103697AE;
	Wed,  4 Mar 2026 16:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=stR+fiQn44jXAiWKBJzbsxfh8q0GGnEp7PRkh3gMa3I=;
	b=TOKnlZwD7v8PFZeNSuQC0M3oyEv2h5CRUZYCZV1ZPAYMootLlr79pikYpmZmTaW3+H6iL5
	gNdCDzS7liY6Xt7o1VI0Y0K6U5ZesH8lqM+WhFOyQLxS6XtJzr9+xhaIArayuHNcYUULFP
	mdyi8LlAGZZUCnGB6DHwUD0pGUcrielhMPiyISYLktBrH2NEgkbyHMW8Nxe+pJs1Bxhd2I
	VOeHF3rbjy0H9xiIX3qCfxAa0BilBSwU8K8JId9JpFaDMRndTJiSie2B1BpBLMAYbOFoDd
	IuiL4uBLW4Yj/GiBG5bi78vjwVA+sYbIaXmX0rm22dx87DDRgPoFKmA9g9ZAnA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v4 00/10] Add clock and reset support for Mobileye EyeQ7H
Date: Wed, 04 Mar 2026 16:25:14 +0100
Message-Id: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANtOqGkC/2WQ2WrDMBBFf8XouQoabV4Ipf9R+mBJ40bUWyxH1
 IT8e2WbFoc+XmnO4c7cScDJYyBVdicTRh/80KcgXzJiL3X/idS7lAlnXLGC5dS2XxQXvOa0Ka3
 GWgoHoiBpfpyw8d+b6/0j5YsP8zAtmzrC+rpbSiYOlgiUUdEoxqVRTiN/M8Mwt74/2aEjqyfyP
 xY4l0eWJ7aAXEoH6deV/1nxy2oG8MSKlUXjTJ0bBkI8s499oQmvt3STed+KdBhCvd2kys6blHN
 Fu9oaOl4WGvPk1FoZV2gonYKj85Ucb1pl2z7Ai62Pbsf2FmipwWrBGlZKVqXuiTB1QJrwzs9VF
 vMTo5OF1O/xA8qeP7e7AQAA
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
X-Rspamd-Queue-Id: 8FF28202E0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13366-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

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
previously[1], which in turn depends on Théo's series[2]. In particular,
the changes made to the clk-eyeq driver in this patchset depend on the
changes done in these two series.

[1]: https://lore.kernel.org/all/20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com/
[2]: https://lore.kernel.org/lkml/20260225-macb-phy-v7-0-665bd8619d51@bootlin.com/

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v4:
- Rebased on v7.0-rc1 + version 3 of eyeq6plus series.
- Link to v3: https://lore.kernel.org/r/20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com

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
 drivers/clk/clk-eyeq.c                             | 1245 +++++++++++++-------
 drivers/clk/clk-fixed-factor.c                     |   72 +-
 drivers/reset/reset-eyeq.c                         |  268 ++++-
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    |  119 ++
 include/linux/clk-provider.h                       |   56 +-
 7 files changed, 1468 insertions(+), 497 deletions(-)
---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20250807-clk-eyeq7-f9c6ea43d138
prerequisite-message-id: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
prerequisite-patch-id: 68a9ce9820cf78e8a0705505ea29ff981b518570
prerequisite-patch-id: 40a406305a44a0ea0d0b861d34c199907750f84c
prerequisite-patch-id: dda6d7c3d7d7d8e49b31015887d1a7308f65559a
prerequisite-change-id: 20251128-eyeq6lplus-961c630f0940:v3
prerequisite-patch-id: 68a9ce9820cf78e8a0705505ea29ff981b518570
prerequisite-patch-id: 40a406305a44a0ea0d0b861d34c199907750f84c
prerequisite-patch-id: dda6d7c3d7d7d8e49b31015887d1a7308f65559a
prerequisite-patch-id: ee24f0dcdb893f3850e9dd0d54e848782a1b9ed7
prerequisite-patch-id: 781c4ae465c2af54c28ef4ad7a3c142da8390cf0
prerequisite-patch-id: 5de50e537525f326cd3478f8cf88df947c66a7ee
prerequisite-patch-id: cbb05dadd49dbf4ef54548b1016bba1e80c90805
prerequisite-patch-id: 07021e7be37e3c14ef2950f2ca176a69b3be3ded
prerequisite-patch-id: 1ee9fc5cf027bc9211c1a5e1547036e33d30fcf7
prerequisite-patch-id: 30f092cffaae6e2adc8f6520af6073b9cd20c59e
prerequisite-patch-id: 90361e8b03b1160a73257cc7d69e32435f319423
prerequisite-patch-id: 5db4ab27d470485e90f50a95ab7fc423ae63f5c8
prerequisite-patch-id: 571f8eb779bcad13ac8762519dafc2d0c260d6c7
prerequisite-patch-id: 27c86e0ecfdabca4bca4bdc44e1bc9db8c27634a
prerequisite-patch-id: 40a5ae6831ec4107ae32d74e948636837fa9e076
prerequisite-patch-id: a8952e1ae521fd6f757ebed446f15523791003ac

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


