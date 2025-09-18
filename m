Return-Path: <linux-mips+bounces-10481-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A318FB31D6D
	for <lists+linux-mips@lfdr.de>; Fri, 22 Aug 2025 17:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808F6AA7789
	for <lists+linux-mips@lfdr.de>; Fri, 22 Aug 2025 14:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC77031353C;
	Fri, 22 Aug 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyL8qphz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36824CEE8;
	Fri, 22 Aug 2025 14:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874672; cv=none; b=PejVQWYQEAtUIJObAhYM0IC63AM+THDULzFhJwDp2ctJQqsKtjKzS0KOCqDq7TaE0wI23n30elbCQm2DEIu0J+lajsQO+Zh91ESlWO1VIZgR+GPQztSV92IKPrSbAlw2HYwBNDEOhc99xpnR7BuKfgOaHYhbuqQbhcYkWEyXTFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874672; c=relaxed/simple;
	bh=3x4mEhP7iBLX8hi8m0JxlOf943qi7QpjreCSkVJG+/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6ADzZNcq4mVk5hu7rX6hUPlqI/GB2pFxRXJbOk5y4FChwD4/U3jSnkqbpPtpxmFxKfPU9fTUMm9leRQoOMMkBq65zvrJApAXVKqDWCKfVeVr7kw2A8JljNjEax1YY7ikKF6IpB6CNfN+6xlVZ1bI23C53QRI1aILoaUzMuTejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyL8qphz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874671; x=1787410671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3x4mEhP7iBLX8hi8m0JxlOf943qi7QpjreCSkVJG+/4=;
  b=WyL8qphzB3U3rwcz05jNbMBe6yhT3vJ7eEm1GUcUeHmCadkXI9/3dCmA
   8/OYKe5AoKueJJ2+5uEmqsVbzMqBDT3io8FYFyhjWTVxzcnabpc4rYJlj
   viuIr5nNxoqBC6q9alrHMMaO+jdDCcTfhfOoHridbSET6l6VlPjOtMbZj
   fXpx/i/K/qtUClu1YnnhTxqps5LIbV5qeEcNEQwAaCRmJrfTDRuxK+l3r
   G/PhxmZEPZLvrYDVHffsxQd6FYzaG1HG8jp5dy+aZAmvDqQ768mu4CCj3
   v6A2RZbwUcg+EL2zEVs8erjWL/MmKrfFMDkqFi5ji7tX4D9eoW+M2ObCv
   w==;
X-CSE-ConnectionGUID: F5bMZ8hgQp6epOn65BfnYw==
X-CSE-MsgGUID: gwxkHQQ5TX+091u3zxY32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201393"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:50 -0700
X-CSE-ConnectionGUID: zqR0JlJ6TWKcZThoCrOuJQ==
X-CSE-MsgGUID: SFOmFw8hRJy5G5g3zRargQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168920538"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:45 -0700
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
Subject: [PATCH 10/24] PCI: Preserve bridge window resource type flags
Date: Fri, 22 Aug 2025 17:55:51 +0300
Message-Id: <20250822145605.18172-11-ilpo.jarvinen@linux.intel.com>
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

When a bridge window is found unused or fails to assign, the flags of
the associated resource are cleared. Clearing flags is problematic as
it also removes the type information of the resource which is needed
later.

Thus, always preserve the bridge window type flags and use
IORESOURCE_UNSET and IORESOURCE_DISABLED to indicate the status of the
bridge window. Also, when initializing resources, make sure all valid
bridge windows do get their type flags set.

Change various places that relied on resource flags being cleared to
check for IORESOURCE_UNSET and IORESOURCE_DISABLED to allow bridge
window resource to retain their type flags. Add
pdev_resource_assignable() and pdev_resource_should_fit() helpers to
filter out disabled bridge windows during resource fitting, the latter
combines more common checks into the helper.

When reading the bridge windows from the registers, instead of leaving
the resource flags cleared for bridge windows that are not enabled,
always setup the flags and set IORESOURCE_UNSET | IORESOURCE_DISABLED
as needed.

When resource fitting or assignment fails for a bridge window resource,
or the bridge window is not needed, mark the resource with
IORESOURCE_UNSET or IORESOURCE_DISABLED, respectively.

Use dummy zero resource in resource_show() for backwards compatibility
as lspci will otherwise misrepresent disabled bridge windows.

This change ended up fixing an issue which too highlights the
importance of keeping the resource type flags intact:

At the end of __assign_resources_sorted(), reset_resource() is called,
previously clearing the flags. Later, pci_prepare_next_assign_round()
attempted to release bridge resources using
pci_bus_release_bridge_resources() that calls into
pci_bridge_release_resources() that assumes type flags are still
present. As type flags were cleared, IORESOURCE_MEM_64 was not set
leading to resources under an incorrect bridge window to be released
(idx = 1 instead of idx = 2). While the assignments performed later
covered this problem so that the wrongly released resources got
assigned in the end, it was still causing extra release+assign pairs.

There are other reasons why the resource flags should be retained in
upcoming changes too.

Removing the flag reset for non-bridge window resource is left as
future work, in part because it has a much higher regression potential
due to pci_enable_resources() that will start to work also for those
resources then and due to what endpoint drivers might assume about
resources.

Despite the Fixes tag, backporting this (at least any time soon) is
highly discouraged. The issue fixed is borderline cosmetic as the later
assignments normally cover the problem entirely. Also there might be
non-obvious dependencies.

Fixes: 5b28541552ef ("PCI: Restrict 64-bit prefetchable bridge windows to 64-bit resources")
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/bus.c       |  3 ++
 drivers/pci/pci-sysfs.c |  7 ++++
 drivers/pci/probe.c     | 25 +++++++++---
 drivers/pci/setup-bus.c | 88 ++++++++++++++++++++++++++---------------
 drivers/pci/setup-res.c |  3 ++
 5 files changed, 89 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index b77fd30bbfd9..58b5388423ee 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -204,6 +204,9 @@ static int pci_bus_alloc_from_region(struct pci_bus *bus, struct resource *res,
 		if (!r)
 			continue;
 
+		if (r->flags & (IORESOURCE_UNSET|IORESOURCE_DISABLED))
+			continue;
+
 		/* type_mask must match */
 		if ((res->flags ^ r->flags) & type_mask)
 			continue;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 5eea14c1f7f5..162a5241c7f7 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -177,6 +177,13 @@ static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
 
 	for (i = 0; i < max; i++) {
 		struct resource *res =  &pci_dev->resource[i];
+		struct resource zerores = {};
+
+		/* For backwards compatibility */
+		if (i >= PCI_BRIDGE_RESOURCES && i <= PCI_BRIDGE_RESOURCE_END &&
+		    res->flags & (IORESOURCE_UNSET | IORESOURCE_DISABLED))
+			res = &zerores;
+
 		pci_resource_to_user(pci_dev, i, res, &start, &end);
 		len += sysfs_emit_at(buf, len, "0x%016llx 0x%016llx 0x%016llx\n",
 				     (unsigned long long)start,
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index f41128f91ca7..f31d27c7708a 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -419,13 +419,17 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
 		limit |= ((unsigned long) io_limit_hi << 16);
 	}
 
+	res->flags = (io_base_lo & PCI_IO_RANGE_TYPE_MASK) | IORESOURCE_IO;
+
 	if (base <= limit) {
-		res->flags = (io_base_lo & PCI_IO_RANGE_TYPE_MASK) | IORESOURCE_IO;
 		region.start = base;
 		region.end = limit + io_granularity - 1;
 		pcibios_bus_to_resource(dev->bus, res, &region);
 		if (log)
 			pci_info(dev, "  bridge window %pR\n", res);
+	} else {
+		resource_set_range(res, 0, 0);
+		res->flags |= IORESOURCE_UNSET | IORESOURCE_DISABLED;
 	}
 }
 
@@ -440,13 +444,18 @@ static void pci_read_bridge_mmio(struct pci_dev *dev, struct resource *res,
 	pci_read_config_word(dev, PCI_MEMORY_LIMIT, &mem_limit_lo);
 	base = ((unsigned long) mem_base_lo & PCI_MEMORY_RANGE_MASK) << 16;
 	limit = ((unsigned long) mem_limit_lo & PCI_MEMORY_RANGE_MASK) << 16;
+
+	res->flags = (mem_base_lo & PCI_MEMORY_RANGE_TYPE_MASK) | IORESOURCE_MEM;
+
 	if (base <= limit) {
-		res->flags = (mem_base_lo & PCI_MEMORY_RANGE_TYPE_MASK) | IORESOURCE_MEM;
 		region.start = base;
 		region.end = limit + 0xfffff;
 		pcibios_bus_to_resource(dev->bus, res, &region);
 		if (log)
 			pci_info(dev, "  bridge window %pR\n", res);
+	} else {
+		resource_set_range(res, 0, 0);
+		res->flags |= IORESOURCE_UNSET | IORESOURCE_DISABLED;
 	}
 }
 
@@ -489,16 +498,20 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
 		return;
 	}
 
+	res->flags = (mem_base_lo & PCI_PREF_RANGE_TYPE_MASK) | IORESOURCE_MEM |
+		     IORESOURCE_PREFETCH;
+	if (res->flags & PCI_PREF_RANGE_TYPE_64)
+		res->flags |= IORESOURCE_MEM_64;
+
 	if (base <= limit) {
-		res->flags = (mem_base_lo & PCI_PREF_RANGE_TYPE_MASK) |
-					 IORESOURCE_MEM | IORESOURCE_PREFETCH;
-		if (res->flags & PCI_PREF_RANGE_TYPE_64)
-			res->flags |= IORESOURCE_MEM_64;
 		region.start = base;
 		region.end = limit + 0xfffff;
 		pcibios_bus_to_resource(dev->bus, res, &region);
 		if (log)
 			pci_info(dev, "  bridge window %pR\n", res);
+	} else {
+		resource_set_range(res, 0, 0);
+		res->flags |= IORESOURCE_UNSET | IORESOURCE_DISABLED;
 	}
 }
 
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index b62465665abc..223f0e025407 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -190,6 +190,31 @@ static bool pdev_resources_assignable(struct pci_dev *dev)
 	return true;
 }
 
+static bool pdev_resource_assignable(struct pci_dev *dev, struct resource *res)
+{
+	int idx = pci_resource_num(dev, res);
+
+	if (!res->flags)
+		return false;
+
+	if (idx >= PCI_BRIDGE_RESOURCES && idx <= PCI_BRIDGE_RESOURCE_END &&
+	    res->flags & IORESOURCE_DISABLED)
+		return false;
+
+	return true;
+}
+
+static bool pdev_resource_should_fit(struct pci_dev *dev, struct resource *res)
+{
+	if (res->parent)
+		return false;
+
+	if (res->flags & IORESOURCE_PCI_FIXED)
+		return false;
+
+	return pdev_resource_assignable(dev, res);
+}
+
 /* Sort resources by alignment */
 static void pdev_sort_resources(struct pci_dev *dev, struct list_head *head)
 {
@@ -205,10 +230,7 @@ static void pdev_sort_resources(struct pci_dev *dev, struct list_head *head)
 		resource_size_t r_align;
 		struct list_head *n;
 
-		if (r->flags & IORESOURCE_PCI_FIXED)
-			continue;
-
-		if (!(r->flags) || r->parent)
+		if (!pdev_resource_should_fit(dev, r))
 			continue;
 
 		r_align = pci_resource_alignment(dev, r);
@@ -257,8 +279,15 @@ bool pci_resource_is_optional(const struct pci_dev *dev, int resno)
 	return false;
 }
 
-static inline void reset_resource(struct resource *res)
+static inline void reset_resource(struct pci_dev *dev, struct resource *res)
 {
+	int idx = pci_resource_num(dev, res);
+
+	if (idx >= PCI_BRIDGE_RESOURCES && idx <= PCI_BRIDGE_RESOURCE_END) {
+		res->flags |= IORESOURCE_UNSET;
+		return;
+	}
+
 	res->start = 0;
 	res->end = 0;
 	res->flags = 0;
@@ -610,7 +639,7 @@ static void __assign_resources_sorted(struct list_head *head,
 				    0 /* don't care */);
 		}
 
-		reset_resource(res);
+		reset_resource(dev, res);
 	}
 
 	free_list(head);
@@ -1014,8 +1043,11 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 
 			if (r->parent || !(r->flags & IORESOURCE_IO))
 				continue;
-			r_size = resource_size(r);
 
+			if (!pdev_resource_assignable(dev, r))
+				continue;
+
+			r_size = resource_size(r);
 			if (r_size < SZ_1K)
 				/* Might be re-aligned for ISA */
 				size += r_size;
@@ -1034,6 +1066,9 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 	size0 = calculate_iosize(size, min_size, size1, 0, 0,
 			resource_size(b_res), min_align);
 
+	if (size0)
+		b_res->flags &= ~IORESOURCE_DISABLED;
+
 	size1 = size0;
 	if (realloc_head && (add_size > 0 || children_add_size > 0)) {
 		size1 = calculate_iosize(size, min_size, size1, add_size,
@@ -1045,13 +1080,14 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 		if (bus->self && (b_res->start || b_res->end))
 			pci_info(bus->self, "disabling bridge window %pR to %pR (unused)\n",
 				 b_res, &bus->busn_res);
-		b_res->flags = 0;
+		b_res->flags |= IORESOURCE_DISABLED;
 		return;
 	}
 
 	resource_set_range(b_res, min_align, size0);
 	b_res->flags |= IORESOURCE_STARTALIGN;
 	if (bus->self && size1 > size0 && realloc_head) {
+		b_res->flags &= ~IORESOURCE_DISABLED;
 		add_to_list(realloc_head, bus->self, b_res, size1-size0,
 			    min_align);
 		pci_info(bus->self, "bridge window %pR to %pR add_size %llx\n",
@@ -1198,11 +1234,13 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 			const char *r_name = pci_resource_name(dev, i);
 			resource_size_t r_size;
 
-			if (r->parent || (r->flags & IORESOURCE_PCI_FIXED) ||
-			    !pdev_resources_assignable(dev) ||
-			    ((r->flags & mask) != type &&
-			     (r->flags & mask) != type2 &&
-			     (r->flags & mask) != type3))
+			if (!pdev_resources_assignable(dev) ||
+			    !pdev_resource_should_fit(dev, r))
+				continue;
+
+			if ((r->flags & mask) != type &&
+			    (r->flags & mask) != type2 &&
+			    (r->flags & mask) != type3)
 				continue;
 			r_size = resource_size(r);
 
@@ -1253,6 +1291,9 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 	min_align = max(min_align, win_align);
 	size0 = calculate_memsize(size, min_size, 0, 0, resource_size(b_res), min_align);
 
+	if (size0)
+		b_res->flags &= ~IORESOURCE_DISABLED;
+
 	if (bus->self && size0 &&
 	    !pbus_upstream_space_available(bus, mask | IORESOURCE_PREFETCH, type,
 					   size0, min_align)) {
@@ -1287,13 +1328,14 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 		if (bus->self && (b_res->start || b_res->end))
 			pci_info(bus->self, "disabling bridge window %pR to %pR (unused)\n",
 				 b_res, &bus->busn_res);
-		b_res->flags = 0;
+		b_res->flags |= IORESOURCE_DISABLED;
 		return 0;
 	}
 
 	resource_set_range(b_res, min_align, size0);
 	b_res->flags |= IORESOURCE_STARTALIGN;
 	if (bus->self && size1 > size0 && realloc_head) {
+		b_res->flags &= ~IORESOURCE_DISABLED;
 		add_to_list(realloc_head, bus->self, b_res, size1-size0, add_align);
 		pci_info(bus->self, "bridge window %pR to %pR add_size %llx add_align %llx\n",
 			   b_res, &bus->busn_res,
@@ -1721,7 +1763,6 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 {
 	struct pci_dev *dev = bus->self;
 	struct resource *r;
-	unsigned int old_flags;
 	struct resource *b_res;
 	int idx, ret;
 
@@ -1758,7 +1799,6 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 	/* If there are children, release them all */
 	release_child_resources(r);
 
-	type = old_flags = r->flags & PCI_RES_TYPE_MASK;
 	ret = pci_release_resource(dev, PCI_BRIDGE_RESOURCES + idx);
 	if (ret)
 		return;
@@ -1767,8 +1807,6 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 	if (type & IORESOURCE_PREFETCH)
 		type = IORESOURCE_PREFETCH;
 	__pci_setup_bridge(bus, type);
-	/* For next child res under same bridge */
-	r->flags = old_flags;
 }
 
 enum release_type {
@@ -2246,21 +2284,9 @@ static void pci_prepare_next_assign_round(struct list_head *fail_head,
 	}
 
 	/* Restore size and flags */
-	list_for_each_entry(fail_res, fail_head, list) {
-		struct resource *res = fail_res->res;
-		struct pci_dev *dev = fail_res->dev;
-		int idx = pci_resource_num(dev, res);
-
+	list_for_each_entry(fail_res, fail_head, list)
 		restore_dev_resource(fail_res);
 
-		if (!pci_is_bridge(dev))
-			continue;
-
-		if (idx >= PCI_BRIDGE_RESOURCES &&
-		    idx <= PCI_BRIDGE_RESOURCE_END)
-			res->flags = 0;
-	}
-
 	free_list(fail_head);
 }
 
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 4e0e60256f04..21f77e5c647c 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -359,6 +359,9 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
 
 	res->flags &= ~IORESOURCE_UNSET;
 	res->flags &= ~IORESOURCE_STARTALIGN;
+	if (resno >= PCI_BRIDGE_RESOURCES && resno <= PCI_BRIDGE_RESOURCE_END)
+		res->flags &= ~IORESOURCE_DISABLED;
+
 	pci_info(dev, "%s %pR: assigned\n", res_name, res);
 	if (resno < PCI_BRIDGE_RESOURCES)
 		pci_update_resource(dev, resno);
-- 
2.39.5


