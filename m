Return-Path: <linux-mips+bounces-1298-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAEB849BE7
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 14:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 511001F24746
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 13:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA58E28E2B;
	Mon,  5 Feb 2024 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBGvnKcM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E528E0D;
	Mon,  5 Feb 2024 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140112; cv=none; b=L4TGJlp5q+DAMFcFaGkW0ffwB3sY43Mm9RWEjeRbzskJtOUs+suRnqXRbgLJc6xNrEhKQ2Bl0g+Dku4JLQXDyR1PKzzApocTJt9vI1NkE1Rqz+Ao+K6K7Z30Fd5jwRh0m0k4qOD8U6hL3SFMHD+4KZ9rlzYwY0kMI5uYNMWL+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140112; c=relaxed/simple;
	bh=X2Muz8pkoRwEhUvH9ti0eknrxae4vqD1PWSyx9/gso0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZTbDEUT6ipbyUtKKeRS9r+nim7KLhBcZFzjGDWuMWYvWYJ1daY+effDB4GLAbryLaNzajaFtbQPjKWAya+itfMC3bBjJWBf+pglPzizGM4Qsjnd/LiBda3YgYG/BQfDAbQqsaBMlzoPeox4QE0UtdMDYLAI9/dE9K3Jbi++/JFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBGvnKcM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707140111; x=1738676111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X2Muz8pkoRwEhUvH9ti0eknrxae4vqD1PWSyx9/gso0=;
  b=UBGvnKcMsGdbbJKLJjzHHHrCDQTkaaOfFnSj2p9Adk1HyVerbVSyCXJb
   zGEEMgKVvKYRmsXWdj1s5DBx3ln8xX4TjJ2a9sbxEGs61UjqknN8pSpFk
   XKqOK0Eq4VbUyCdJ8RptV/yo3uU+DKekXqV2ZFslnB0TlZq7eUMSTEOaG
   5y9dYgicI6IwmAygqQsoKNNcVQODYFHTjm1cDRHFYx1YhegNQTVTGL66g
   HJgrP321qNf785Rkzy6OUHok2xHdNl4rZiEKBozXZzogwlZlDuW2E8HmQ
   OE0To3oqOSLw1JM56isFRg97OFTndlGvZUdYJEp5KOB/7bntjT3h1BEkW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11167269"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11167269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5329233"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.35.237])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:35:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/4] MIPS: lantiq: Remove unused function pointer variables
Date: Mon,  5 Feb 2024 15:34:47 +0200
Message-Id: <20240205133450.5222-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205133450.5222-1-ilpo.jarvinen@linux.intel.com>
References: <20240205133450.5222-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ever since introduction in the commit e47d488935ed ("MIPS: Lantiq: Add
PCI controller support.") ltqpci_plat_dev_init has been unused. In
57c8cb8f2429 ("MIPS: pci: convert lantiq driver to OF") also
ltq_pci_plat_arch_init was introduced.

With those commit being more than 10 years ago, it seem neither is
going to get used anytime soon. Thus, remove both unused function
pointer variables.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/mips/pci/fixup-lantiq.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/mips/pci/fixup-lantiq.c b/arch/mips/pci/fixup-lantiq.c
index 13009666204f..8bcc136976dc 100644
--- a/arch/mips/pci/fixup-lantiq.c
+++ b/arch/mips/pci/fixup-lantiq.c
@@ -7,17 +7,8 @@
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 
-int (*ltq_pci_plat_arch_init)(struct pci_dev *dev) = NULL;
-int (*ltq_pci_plat_dev_init)(struct pci_dev *dev) = NULL;
-
 int pcibios_plat_dev_init(struct pci_dev *dev)
 {
-	if (ltq_pci_plat_arch_init)
-		return ltq_pci_plat_arch_init(dev);
-
-	if (ltq_pci_plat_dev_init)
-		return ltq_pci_plat_dev_init(dev);
-
 	return 0;
 }
 
-- 
2.39.2


