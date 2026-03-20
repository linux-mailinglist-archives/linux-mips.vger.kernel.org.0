Return-Path: <linux-mips+bounces-13845-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJNrJROuvWnIAQMAu9opvQ
	(envelope-from <linux-mips+bounces-13845-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 21:29:07 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9D2E0D1B
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 21:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1C9F300B9A8
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A735317161;
	Fri, 20 Mar 2026 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7dMKLzN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E02C0F81;
	Fri, 20 Mar 2026 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038544; cv=none; b=thhqnL+eix6SwAHdGWcifAHTeHg0cLeP9aCRqF41p1wgfNEGwcJ6IWyxk4KsS2fHI7Qd0WlOGYAJ5VlHl8KPrrKifUpeQIfy9qNsKJAng1/y5qaT4IhnHresUivkkg8AiA9TapF6KZjVTRpFvvSHa1Z4YHV9ijHrwQ0TNNqqwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038544; c=relaxed/simple;
	bh=9Y0WOGZe3gDhZsHX5AhRV918aiuRb1Ullis7ndljiLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+zpXj7cjKnzDaBuLif6IOkfswaHj5JRhra95a3zjo8hnI5e14BE85P5fvTxnZfInhn+vQzHUdTpDwer+XeZmBBeHMw5NPwC1+96C8YO/6tLmLqklRgyq4p1LcclTEQ/7HALUqzy/RLs1hfRyFj5T8wBt+ss1E0U2FsCk+oSbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7dMKLzN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774038543; x=1805574543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9Y0WOGZe3gDhZsHX5AhRV918aiuRb1Ullis7ndljiLQ=;
  b=H7dMKLzNb3LuuwntcPhuyYcx4IXTFaivMRzw9mvoaAnQdqa8YMLtTfSl
   /jP8ncNv6Jl2eUEImLf/SY3hWvGz3rqXhOxkwtduepZE/fDXj6HLRnPv8
   y+diEYZbDisFm8KLXgT/j9SGRc+vAW2qd/GjpwZmqC8s95q1mg9/yk4UG
   U6hAzsoCNTcrQ65ASsQCam1g3DPJwvR7fq7UpHpMjkhJj/by6w8t5oOoN
   Wt90UAKdXLNtz7e+Mzl8m7ImwdsJaVs5k1CSETKj65KS4k2q+5Y0l8tF3
   KF5OIadwb07EJR7ut+F/9ftV1ChHpEfxnEBziwlDD0Ku1XXuoqXyL67GP
   w==;
X-CSE-ConnectionGUID: s3dhDgFkRo2UScnUQE7xvQ==
X-CSE-MsgGUID: JiMjLqY2Rge3sQKW8QpyNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75101520"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75101520"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 13:29:03 -0700
X-CSE-ConnectionGUID: aFtgehLGT5OAKWdiKOP/uA==
X-CSE-MsgGUID: ExlWARoLQhWbmaM/mYP36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="253877245"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2026 13:29:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8123095; Fri, 20 Mar 2026 21:29:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [resend, PATCH v2 1/1] MIPS: Alchemy: Remove unused forward declaration
Date: Fri, 20 Mar 2026 21:28:08 +0100
Message-ID: <20260320202852.3233790-1-andriy.shevchenko@linux.intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13845-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,franken.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17C9D2E0D1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 'struct gpio' is not used in the code, remove unneeded forward declaration.
This seems to be a leftover for a 5 years.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2 (resend): Cc'ed to GPIO maintainers and ML
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


