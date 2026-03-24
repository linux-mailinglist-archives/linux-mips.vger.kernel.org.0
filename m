Return-Path: <linux-mips+bounces-13911-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJXQNKzDwmlflgQAu9opvQ
	(envelope-from <linux-mips+bounces-13911-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:02:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 703AA319989
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E82A9303840D
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 16:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A0A3FCB3B;
	Tue, 24 Mar 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JL9j3tQe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806BD3CF66F;
	Tue, 24 Mar 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371559; cv=none; b=R7z0RlaN4f156EJHjfeMjs8WyFjVHYYl0izmldeH0xz+h0kN2Z1a0fbQ+ib3viBaKpf4sifGu23ovU2q36y9B2lGVGZ7HfevN+NA7qGoDEOUhmis6VhGtarJZFSSvyEWAyqphy8OtG75Jmbh5NbHTft7xSdLpaNMhKVVd7yO7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371559; c=relaxed/simple;
	bh=4wZaEWcRmOK6fFyQu8mcl48M7LLtMpZtBEYXsd1Cc4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kt/+STf+a1WULvdnJwY03JoezaC82Jp5YIwieGmBpZihTYhoOHFCMKmB8EyU7dmBBV+gO91gmYWQQAWVmTmSTl+EoW/gfm+wAgtCIb3L/bx22JkEdPsfg/iff6+nYgGKYga5LC6RMWY1E9d1SG+qCQQT+/QZuCJhOSE+ZGx9KZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JL9j3tQe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371558; x=1805907558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wZaEWcRmOK6fFyQu8mcl48M7LLtMpZtBEYXsd1Cc4E=;
  b=JL9j3tQeXBYC83en/T8KiQE9JJyUH+tYKOhXXjWWAS+oIoMIcgoLgo0W
   PQ8J1LtlYKISV4O7YW4/ZBAJLct0KS1Z5n33+LDGxT8qTDxPJ/zK75RFD
   4Q3UCd0TwlbWJ4z5Q/sUv6+VUWa3Xv8xuxHm1hnJRTlnLpcZxk0cEfAtq
   lkw7v9Xlcb1JWazFzTGp0KurDx2USnkngF1b1Y6DgXdvqg53lVlYPkMCS
   XbtxgNWWfjWW8bznrWL16ZxYU3qxLOwG9lKtqEj7ilgD/My2dEzFsCQ4y
   qBALtZT9j0oKqDX4EM8Vxa9VIBnen6b1lzG9qJMUFdv5DeZsNK4U7H5Nh
   w==;
X-CSE-ConnectionGUID: Vdv1ZBH0TvqJY+mk/TDCgQ==
X-CSE-MsgGUID: GwDKocO1TBCQrsFLqMxLdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471757"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471757"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:17 -0700
X-CSE-ConnectionGUID: b26LCQzsTZi2fIETMNneag==
X-CSE-MsgGUID: WA0Ub946SXOBfg0OV/eeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224666273"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:07 -0700
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
Subject: [PATCH 03/10] resource: Rename 'tmp' variable to 'full_avail'
Date: Tue, 24 Mar 2026 18:56:26 +0200
Message-Id: <20260324165633.4583-4-ilpo.jarvinen@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13911-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 703AA319989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

__find_resource_space() has variable called 'tmp'. Rename it to
'full_avail' to better indicate its purpose.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 kernel/resource.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 1b8d3101bdc6..8c5fcb30fc33 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -727,39 +727,39 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 				 struct resource_constraint *constraint)
 {
 	struct resource *this = root->child;
-	struct resource tmp = *new, avail, alloc;
+	struct resource full_avail = *new, avail, alloc;
 	resource_alignf alignf = constraint->alignf;
 
-	tmp.start = root->start;
+	full_avail.start = root->start;
 	/*
 	 * Skip past an allocated resource that starts at 0, since the assignment
-	 * of this->start - 1 to tmp->end below would cause an underflow.
+	 * of this->start - 1 to full_avail->end below would cause an underflow.
 	 */
 	if (this && this->start == root->start) {
-		tmp.start = (this == old) ? old->start : this->end + 1;
+		full_avail.start = (this == old) ? old->start : this->end + 1;
 		this = this->sibling;
 	}
 	for(;;) {
 		if (this)
-			tmp.end = (this == old) ?  this->end : this->start - 1;
+			full_avail.end = (this == old) ?  this->end : this->start - 1;
 		else
-			tmp.end = root->end;
+			full_avail.end = root->end;
 
-		if (tmp.end < tmp.start)
+		if (full_avail.end < full_avail.start)
 			goto next;
 
-		resource_clip(&tmp, constraint->min, constraint->max);
-		arch_remove_reservations(&tmp);
+		resource_clip(&full_avail, constraint->min, constraint->max);
+		arch_remove_reservations(&full_avail);
 
 		/* Check for overflow after ALIGN() */
-		avail.start = ALIGN(tmp.start, constraint->align);
-		avail.end = tmp.end;
+		avail.start = ALIGN(full_avail.start, constraint->align);
+		avail.end = full_avail.end;
 		avail.flags = new->flags;
-		if (avail.start >= tmp.start) {
+		if (avail.start >= full_avail.start) {
 			alloc.flags = avail.flags;
 			if (alignf) {
 				alloc.start = alignf(constraint->alignf_data,
-						     &avail, &tmp,
+						     &avail, &full_avail,
 						     size, constraint->align);
 			} else {
 				alloc.start = avail.start;
@@ -777,7 +777,7 @@ next:		if (!this || this->end == root->end)
 			break;
 
 		if (this != old)
-			tmp.start = this->end + 1;
+			full_avail.start = this->end + 1;
 		this = this->sibling;
 	}
 	return -EBUSY;
-- 
2.39.5


