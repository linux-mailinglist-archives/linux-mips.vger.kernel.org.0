Return-Path: <linux-mips+bounces-12996-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHbPG+wBdGke1QAAu9opvQ
	(envelope-from <linux-mips+bounces-12996-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 00:19:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53D7B72E
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 00:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 253FF301C12A
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 23:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6A32F0C46;
	Fri, 23 Jan 2026 23:18:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49862DD60F;
	Fri, 23 Jan 2026 23:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210282; cv=none; b=q08Vzpq82FjCDp7PakDgeV+/Wfi0Rz8oPqN48FYFtIcaqTNoi1TXlDyedRY6/wxXCXlavUoUjYebbBh950eoRUYUugRnLRMHSflUMDvZrQWQAV+7l2Y9ybtoQqfpYDEdwthCHvkHzINQH8oKbkplbmRxQPQb5Gov/zbWoxbVvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210282; c=relaxed/simple;
	bh=idtFNnu3TLFsOUxuYoangUgimFXI9yYD+m8xKSAod+M=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=SDxEjrbs9uxYHpcK18ZK24hlY8jwuCLOe932FD7/vUJBqTrdhGM62OSEqC81YYOf3i6SyO6E3AfQChmx3FAJDpN4ZKfCPNM1453nT+ptxTPEdva5MeWUECTQrsJwcDTgXP3uRTXn0d8y6PXcuRch0uALouPLkZEFFBfFgjReokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linutronix.de; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 24 Jan 2026 00:17:57 +0100
Message-ID: <20260123231521.858743259@kernel.org>
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 John Stultz <jstultz@google.com>,
 Waiman Long <longman@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jiri Wiesner <jwiesner@suse.de>,
 Daniel J Blueman <daniel@quora.org>,
 Scott Hamilton <scott.hamilton@eviden.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org
Subject: [patch 4/5] clocksource: Dont use non-continuous clocksources as
 watchdog
References: <20260123230651.688818373@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,quora.org,eviden.com,gmx.de,vger.kernel.org,alpha.franken.de];
	TAGGED_FROM(0.00)[bounces-12996-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF53D7B72E
X-Rspamd-Action: no action

Using a non-continuous aka untrusted clocksource as a watchdog for another
untrusted clocksource is equivalent to putting the fox in charge of the
henhouse.

That's especially true with the jiffies clocksource which depends on
interrupt delivery based on a periodic timer. Neither the frequency of that
timer is trustworthy nor the kernel's ability to react on it in a timely
manner and rearm it if it is not self rearming.

Just don't bother to deal with this. It's not worth the trouble and only
relevant to museum piece hardware.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 kernel/time/clocksource.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -651,6 +651,13 @@ static void clocksource_select_watchdog(
 		if (cs->flags & CLOCK_SOURCE_MUST_VERIFY)
 			continue;
 
+		/*
+		 * If it's not continuous, don't put the fox in charge of
+		 * the henhouse.
+		 */
+		if (!(cs->flags & CLOCK_SOURCE_IS_CONTINUOUS))
+			continue;
+
 		/* Skip current if we were requested for a fallback. */
 		if (fallback && cs == old_wd)
 			continue;


