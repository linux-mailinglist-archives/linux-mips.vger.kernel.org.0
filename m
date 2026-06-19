Return-Path: <linux-mips+bounces-15150-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lHLrCWEnNWq8ngYAu9opvQ
	(envelope-from <linux-mips+bounces-15150-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 13:26:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1C6A56AD
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 13:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15150-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15150-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2870B3006175
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 11:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD7937C0EB;
	Fri, 19 Jun 2026 11:26:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CC9349CDC;
	Fri, 19 Jun 2026 11:26:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781868380; cv=none; b=Jr3pJzBLNlLSo0Ln0tMLFxo1RJ8CtFnU+4dw+E9SNvEz41Rh8jzcCcaFLxqF0Ft/M937VpP9QgXlS2gdLYZSAoCMUQbiTd515V8KxoPWCth2brBhLthq/ERI93ib71hzoE1pU2EoetGCtnsebtfqbcTl+gEi9qnxd7ae/7QGsgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781868380; c=relaxed/simple;
	bh=caqXjvKHn/XY8xLmXZ7nv3e1jf47C5//B2yUQunhHeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eqh8rQqVOTM4KQs6UA6Ei7AEZNHEiht1krFCA9F77qaWycA3X/xRp0trdHI7dlTjmx9UHnLPDrHqvvlAAIfhRnPyA9e1qrCCAghc94cSslYE+3hOe9r4xdiiNpwwpJ/cs8IOVT2w1WEz3J0KwvDWWhod9fnFkrxtcJwWKxp+eEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1waXMO-0003g1-00; Fri, 19 Jun 2026 13:26:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4E701C00E8; Fri, 19 Jun 2026 13:25:58 +0200 (CEST)
Date: Fri, 19 Jun 2026 13:25:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v7.2
Message-ID: <ajUnRiURsctnJ7R9@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15150-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACA1C6A56AD

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.2

for you to fetch changes up to 6f25741b7565d7f82fc09947c981cae17535894d:

  mips: select legacy gpiolib interfaces where used (2026-06-15 12:32:43 +0200)

----------------------------------------------------------------
- use software nodes for GPIO code
- cleanups and fixes

----------------------------------------------------------------
Aaron Tomlin (1):
      mips: sched: Fix CPUMASK_OFFSTACK memory corruption

Arnd Bergmann (1):
      mips: select legacy gpiolib interfaces where used

Bartosz Golaszewski (4):
      MIPS: RB532: attach the software node to its target GPIO controller
      MIPS: RB532: serial: statify setup_serial_port()
      MIPS: alchemy: platform: add missing include
      MIPS: alchemy: provide visible function prototypes to board files

Catalin Iacob (1):
      mips: Remove remaining defconfig references to the pktcdvd driver

Costa Shulyupin (2):
      include: Remove unused jz4740-adc.h
      include: Remove unused jz4740-battery.h

Dmitry Torokhov (4):
      MIPS: alchemy: mtx1: attach software nodes to GPIO chips
      MIPS: alchemy: db1000: use nodes attached to GPIO chips in properties
      MIPS: alchemy: gpr: switch to static device properties
      MIPS: alchemy: db1300: switch to static device properties

Ethan Nelson-Moore (1):
      MIPS: mm: remove comment referring to removed CONFIG_MIPS_CMP

Icenowy Zheng (2):
      MIPS: Loongson64: dts: Sort nodes
      MIPS: Loongson64: dts: Add node for LS7A PCH LPC

Johan Hovold (5):
      MIPS: ip22-gio: fix kfree() of static object
      MIPS: ip22-gio: fix gio device memory leak
      MIPS: ip22-gio: fix device reference leak in probe
      MIPS: ip22-gio: switch to dynamic root device
      MIPS: ip22-gio: do not export device release function

Jonas Jelonek (1):
      MIPS: smp: report dying CPU to RCU in stop_this_cpu()

Maciej W. Rozycki (7):
      MIPS: Fix big-endian stack argument fetching in o32 wrapper
      MIPS: Make do_IRQ() available for assembly callers
      MIPS: DEC: Remove do_IRQ() call indirection
      MIPS: DEC: Fix prototypes for halt/reset handlers
      MIPS: DEC: Remove IRQF_ONESHOT reference for IOASIC DMA error IRQs
      MIPS: DEC: Ensure 32-bit stack location for o32 prom_printf()
      MIPS: DEC: Prevent initial console buffer from landing in XKPHYS

Markus Elfring (2):
      MIPS: kernel: proc: Use seq_putc() calls in show_cpuinfo()
      MIPS: kernel: proc: Delete unnecessary braces in show_cpuinfo()

Nathan Chancellor (2):
      MIPS: VDSO: Avoid including .got in dynamic segment
      MIPS: lib: Remove '.hidden' for local symbols

Qingfang Deng (1):
      MIPS: ralink: reduce ARCH_DMA_MINALIGN

Rosen Penev (5):
      mips: cps: Assemble jr.hb with an R2 ISA level
      mips: ralink: mt7621: add missing __iomem
      mips: n64: add __iomem for writel call
      mips: dts: ar9132: fix wdt node name
      MIPS: ath79: reduce ARCH_DMA_MINALIGN

Sasha Levin (1):
      MIPS: mobileye: Remove duplicate FIT_IMAGE_FDT_EPM5 from main Kconfig

Yadan Fan (1):
      MIPS: mm: Fix out-of-bounds write in maar_res_walk()

 arch/mips/Kconfig                               |  14 +-
 arch/mips/alchemy/Kconfig                       |   1 -
 arch/mips/alchemy/board-gpr.c                   | 127 ++++++++------
 arch/mips/alchemy/board-mtx1.c                  |  34 ++--
 arch/mips/alchemy/common/gpiolib.c              |  45 ++++-
 arch/mips/alchemy/devboards/db1000.c            |  31 ++--
 arch/mips/alchemy/devboards/db1200.c            |   1 +
 arch/mips/alchemy/devboards/db1300.c            | 219 ++++++++++++++++--------
 arch/mips/alchemy/devboards/db1550.c            |   2 +
 arch/mips/alchemy/devboards/db1xxx.c            |  11 +-
 arch/mips/alchemy/devboards/db1xxx.h            |  18 ++
 arch/mips/alchemy/devboards/platform.c          |   2 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi       |  17 +-
 arch/mips/boot/dts/qca/ar9132.dtsi              |   2 +-
 arch/mips/configs/fuloong2e_defconfig           |   1 -
 arch/mips/configs/ip22_defconfig                |   1 -
 arch/mips/configs/ip27_defconfig                |   1 -
 arch/mips/configs/ip30_defconfig                |   1 -
 arch/mips/configs/jazz_defconfig                |   1 -
 arch/mips/configs/malta_defconfig               |   1 -
 arch/mips/configs/malta_kvm_defconfig           |   1 -
 arch/mips/configs/maltaup_xpa_defconfig         |   1 -
 arch/mips/configs/rm200_defconfig               |   1 -
 arch/mips/configs/sb1250_swarm_defconfig        |   1 -
 arch/mips/dec/int-handler.S                     |   2 +-
 arch/mips/dec/ioasic-irq.c                      |   5 +-
 arch/mips/dec/prom/console.c                    |   7 +-
 arch/mips/dec/prom/init.c                       |   6 +-
 arch/mips/dec/reset.c                           |   2 +
 arch/mips/dec/setup.c                           |  12 +-
 arch/mips/fw/lib/call_o32.S                     |   2 +-
 arch/mips/include/asm/dec/prom.h                |  15 +-
 arch/mips/include/asm/dec/reset.h               |  19 ++
 arch/mips/include/asm/gio_device.h              |   6 -
 arch/mips/include/asm/irq.h                     |   2 +-
 arch/mips/include/asm/mach-ath79/kmalloc.h      |   7 +
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |   5 +
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 arch/mips/include/asm/mach-ralink/kmalloc.h     |   9 +
 arch/mips/kernel/cps-vec.S                      |   6 +
 arch/mips/kernel/irq.c                          |   2 +-
 arch/mips/kernel/mips-mt-fpaff.c                |  28 +--
 arch/mips/kernel/proc.c                         |   9 +-
 arch/mips/kernel/smp.c                          |   2 +
 arch/mips/lib/memcpy.S                          |   2 -
 arch/mips/lib/memset.S                          |   2 -
 arch/mips/mm/c-r4k.c                            |   5 -
 arch/mips/mm/init.c                             |  12 +-
 arch/mips/n64/init.c                            |   2 +-
 arch/mips/ralink/mt7621.c                       |   2 +-
 arch/mips/rb532/devices.c                       |  32 +++-
 arch/mips/rb532/gpio.c                          |  41 ++---
 arch/mips/rb532/serial.c                        |   2 +-
 arch/mips/sgi-ip22/ip22-gio.c                   |  34 ++--
 arch/mips/txx9/Kconfig                          |   1 +
 arch/mips/vdso/vdso.lds.S                       |   1 +
 include/linux/jz4740-adc.h                      |  33 ----
 include/linux/power/jz4740-battery.h            |  15 --
 58 files changed, 505 insertions(+), 362 deletions(-)
 create mode 100644 arch/mips/alchemy/devboards/db1xxx.h
 create mode 100644 arch/mips/include/asm/dec/reset.h
 create mode 100644 arch/mips/include/asm/mach-ath79/kmalloc.h
 create mode 100644 arch/mips/include/asm/mach-ralink/kmalloc.h
 delete mode 100644 include/linux/jz4740-adc.h
 delete mode 100644 include/linux/power/jz4740-battery.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

