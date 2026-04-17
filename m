Return-Path: <linux-mips+bounces-14188-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLY7KGc14mm13QAAu9opvQ
	(envelope-from <linux-mips+bounces-14188-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 15:28:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3785141BA25
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 15:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 966C5302978B
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90029399002;
	Fri, 17 Apr 2026 13:27:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425B03822B1;
	Fri, 17 Apr 2026 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432455; cv=none; b=pA8/Hz82v3MVBEUDq5F1dUK5Jv4kieLoRfINUCS6qoh3L1FPOx5OgWk12pwsQz1ce06z1x5rf+gbph+fijr9l+Z1dYyxMowAMi4TQwAM6P2I6pB2UzZz3NcTT2VWGXja6BXn6DAkabDZ5RaZQ/BYu2PgP3zw7LPgMLVa9IHA4Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432455; c=relaxed/simple;
	bh=H89iYPMhoKqOLzrga9w7Dg8HsAwnzpiP1sV5NPM1YYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/ZpsH2+cxgMXJHBTcNul4zQdTUUAW3FcjA97zcINoMapE02UA4dIxB1I7v++0aMmK8EV+NK6ZaIchYa3K/pRrqAXX5BZzQSGKUauGyz7+JfnQECkX3FZy1kJkx+jPMzybkCdc7IGDzw5IXyNFlJFe8ZcYOsSN4rX1AGrNfzLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wDjEB-000294-00; Fri, 17 Apr 2026 15:27:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4A9FFC0256; Fri, 17 Apr 2026 15:27:15 +0200 (CEST)
Date: Fri, 17 Apr 2026 15:27:15 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v7.1
Message-ID: <aeI1M497YKp8Ii_S@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14188-lists,linux-mips=lfdr.de];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 3785141BA25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:

  Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.1

for you to fetch changes up to 15513eefac7ca68602e9de9853f5e671bf7b4eef:

  MIPS/mtd: Handle READY GPIO in generic NAND platform data (2026-04-13 15:41:56 +0200)

----------------------------------------------------------------
Support for Mobileye EyeQ6Lplus
Cleanups and fixes

----------------------------------------------------------------
Andy Shevchenko (1):
      MIPS: Alchemy: Remove unused forward declaration

Benoît Monin (13):
      dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
      dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
      MIPS: Add Mobileye EyeQ6Lplus support
      reset: eyeq: Add Mobileye EyeQ6Lplus OLB
      pinctrl: eyeq5: Use match data
      pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
      clk: eyeq: Skip post-divisor when computing PLL frequency
      clk: eyeq: Adjust PLL accuracy computation
      clk: eyeq: Add Mobileye EyeQ6Lplus OLB
      MIPS: Add Mobileye EyeQ6Lplus SoC dtsi
      MIPS: Add Mobileye EyeQ6Lplus evaluation board dts
      MIPS: config: add eyeq6lplus_defconfig
      MAINTAINERS: Mobileye: Add EyeQ6Lplus files

Caleb James DeLisle (1):
      mips: dts: Add PCIe to EcoNet EN751221

Linus Walleij (2):
      MIPS/input: Move RB532 button to GPIO descriptors
      MIPS/mtd: Handle READY GPIO in generic NAND platform data

Maciej W. Rozycki (4):
      MIPS: kernel: Remove $0 clobber from `mult_sh_align_mod'
      MIPS: DEC: Rate-limit memory errors for ECC systems
      MIPS: DEC: Rate-limit memory errors for KN01 systems
      MIPS: DEC: Rate-limit memory errors for non-KN01 parity systems

Pengpeng Hou (1):
      MIPS: validate DT bootargs before appending them

Rong Zhang (1):
      MIPS: dts: loongson64g-package: Switch to Loongson UART driver

Shiji Yang (3):
      mips: pci-mt7620: fix bridge register access
      mips: pci-mt7620: add more register init values
      mips: pci-mt7620: rework initialization procedure

Thomas Zimmermann (1):
      arch/mips: Drop CONFIG_FIRMWARE_EDID from defconfig files

Théo Lebrun (3):
      dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
      MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
      MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

 .../devicetree/bindings/mips/mobileye.yaml         |   5 +
 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  |   7 +-
 .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 ++++++++++
 MAINTAINERS                                        |   4 +-
 arch/mips/boot/dts/econet/en751221.dtsi            | 114 ++++++
 .../dts/econet/en751221_smartfiber_xp8421-b.dts    |  21 +
 .../boot/dts/loongson/loongson64g-package.dtsi     |   4 +-
 arch/mips/boot/dts/mobileye/Makefile               |   1 +
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |  26 ++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  45 +++
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts    | 103 +++++
 arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi   |  84 ++++
 arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi        | 170 ++++++++
 arch/mips/configs/eyeq6lplus_defconfig             | 117 ++++++
 arch/mips/configs/ip32_defconfig                   |   1 -
 arch/mips/configs/lemote2f_defconfig               |   1 -
 arch/mips/configs/malta_qemu_32r6_defconfig        |   1 -
 arch/mips/configs/maltaaprp_defconfig              |   1 -
 arch/mips/configs/maltasmvp_defconfig              |   1 -
 arch/mips/configs/maltasmvp_eva_defconfig          |   1 -
 arch/mips/configs/maltaup_defconfig                |   1 -
 arch/mips/dec/ecc-berr.c                           |  16 +-
 arch/mips/dec/kn01-berr.c                          |   6 +-
 arch/mips/dec/kn02xa-berr.c                        |  26 +-
 arch/mips/econet/Kconfig                           |   2 +
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h    |   2 -
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h    |   1 -
 arch/mips/kernel/r4k-bugs64.c                      |   2 +-
 arch/mips/kernel/setup.c                           |   4 +
 arch/mips/mobileye/Kconfig                         |   3 +
 arch/mips/mobileye/Platform                        |   1 +
 arch/mips/pci/pci-mt7620.c                         | 110 ++++--
 arch/mips/rb532/devices.c                          |  83 ++--
 drivers/clk/Kconfig                                |   4 +-
 drivers/clk/clk-eyeq.c                             |  90 ++++-
 drivers/input/misc/rb532_button.c                  |  35 +-
 drivers/mtd/nand/raw/plat_nand.c                   |  24 +-
 drivers/pinctrl/Kconfig                            |   4 +-
 drivers/pinctrl/pinctrl-eyeq5.c                    | 439 +++++++++++++++------
 drivers/reset/Kconfig                              |   4 +-
 drivers/reset/reset-eyeq.c                         |  31 ++
 .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++
 42 files changed, 1591 insertions(+), 249 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi
 create mode 100644 arch/mips/configs/eyeq6lplus_defconfig
 create mode 100644 include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

