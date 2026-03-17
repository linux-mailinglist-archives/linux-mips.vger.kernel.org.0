Return-Path: <linux-mips+bounces-13729-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEoKMTRYuWnYAgIAu9opvQ
	(envelope-from <linux-mips+bounces-13729-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:33:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578F2AAEC9
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B3F1302A9E3
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 13:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1ED280014;
	Tue, 17 Mar 2026 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="07ncaZl+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6027FD52;
	Tue, 17 Mar 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754414; cv=none; b=Zq5R7UtI9ypc2LXj5ctYsu+tmcwelkw+88Yq0VsumF/da86BzUJ7uLxYVaVMgKgSHW5JGDMVfT2HkD0Mn1n11UKge6Vx8BPkumETJGGs5hk7nDL2U0LiWoJL5g8fhpvF6a3TbKL5rx94QtHX9XbUww9FYtLp61hPEYm24Y30s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754414; c=relaxed/simple;
	bh=dndxzP16AqxiqnW5KnnFAXowA07EQ4hi8Tx1lcE/Z5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZcF6ENqWt9WrpbIx4dmVZ50bXWpuPsNsZ+osqvpA//m0514g2E4HEanJBZ0Y3OxsOhtvKotBmhYnyniNn5V316p0T6dP0lUhnsTJOj+R3kzhndyZ44l2zXF2Q1N/j7AUDAjGZYz1poNpn8NT2gCqcpSY8PEhtrvCdvZ+h/UIN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=07ncaZl+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0A4FB1A2D72;
	Tue, 17 Mar 2026 13:33:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0C5B5FC9A;
	Tue, 17 Mar 2026 13:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23F9A104505E9;
	Tue, 17 Mar 2026 14:33:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773754408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xpHJa1ryTlR1OcJcmakYaRM4nZUHMIqMK4/9O3AQ/DY=;
	b=07ncaZl+BlZXdiz9YDRusS5kjnCdPoe5jr6CMIeC8AcvEEunTjhV0aRxGlC8iZYrwda8HT
	8ZCVH7BcFWerW/RTa4EGsaB0b0WsTSpdAE7/+mRv2qIu0pQsBvAjf1foUsrPpHur7UDPW9
	c0N2joWiB2Y2PQsnqCP6+hglmDC3b23cr3KvAej6RGHx6l+XhDSDhN2lOQp+LoEb1+o0U3
	t0ayhKSuyOmwnb2sDZnP78oZ3/pCZXfrrJDBWItz4GyVVfsVDP3VNt0svw7XYu03EUwcZx
	H6p3dldkyqrhFKHzcgySFVk+w5mr2mxuURTEOpK3eE7jS+3WwtxfZyXPweAqEA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v5 00/10] Add clock and reset support for Mobileye EyeQ7H
Date: Tue, 17 Mar 2026 14:33:02 +0100
Message-Id: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA5YuWkC/2WRW27CMBREtxL5u0a+fiWOUNV9VP2I7ZtiNSEQh
 6gIsfdegtoG8Tm2z9FofGEZx4SZ1cWFjTinnIY9BfNSsLBr9p/IU6TMpJBGVKLkofvieMZjyVs
 XLDZaRVAVo/eHEdv0vbjePyjvUp6G8byoZ7id3i1OqJVlBi64ao2Q2ptoUb75YZi6tN+EoWc3z
 yz/WJBSr1lJbAWl1hHoNrpnVv2yVgA8sOrGoo++Kb0ApZ5Z/c8q8cBqYl20PrpItTE8stf7GCM
 eT7TndF+E9Zhzs+xZF9tFKqXhfRM8P+zOfC7Jaa3xsbLgooG185Wt/6Muli1AVksf2x26U+bOQ
 rBKtMJpUVN3InyTkRPep6ku5nIj+BiA+l1/AELdzqf3AQAA
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
 Sari Khoury <sari.khoury@mobileye.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13729-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:email,bootlin.com:url]
X-Rspamd-Queue-Id: 9578F2AAEC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

[1]: https://lore.kernel.org/all/20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com/
[2]: https://lore.kernel.org/lkml/20260225-macb-phy-v7-0-665bd8619d51@bootlin.com/

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v5:
- Rebased in v7.0-rc1 + version 4 of eyeq6plus series.
- Remove an superfluous whitespace and tidy up macros in clk-provider.h.
- Link to v4: https://lore.kernel.org/r/20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com

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
prerequisite-change-id: 20251128-eyeq6lplus-961c630f0940:v4
prerequisite-patch-id: 68a9ce9820cf78e8a0705505ea29ff981b518570
prerequisite-patch-id: 40a406305a44a0ea0d0b861d34c199907750f84c
prerequisite-patch-id: dda6d7c3d7d7d8e49b31015887d1a7308f65559a
prerequisite-patch-id: ee24f0dcdb893f3850e9dd0d54e848782a1b9ed7
prerequisite-patch-id: 781c4ae465c2af54c28ef4ad7a3c142da8390cf0
prerequisite-patch-id: 5de50e537525f326cd3478f8cf88df947c66a7ee
prerequisite-patch-id: 78779cc26eb7bde308df40ef016b22f599109dce
prerequisite-patch-id: 07021e7be37e3c14ef2950f2ca176a69b3be3ded
prerequisite-patch-id: 1ee9fc5cf027bc9211c1a5e1547036e33d30fcf7
prerequisite-patch-id: 30f092cffaae6e2adc8f6520af6073b9cd20c59e
prerequisite-patch-id: 90361e8b03b1160a73257cc7d69e32435f319423
prerequisite-patch-id: c7516d424e78d3fb0bb5cc889140b61382a1d1cd
prerequisite-patch-id: 571f8eb779bcad13ac8762519dafc2d0c260d6c7
prerequisite-patch-id: 27c86e0ecfdabca4bca4bdc44e1bc9db8c27634a
prerequisite-patch-id: 40a5ae6831ec4107ae32d74e948636837fa9e076
prerequisite-patch-id: a8952e1ae521fd6f757ebed446f15523791003ac

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


