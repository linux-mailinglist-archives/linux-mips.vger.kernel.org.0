Return-Path: <linux-mips+bounces-14603-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNUZLvi2CGp42QMAu9opvQ
	(envelope-from <linux-mips+bounces-14603-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 20:27:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E255D188
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 20:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9C363009F25
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 18:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373E63264EC;
	Sat, 16 May 2026 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="mXB6497q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88A31F993;
	Sat, 16 May 2026 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956022; cv=none; b=WXO8jJfSGmlvPJHgKgFuLmYpKm5URJniG2zqT+8o4O3Aqm/6GF9rswxZNtSgM+TjWMxOCtflfCDrsMrxwgU5s1o9qbAIbpWsOXAcALIe0ulm80Q1/EMf9aF0z+G97z+8+LDQxoEkM7ucScYjgHiPW5HCVDQfgcf+sGDCVHoksao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956022; c=relaxed/simple;
	bh=d8Wueu14zhZIcAI8uKCM4xjBPCKgT66DtyCpdUB0j14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HDDBB9JnT5X3uXKI5LdDVw9JtXNh84lnY20xS92pi+mmxe25r5kIXmr57jjn3yCXnoaZV6EZyMuAI9QFLyDoB3NejjGoIoB0jTv0IVxUy9I2qR+0rXLxtWHjk4Ulhj4RrnJniL7VQpYk1HmyJ7qiWigDU5WAhMxNsS6nMuuEPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=mXB6497q; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE9873F5266;
	Sat, 16 May 2026 20:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778956012; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ti9n0EFtAnJw8VEHO39mfc+a6/KoDQ9GtrVRKrLAzw0=;
	b=mXB6497qZoaYfpIttEltXLuB4koVQtNluCNAvCws2Z7iwUwZwpqVS5Facx7qme2JHfxhx6
	x7E1x8nDXLCmihODFR9Y5+hCsKCtKf0rzj7csXev4LjInLLYfcQOjwKoW/wiP1gjuVaXnF
	3BAcwuR7HTYlDa0s/DRtjnxc+vEPEuq4QAsAlieQtmMXOfTYG0gxXPGzuOaUmMbG3UKO6N
	g05B4mjYzTIIKTQCyCgR1WHTNnbT46XBrRzudQYwGRBp21wWLiqI8EdlsHCgHJXKKdE20M
	U3W28CW0jqG2aS7SzygscA4DupIjBQEWsOKhC/+t8FmWJ5o5NI3WDK93vMyuVg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 0/4] clocksource/timer-econet-en751221: Support irq number per timer
Date: Sat, 16 May 2026 18:26:44 +0000
Message-Id: <20260516182648.3987792-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 574E255D188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,cjdns.fr];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14603-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Action: no action

I decided to take this patchset in a slightly different direction from
v2. There is a certain amount of initialization that once it has run,
it cannot be reverted in case of error. The original driver init was a
mixture of revertible and non-revertible code which made it too easy
for code which is designed with best practices in mind to in fact
introduce a bug. Therefore I start by making the init process more
legible but without any business logic changes, then fix a race
condition by keeping IRQ disabled until after cevt is setup, then
finally add non-percpu IRQ support.

* v2: https://lore.kernel.org/linux-mips/20260514000601.3430262-1-cjd@cjdns.fr

Changes from v1:
* Split changes over 3 refactoring patches + main patch
* Remove driver discussion from dt commit message
* v1: https://lore.kernel.org/linux-mips/20260416175101.958073-1-cjd@cjdns.fr/


Caleb James DeLisle (4):
  dt-bindings: timer: econet: Update EN751627 for multi-IRQ
  clocksource/timer-econet-en751221: Init teardown on error if possible
  clocksource/timer-econet-en751221: Disable IRQ until cevt registered
  clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

 .../bindings/timer/econet,en751221-timer.yaml |  23 ++-
 drivers/clocksource/timer-econet-en751221.c   | 159 +++++++++++++-----
 2 files changed, 136 insertions(+), 46 deletions(-)


base-commit: ff1c0c5d07028a84837950b619d30da623f8ddb2
-- 
2.39.5


