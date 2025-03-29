Return-Path: <linux-mips+bounces-8401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28333A755AB
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 11:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6653AE552
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B10F73477;
	Sat, 29 Mar 2025 10:06:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0F1208D0;
	Sat, 29 Mar 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743242787; cv=none; b=UcGokAuLmcGjJluQiAUKJfUJUkXfuUmU+7/B6n8yu/ajeqaM2SsYihkvJeVI1qyNVj6lnHbQ1XDc/acUFjDKNi7ZmOjok+7p8tSId/81xtdlrX4Sa70WOa4lOn6wxyZ7pASUPShm0Dmz9I3GvVV9wI0BDIRJT+vknlVFSghMdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743242787; c=relaxed/simple;
	bh=pC4yT71Ib0ckoDWBir7IsgDkdHvt1zvX0i+HOKnOltk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oD8SR0FhhOSmua7bKRVpgVta6UGXMO9whU6S610y7F8L6hcTLqlPgEDCTkAv6zAmObFKD+JD92/oBqxbSAuGBgafiJSLbbvta4Wlc3IVvJTUDNoanleWZWfKcduyaDoW3tVm4621fWjpmb+nie+9jSW1l+lz4kLQBkWwjXDfqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tyT54-0005YC-00; Sat, 29 Mar 2025 11:06:22 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 77697C00F0; Sat, 29 Mar 2025 11:06:16 +0100 (CET)
Date: Sat, 29 Mar 2025 11:06:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.15
Message-ID: <Z-fGGOyv_5IafH71@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.15

for you to fetch changes up to 855912be0b046028abc9c0577787e749a8d26cf5:

  MIPS: config: omega2+, vocore2: enable CLK_MTMIPS (2025-03-25 21:35:54 +0100)

----------------------------------------------------------------
Added support for multi-cluster configuration
Added quirks for enabling multi-cluster mode on EyeQ6
Added DTS clocks for ralink
Cleanup realtek DTS
Other cleanups and fixes

----------------------------------------------------------------
Abhishek Tamboli (1):
      MIPS: Fix Macro name

Bibo Mao (1):
      MIPS: Use arch specific syscall name match function

Geert Uytterhoeven (1):
      mips: dts: ingenic: Switch to simple-audio-card,hp-det-gpios

Gregory CLEMENT (5):
      dt-bindings: mips: Document mti,mips-cm
      dt-bindings: mips: mips-cm: Add a new compatible string for EyeQ6
      MIPS: cm: Detect CM quirks from device tree
      MIPS: CPS: Support broken HCI for multicluster
      MIPS: mobileye: dts: eyeq6h: Enable cluster support

Johan Korsnes (1):
      arch: mips: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX

Joris Vaisvila (1):
      MIPS: config: omega2+, vocore2: enable CLK_MTMIPS

Paul Burton (4):
      clocksource: mips-gic-timer: Enable counter when CPUs start
      MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
      MIPS: CPS: Introduce struct cluster_boot_config
      MIPS: CPS: Boot CPUs in secondary clusters

Sander Vanheule (9):
      mips: dts: realtek: Decouple RTL930x base DTSI
      mips: dts: realtek: Clean up CPU clocks
      mips: dts: realtek: Add address to SoC node name
      mips: dts: realtek: Fold rtl83xx into rtl838x
      mips: dts: realtek: Add SoC IRQ node for RTL838x
      mips: dts: realtek: Correct uart interrupt-parent
      mips: dts: realtek: Replace uart clock property
      mips: dts: realtek: Add RTL838x SoC peripherals
      mips: dts: realtek: Add restart to Cisco SG220-26P

Sergio Paracuellos (6):
      dt-bindings: clock: add clock definitions for Ralink SoCs
      mips: dts: ralink: rt2880: update system controller node and its consumers
      mips: dts: ralink: rt3050: update system controller node and its consumers
      mips: dts: ralink: rt3883: update system controller node and its consumers
      mips: dts: ralink: mt7620a: update system controller node and its consumers
      mips: dts: ralink: mt7628a: update system controller node and its consumers

Thomas Bogendoerfer (1):
      MIPS: cm: Fix warning if MIPS_CM is disabled

Thomas Zimmermann (1):
      mips: sni: Do not include <linux/fb.h>

Thorsten Blum (1):
      MIPS: Loongson2ef: Replace deprecated strncpy() with strscpy()

WangYuli (3):
      MIPS: dec: Declare which_prom() as static
      MIPS: cevt-ds1287: Add missing ds1287.h include
      MIPS: ds1287: Match ds1287_set_base_clock() function types

 .../bindings/clock/mediatek,mtmips-sysc.yaml       |  11 +-
 .../devicetree/bindings/mips/mti,mips-cm.yaml      |  57 ++++
 arch/mips/boot/dts/ingenic/gcw0.dts                |   2 +-
 arch/mips/boot/dts/ingenic/rs90.dts                |   2 +-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |   4 +
 .../dts/ralink/gardena_smart_gateway_mt7688.dts    |   2 +-
 arch/mips/boot/dts/ralink/mt7620a.dtsi             |  10 +-
 arch/mips/boot/dts/ralink/mt7620a_eval.dts         |   2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi             |  40 +--
 arch/mips/boot/dts/ralink/omega2p.dts              |   2 +-
 arch/mips/boot/dts/ralink/rt2880.dtsi              |  10 +-
 arch/mips/boot/dts/ralink/rt2880_eval.dts          |   2 +-
 arch/mips/boot/dts/ralink/rt3050.dtsi              |  10 +-
 arch/mips/boot/dts/ralink/rt3883.dtsi              |  10 +-
 arch/mips/boot/dts/ralink/rt3883_eval.dts          |   2 +-
 arch/mips/boot/dts/realtek/cisco_sg220-26.dts      |  10 +-
 arch/mips/boot/dts/realtek/rtl838x.dtsi            | 111 +++++++-
 arch/mips/boot/dts/realtek/rtl83xx.dtsi            |  59 -----
 arch/mips/boot/dts/realtek/rtl930x.dtsi            | 136 ++++++----
 arch/mips/configs/gpr_defconfig                    |   1 -
 arch/mips/configs/ip22_defconfig                   |   1 -
 arch/mips/configs/ip27_defconfig                   |   1 -
 arch/mips/configs/malta_defconfig                  |   1 -
 arch/mips/configs/malta_kvm_defconfig              |   1 -
 arch/mips/configs/malta_qemu_32r6_defconfig        |   1 -
 arch/mips/configs/maltaaprp_defconfig              |   1 -
 arch/mips/configs/maltasmvp_defconfig              |   1 -
 arch/mips/configs/maltasmvp_eva_defconfig          |   1 -
 arch/mips/configs/maltaup_defconfig                |   1 -
 arch/mips/configs/maltaup_xpa_defconfig            |   1 -
 arch/mips/configs/mtx1_defconfig                   |   1 -
 arch/mips/configs/omega2p_defconfig                |   1 +
 arch/mips/configs/rb532_defconfig                  |   1 -
 arch/mips/configs/rm200_defconfig                  |   1 -
 arch/mips/configs/vocore2_defconfig                |   1 +
 arch/mips/dec/prom/init.c                          |   2 +-
 arch/mips/include/asm/ds1287.h                     |   2 +-
 arch/mips/include/asm/ftrace.h                     |  16 ++
 arch/mips/include/asm/mach-rc32434/pci.h           |   2 +-
 arch/mips/include/asm/mips-cm.h                    |  40 +++
 arch/mips/include/asm/smp-cps.h                    |   7 +-
 arch/mips/kernel/asm-offsets.c                     |   3 +
 arch/mips/kernel/cevt-ds1287.c                     |   1 +
 arch/mips/kernel/cps-vec.S                         |  19 +-
 arch/mips/kernel/mips-cm.c                         |  18 +-
 arch/mips/kernel/pm-cps.c                          |  35 ++-
 arch/mips/kernel/smp-cps.c                         | 288 +++++++++++++++++----
 arch/mips/loongson2ef/common/machtype.c            |   3 +-
 arch/mips/sni/setup.c                              |   1 -
 drivers/clocksource/mips-gic-timer.c               |   6 +-
 include/dt-bindings/clock/mediatek,mtmips-sysc.h   | 130 ++++++++++
 51 files changed, 836 insertions(+), 235 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
 delete mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi
 create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

