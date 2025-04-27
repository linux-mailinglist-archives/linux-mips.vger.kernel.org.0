Return-Path: <linux-mips+bounces-8807-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4CA9E2C7
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 13:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 571B73ACF34
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 11:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EAA1922DD;
	Sun, 27 Apr 2025 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CVi/hRLo"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC76C17A2F0
	for <linux-mips@vger.kernel.org>; Sun, 27 Apr 2025 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753729; cv=none; b=RD3tFWUqfy60C9Uj0znK/S8zXRjwudNgD8e7lknGVmYynQEltnJUcqt+wUbsJXt/Os4ATzGqN3PTxIRBEx1/HqmeH0hQo2mnR+xGvIifwVm1yxZbSZRCH8PyL729oMgiqSHODt/CUwjlxypvEQfGUcPLiReEcal93P9+iAKYOlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753729; c=relaxed/simple;
	bh=jmvndnXismTNZl16DZ1DIdluALOH15b+ESCZyIyPXO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7JppDPPQtvrKOFyZJH3q+xoUHGbldNBdmVn3DN1hTNj8QiEhFRsZdkpvxZncCT23geLlGHGUUIltAzFBsdNSi9N8IHCrguOvEDa99vx9ahDJUgP47ZqZDCW3fjErLBq+kBi1P2v/uhk0U0yPsEeK07e7uMmNb61cwn5SO9UCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CVi/hRLo; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745753722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hW4519CYvEA+gdkgAaMdE31EOuLdWmzDYGdg411anRE=;
	b=CVi/hRLo9aiX4RAl4jdxPta5M5UJDDubLc3IsviJ3VPH2NBGChnmoyzijVL+ngINTZkWUN
	1ddqYuTWLakyvmS5OIjp5CMID6b74yXmzEuns5csfTUg0zrXW//rckxpTN2pliTL4iFxuz
	AeoTbyP6m0MCEETg3POpVxXZm076Jsg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Oleg Nesterov <oleg@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
Date: Sun, 27 Apr 2025 13:34:24 +0200
Message-ID: <20250427113423.67040-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix MAX_REG_OFFSET to point to the last register in 'pt_regs' and not to
the marker itself, which could allow regs_get_register() to return an
invalid offset.

Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only.

Changes in v2:
- Fix MAX_REG_OFFSET as suggested by Maciej (thanks!)
- Link to v1: https://lore.kernel.org/lkml/20250411090032.7844-1-thorsten.blum@linux.dev/

Changes in v3:
- Keep the marker and avoid using #ifdef by adjusting MAX_REG_OFFSET as
  suggested by Thomas and Maciej
- Link to v2: https://lore.kernel.org/lkml/20250417174712.69292-2-thorsten.blum@linux.dev/
---
 arch/mips/include/asm/ptrace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index 85fa9962266a..ef72c46b5568 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -65,7 +65,8 @@ static inline void instruction_pointer_set(struct pt_regs *regs,
 
 /* Query offset/name of register from its name/offset */
 extern int regs_query_register_offset(const char *name);
-#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
+#define MAX_REG_OFFSET \
+	(offsetof(struct pt_regs, __last) - sizeof(unsigned long))
 
 /**
  * regs_get_register() - get register value from its offset
-- 
2.49.0


