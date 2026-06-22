Return-Path: <linux-mips+bounces-15167-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hx7OORemOWrvvwcAu9opvQ
	(envelope-from <linux-mips+bounces-15167-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:16:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4876B270D
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:16:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=mobileye.com header.s=MoEyIP header.b=Z1Jd1NEO;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15167-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15167-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mobileye.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142B83022AB0
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 21:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDDB363C6B;
	Mon, 22 Jun 2026 21:15:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAAA1A680A;
	Mon, 22 Jun 2026 21:15:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162951; cv=none; b=HM1aIQx773M2CV+X5YTD4qZqSYikxjFJFsNo1rJbkDi4mMuIGsJRQcif0BgSjk3a7LUDpVFC4iFckaWUA0+Y+ql4cjiwXeUaSTy4jtq0ZBvdQU9DAoMh6SALMV1rSVh+UrG41VZG1HPE4Edi+hwWSkhuRB7SlmS3/2ZQkjVOMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162951; c=relaxed/simple;
	bh=0GnAklF3R5+7SV6HzFwpD4jHkQJ4qLIj7qNgFyn8Qlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq/BAHxiRXi7zU+u4MFsxPR2QrfiZbOUXiO8q9Q+Sk+vnWDCp/jNBE6asm0y7eQvudbuiuBeZLAObuMayZvC3IgspxH8N0AuNxU8Ml7n6TOGSUpw/UlQ9ARqRuT4MaY06UA1mapth1yA5q2GMPY3DRTQb5B5Y0we4DGNqc3ydSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=Z1Jd1NEO reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.147
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782162949; x=1813698949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0GnAklF3R5+7SV6HzFwpD4jHkQJ4qLIj7qNgFyn8Qlc=;
  b=Z1Jd1NEOBYjPzOOONr8BtXPReAQwKD/7X6NIqQ9NRYrKqeSbTW6BfvuM
   EjP6FL5O1+v+O+734gDIXQoerc1mk7xjldPuAnln+wJmg0hCqOde5jkjC
   pzdRLASYzk+Z4CZZth+Wx8VbA0A1ntozd8hxM3vkh/mW7n6tICinbXeAh
   J3VG3Qnm8+Upp+UjeI9rKRr61SB2ie7OFuftqo3MBL4sjA3rusHcoOImx
   YapVxZXjXPRRPQAMxg7maapMW9lCqYwKop/UHCwSLsBnjvFGfpLbBa69k
   Coq7cGGTdDR6jDnmfS/Fmgdo3P3t67zLonOi9y6RS2rEQJOVEHH5dY9zj
   g==;
X-CSE-ConnectionGUID: 5dV9yPKvSsqcueBfC3/oVQ==
X-CSE-MsgGUID: f2JYezopQyuDVvwzh1iI+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:14:39 +0300
X-CSE-ConnectionGUID: HH8ymZBcRCKEdbjQP7zapg==
X-CSE-MsgGUID: tUCgX8QNRNGOK4+kB7jsag==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 23 Jun 2026 00:19:48 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 00:14:37 +0300
From: Pnina Feder <pnina.feder@mobileye.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH 1/4] vmcoreinfo: increase vmcoreinfo buffer to 8KB
Date: Tue, 23 Jun 2026 00:14:27 +0300
Message-ID: <20260622211430.4008899-2-pnina.feder@mobileye.com>
In-Reply-To: <20260622211430.4008899-1-pnina.feder@mobileye.com>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[mobileye.com : SPF not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	R_DKIM_PERMFAIL(0.00)[mobileye.com:s=MoEyIP];
	DKIM_TRACE(0.00)[mobileye.com:~];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15167-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[pnina.feder@mobileye.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:bhe@redhat.com,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:ruirui.yang@linux.dev,m:corbet@lwn.net,m:alex@ghiti.fr,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-doc@vger.kernel.org,m:pnina.feder@mobileye.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pnina.feder@mobileye.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mobileye.com:email,mobileye.com:mid,mobileye.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F4876B270D

Additional metadata will be exported to vmcoreinfo, requiring more
buffer space than a single 4KB page provides.

Change VMCOREINFO_BYTES from PAGE_SIZE to a fixed SZ_8K. This
decouples the buffer size from the page size, avoiding waste on
architectures with large pages (e.g. 16KB on MIPS, 64KB on arm64)
while providing enough space on 4KB-page architectures like RISC-V.

The existing allocation in kimage_crash_copy_vmcoreinfo() already
uses get_order() and DIV_ROUND_UP(), so it correctly rounds up to
whole pages regardless of the constant's value.

Signed-off-by: Pnina Feder <pnina.feder@mobileye.com>
---
 include/linux/vmcore_info.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index e71518caacdf..612dcf7b9ecd 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -20,7 +20,8 @@
 				     CRASH_CORE_NOTE_NAME_BYTES +	\
 				     CRASH_CORE_NOTE_DESC_BYTES)
 
-#define VMCOREINFO_BYTES	   PAGE_SIZE
+/* Fixed size independent of PAGE_SIZE to avoid waste on large-page archs */
+#define VMCOREINFO_BYTES	   SZ_8K
 #define VMCOREINFO_NOTE_NAME	   "VMCOREINFO"
 #define VMCOREINFO_NOTE_NAME_BYTES ALIGN(sizeof(VMCOREINFO_NOTE_NAME), 4)
 #define VMCOREINFO_NOTE_SIZE	   ((CRASH_CORE_NOTE_HEAD_BYTES * 2) +	\
-- 
2.43.0


