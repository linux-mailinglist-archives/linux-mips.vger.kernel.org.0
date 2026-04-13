Return-Path: <linux-mips+bounces-14137-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJAsCzYa3WknaAkAu9opvQ
	(envelope-from <linux-mips+bounces-14137-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 18:30:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277D3EF1E1
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 18:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26253130FDD
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF830282F27;
	Mon, 13 Apr 2026 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kdT0O4eK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E28272E7C
	for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2026 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096298; cv=none; b=oAUD8fB2kRX+V0/QtLXjzuc9Gpo47lTZDvgIKCPd5dmyrXKMfHa9nXc9KZC41QpfLF0ZNxmIUrkwQgogkH6jX0aa5YXkdwXyq/s2fDDxIuIH2uapq3H6gfVB5osWpJQ9AKb9ti+WWJzDau70F8+3wbH9ga5asWOZsccUOnWIoBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096298; c=relaxed/simple;
	bh=peegSiaVp3GynQKbkn019iXDc07O1MQmZKS/ttHLta0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MnfD0lfhM4rg5BY8MQGc8AkrZ+AUdOrVwzH1njO6ABPkwLuE4EtoPpsudeg2ppMmtOSbz6QcfGWWsh8zvDXodZOtfcUy31hlf7X9XKKs9LpQ4huDZwk+b/WWC89QEw5/osD4Xb0RDyGLJtjHBFa7Q81yz6W5fBZp/pp/Y0KMB90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kdT0O4eK; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776096293; x=1776355493;
	bh=de4GFTB3XVv68uxJ7Df3HD4xaPxu+i7SQdwOEYwMIhU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kdT0O4eKplLtZnYyR+2vY9rZs9oEFCS9iWHg47M9gxemiF5BoCmqUulDs+xKryivs
	 oF0kYW9l5BVaxDFEh7E0YvfjZav84wBMpGuwTuHwrJxWGmV1epLdeon0V07MjiLqCq
	 pGy8s23d42RlmxMPD6SnN6ADCaX9O/6FgYeYbkYa+pdU+eIRt4mlJPzTDg85JMV9yZ
	 16LVqRQy8+Rqt6npG3Z1VFwRPPJVkUQ3GipKWnM+7J3VejdBsltJbIEkQoBQIy9nD9
	 PkUykXiWKOI9NwGjU8FqSzCJlGaUbk2EpwI7KML5WNemwWLhABf/qbKJnDVx+l7/n4
	 YUzG5itq3MJ9g==
Date: Mon, 13 Apr 2026 16:04:49 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>, "naseefkm@gmail.com" <naseefkm@gmail.com>
Subject: [PATCH v2 2/2] clocksource: timer-econet-en751221: fix IRQ ack storm on interrupt handler
Message-ID: <cAKrsEu2h3qUcucFHNb4TH61fInUPSG1Z6gefgAecIzRCGrhzAflYboWuY7ANYSLaGoEbH6_ypWsmMGv9IituYBbiWoR9y6Ux29IBA7ozCM=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: 733b301796039b25d396a0ea1053ae2c47f49f5b
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
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alpha.franken.de,cjdns.fr,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14137-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:dkim,proton.me:email,proton.me:mid]
X-Rspamd-Queue-Id: 8277D3EF1E1
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
 drivers/clocksource/timer-econet-en751221.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksou=
rce/timer-econet-en751221.c
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -68,6 +68,10 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
 =09if (!cevt_is_pending(cpu))
 =09=09return IRQ_NONE;

-=09iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+=09/*
+=09 * Ack: write a future value so count < compare, clearing the pending
+=09 * condition. set_next_event() will program the real deadline.
+=09 */
+=09iowrite32(U32_MAX, reg_compare(cpu));
 =09dev->event_handler(dev);
 =09return IRQ_HANDLED;
 }


