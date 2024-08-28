Return-Path: <linux-mips+bounces-5155-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473E962A1A
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 16:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2BCF1F250B6
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33EB1891DA;
	Wed, 28 Aug 2024 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lug9jQPk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238E2D600;
	Wed, 28 Aug 2024 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855161; cv=none; b=jUu69SdN7Zqx6EqHBTwVAOZ9vgle1J3z0pqFJOJOKnnCwdQMyNMQpP0Rgx+FCgTHhtZ7BrJIv/KrUBhmny6yT6WTYuN1JRMJkWJwYxawusJmA3IyforWE4SSYzyYNtnCoU1FImnJmMWY5F4v0dR/vJCFp1yTkgzWXWn0ElybFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855161; c=relaxed/simple;
	bh=ZqkdXmD9LrrwdNrSv7uvMPe7m3i56mY5PSRJljTNWbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXVoUg+IT9J1uh3B3OIgezJ7EcqbcwQkEAwXAHQUunKYymqHd6NpTakok+twYSWR6Ulhs549gCAKO3Bbnb0b8aL66+9gemWGWPF6UQoJtPkiCNhidJHzG4kp3ZbboUfKdKr4wU2+Qav4GEtTrx5s4+H3M2IEEcFjVPeaJpEvRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lug9jQPk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724855160; x=1756391160;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZqkdXmD9LrrwdNrSv7uvMPe7m3i56mY5PSRJljTNWbo=;
  b=Lug9jQPk8E4YseI35yUUKU/X0n9GGPj5Hu5Vv7gizz6BLe4JX9HxqgVV
   6BtXGwR/vjWT8/bgmRUgGsxJcvDRob/zLSkw51TD37iJW98abiUM6pxKH
   ouQre8GuYWQ3EiB3DjqzbQFXv5Hx5T5gltFZLrNp/Ysi+NOPvKiXiDbKy
   uwpL54hJ+NFA+KRtobCTC2RipGx1w2/4wLeUgcRJlxwRr+L5N1kDKHxr3
   zQ9w4x46/XXOCd8LIcr9vWh6tToKY73xgMZBplTd535UF62szO+i0QRxj
   6x2VLs3mRE+Gi9eHJhAIyf4DaJtA1vzdEM0v4oxb2aiYQ/R3fOahpmuXG
   g==;
X-CSE-ConnectionGUID: US32oX1yTnOKlB7BvY4FIw==
X-CSE-MsgGUID: xm/pHoXfRjm1pflVVu+YjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23575169"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23575169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 07:25:59 -0700
X-CSE-ConnectionGUID: QF9kZHv1TYaqjmOYb3u2wA==
X-CSE-MsgGUID: DOIZP0CSSvCgVsefw9pDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="94047451"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2024 07:25:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F18F3143; Wed, 28 Aug 2024 17:25:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 0/2] gpiolib:legacy: Kill GPIOF_DIR_* and GPIOF_INIT_*
Date: Wed, 28 Aug 2024 17:23:56 +0300
Message-ID: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shrink the legacy API and definition surface by killing the (internal)
definitions. This, in particular, will fix a couple of drivers that took
it wrong.

This is assumed to go via BPIOLIB tree as this is quite small series and
most of the changes related to it.

Andy Shevchenko (2):
  gpiolib: legacy: Kill GPIOF_INIT_* definitions
  gpiolib: legacy: Kill GPIOF_DIR_* definitions

 arch/arm/mach-ep93xx/vision_ep9307.c      |  6 ++----
 arch/mips/bcm63xx/boards/board_bcm963xx.c |  2 +-
 drivers/gpio/gpiolib-legacy.c             |  5 ++---
 include/linux/gpio.h                      | 12 +++---------
 4 files changed, 8 insertions(+), 17 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


