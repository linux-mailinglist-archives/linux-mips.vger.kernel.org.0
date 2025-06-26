Return-Path: <linux-mips+bounces-9515-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52791AEA4D2
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 19:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B22A7A45D0
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4371B2E5424;
	Thu, 26 Jun 2025 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moHvtMzq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5462ED87D;
	Thu, 26 Jun 2025 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960774; cv=none; b=h9MQP7fR7efS6MDmo7h5hCWGwXHF/K/VusvbMuhnCVbgrxUCLymX4CEUz1ubu6+SqPUclRM4Ph1kOh93QdQsDAGwP1XxHi3DV/nIWnKSWoZiTBnXDeAG5o6rDdt3aYFMwshU9SgXT4xlRgM9WR0xczrgT7PcH0OzgKgUZ5LaJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960774; c=relaxed/simple;
	bh=kSQm186hFl/xVD4TKfHSs/HAljINzHlSCTWzvZ3OqaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX/d06yDDKfTihj5+4xe8IZ5KDxib36SZk0dwjO4LRPDu9F1420jx92Xu1FHD1ZbBVPaeNWOCy7sogFXn+YeZSDDHCAOK/1ZIE4iS0ViHl+kkk3Qomc+PBc2YuOSp08Xwfp2FVYcq6EEQ6uMtT3Lv54Ehc2NSWQsfHgdV0D3P2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moHvtMzq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750960772; x=1782496772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kSQm186hFl/xVD4TKfHSs/HAljINzHlSCTWzvZ3OqaM=;
  b=moHvtMzqE+YB31whulBdDMkIlebqCM7jY5L8PczhMyGi7faIIyvAUGzk
   8vl5yzr/BBlfegQwccMch6gCcEnD+R5u2+X2Chcvn8mGVPRHs/lhfxXYM
   NO/WShFZURzzDwMoopfvit8CqIfGb9Swi6U8nZ7urqM4aPIq6XJmiu4DC
   JIGOHcbtmLgtWRk+QH3YKr2lK836NpHulo/1qXtKV4yfqF4zP+Kax1o/g
   w3YeD1b4UJLpYY1bog94j2H+iXONIrBadP18hYdGFFdLGGcrtRxj5+qaM
   wVzh5bhMUUJGC1IDWUtFzDJHmRepeeh/z9BG/dWvoSKhLqt/wQaz0GGrf
   A==;
X-CSE-ConnectionGUID: vQPRTAkzRGCqOhxB8UjejA==
X-CSE-MsgGUID: /wZsO0UPRgiOlvEzViOrMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63868169"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="63868169"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 10:59:32 -0700
X-CSE-ConnectionGUID: hL2ErFnMRzakCns1yjiADw==
X-CSE-MsgGUID: MZ4e4PIsRMS1Us4OekybiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153111256"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2025 10:59:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EBC7E2AD; Thu, 26 Jun 2025 20:59:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v1 1/1] firmware/nvram: bcm47xx: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 20:59:26 +0300
Message-ID: <20250626175926.372183-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bcm47xx_nvram.h | 1 -
 include/linux/bcm47xx_sprom.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/bcm47xx_nvram.h b/include/linux/bcm47xx_nvram.h
index 7615f8d7b1ed..e4b6ce953ddb 100644
--- a/include/linux/bcm47xx_nvram.h
+++ b/include/linux/bcm47xx_nvram.h
@@ -7,7 +7,6 @@
 
 #include <linux/errno.h>
 #include <linux/types.h>
-#include <linux/kernel.h>
 #include <linux/vmalloc.h>
 
 #ifdef CONFIG_BCM47XX_NVRAM
diff --git a/include/linux/bcm47xx_sprom.h b/include/linux/bcm47xx_sprom.h
index f8254fd53e15..40a7da3ef50e 100644
--- a/include/linux/bcm47xx_sprom.h
+++ b/include/linux/bcm47xx_sprom.h
@@ -5,8 +5,8 @@
 #ifndef __BCM47XX_SPROM_H
 #define __BCM47XX_SPROM_H
 
+#include <linux/errno.h>
 #include <linux/types.h>
-#include <linux/kernel.h>
 #include <linux/vmalloc.h>
 
 struct ssb_sprom;
-- 
2.47.2


