Return-Path: <linux-mips+bounces-3299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96188C9AF1
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D797B2084B
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 10:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655A742044;
	Mon, 20 May 2024 10:05:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C301EA67;
	Mon, 20 May 2024 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716199500; cv=none; b=t6aejTJlYKMlw1NIwuq5p9w/dBYPAnQC/MQ3PF/aSuIrXahL5xjuBGPY7EeazLsaq7JtHD3wnDxyhhAj/rqBQ9a4xA4JnOXg3vtpy/fiMhY8/1qjPXakgb+o5RY7BnylfxzJAOXOqQe5lZ8vFyc+8yc765bUJxUGpQk0VyzJh0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716199500; c=relaxed/simple;
	bh=Lh/a5CQnHWFVHPLTcboaMYD8avCNkkGAiOMBkLALvxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ib52Dg2BbYgxYyYtMHQ/4oPxL6KarO3CNz24sFtOWiXG1ny0IxgCbllal6v1GLxTA8VskJVtlRPvN2gKel08tmATLHKJld8m45UyG1nxtdYVpXntAHFWF3lQP2tdRK0Xe1EM1nobjxTB0ublUBpz9aKowIA9RW/DjXjW9PBdNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1s8zD8-0007O9-00; Mon, 20 May 2024 11:21:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 21EF2C0120; Mon, 20 May 2024 11:21:29 +0200 (CEST)
Date: Mon, 20 May 2024 11:21:29 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.10
Message-ID: <ZksWGd0Kr7D19kp/@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0bbac3facb5d6cc0171c45c9873a2dc96bea9680:

  Linux 6.9-rc4 (2024-04-14 13:38:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.10

for you to fetch changes up to 07e6a6d7f1d9fa4685003a195032698ba99577bb:

  MIPS: Take in account load hazards for HI/LO restoring (2024-05-03 14:22:38 +0200)

----------------------------------------------------------------
just cleanups and fixes

----------------------------------------------------------------
Jiaxun Yang (1):
      MIPS: Guard some macros with __ASSEMBLY__ in asm.h

Justin Swartz (14):
      mips: dts: ralink: mt7621: reorder cpu node attributes
      mips: dts: ralink: mt7621: reorder cpuintc node attributes
      mips: dts: ralink: mt7621: reorder mmc regulator attributes
      mips: dts: ralink: mt7621: reorder sysc node attributes
      mips: dts: ralink: mt7621: reorder gpio node attributes
      mips: dts: ralink: mt7621: reorder i2c node attributes
      mips: dts: ralink: mt7621: reorder spi0 node attributes
      mips: dts: ralink: mt7621: move pinctrl and sort its children
      mips: dts: ralink: mt7621: reorder mmc node attributes
      mips: dts: ralink: mt7621: reorder gic node attributes
      mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
      mips: dts: ralink: mt7621: reorder pcie node attributes and children
      mips: dts: ralink: mt7621: reorder pci?_phy attributes
      mips: dts: ralink: mt7621: reorder the attributes of the root node

Nathan Chancellor (1):
      MIPS: Add prototypes for plat_post_relocation() and relocate_kernel()

Siarhei Volkau (1):
      MIPS: Take in account load hazards for HI/LO restoring

Songyang Li (1):
      MIPS: Octeon: Add PCIe link status check

Yongzhen Zhang (3):
      MIPS: BCM47XX: include header for bcm47xx_prom_highmem_init() prototype
      MIPS: BCM47XX: Declare early_tlb_init() static
      MIPS: RB532: Declare prom_setup_cmdline() and rb532_gpio_init() static

Yury Norov (3):
      MIPS: SGI-IP27: micro-optimize arch_init_irq()
      MIPS: SGI-IP27: fix -Wunused-variable in arch_init_irq()
      MIPS: SGI-IP27: use WARN_ON() output

 arch/mips/bcm47xx/prom.c              |   3 +-
 arch/mips/boot/dts/ralink/mt7621.dtsi | 430 +++++++++++++++++++---------------
 arch/mips/include/asm/asm.h           |   3 +
 arch/mips/include/asm/setup.h         |   6 +
 arch/mips/include/asm/stackframe.h    |  19 +-
 arch/mips/pci/pcie-octeon.c           |   6 +
 arch/mips/rb532/gpio.c                |   2 +-
 arch/mips/rb532/prom.c                |   2 +-
 arch/mips/sgi-ip27/ip27-irq.c         |  15 +-
 9 files changed, 274 insertions(+), 212 deletions(-)
 mode change 100644 => 100755 arch/mips/pci/pcie-octeon.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

