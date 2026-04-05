Return-Path: <linux-mips+bounces-14062-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKLxFKb30mmzcgcAu9opvQ
	(envelope-from <linux-mips+bounces-14062-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 02:00:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C13A0AB6
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 02:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 625703002B3B
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 00:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE2025A2C6;
	Mon,  6 Apr 2026 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="boSDY5o+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339633262C
	for <linux-mips@vger.kernel.org>; Mon,  6 Apr 2026 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433631; cv=none; b=RvWqYx1RWwsaR7mlQuGpBWA7pL2H83oet88V1sMDBPW9bdAcdC0T5pUQQ8XVk+kxsPUVgsxt9SPkO+ww8rW7cTbQEWb8QW1OEFIsZ7c41Kbhf2+jwf5l4Y7oQSAYIwSp3cPfnUDtXzbvVnbHQw4Olz0oNXKaWAqmNWR+PmtI00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433631; c=relaxed/simple;
	bh=0wGIuDnhgmSMCIXUcnnFBP1D5zD0z8SHvprnOYg4gTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAGydnv4o+ERhR2O+FQeMV2lEeSdr6E/p5Hm6onKBSJhzAAXbnRYI7BqVCAUEr23+CanJYc8KT+UMHt7cnNgfJrRtyIlMXbkwTqHUsGfJjDqejkuCWHWqj6GaopWLwdCLJw349RaUsHUBaCbGreVsVfJbbG6bScqHnH6i6RteE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=boSDY5o+; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4fpqGQ0zNfz9s1x;
	Mon,  6 Apr 2026 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775433630; bh=noUZT6B6rmt+9t+9dOOTGHKgQ8qZJByMqOAJIB5GHc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=boSDY5o+7gIWWSNcP53x26yDLYsyaAymJEKseuZ+zloPMUcVvMA76C6pxsYAatpLT
	 qp8fPHCkoAYLxn+piUHpNZgz0ngQC8r4azJDhNOHa3iYXhb87n2rkypDE2KEQ/qDdj
	 ZNKdUvSDDrbuj9bnsiuhlytELaZH/mGNy6VKvlFA=
X-Riseup-User-ID: 2710F069713B2AEC70BA075A6BDDBE04F92BEEA98C2BDE5364533CE4155A0264
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4fpqGN5KcFz1yLn;
	Mon,  6 Apr 2026 00:00:28 +0000 (UTC)
From: Rany Hany <rany_hany@riseup.net>
To: linux-mips@vger.kernel.org
Cc: Rany Hany <rany_hany@riseup.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 1/3] MIPS: Stop secondary CPUs before platform restart/halt/poweroff
Date: Mon,  6 Apr 2026 02:59:53 +0300
Message-ID: <20260405235956.79535-2-rany_hany@riseup.net>
In-Reply-To: <20260405235956.79535-1-rany_hany@riseup.net>
References: <20260405235956.79535-1-rany_hany@riseup.net>
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
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14062-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B4C13A0AB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

smp_send_stop() was placed after the platform restart, halt, and
power-off callbacks. These callbacks never return, so smp_send_stop()
was dead code and secondary CPUs were never stopped before the system
reset.

Move smp_send_stop() before the callbacks.

Signed-off-by: Rany Hany <rany_hany@riseup.net>
---
 arch/mips/kernel/reset.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index e7ce07b3e..12c54d1b7 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -87,13 +87,14 @@ static void machine_hang(void)
 
 void machine_restart(char *command)
 {
-	if (_machine_restart)
-		_machine_restart(command);
-
 #ifdef CONFIG_SMP
 	preempt_disable();
 	smp_send_stop();
 #endif
+
+	if (_machine_restart)
+		_machine_restart(command);
+
 	do_kernel_restart(command);
 	mdelay(1000);
 	pr_emerg("Reboot failed -- System halted\n");
@@ -102,23 +103,25 @@ void machine_restart(char *command)
 
 void machine_halt(void)
 {
-	if (_machine_halt)
-		_machine_halt();
-
 #ifdef CONFIG_SMP
 	preempt_disable();
 	smp_send_stop();
 #endif
+
+	if (_machine_halt)
+		_machine_halt();
+
 	machine_hang();
 }
 
 void machine_power_off(void)
 {
-	do_kernel_power_off();
-
 #ifdef CONFIG_SMP
 	preempt_disable();
 	smp_send_stop();
 #endif
+
+	do_kernel_power_off();
+
 	machine_hang();
 }
-- 
2.53.0


