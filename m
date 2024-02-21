Return-Path: <linux-mips+bounces-1640-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84E85E62F
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 19:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61781C20E96
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 18:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1798594C;
	Wed, 21 Feb 2024 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFzoC4XD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225358563E;
	Wed, 21 Feb 2024 18:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708540500; cv=none; b=EsjK68S2NaSVECmlbRL97bnTzp/cX+kf2F37qKX16EyHziwe9giyMBIeBPshZdUB316MDVzzBMAQki33weX2xCNUM+VbQS2hklf1ea5nxPPtu+Rm1HqRV6VNW9q+SUINqpRCeP6jnoZhdrJFizwKpa8dkL5hVEl/Ga18UbWBh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708540500; c=relaxed/simple;
	bh=GKzrAAQ/SAD+M4CCaHIYdelfWhk61yKpviB6x4LqmT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMHpHj8NSCd23MJYn1nGBhqi9gFvdQwXwojxpGAMIBRgZPmOW09/t/n5R380GBW8vgL6qZDapWnl8LqU9E2csEyToyghMZOUeL1f0F3U0CFzcnfCaOaPWWaC+MJ6j0OguKiz4dieOGeuBZHb3m4RKnyPT6D7aWUVkRj6mFYoOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFzoC4XD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540499; x=1740076499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GKzrAAQ/SAD+M4CCaHIYdelfWhk61yKpviB6x4LqmT4=;
  b=BFzoC4XDL/qITWgpeDoQLuLAAOt1kB8lvR+0uJVgNYKx8K8BBwGjkhfT
   BRvuve5KPsFhY9g0iar7O1gVRNh/wLHeitEnxNmzI0EJcEPtEFa6/vHuD
   +EDkOYtri/Nnffcp+/34KmhFrY1YFlW67b9K9x6BvKcajc8eih/isijMs
   F1cLXKupBCL5swAvfqNvPQKHREbcbKWukmgxzzT3PnVrmHPvDhWPzpD9M
   /jplKefbP0gySxhhklRXk8W2cuN8Fp7lK+V1LXcqgdlPsCvs3Go2uPF4u
   Pcjr8euUmNscEnPQteUrw/zVj/BOo87194O5ILZItTOnocvZjPo7vvSu+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164704"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:34:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684739"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684739"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B783E144; Wed, 21 Feb 2024 20:34:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 01/14] serial: core: Move struct uart_port::quirks closer to possible values
Date: Wed, 21 Feb 2024 20:31:17 +0200
Message-ID: <20240221183442.4124354-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently it's not crystal clear what UPIO_* and UPQ_* definitions
belong two. Reindent the code, so it will be easy to read and understand.
No functional changes intended.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/serial_core.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 55b1f3ba48ac..2d2ec99eca93 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -467,8 +467,8 @@ struct uart_port {
 	unsigned int		fifosize;		/* tx fifo size */
 	unsigned char		x_char;			/* xon/xoff char */
 	unsigned char		regshift;		/* reg offset shift */
+
 	unsigned char		iotype;			/* io access style */
-	unsigned char		quirks;			/* internal quirks */
 
 #define UPIO_PORT		(SERIAL_IO_PORT)	/* 8b I/O port access */
 #define UPIO_HUB6		(SERIAL_IO_HUB6)	/* Hub6 ISA card */
@@ -479,7 +479,9 @@ struct uart_port {
 #define UPIO_MEM32BE		(SERIAL_IO_MEM32BE)	/* 32b big endian */
 #define UPIO_MEM16		(SERIAL_IO_MEM16)	/* 16b little endian */
 
-	/* quirks must be updated while holding port mutex */
+	unsigned char		quirks;			/* internal quirks */
+
+	/* internal quirks must be updated while holding port mutex */
 #define UPQ_NO_TXEN_TEST	BIT(0)
 
 	unsigned int		read_status_mask;	/* driver specific */
-- 
2.43.0.rc1.1.gbec44491f096


