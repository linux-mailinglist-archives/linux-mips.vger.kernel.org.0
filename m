Return-Path: <linux-mips+bounces-9827-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C4B074A8
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CC93A7200
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FCF2F3C1A;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIUzTA3y"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C752F1FF2;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=WF4fG/7QAuWJ7LztVLmEQ2M2JIzvWjzAy/skOufkMqa1ZpjcfkoUqfaJmyaZjeu/jPP8MJvBW9T0KpOCi/yOfD/nRhaBhW6wzzLUmMJnypO2b5cf+zEsMr4bk64v+v5EPUS1YbzLGjPgYZa4uhTLOoqggLeB+G3cJzzHYLOQu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=p3BSUcDo5y0Wn2DQ5Qi8LbjrebDK6eyOiu8A1DTmYoo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cXvacbpUBzwDX8YFwEYRpSDgt7mOER63464W5youB0vtKK1KNj53BE5V/wdr1ZyblxvcHwb0U48vkhqbNT/8X0G1BmCSegW59G7eQe6tFGbC4hcyHd1GDATtX4XS5ncHGOxj0x8cEM0X+QVpHY7tnu0YEkGKYfoPE0KRxPH4HEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIUzTA3y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEE79C4CEF6;
	Wed, 16 Jul 2025 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665138;
	bh=p3BSUcDo5y0Wn2DQ5Qi8LbjrebDK6eyOiu8A1DTmYoo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bIUzTA3yB0fqnHADbrelM61uSuGB1RujDklsx70m5UfsLgpZel2IPTaF0fZwO5JVg
	 GIkCfvYj+SnnveHffbt/o6mVBVdjXnsIBZN+W0uP/1xCIbifDasGCgfzvtiKpE1J/a
	 s1Uyj+flvF3UyJzVJGWkyNXv6Ael5OurlVKrBE903Gb1/57M0kyND3XKXHa5wyZD5w
	 Sv/lH5VMOVBgcrFixO+qKBKgGSjkJCxvbK//2dCxJ5YfI7laiXrlkBfB/d7RECxq1c
	 oDf+pvoB+pF37fOYSygOZ+MyNo+ykANC765xhnYBcpQsJUfcjG2ZOAbO+YxeI9MC2Z
	 tI0rx+mgMyUVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5AFC83F27;
	Wed, 16 Jul 2025 11:25:38 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v3 0/9] MIPS: loongson32: Convert all platform devices to
 DT
Date: Wed, 16 Jul 2025 19:25:09 +0800
Message-Id: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWMd2gC/12Oyw6CMBQFf4V07SVtKY+68j8Mi1ou0AitaZGoh
 H+3YEyMy1mcObOQgN5gIMdkIR5nE4yzEbJDQnSvbIdgmsiEU55TwQQMztkuOMtAed1DjqrS2Ag
 tlSRxdPPYmscuPNeRW+9GmHqP6qvJaMkly0TGqpQVUoiiBAZX7O7xLn1tp6duVGZItRs3ZW/C5
 PxzT5z5Jv7UlFT+18wcKFx02xaYs0pT+WOq13V9A4gnywLvAAAA
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=3912;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=p3BSUcDo5y0Wn2DQ5Qi8LbjrebDK6eyOiu8A1DTmYoo=;
 b=bGgm74usr1scB/TvEdJlAVUw5GvU3MMAKStrhD4cikw0SATfq+esZ2p2h3TpmtWONuK1J046W
 dlyTbPfCw26DLKh/qRfkJhAzEr7GQatC0WfSotQfyVCDDLmZAag6IL+
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Convert all platform devices to Device Tree.
Remove all obsolete platform device code.
Switch to the generic MIPS core.
Add built-in DTB support.
Update Kconfig and Makefile accordingly.
Update and rename the defconfig.

Changes in v3:
- Squash two previous changes that documented DT bindings for the
  LS1B-DEMO and CQ-T300B into a single patch.
- Separate the built-in DTB support into a single patch.
- Move the timer node under the APB bus.
- Remove redundant console bootargs since it is covered by stdout-path.
- Replace mtdparts bootargs with a "partitions" node.
- Link to v2: https://lore.kernel.org/r/20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com

Changes in v2:
- Document two new boards: loongson,ls1b-demo and loongson,cq-t300b.
- Submit complete DTS files for each board.
- Switch to the generic MIPS kernel.
- Consolidate Loongson1 defconfigs.
- Link to v1: https://lore.kernel.org/all/20230729134318.1694467-1-keguang.zhang@gmail.com/

---
Keguang Zhang (9):
      dt-bindings: mips: loongson: Add LS1B-DEMO and CQ-T300B
      MIPS: dts: loongson: Add LS1B-DEMO board
      MIPS: dts: loongson: Add LSGZ_1B_DEV board
      MIPS: dts: loongson: Add Smartloong-1C board
      MIPS: dts: loongson: Add CQ-T300B board
      MIPS: loongson: Add built-in DTB support
      MIPS: loongson32: Switch to generic core
      MIPS: Unify Loongson1 PRID_REV
      MIPS: configs: Consolidate Loongson1 defconfigs

 .../devicetree/bindings/mips/loongson/devices.yaml |   2 +
 MAINTAINERS                                        |   3 +-
 arch/mips/Kconfig                                  |  64 ++---
 arch/mips/boot/dts/Makefile                        |   1 +
 arch/mips/boot/dts/loongson/Makefile               |  10 +
 arch/mips/boot/dts/loongson/cq-t300b.dts           | 110 ++++++++
 arch/mips/boot/dts/loongson/loongson1.dtsi         | 136 ++++++++++
 arch/mips/boot/dts/loongson/loongson1b.dtsi        | 198 ++++++++++++++
 arch/mips/boot/dts/loongson/loongson1c.dtsi        | 141 ++++++++++
 arch/mips/boot/dts/loongson/ls1b-demo.dts          | 125 +++++++++
 arch/mips/boot/dts/loongson/lsgz_1b_dev.dts        | 162 ++++++++++++
 arch/mips/boot/dts/loongson/smartloong-1c.dts      | 110 ++++++++
 .../{loongson1b_defconfig => loongson1_defconfig}  |  94 +++++--
 arch/mips/configs/loongson1c_defconfig             | 121 ---------
 arch/mips/include/asm/cpu-type.h                   |   3 +-
 arch/mips/include/asm/cpu.h                        |   3 +-
 arch/mips/include/asm/mach-loongson32/irq.h        | 107 --------
 arch/mips/include/asm/mach-loongson32/loongson1.h  |  50 ----
 arch/mips/include/asm/mach-loongson32/platform.h   |  23 --
 arch/mips/include/asm/mach-loongson32/regs-mux.h   | 124 ---------
 arch/mips/kernel/cpu-probe.c                       |   6 +-
 arch/mips/loongson32/Kconfig                       |  43 +---
 arch/mips/loongson32/Makefile                      |  17 --
 arch/mips/loongson32/Platform                      |   1 -
 arch/mips/loongson32/common/Makefile               |   6 -
 arch/mips/loongson32/common/irq.c                  | 191 --------------
 arch/mips/loongson32/common/platform.c             | 285 ---------------------
 arch/mips/loongson32/common/prom.c                 |  42 ---
 arch/mips/loongson32/common/setup.c                |  26 --
 arch/mips/loongson32/common/time.c                 |  23 --
 arch/mips/loongson32/ls1b/Makefile                 |   6 -
 arch/mips/loongson32/ls1b/board.c                  |  55 ----
 arch/mips/loongson32/ls1c/Makefile                 |   6 -
 arch/mips/loongson32/ls1c/board.c                  |  23 --
 34 files changed, 1118 insertions(+), 1199 deletions(-)
---
base-commit: b5a1f9870f9828bd6625d6c946c66be4983d56f6
change-id: 20250414-loongson1-arch-5ea8ced4c9a9

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



