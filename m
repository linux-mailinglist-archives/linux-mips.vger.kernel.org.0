Return-Path: <linux-mips+bounces-14708-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOWXFC1WEGraWQYAu9opvQ
	(envelope-from <linux-mips+bounces-14708-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:12:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5755B4DDF
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B841630BAB30
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 12:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845583A48E8;
	Fri, 22 May 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kEGX4X+d"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551AB3A1A42;
	Fri, 22 May 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453100; cv=none; b=hqX57Tpv/YQmHq+StB3xhneKAszV4UE4wkNB7pSrQ3TKGS7NvPAt2R6wGEQQpGMdeGr/STcuy5xJo56xbftqU2ed4Acd2eff824IVTkF1PIQoKDJyTD0xG2ZV9WcYvrOBzRMLhCoyagCth2uVn4sA+9zHJib0+TcwI2ogP4zLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453100; c=relaxed/simple;
	bh=ZdyanZvPjMCYLyOa13F62WT/ughxibJfWVnKWzxAX4U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IHTE9XDFr6IKgjqDXfc0Y6yRhD0pZmc6woRE3ja5soqasNHEnwvW5bRXytNfKh/4qLAqjPsgm+l0z2WpYZe5rT8MRUdnKpo92GytypG/wvAri32m0Gwzl2MogsnrknFkO0lDDW3S2a04ViTQOFUrZHj6kvsrv79snfSsujodRTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kEGX4X+d; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D5D1C2C655;
	Fri, 22 May 2026 12:32:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 953346003C;
	Fri, 22 May 2026 12:31:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28CB310811314;
	Fri, 22 May 2026 14:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779453089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=90TuC17oPDZ9l6OZNDbUQZQWto0TVENgMFWVHEcFwkU=;
	b=kEGX4X+dyKsfqiTEZpcsxc3yNBjbV6ylo5h0U3LdVG+73oKOc/dM1N4ww45HUBRk7N6h5F
	vARW09+Floh1+UApGt23Dizt459jpFhkaSi7ILqQuPg8xt9r6w/UpzQeP1U++Aj6WBP/Z5
	MCl/MgNcvE5Bpf3dkDhZ9um+hwUeffW0hgbDj1a0cXAKAfp4Lq8MK3LzapA9Ipsci2YS8Z
	WcorHMZKHQOAUIwXxixHQ95GjDj6GuWoGKC5G5ht6PN1yiCJIws6EPuITlFDPrKUhgsgte
	r4gkFjgyRd7JSpX1IwqnPTPNgICl4g7rNj5upvnvkDsyGU+Xk+tctP7LQKkTAA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v7 0/9] Add clock and reset support for Mobileye EyeQ7H
Date: Fri, 22 May 2026 14:31:09 +0200
Message-Id: <20260522-clk-eyeq7-v7-0-14ad6c2c5213@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI1MEGoC/2XRS27CMBAG4Ksgr2vk8TNh1XtUXfgxKVYhASeNi
 hB374SoJTTLsef7Zc9cWY8lY892mysrOOY+dy0V7mXD4t63H8hzoppJIY2ohOPx8MnxgmfHmzp
 a9FolUBWj/lPBJn/fs97eqd7nfujK5R49wnQ6p9RCLVJG4IKrxgipg0kW5WvouuGQ223sjmzKG
 eWfBSn10kqyFTitE9BtqtdW/VorAJ6smiyGFLwLApRaW/2wSjxZTbZONqQ60bMxrq1ZWFhObTR
 kbWOT9zJKZd3a2oelHy+tJSuMFjEiVE34N6vbvISC5y/a4zBvggXfI6f7Yx52m9FtgZeoqPn2A
 2nuxbD8AQAA
X-Change-ID: 20250807-clk-eyeq7-f9c6ea43d138
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sari Khoury <sari.khoury@mobileye.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14708-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6D5755B4DDF
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

This series is based on v7.1-rc3 as all the prerequisites have been
merged. It also applies cleanly on the clk-next branch.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v7:
- Fixed DDR OLB reset controller type (the comment and sashiko were right)
  and the comment for the reset offsets for west OLB in reset-eyeq.
- Made sure the parent clock is valid before accessing it
  in clk_factor_determine_rate().
- Fixed error paths mistakenly returning IS_ERR(ret) instead of PTR_ERR(ret)
  in clk-eyeq.
- Declared the DDR OLB dividers as read-only.
- Ensured that the mult and div computed in eqc_pll_parse_fracg() fit in 32 bits.
- Link to v6: https://patch.msgid.link/20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com

Changes in v6:
- Rebased on v7.1-rc3.
- Dropped the MAINTAINER update for now, this will go with the SoC series.
- Link to v5: https://lore.kernel.org/r/20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com

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

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Benoît Monin <benoit.monin@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
Benoît Monin (9):
      dt-bindings: soc: mobileye: Add EyeQ7H OLB
      reset: eyeq: Add EyeQ7H compatibles
      clk: fixed-factor: Rework initialization with parent clocks
      clk: fixed-factor: Export __clk_hw_register_fixed_factor()
      clk: eyeq: Prefix the PLL registers with the PLL type
      clk: eyeq: Introduce a generic clock type
      clk: eyeq: Convert clocks declaration to eqc_clock
      clk: eyeq: Drop PLL, dividers, and fixed factors structs
      clk: eyeq: Add EyeQ7H compatibles

 .../bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml |  192 +++
 drivers/clk/clk-eyeq.c                             | 1262 +++++++++++++-------
 drivers/clk/clk-fixed-factor.c                     |   78 +-
 drivers/reset/reset-eyeq.c                         |  268 ++++-
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    |  119 ++
 include/linux/clk-provider.h                       |   56 +-
 6 files changed, 1480 insertions(+), 495 deletions(-)
---
base-commit: bb1459368dd795c43380057523f571d5eb0ddded
change-id: 20250807-clk-eyeq7-f9c6ea43d138

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


