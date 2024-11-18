Return-Path: <linux-mips+bounces-6765-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2B9D0B57
	for <lists+linux-mips@lfdr.de>; Mon, 18 Nov 2024 10:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB262822C5
	for <lists+linux-mips@lfdr.de>; Mon, 18 Nov 2024 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A66C149E1A;
	Mon, 18 Nov 2024 09:03:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EDA2907;
	Mon, 18 Nov 2024 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731920600; cv=none; b=HSN4nNjNZZjih0XkfZxT+6Qro7ru0CR58NO6KSGl7sddMKFhSERblWpsh7z0dSLcxhYbLte6zSDmt2rv4hu/53mfSu5QnEEDfYae/mE9MeLF67bbE/BGaJiGskLyEaD+ymPpQZruAxE9YMpKr38Jxm/xMTByX3CKHembtDEzd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731920600; c=relaxed/simple;
	bh=exWOnmLwl232I82JkhJYQ8DE0w1MXTwqbQtBMmKk16M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jf8fwg+T2U0dc7zIrsywHeSH8bvE+zq+7v9rADGG5ACGpddVLK1JiND613BgQum+6LL1WQhcfS9IXqHwQ+or0AcqlzLcCCQ4ChsWBLe/EsTP7NB7HuOe0j4yTUWe/IhGAifBsC8gKd5iPC15ITiK3nTZ5KpmGdK1PwN4B+qhJus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tCxez-0007lT-00; Mon, 18 Nov 2024 10:03:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AEAF9C0110; Mon, 18 Nov 2024 10:02:56 +0100 (CET)
Date: Mon, 18 Nov 2024 10:02:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.13
Message-ID: <ZzsCwEfGZ0m6dNVS@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.13

for you to fetch changes up to 56131e6d1fcce8e7359a2445711cc1a4ddb8325c:

  mips: dts: realtek: Add I2C controllers (2024-11-12 15:51:21 +0100)

----------------------------------------------------------------
just cleanups and fixes

----------------------------------------------------------------
Chris Packham (2):
      mips: dts: realtek: Add syscon-reboot node
      mips: dts: realtek: Add I2C controllers

Christian Marangi (1):
      mips: bmips: bcm6358/6368: define required brcm,bmips-cbr-reg

Gregory CLEMENT (2):
      MIPS: Allow using more than 32-bit addresses for reset vectors when possible
      MIPS: mobileye: eyeq6h-epm6: Use eyeq6h in the board device tree

Jonas Gorski (1):
      mips: asm: fix warning when disabling MIPS_FP_SUPPORT

Maciej W. Rozycki (2):
      MAINTAINERS: Retire Ralf Baechle
      MAINTAINERS: Remove linux-mips.org references

Paulo Miguel Almeida (1):
      mips: sgi-ip22: Replace "s[n]?printf" with sysfs_emit in sysfs callbacks

Thorsten Blum (1):
      MIPS: kernel: proc: Use str_yes_no() helper function

WangYuli (2):
      MIPS: loongson3_defconfig: Update configs dependencies
      MIPS: loongson3_defconfig: Enable blk_dev_nvme by default

zhang jiao (1):
      TC: Fix the wrong format specifier

 .get_maintainer.ignore                             |  1 +
 CREDITS                                            |  5 +++
 MAINTAINERS                                        | 17 +++-----
 arch/mips/boot/dts/brcm/bcm6358.dtsi               |  1 +
 arch/mips/boot/dts/brcm/bcm6368.dtsi               |  1 +
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts        |  2 +-
 .../dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts |  2 +-
 arch/mips/boot/dts/realtek/rtl9302c.dtsi           | 15 +++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi            | 29 ++++++++++++++
 arch/mips/configs/loongson3_defconfig              | 32 +++++----------
 arch/mips/include/asm/mips-cm.h                    |  2 +
 arch/mips/include/asm/switch_to.h                  |  2 +-
 arch/mips/kernel/proc.c                            | 17 ++++----
 arch/mips/kernel/smp-cps.c                         | 46 ++++++++++++++++++----
 arch/mips/sgi-ip22/ip22-gio.c                      |  7 ++--
 drivers/tc/tc.c                                    |  2 +-
 16 files changed, 123 insertions(+), 58 deletions(-)
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dtsi

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

