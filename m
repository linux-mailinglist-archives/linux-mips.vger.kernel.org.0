Return-Path: <linux-mips+bounces-13916-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAkrA8fEwmlflgQAu9opvQ
	(envelope-from <linux-mips+bounces-13916-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:07:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A930319B30
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A280A316C6E2
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA2436C9C5;
	Tue, 24 Mar 2026 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVu7atom"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5617123C8AE;
	Tue, 24 Mar 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371634; cv=none; b=Jd12nuJjdqPDvgogp59/8tBggqJMQYUv/16zN5+uNnTE80rwt56YDjpv6lQb1S2zflJukHtlErE0Vmgqn3fTZg2LxU+974dFag0iY3hnXOUN2M8/P/YWU7OiKo5Hm2yGvAyWyJggpKuA9hEuk+lmvfnu191nA81miOJ4dM2Hac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371634; c=relaxed/simple;
	bh=yRiNPjyR6BmckrFz9yS55d2yQZU16Z4uT3UMgBowpHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejn578OaF6JP8coUZEk1Wzq1NqYhGdkRCdg5x5TmJ/vBlg/iAAL6aRUlcryEX2qUWtB0fTK+9bZppr8fE024llnfF5JrcYVk3C3p2kWpmQa15LXODaBBN/uY3KPYj/aNP9gC9EpyhB19hFcacfjyln+Cg7BdVR+aDg2EE3abmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVu7atom; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371632; x=1805907632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRiNPjyR6BmckrFz9yS55d2yQZU16Z4uT3UMgBowpHk=;
  b=XVu7atomGqeRQ/mCvdsKBuOQqnS1A97ZFHQ5puo3JRTcIwdzrp5Yr2Rd
   jj1ETPgCNbjE6BE79nJ3C7Zaa+z4mSwmDHFYxZRmzrp2mpbO4Cu3Qt/yD
   vJJiRCY2WGxFF2yToGAcCqMXJn0mooQi9q830Eh2W/9dyTmG97j3QNmRd
   mzE6F3SHc1fSTFh0U4wYdOQ1jinn5Iw0QBTFOWxePvgJJAl/rtzmYuJKM
   jDxSMumIEEoe+9e1PoNoEwc9Sqib5SCOCiOVH3nSToaOEA2SziPRnnnZT
   hG7orP7S4succId+dkQnlq9tlZ16Uzf2dP8dFFiFg03yoXx6YLJepcJZr
   A==;
X-CSE-ConnectionGUID: 0aj1QaDoTeiUONUsc8/J8Q==
X-CSE-MsgGUID: MXAYKiVpSQOuiLrr6n22vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75281459"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75281459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:31 -0700
X-CSE-ConnectionGUID: NHjFhTG1RYO9C2glveQ6yA==
X-CSE-MsgGUID: hhyUW1HYQmiP63jGpn9/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219540299"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 08/10] PCI: Rename window_alignment() to pci_min_window_alignment()
Date: Tue, 24 Mar 2026 18:56:31 +0200
Message-Id: <20260324165633.4583-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13916-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 7A930319B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

window_alignment() lacks prefix. Rename it to pci_min_window_alignment()
in order to include the prefix and also add min to indicate the returned
window alignment is the minimum PCI spec and arch allows.

Also make it available in drivers/pci/pci.h as upcoming changes will need
to call it from outside of setup-bus.c.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h       | 3 +++
 drivers/pci/setup-bus.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce..2edb03c1c6b9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1053,6 +1053,9 @@ static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 	return resource_alignment(res);
 }
 
+resource_size_t pci_min_window_alignment(struct pci_bus *bus,
+					 unsigned long type);
+
 void pci_acs_init(struct pci_dev *dev);
 void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 61f769aaa2f6..edc0d682dcad 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1035,7 +1035,7 @@ resource_size_t __weak pcibios_window_alignment(struct pci_bus *bus,
 #define PCI_P2P_DEFAULT_IO_ALIGN	SZ_4K
 #define PCI_P2P_DEFAULT_IO_ALIGN_1K	SZ_1K
 
-static resource_size_t window_alignment(struct pci_bus *bus, unsigned long type)
+resource_size_t pci_min_window_alignment(struct pci_bus *bus, unsigned long type)
 {
 	resource_size_t align = 1, arch_align;
 
@@ -1084,7 +1084,7 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t add_size,
 	if (resource_assigned(b_res))
 		return;
 
-	min_align = window_alignment(bus, IORESOURCE_IO);
+	min_align = pci_min_window_alignment(bus, IORESOURCE_IO);
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct resource *r;
 
@@ -1339,7 +1339,7 @@ static void pbus_size_mem(struct pci_bus *bus, struct resource *b_res,
 		}
 	}
 
-	win_align = window_alignment(bus, b_res->flags);
+	win_align = pci_min_window_alignment(bus, b_res->flags);
 	min_align = calculate_head_align(aligns, max_order);
 	min_align = max(min_align, win_align);
 	size0 = calculate_memsize(size, realloc_head ? 0 : add_size,
-- 
2.39.5


