Return-Path: <linux-mips+bounces-14585-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDlyAfwRBWpVSAIAu9opvQ
	(envelope-from <linux-mips+bounces-14585-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 02:06:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53753C384
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 02:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71F13301C13A
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FD91548C;
	Thu, 14 May 2026 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="GxGlSEP1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C1EEBB;
	Thu, 14 May 2026 00:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717176; cv=none; b=donB01pR/w0cRFIBjuxpTmb/AJUfW2YAcvcuqN46oYoIexqYTZ2hleE19NoUavNH/y/8UXdn464DUABEyonS1va1HlLoGnRDsi069ieX8c+eplXvbJTPkTG60a2ea9MMh4UCUHTdqtXdXXCPRXWNLN6I17yJjxKrDOV+qGFSOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717176; c=relaxed/simple;
	bh=VExJMGkwT7PaOtVjeEUz4ijDzyegHrBaxl7ZcQxcwEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NDBCZKAW8jC7weWUnglhbxj+qRsrkonpwExqFslKmKEOAhHdub9GV7x3LTPko3+Te9LjsNfP/CPG5CaFwHnaKupe8bvM1+Vao3I5JSISsW0f5qkgWdKc8UDzJFSkZxvTjVni0kqLRLPAarDmgc+iBo1CCVmcRxeqacMP4x3sky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=GxGlSEP1; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 891633CB21B;
	Thu, 14 May 2026 02:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778717172; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SfI18vbFuRe05ptVGBlozK91n1PKQ3o3V3swShrHADc=;
	b=GxGlSEP1HVWt77sLkvnngXTGtqe66C4MddXsgpnid4YTI3omhYjlSTki/VKwnP7vSPd5mc
	Hdw4CycnWxP+TA4Z5+vdbs0uaYXFwFJyjG1BApOcXW20meuIhM1LXv6gGQ7fREwvLHnxGk
	UgLbPNHx5LuMZCzdrVvzTqDef8T8mw43yHBg6WzJbWyfixHA+MmWmn7AHxoZvAv7417W9N
	mVAiwECcNCG5DsNn+jIxC9Q8vfeGdpUF1kMKT52lQk20NlrKYrg6BmlEqSa7IM33T0ylrA
	llD+agZse1ybTBOmSnG6hqnukw/Qdlx7d7mS7VS7zLTO8k8swCGqBl+jTvX+fA==
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
Subject: [PATCH v2 0/5] clocksource/timer-econet-en751221: Support irq number per timer
Date: Thu, 14 May 2026 00:05:56 +0000
Message-Id: <20260514000601.3430262-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 6E53753C384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,cjdns.fr];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14585-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In prep for adding EN751627 and EN7528 SoCs, we need to support the GIC
interrupt controller. Unlike the intc in the EN751221, this intc does
not create a percpu interrupt for the timers, so we update the timer
driver to support both models.

Changes from v1:
* Split changes over 3 refactoring patches + main patch
* Remove driver discussion from dt commit message
* v1: https://lore.kernel.org/linux-mips/20260416175101.958073-1-cjd@cjdns.fr/

Caleb James DeLisle (5):
  dt-bindings: timer: econet: Update EN751627 for multi-IRQ
  clocksource/timer-econet-en751221: Move generic logic out of cevt_init
  clocksource/timer-econet-en751221: Always map all membase blocks
  clocksource/timer-econet-en751221: Unmap io mem on probe error
  clocksource/timer-econet-en751221: Support irq number per timer

 .../bindings/timer/econet,en751221-timer.yaml |  16 ++-
 drivers/clocksource/timer-econet-en751221.c   | 123 +++++++++++++++---
 2 files changed, 117 insertions(+), 22 deletions(-)


base-commit: ff1c0c5d07028a84837950b619d30da623f8ddb2
-- 
2.39.5


