Return-Path: <linux-mips+bounces-8564-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BDAA8572F
	for <lists+linux-mips@lfdr.de>; Fri, 11 Apr 2025 11:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EFD11B62AEB
	for <lists+linux-mips@lfdr.de>; Fri, 11 Apr 2025 09:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0604728FFF4;
	Fri, 11 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RnMub+sY"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5051EFFB0
	for <linux-mips@vger.kernel.org>; Fri, 11 Apr 2025 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362059; cv=none; b=acz8Y5WstfBD3D1OUbb86rs4LkNMTX0xI3ASUFZ3eWve7btuVVQbDUD0RW9RWz5Lif73NaAnCWeXNQZukO7fyCjOKAtFba//ACBvcyDFaw5PRGsfneCmR5HjyBUGMuQJWaNhEaQuxykUBXaG4Yi1oUkRvWq4NUaQwgOAvLeVYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362059; c=relaxed/simple;
	bh=AuFbb9Im5wZZ7hywLyUl0mj64HOD1UiDMpJHPP5JD0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLsgc1LFlOX+/WN7Qg9Bsmwn3K4Xykae/4pIOsEWErClCPzetIQq8jNPLkMv2acAWseT1sn3lqHkCw6QkjCmhpKMgmwcnr8ZpYUqmMl6kN/FGzSsc5mVuEj0x8fZcXMbCV1xgqqSFavcUKfZzEa9DHxhyhOmnExXyWQcTgu3Kbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RnMub+sY; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744362046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RjKO2M3p+Cll4XnVzn0mEDiJxphotJjwp94db8HB+CY=;
	b=RnMub+sYvLcT+leWxjHL66XzWbidJYObTw74cPurm/KeECv9+RYGTf9EXXBi3o42SV2WFg
	SLPNNyCEm/wsfw/gyprA4m916Whnx5+13SaPINS5eoFTTO6OnT5rY7Ddc0XmOr11WY21lx
	Getas07m6yRScE+9T0LLstyxRGsIS8Q=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Oleg Nesterov <oleg@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Remove unnecessary zero-length struct member
Date: Fri, 11 Apr 2025 11:00:32 +0200
Message-ID: <20250411090032.7844-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the zero-length struct member '__last' and use sizeof() to
calculate the value for MAX_REG_OFFSET.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/include/asm/ptrace.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index 85fa9962266a..1bb10ee8c2ce 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -48,7 +48,6 @@ struct pt_regs {
 	unsigned long long mpl[6];        /* MTM{0-5} */
 	unsigned long long mtp[6];        /* MTP{0-5} */
 #endif
-	unsigned long __last[0];
 } __aligned(8);
 
 static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
@@ -65,7 +64,7 @@ static inline void instruction_pointer_set(struct pt_regs *regs,
 
 /* Query offset/name of register from its name/offset */
 extern int regs_query_register_offset(const char *name);
-#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
+#define MAX_REG_OFFSET (sizeof(struct pt_regs))
 
 /**
  * regs_get_register() - get register value from its offset
-- 
2.49.0


