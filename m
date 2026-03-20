Return-Path: <linux-mips+bounces-13844-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MeOLaCsvWmdAQMAu9opvQ
	(envelope-from <linux-mips+bounces-13844-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 21:22:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24D2E0C8D
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 21:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEBB83043FAA
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9BF2FF147;
	Fri, 20 Mar 2026 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnbzrFrD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F12FE04E;
	Fri, 20 Mar 2026 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038162; cv=none; b=XD8ZebMw6QMVlfmJsQK2vkwT86enMDzM4/VdQEQ0otRVZU/NM95nSSwHQlo60oL15nrv5/MjLzkE4frQ+kCLlYrlCfpzlNP8wteDuW8cbtP+ZB6koUyEhqxj3iLLi5fDxMmZWpQ9K27L6EPrL6LZ086ywhG4rnjlr/3vX/DVv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038162; c=relaxed/simple;
	bh=0DWRQN/0muFpFQ0xJIR1FjTWamxMxe1o03kjWEUi/n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRL5RF7O4AhaYwTrv82uEIiSGERRY/dCrB4kSNbIwoEoTF9yoBp6n0hive2X+9uzsP888ib7TtViSDITgr1jbrJZkWdvS4PnKOEynypm5Cl8rlTQpL2J+LmasQDNNthOlcXGlsBbCIxyzg+VzmTHc9xK9QNW120FPo/maTL8ots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnbzrFrD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774038161; x=1805574161;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0DWRQN/0muFpFQ0xJIR1FjTWamxMxe1o03kjWEUi/n8=;
  b=dnbzrFrDN+FllEMQqZUkJ6vTwLqjRGZFqMId0JSFhkgAMf6EzWuvKRG2
   PSokncderje8wTa4t9oPur6ssykHI4Iq4edhe9eftEv+0Ixerla4wYAnZ
   TKnPwtFE/dM3mpQXpbjnfrtF1lZWrf+e8Vxh+gq4WJXXpi2eXja30ntit
   vb0ElNwgpiE5YjOo9jP/Msb8YhRosj/6OE1dtn7sdHRn3QQf8qjtj16WB
   nCXYmZ7ouzV9tTf+c+n71WC2mh+75ASsZwNfTCwyEGR3uK0pwWUDHT3wt
   AIxcQfPFxzW3hN77j+Ax7RjbvF7ce+MdvGS2F9xl2h3jGuIPWqqmlOUlO
   Q==;
X-CSE-ConnectionGUID: Ao9Y5pg7TcSYXIL4SSYpwA==
X-CSE-MsgGUID: 7ENPO/PLQ1W1JzlvDkLvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86495040"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86495040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 13:22:40 -0700
X-CSE-ConnectionGUID: xaBrfnEYT1K3ZmmAZBROFA==
X-CSE-MsgGUID: FvKBByojTuKmQyenPFcQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246414198"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 13:22:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 178E695; Fri, 20 Mar 2026 21:22:38 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v2 1/1] MIPS: Alchemy: Remove unused forward declaration
Date: Fri, 20 Mar 2026 21:21:30 +0100
Message-ID: <20260320202235.3233545-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13844-lists,linux-mips=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: AB24D2E0C8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 'struct gpio' is not used in the code, remove unneeded forward declaration.
This seems to be a leftover for a 5 years.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: collected tags (Thomas)

Bart, it was agreed to take this patch via GPIO tree
(that's why we have an Ack), can you apply it, please?

 arch/mips/include/asm/mach-au1x00/gpio-au1000.h | 2 --
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
index d820b481ac56..e6306f6820e6 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
@@ -40,8 +40,6 @@
 #define AU1000_GPIO2_INTENABLE	0x10
 #define AU1000_GPIO2_ENABLE	0x14
 
-struct gpio;
-
 static inline int au1000_gpio1_to_irq(int gpio)
 {
 	return MAKE_IRQ(1, gpio - ALCHEMY_GPIO1_BASE);
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index 43d44f384f97..b12f37262cfa 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -12,7 +12,6 @@
 #include <asm/io.h>
 #include <asm/mach-au1x00/au1000.h>
 
-struct gpio;
 struct gpio_chip;
 
 /* with the current GPIC design, up to 128 GPIOs are possible.
-- 
2.50.1


