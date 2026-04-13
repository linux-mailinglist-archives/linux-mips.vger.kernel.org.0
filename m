Return-Path: <linux-mips+bounces-14123-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IGvLhnC3Gn5VwkAu9opvQ
	(envelope-from <linux-mips+bounces-14123-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 12:14:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 674373EA727
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 12:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39F253030B92
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 10:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DE43B2FE4;
	Mon, 13 Apr 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d8axNX3o"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BAD32E6BD
	for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075164; cv=none; b=KlcIhjbpC17xe/qhwVqJMHO3+OgPAexYWo4lmI/Q5J4/A9L1Fb9UmxbbPleIJE8zy1aod6VOXjnGlJNHfK1TlCUh+wNAZPVxVwHu3rhGaxsp2TKVGQyxYe6Owrx5BBjnO0X9IA6NVBEwwBhs1yYzrTjl0BvmjS0UYK722XDLwpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075164; c=relaxed/simple;
	bh=+cuKA0hW3Mhr9Lot4t7cBlgy/y1kIy6F2PjJopYAO48=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YPmj67nOnIHxqLv0YPTV6HiQGMTde91c9aDRiL/9PAhjIg2WT41ka1e0J1EegNrh7Y6sPfatZiRfoAj+FGmqmmQoB+rqv5jmJ4ZKueHStjPn5jUBGSzt/ICQyK3MmyKllVfHFVQFMarl/4Px/ZmKQCT+QHkG20OZzzIWRIiVNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d8axNX3o; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=msyqnjspobbr5dyzcxovkdo544.protonmail; t=1776075153; x=1776334353;
	bh=NmrqvvGaEVThyoyN9jeCoqltlCrUYhMEwPF+binc+Zg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d8axNX3o05ZtWgjoPrRi38aikJVQBzXNqOt45RUGSzGSOi4cNM5GDWnpDkNMfn/JQ
	 sq32UPoRCthMaL99ZBw+jAqR8UK4rQF/ObY+l50Ifi4le3gsuAkiLo430KMg9QJraI
	 9ySdd7lxAyNi6LMQug5/8nvBNbFObU1PMLLEuX1k+yVDMhwY92M2xfKodzze253Qp0
	 DIkXnQ5AY7UusubBsbI7Hyy6DGT05PVF4je/pnCYgLAbh5QdLLGtEcFn94bKCJfpka
	 2snu6aFm0zrXc3Z/WF9fORIOaj/CK2Ro9JMCq4AFdurq1xx+moXALKXooz/f1V7hkq
	 VA1YfAoY9Sqhg==
Date: Mon, 13 Apr 2026 10:12:30 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>
Subject: [PATCH 2/2] clocksource: timer-econet-en751221: fix IRQ ack storm on interrupt handler
Message-ID: <kukRFNz-gOs6wE_tlx8tRrsA1OIoT3LiP8OLLgIYZxFMvnh3ncsCuX037qaysPkg1KHBXkbwrU8CqUmmuxilvpTdK6TOEXRVKokk_Fi4WUs=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: b5f899b12000dd336f91f8f0c29112aae929059e
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=msyqnjspobbr5dyzcxovkdo544.protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-14123-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,proton.me:dkim,proton.me:email,proton.me:mid]
X-Rspamd-Queue-Id: 674373EA727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The interrupt handler acked by writing the current count back to compare:

  iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));

Since the interrupt fires when count >=3D compare, and the counter advances
past the written value before the MMIO write reaches the peripheral, the
condition re-asserts on the same bus cycle. This causes a tight IRQ storm
on CPU0, stalling boot at T=3D62s (measured: boot never progresses past
clockevents registration).

The EcoNet GPL kernel (arch/mips/econet/time2.c, cputmr_timer_ack()) acks
by writing the *next* deadline, which puts count < compare and clears the
pending condition. Write U32_MAX (unreachable before set_next_event()
programs the real deadline), consistent with cevt_dev_init() which also
writes U32_MAX to park the compare register at init.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
---
 drivers/clocksource/timer-econet-en751221.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksou=
rce/timer-econet-en751221.c
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -68,7 +68,9 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
 =09if (!cevt_is_pending(cpu))
 =09=09return IRQ_NONE;

-=09iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+=09/* Ack: write a future value so count < compare, clearing the pending
+=09 * condition. set_next_event() will program the real deadline. */
+=09iowrite32(U32_MAX, reg_compare(cpu));
 =09dev->event_handler(dev);
 =09return IRQ_HANDLED;
 }


