Return-Path: <linux-mips+bounces-14057-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKgaKc7u0ml/cQcAu9opvQ
	(envelope-from <linux-mips+bounces-14057-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:22:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3AF3A02CF
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF13300A538
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 23:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85295385533;
	Sun,  5 Apr 2026 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="NJjDw7+t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113653845C2
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431349; cv=none; b=IrNlYAHl1jhrZKgTgdzR1V8SAFkKHvAZ5NBhGWh2wsnOpaXApMk642KU/X7+2vuvbRcgFxuBAgphuJRIYBLi1Bez8manSzzvKRd48kHcrNH6RmbP9XgaTQTmdHQ1RejF/BHu9ISC564+FWeFBZ4r8B8frW+U1u/pU581RdKo4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431349; c=relaxed/simple;
	bh=0lUBhcQ6S0rkddxw4gAcRSXKIRg053qEDbfxRaxNt7g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ZD32h9x9LAEKD35gwaoKM+EUw2phniZh4xDyhSHxkVJmfEDS47nO2Y7EYo8Xm3GRTyMNgbwXpTerr+A36Acf+12+sg9xCfRiRc18p/zoIpyC3T6xDbJYqy+k+qEk/Dn35vtcrBmFbJJfZrbiEGdeTWx6rTphACpZeJHa4MveUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=NJjDw7+t; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fppQW3XPbzDqRh
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775431347; bh=YZ5N7NxDG4+KvAZEW1C/CGk/zUTGW4ZKLpmHGc/HY1s=;
	h=Date:From:Subject:To:Cc:From;
	b=NJjDw7+tOEzECMDfwIA1n0SoT0i8DCguajBU7n0+oz8jHBzrlAdNRK2x/S8JesSfc
	 3ZUBIUU/1uM1CHCuJcgVZ6MbBHlgsuWGtd8j6W22ddHRYD9WCHTq+b+zjKeSkJw526
	 vJ/Ouuj1SK5K3KXU/wJkMNS5RYnx2pdfmxsk5yqU=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4fppQP525Nz9vtZ;
	Sun,  5 Apr 2026 23:22:21 +0000 (UTC)
X-Riseup-User-ID: A7BB02700D92A1EC4933AF14070D96339C6752B11457DD150F06B5EF73B7FA57
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4fppQN4QlDz22Ml;
	Sun,  5 Apr 2026 23:22:20 +0000 (UTC)
Message-ID: <9ebefe97-03b6-47cd-b786-ce3ed3f7d5fb@riseup.net>
Date: Mon, 6 Apr 2026 02:22:20 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rany Hany <rany_hany@riseup.net>
Subject: [PATCH 1/3] MIPS: Stop secondary CPUs before platform
 restart/halt/poweroff
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14057-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5C3AF3A02CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

smp_send_stop() was placed after the platform restart, halt, and
power-off callbacks. These callbacks never return, so smp_send_stop()
was dead code and secondary CPUs were never stopped before the system
reset. Move smp_send_stop() before the callbacks.

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



