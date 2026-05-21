Return-Path: <linux-mips+bounces-14663-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B+1DeWrDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14663-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:53:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5E59FB3B
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72B25301AFD0
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B84386C2C;
	Thu, 21 May 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ClZiqWOI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yXA5RG9C"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5ED384CF6;
	Thu, 21 May 2026 06:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346402; cv=none; b=W9aBt4+RvIL0jqa51cK2Wk0ja26fpjOo810U55ZUmED10N03fAFRiaht32n+cStXH3ERK0MankOhl7j3t29SNqh+ozdtFRlxN137Vo0SBjaLp4q5sJ8/+WbybUl8ErxtKIjBVi28LMGcSnubG0/r6gyFN+C6CcV4kjeomzomMq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346402; c=relaxed/simple;
	bh=13cLvGZZ6A4vhrhuxgcectzpmVhX9ANUNsQxSTkRb6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHWLuAZ4e8KUpmL7l91h9RHH9OJzW14w1EU6mc+RALPGQXMnnum/pgep5hhOgLq6KI1y2ZsMQqp5HoPTJ7cpl+w1T3yIbkNs9kp1rQK2vgB8mUrDJvQNYKE5+34rrZkqi3z+zo6GbbieNHke10e8ThhRjWazmScPe2jdn0IntQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ClZiqWOI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yXA5RG9C; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQ37MDaIkKRVYt3r1jO04bLsBtL2wGv/MXye3TsflZE=;
	b=ClZiqWOISRcFWpI3PU3taoOBMYLnaLMdke8aE6+HRa9GDyk722T2F7o65lbpKXpwH35yOY
	P2ig3wPTlT+eKEaAhg6p2nNr8ABqlx5zf8sbjNw/OLTrEPqiOKtUr9qvsdICGZpIxnpLoF
	wEr8fgO+nWVvpXMYOMt/0hii/n4yfhHvasxBWty3c0m41SZPbiHdlUv3xg3ZVTrxgotBRf
	JQ/BuzjrEE91exvz26JlahFBfr0N5fKOpLIMZR69WHpEl/XOYiyvHlchC0Gf+uzh2pEYgd
	vpVMsrQfgTJPp2t2/lhkQNSWK7nleNyI9JYqLWGLumXKYdFKcp5L8KcLeDdulA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQ37MDaIkKRVYt3r1jO04bLsBtL2wGv/MXye3TsflZE=;
	b=yXA5RG9Ch/rLqv598qMUGE8af+04AOARKjblxxHgzwucSfIFZamWU9Gsg0Y5nK2lMVXcCS
	6nuVlHocJIK6RtBQ==
Date: Thu, 21 May 2026 08:53:15 +0200
Subject: [PATCH 1/9] MAINTAINERS: Add include/linux/vdso_datastore.h to
 vDSO block
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-1-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=624;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=13cLvGZZ6A4vhrhuxgcectzpmVhX9ANUNsQxSTkRb6Y=;
 b=53VhIkX1OIPoSRu+fMfGTfL42cx9Tns+s6i8sIpz/vGTNsuxqhPZa0qeRHLWuUoHKCGxIxE1f
 kPBkAkMm+ENBViQoab7DMXMToItpO50WSdrIb+/BWazvIg/yH5kxMA2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14663-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: D3B5E59FB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This file is part of the generic vDSO subsystem.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..e1ba3826ef53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10857,6 +10857,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
 F:	include/asm-generic/vdso/vsyscall.h
+F:	include/linux/vdso_datastore.h
 F:	include/vdso/
 F:	kernel/time/namespace_vdso.c
 F:	kernel/time/vsyscall.c

-- 
2.54.0


