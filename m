Return-Path: <linux-mips+bounces-14608-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N3FMU7oCGp4+gMAu9opvQ
	(envelope-from <linux-mips+bounces-14608-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:57:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157B55DFCA
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D94DF300FEEA
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 21:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2D737C0FA;
	Sat, 16 May 2026 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="cSzh7U4D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58E1F30A4;
	Sat, 16 May 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968650; cv=none; b=H691DYuVT5xfLoC8p/TZwOJ5+M6gCGicC16WUXjqubc+DYWesmQmKfglhmQ+XMGrJgb+x00VyanpuxBWouImUid/jIjUBR+Ecckh+rtWopCJMyTHwqeDwVI9ArH95ajV9+YkoBLmqqAWdZsJ7KyR6ptkdwdXAaTx0ZA2ziFGdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968650; c=relaxed/simple;
	bh=VgOGJRXlv/K3CBfC1DsWZ2UI7ACptVTWwxX2N7QJe+k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aPYhgtdZFb5pYL0e/TCCUR2jHBT6+fa094lRb+XR5Q0QZUULj8LueeY21xHtyh+re01nrOMBxrH/W87g+/zmsGs6pXz12SszhYNAduN1oSUlagt4ql++6T7K13MyCI+Q85AM1ALlscsm8mziXULRwjCppLUY13RtbWhOE0K3hEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=cSzh7U4D; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 237353FA109;
	Sat, 16 May 2026 23:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778968646; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/+A3JxfQ08H2sAreXGvOUI3Q1ChhXAgCuiOtdRCr8eM=;
	b=cSzh7U4D+8wqnvsdcTsI3sLY8jslr3sGlqm9Wxzi68sC1EQg0MSiz3xsdFfzlRH1Z9ZVFn
	ZMd0fmzqaTnttO+S9hK4+RurT4PzuC4AaPC/+Wjt3Rvc34Z7UjOKq9U4LdXf0TNEK/wTnS
	DyYSkxYYMpDYJqfKWqlN+pT7rYAeCC+KQ6ka4u6N0DzaPuiepyoJKsWsdRBwaDoVAjbWp6
	3n4LH4mijpPCyx0+8VKVIwH1qFufC+nL8AxJWTSqSkm5GNH3RYb9/vPUiXxL13DJATNRnO
	4HN7EtHT9gZEzNdWEk+P7ZMTOzsnRpuQ2ZsIqn87kthAqRcQloM3rcutTv7gsg==
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
Subject: [PATCH v4 0/4] clocksource/timer-econet-en751221: Support irq number per timer
Date: Sat, 16 May 2026 21:57:16 +0000
Message-Id: <20260516215720.4160831-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 7157B55DFCA
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14608-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Action: no action

Changes from v3:
* off-by-one in out_irq_free
* Gracefully fail if too many address resources are provided in the DT
* Allow fewer actual timers than num_possible_cpus, as long as they
never start
* v3: https://lore.kernel.org/linux-mips/20260516182648.3987792-1-cjd@cjdns.fr

v3 note:

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
 drivers/clocksource/timer-econet-en751221.c   | 170 +++++++++++++-----
 2 files changed, 146 insertions(+), 47 deletions(-)


base-commit: ff1c0c5d07028a84837950b619d30da623f8ddb2
-- 
2.39.5


