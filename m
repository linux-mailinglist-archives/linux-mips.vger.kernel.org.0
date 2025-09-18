Return-Path: <linux-mips+bounces-10492-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304EBB31DA7
	for <lists+linux-mips@lfdr.de>; Fri, 22 Aug 2025 17:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6215A61C5
	for <lists+linux-mips@lfdr.de>; Fri, 22 Aug 2025 15:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ACE3277AA;
	Fri, 22 Aug 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLi+cj+2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C6227B88;
	Fri, 22 Aug 2025 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874775; cv=none; b=K5L9xVdx52KL7ay9Zv4PC5AUHrB1emlDYZn+itEBytnx8k5PVIId40TPhei0aWWpTqGBGUGIsudmsIZ+S4zm508AxTdh3ZWCJ5i6dAvFiuspmPa6qSrwPVHDspiOJM2oPTklppLD3NDig25G8hdMdrvwBEYwTVdGm9HBY1j/rH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874775; c=relaxed/simple;
	bh=FRfssbwFVOeTRuS2nCD7Ynmj6Ps7cVzti/WfWUW/SwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aTbPv6pf8xFymJ03NCybLB5s5J13inMX1+WeI7xBLcXqfkOTpVdm3umrXnnv2UeiHfOFOR+2nUZPMCboG0ztql1hZvhGRXVwRhnlrDdQcaUmFK3Fbs1/CAoj1KyyqGtgHPRPzmW5tvYpSphf5OiAIPxIcCt6LF37+/Ip40u1I88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLi+cj+2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874775; x=1787410775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FRfssbwFVOeTRuS2nCD7Ynmj6Ps7cVzti/WfWUW/SwQ=;
  b=KLi+cj+2Gw4b84vymRsQP+iuUjqInzEzez8ucpAI/eBk3ZKWjfn6A53b
   bg3/VRF0S5bD7AEBJ/r2Q08oztXiUGjlEvsnvVaec0+ZVKJmbavryX+3I
   U60SwC5668IS05r6Zrsxw4JNTI8MLTMjDmIcs1B2lAAJx0PhPsyYOJ41f
   dO+ynnPKuaZy7MrmEGIjG3lspkpmxnKkWkXf8G954ZQ8rmODNPebHTZFU
   2ufIs5+Ko6gjwtYv88nKFtsdatjO6YJGOztgiDSeFrDgLNtemDa8DN5TP
   NdM3zq2gzZzAJChGAwzRf+0XXDgDFgdSz6E4xm46oOvMOhclVDf7a0yAa
   w==;
X-CSE-ConnectionGUID: Lul5mvyQQ0GQDhSRgJYezA==
X-CSE-MsgGUID: sr8csa7zRP+a/n/2Bs9bCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75640712"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75640712"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:34 -0700
X-CSE-ConnectionGUID: 7HgkGi3zQqKRPBeZCM3JIw==
X-CSE-MsgGUID: FNeyO842RAq2qXrusEvxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172986945"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 21/24] PCI: Refactor remove_dev_resources() to use pbus_select_window()
Date: Fri, 22 Aug 2025 17:56:02 +0300
Message-Id: <20250822145605.18172-22-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert remove_dev_resources() to use pbus_select_window(). As
'available' is not the real resources, the index has to be adjusted as
only bridge resource counterparts are present in the 'available' array.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index ee2f2c78d8c9..ece533181ff1 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2061,34 +2061,18 @@ static void remove_dev_resource(struct resource *avail, struct pci_dev *dev,
 static void remove_dev_resources(struct pci_dev *dev,
 				 struct resource available[PCI_P2P_BRIDGE_RESOURCE_NUM])
 {
-	struct resource *mmio_pref = &available[PCI_BUS_BRIDGE_PREF_MEM_WINDOW];
-	struct resource *res;
+	struct resource *res, *b_win;
+	int idx;
 
 	pci_dev_for_each_resource(dev, res) {
-		if (resource_type(res) == IORESOURCE_IO) {
-			remove_dev_resource(&available[PCI_BUS_BRIDGE_IO_WINDOW],
-					    dev, res);
-		} else if (resource_type(res) == IORESOURCE_MEM) {
+		b_win = pbus_select_window(dev->bus, res);
+		if (!b_win)
+			continue;
 
-			/*
-			 * Make sure prefetchable memory is reduced from
-			 * the correct resource. Specifically we put 32-bit
-			 * prefetchable memory in non-prefetchable window
-			 * if there is a 64-bit prefetchable window.
-			 *
-			 * See comments in __pci_bus_size_bridges() for
-			 * more information.
-			 */
-			if ((res->flags & IORESOURCE_PREFETCH) &&
-			    ((res->flags & IORESOURCE_MEM_64) ==
-			     (mmio_pref->flags & IORESOURCE_MEM_64))) {
-				remove_dev_resource(&available[PCI_BUS_BRIDGE_PREF_MEM_WINDOW],
-						    dev, res);
-			} else {
-				remove_dev_resource(&available[PCI_BUS_BRIDGE_MEM_WINDOW],
-						    dev, res);
-			}
-		}
+		idx = pci_resource_num(dev->bus->self, b_win);
+		idx -= PCI_BRIDGE_RESOURCES;
+
+		remove_dev_resource(&available[idx], dev, res);
 	}
 }
 
-- 
2.39.5


