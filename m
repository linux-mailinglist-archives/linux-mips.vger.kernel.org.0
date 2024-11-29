Return-Path: <linux-mips+bounces-6809-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53EE9DC08F
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2024 09:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4891F282271
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2024 08:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4765157466;
	Fri, 29 Nov 2024 08:34:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE5114B088;
	Fri, 29 Nov 2024 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732869259; cv=none; b=ln58Xkt/M8lp3H9I3M/4KAqYx4cV790WR/VSQAMUO3AR1ZdAFT3RBYWEAIpoTQvcgIlBotrNS7RQJhRT9Lis0nREgp6ZuxeJ3c77AiC1gguBuW2Cxn0eKHAi5TrxZYbKcTO5Nvrbkj376wPeXm7q1tVwoW0H0QCvNPGh4wu6s74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732869259; c=relaxed/simple;
	bh=38dtpdyIihzYzYRxzGxmz1vffoO5wi/Tb2Fz2EpWzY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=li0nHry6le8nCMA61d7QW+/2cfAd+yJsbdNdXD7sbTXgoSPRtIT3CTlvpMkZqr9oELwY+7L/o+sOVc6hrQRv2l5SgvUgjITTtDSMSsMHh8Lub1FhwFFMv7yQvTXAUnXEKoUETeTVdiqyjv2h9AmLFr9hvGjIw9Mb7O3lqR+VkIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tGwRy-0003cP-00; Fri, 29 Nov 2024 09:34:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 60DE5C0110; Fri, 29 Nov 2024 09:33:58 +0100 (CET)
Date: Fri, 29 Nov 2024 09:33:58 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes pt2 for v6.13
Message-ID: <Z0l8dqSzSPrsbmFj@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 56131e6d1fcce8e7359a2445711cc1a4ddb8325c:

  mips: dts: realtek: Add I2C controllers (2024-11-12 15:51:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.13_1

for you to fetch changes up to 4fbd66d8254cedfd1218393f39d83b6c07a01917:

  MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a (2024-11-23 11:53:21 +0100)

----------------------------------------------------------------
- fix for loongson64 device tree
- add SPI nand to realtek device tree
- change clock tree for mobileye

----------------------------------------------------------------
Chris Packham (1):
      mips: dts: realtek: Add SPI NAND controller

Théo Lebrun (2):
      MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks
      MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks

Xi Ruoyao (1):
      MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a

 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          |  73 +++++-
 arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi      | 270 ---------------------
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  30 ++-
 .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     |  52 ----
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  73 +++++-
 arch/mips/boot/dts/realtek/rtl930x.dtsi            |  13 +
 6 files changed, 166 insertions(+), 345 deletions(-)
 delete mode 100644 arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi
 delete mode 100644 arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

