Return-Path: <linux-mips+bounces-13306-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPbVMuyCpWmxCwYAu9opvQ
	(envelope-from <linux-mips+bounces-13306-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Mar 2026 13:30:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881E1D8792
	for <lists+linux-mips@lfdr.de>; Mon, 02 Mar 2026 13:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80B1730D9500
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2026 12:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FFD36CDEA;
	Mon,  2 Mar 2026 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rxZQv7hK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4UlDmyzz"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258836C9F8;
	Mon,  2 Mar 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454349; cv=none; b=VOwTbrHAqk5gk46mZ/GxD0D/Xnqs4l3gljclx70R5B7gMhbuxlFN5vYByB367W0tqRA1wcR+qmJZi1oYlzdiUXkXn/PFV2HazemP1UIRA2YWl2yoXtWuKaj+dmCX4913hXZs+QdTmndtxCiIf8TZLR0zaNp9JGOMYKQQ89JRELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454349; c=relaxed/simple;
	bh=x3siZYFPocmk1PJ7pJ2spSV3FxjnTs1Nv3DHpd4VwUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvdJFyFzJ+WirLbFBGUjgVIbVqT9v56XaJvnvv1fj9kPW8RIxmXVlX/eRFakIh6nW/q2WtmLlOkP+qovYEbdaPYjAFBfCsJo3pZtJVIQmOj71frzS3+KyfMHp3Jt6kEsDf/TFMtYUEovtcJ+Rz/UQGahKSv/w2gjGZ/sPV7Wabw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rxZQv7hK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4UlDmyzz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=rxZQv7hKeFYWJyFKJsUWMqNlbl2vjnSpyMUWvtbM+KVkUK8WaqYOWnhTleOFkje/NFvInP
	Qt/vVXUdfFnn1iq74C1RCTqwoqvw522r7PU2TEuWmhtnt/N+13u0BFDqvSJ9+N50ZjfS4U
	BSarBmo8rYOEJLTRt0ek/3O3vhTop7sJQum0OPLLRalA9vrZx9iZHrKfjYg84JldDBDnZA
	t0WwlWRm4tnjSIcfZAdKa6/AeBM96TDCbJDRytzgPtYIaNnWXkYcPaqvUu9PXVyIRi67Kg
	DLHn9Iv+m+Ef7KGJDn9Agiynrv+ZuTEFjtwN8a9glkN8hM57G/egFrrJPWtgeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=4UlDmyzzjetdRsu/XceNY6w9k+iZB9u+rg7F/k0y7+4PQofKHMuBzzowktpEfzJO2FIgmM
	N2iAdlv556mYd5Bg==
Date: Mon, 02 Mar 2026 13:25:28 +0100
Subject: [PATCH 04/15] ARM: drop custom asm/auxvec.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-4-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=481;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=x3siZYFPocmk1PJ7pJ2spSV3FxjnTs1Nv3DHpd4VwUE=;
 b=rDZhb8bdTw53LKoUbzecX+TybS3+vD/iuZGnWTOdu4kbPRoekZDJcE/myi94bDcvoXoVfIa/j
 i0gchlTXUzRD5/MoKkZ/K9H2k8m5yzGUuEJql+dJlXH03noNQrp6bhu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13306-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3881E1D8792
X-Rspamd-Action: no action

With the introduction of asm-generic/auxvec.h, this header unnecessary.

Drop it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/auxvec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/auxvec.h b/arch/arm/include/asm/auxvec.h
deleted file mode 100644
index fbd388c46299..000000000000
--- a/arch/arm/include/asm/auxvec.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <uapi/asm/auxvec.h>

-- 
2.53.0


