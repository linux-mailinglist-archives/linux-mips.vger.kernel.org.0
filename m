Return-Path: <linux-mips+bounces-14817-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIy4J6RMGGomiwgAu9opvQ
	(envelope-from <linux-mips+bounces-14817-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 16:09:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9035F367E
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 16:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED2E304114F
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 14:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0696B317173;
	Thu, 28 May 2026 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="gm+D5/fm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592132D97A6;
	Thu, 28 May 2026 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977271; cv=none; b=qVFk0p65/w7gsb3jtR88XAOfxd+G30MFqYHPZ2XbrvO2QoSkERMVHNS05wByDb0M7BdLG/4OEf9nWBxKLR6sin/oB1wi+W0PZt5l7qxSpE59C7bZvQ+VNh7O150b7AB/G1WjnPZaqeeGwGJ3V53OfPDTLRn4g/6SFxq5auIO+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977271; c=relaxed/simple;
	bh=0mr5BRvGkaoTeHacl2dJbw6JKOVgJOD8fCl+aCOWO/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QpKY8cDOLdd65h1DuToVZKTDPbT/IGyndO27SwtMgFtrus06XB/9KK1bofmUN53oqMYDong0H8IfYNp2dr7ytyjnpEkNsKUb6Txyq2d9x601p9Pi+DPe4mhysK4QqxPAqq7NHP2h2ZHuu8CfVswUtAJP0j2uHV7ItKmSvGSDox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=gm+D5/fm; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C1B94B2DDC;
	Thu, 28 May 2026 16:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779976851; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ymS5IUpgg5ej3Ch5/r/hu+1fuAOsLqa5td+fBTL4yzY=;
	b=gm+D5/fm59hqPG+SB7ucLNB0jAGQEJ/e6I+X5EdRllNgc13ZT1Tm573zDyDaOPCTpf6BSh
	hwvr3/A08BBsf7XgrzeD3Lp0OcFChxT85GSRPAi+hBz2CTizMEl8eZwfBkRLtg2SG7/tLX
	Rd6Q3IqaHhRoJ1oLM6wJ9BpDYKhJxnAFvFnJaz+1zfyoZm9x7LZx8aHPQeBbARXNcQcXyQ
	h3D4oJQUG7LRPckrXw7WoDx12/eb1b2mb7uWv/waATGRJ3QeN6xiVk4wVnm2fCdVkTUyzl
	EmFb3HyCxmgmEw7LhVUHQ8rC3gIjFMIjGw1ArOKGqE4JdvjZnI/6TreFUh8AOg==
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
	grandmaster@al2klimov.de,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v6 0/5] clocksource/timer-econet-en751221: Support irq number per timer
Date: Thu, 28 May 2026 14:00:41 +0000
Message-Id: <20260528140046.2897674-1-cjd@cjdns.fr>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,al2klimov.de,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14817-lists,linux-mips=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Queue-Id: 4E9035F367E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This timer appears on both the EcoNet EN751221 (34Kc) and on the
EN751627 / EN7528 (1004Kc) SoCs. On the 34Kc the interrupt controller
uses a percpu interrupt while on the others it uses an individual
IRQ number for each CPU timer. Add support for EN751627 and EN7528.
Add support for IRQ number for each CPU timer under the
econet,en751627-timer compatible.

Changes since v5:
* Integrate patch fix refcount leak from:
Link: https://lore.kernel.org/linux-mips/20260526184105.18962-3-grandmaster@al2klimov.de/
* NULL econet_timer.membase after unmapping
* NULL check dev->event_handler in case clockevents_config_and_register
  failed to fully register.
* v5: https://lore.kernel.org/linux-mips/20260516233943.49502-1-cjd@cjdns.fr/

Changes from v4:
* Fixed incorrect compatible in DT schema
* Bracing in out_irq_free if statement
* I did not move cpuhp_setup_state past the point of no return
* v4: https://lore.kernel.org/linux-mips/20260516215720.4160831-1-cjd@cjdns.fr

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

Alexander A. Klimov (1):
  clocksource/timer-econet-en751221: fix refcount leak

Caleb James DeLisle (4):
  dt-bindings: timer: econet: Update EN751627 for multi-IRQ
  clocksource/timer-econet-en751221: Init teardown on error if possible
  clocksource/timer-econet-en751221: Disable IRQ until cevt registered
  clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

 .../bindings/timer/econet,en751221-timer.yaml |  31 +--
 drivers/clocksource/timer-econet-en751221.c   | 181 ++++++++++++++----
 2 files changed, 159 insertions(+), 53 deletions(-)


base-commit: c8d32a0389fb97873285327ef4543a1431e54733
-- 
2.39.5


