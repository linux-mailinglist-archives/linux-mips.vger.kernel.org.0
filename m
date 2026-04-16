Return-Path: <linux-mips+bounces-14178-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKl8Bf4i4WkBpgAAu9opvQ
	(envelope-from <linux-mips+bounces-14178-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 19:57:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A44135F3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 19:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A80303009FBE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430EE2737E0;
	Thu, 16 Apr 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="giLrKqEz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EFD221275;
	Thu, 16 Apr 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361875; cv=none; b=q6hSUTmrnmvEgiDGaZamdD59g4wv6i+0k+2+nsOFnOb7N6MyBn6weXQxG/RNAfNxmdtqyJ1U+dpWVQ+duig0OADEfUFlobVlq3NUYINn4uGUdyK7KzN1xcRMIihplMqM+mcsR/oUd4H9Zyi1EJc178dIaiXxTRRsMXZN2K4CvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361875; c=relaxed/simple;
	bh=yuQWORxJKRnUyRGZmBa1Cz2oUxC9/FiTLkK0A21tAOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BfZs8mgihLVGLdk+GlnRfbSQ/iheb0pBNFimcKVuByGw76EzH3/fs3AYARmvny4j+SuCLLSQAW2hccuIqgDbJ3WXhMgXkfngGxq6dcYm9RUyytEll5zOnJUGoLAclihswO5iURFthMlSE/tb/ZyBAzb0jYljSNlJyhM5eVicH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=giLrKqEz; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF4DBFBF63;
	Thu, 16 Apr 2026 19:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1776361865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=09cXq4kMFgSJtMoxapD51NPJqiDpj1lEGNS2iDhOrMU=;
	b=giLrKqEz7yi5TNG06JZtaEGiBXcIQRM3vgQtD6Dm9njuiFFi+ixt57ufxLbvKZBQv9cTZp
	0XCsGdjFWv1xnke1a45cAqscJIZxmro4Gx6WzwAcBP1i9Ng2QbwACOjtptddpIAY6EYddy
	1jvq+pn/gX+VBhIJJD0kZyw5Mkvi48B+z8PrlNB3ug/xq8ywXtss2FlFgoj+d8HclQu2tl
	9Q3Lk496trtR0TAmBTeZy7laCSwJXpU55cR0TpPVmoF5UMBj1cizkbzE5bDzf8W0S1EQkO
	5UuvkKFdIKLYJVaa8O7tsJjJZG6D2ju8Pg6TUh7U0u3hp9C9DQR/jLf4PwyFHw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] clocksource/timer-econet-en751221: Support irq number per timer
Date: Thu, 16 Apr 2026 17:50:59 +0000
Message-Id: <20260416175101.958073-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14178-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:mid]
X-Rspamd-Queue-Id: 647A44135F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In prep for adding EN751627 and EN7528 SoCs, we need to support the GIC
interrupt controller. Unlike the intc in the EN751221, this intc does
not create a percpu interrupt for the timers, so we update the timer
driver to support both models.

Caleb James DeLisle (2):
  dt-bindings: timer: econet: Update EN751627 for multi-IRQ
  clocksource/timer-econet-en751221: Support irq number per timer

 .../bindings/timer/econet,en751221-timer.yaml |  16 +-
 drivers/clocksource/Kconfig                   |   5 +-
 drivers/clocksource/timer-econet-en751221.c   | 137 ++++++++++++++----
 3 files changed, 127 insertions(+), 31 deletions(-)


base-commit: ff1c0c5d07028a84837950b619d30da623f8ddb2
-- 
2.39.5


