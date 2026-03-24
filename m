Return-Path: <linux-mips+bounces-13909-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAe+InvFwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13909-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:10:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85D319C01
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B0733013C4A
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 16:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13EB40627D;
	Tue, 24 Mar 2026 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/Cx3dv3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E003FE643;
	Tue, 24 Mar 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371522; cv=none; b=TM34RP+d0mYZAjsjyDUKhcRdN5jiVxyc8Xc/nVwMmtC/8aHwxQoGxWY3Xo6J8Kz5LhsQHvMgK2gdWuofEKpEeOP6lIv1lUMtT4ywgEmK+ADvZ7gHYNzn0WNLz4D7wfLraTyKGnPE+2jr/SdUeOqqladl9BQgJMbGi62xow8KcC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371522; c=relaxed/simple;
	bh=rU3n+FhgkyydByVdKs0lqSkLocKXu14IaAOX593F5w8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwTakeoK7U0YdOh4yFHH4cAHLGM69xpLBO4HphGtXwOZAQrBCLOuC27JPBXlFRJZFAt3FYeOKDCOwGg8Mk91RsRP72nrRuMUXKVcQmd/RjYadrdE7GnmEmXfeA4BB9+ekX9E6kTcS6t0V9gB70yerlhzCqwoYJYyBfmpLPu9q8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/Cx3dv3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371521; x=1805907521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rU3n+FhgkyydByVdKs0lqSkLocKXu14IaAOX593F5w8=;
  b=c/Cx3dv3Vz2/YJbekHvh+gD+WIP1CwyNuQ3q0MlWTGImDZiT1q5uRbVc
   8bALhv9WRH2YI6Npjox5VxweEtizr6VeUqSCQGPI9tV9WRwXrQ1zza/8/
   DZD+qQ8HedqBh24LsNLDc44P9DDOd2eFzXOFXpQlU3wRet3dnQGImnx/A
   QWjN1f6hkstl6XO4sFD0Hn0WMcpJ4Qk9XRk4id57U2nGqI0lvMsw+aS6k
   ZdkDBuammcrUGgQ50INjc/9hFh8UCB4L+koUWz1oInxxf1kGgNqKYoAfm
   DyAb/ZzbHxMOjwNlPDxK5ULEw2j5/9lg8vkem+s1IqsMlZipeNnSYQpNs
   A==;
X-CSE-ConnectionGUID: uNh4kUZ4SX+tjgPF/ZVCZg==
X-CSE-MsgGUID: 8vPySxbkRhqdU//0wy+muQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471560"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471560"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:40 -0700
X-CSE-ConnectionGUID: cUSLjl01TreRSEfKEtoT3A==
X-CSE-MsgGUID: UG9hoz2GT3+u65rMjcqTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224421884"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:30 -0700
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
Subject: [PATCH 01/10] resource: Add __resource_contains_unbound() for internal contains checks
Date: Tue, 24 Mar 2026 18:56:24 +0200
Message-Id: <20260324165633.4583-2-ilpo.jarvinen@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13909-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 8F85D319C01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

__find_resource_space() currently uses resource_contains() but for
tentative resources that are not yet crafted into the resource tree. As
resource_contains() checks that IORESOURCE_UNSET is not set for either
of the resources, the caller has to hack around this problem by
clearing the IORESOURCE_UNSET flag (essentially lying to
resource_contains()).

Instead of the hack, introduce __resource_contains_unbound() for cases
like this.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 include/linux/ioport.h | 20 +++++++++++++++++---
 kernel/resource.c      |  4 ++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 5533a5debf3f..19d5e04564d9 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -304,14 +304,28 @@ static inline unsigned long resource_ext_type(const struct resource *res)
 {
 	return res->flags & IORESOURCE_EXT_TYPE_BITS;
 }
-/* True iff r1 completely contains r2 */
-static inline bool resource_contains(const struct resource *r1, const struct resource *r2)
+
+/*
+ * For checking if @r1 completely contains @r2 for resources that have real
+ * addresses but are not yet crafted into the resource tree. Normally
+ * resource_contains() should be used instead of this function as it checks
+ * also IORESOURCE_UNSET flag.
+ */
+static inline bool __resource_contains_unbound(const struct resource *r1,
+					       const struct resource *r2)
 {
 	if (resource_type(r1) != resource_type(r2))
 		return false;
+
+	return r1->start <= r2->start && r1->end >= r2->end;
+}
+/* True iff r1 completely contains r2 */
+static inline bool resource_contains(const struct resource *r1, const struct resource *r2)
+{
 	if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
 		return false;
-	return r1->start <= r2->start && r1->end >= r2->end;
+
+	return __resource_contains_unbound(r1, r2);
 }
 
 /* True if any part of r1 overlaps r2 */
diff --git a/kernel/resource.c b/kernel/resource.c
index bb966699da31..1e2f1dfc0edd 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -754,7 +754,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 		/* Check for overflow after ALIGN() */
 		avail.start = ALIGN(tmp.start, constraint->align);
 		avail.end = tmp.end;
-		avail.flags = new->flags & ~IORESOURCE_UNSET;
+		avail.flags = new->flags;
 		if (avail.start >= tmp.start) {
 			alloc.flags = avail.flags;
 			if (alignf) {
@@ -765,7 +765,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 			}
 			alloc.end = alloc.start + size - 1;
 			if (alloc.start <= alloc.end &&
-			    resource_contains(&avail, &alloc)) {
+			    __resource_contains_unbound(&avail, &alloc)) {
 				new->start = alloc.start;
 				new->end = alloc.end;
 				return 0;
-- 
2.39.5


