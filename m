Return-Path: <linux-mips+bounces-14411-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGxKNiSI82mS4wEAu9opvQ
	(envelope-from <linux-mips+bounces-14411-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 18:49:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A94A6029
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 18:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 826D7302FC89
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 16:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3745B2BD033;
	Thu, 30 Apr 2026 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="KL7w+b97"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFB03F9F22;
	Thu, 30 Apr 2026 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567328; cv=none; b=NnDXDkLlRjBXH2URoC21oFMyw5tWAihJet0jLxb52Lf96+hna3tnpkxZ9eCm0k11IAwKgqZjDcwJ67qMVLE9TbSLEVA9eEbo2lxrHndC5x2GrdpX4FpeLWKkUO2KvicvjZ7xpWOOMBevYgaomu+uREp/++yPm5OsmLjMP8odQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567328; c=relaxed/simple;
	bh=IUfPWF7dOPNJutwKP7Grq3wqHZLTELZZX0Xl8dXRywg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O0aGyoXCP1LjJq5auRfwdRt+VFgTLeai+alag7xMedcxvKgc6EkeRDy7Zmu0qPHGod/291kMnmegbmEYMIIfQiGYtnHLYURNPwdCmGgx2URfN/bsOvVZukRx8OnB2wfuwADrfDjqtau9FI9NyY6gbM0jPIsDlmosS5om38zzENk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=KL7w+b97; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAFDB273AE1;
	Thu, 30 Apr 2026 18:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777567321; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=B2/9kt2XJKLSu5SuJVTvOoK1lMQlmWFZxpZr7YOvClo=;
	b=KL7w+b97uxdQYCswXIykC4A3VZCEenhVQ4sLM62A+PZJF5CCKCBJNKK1+tmiz1romvVvod
	GGgL8Hcy8gJ7g3XxYsZSjulPDg0XY9FmMdmpMS/rD35C1OOTELed6EtM+I74JyXO5veVYG
	3chpw9pcNpSdP7GQwqbccswHEeGnwz56jy1FTsJoYoMhhTEsQZr1yWlffjFowoLMhdEpH7
	ofIKONvW6mgSIGQA65dSccsmI9xDrhWxS5udq67mcJYQilnBzt2Qdgk3SVlmY07JFk0LXr
	g56TPd/Ux9YildaYFMtyYTtrM8pUteZYsWp8QWP8C5fOq1DUTywsg+SpMnZXuQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 0/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC mode
Date: Thu, 30 Apr 2026 16:41:55 +0000
Message-Id: <20260430164157.6026-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: D77A94A6029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14411-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:mid]

MIPS 34Kc and 1004Kc have a Vectored External Interrupt mode, where
CPU interrupts are re-routed to the external interrupt controller,
which prioritizes them, renumbers them, and integrates them with its
own, creating a flat interrupt table.

This bypasses the CPU interrupt controller entirely, which is not ideal
for modern Linux which formalizes the interrupt hierarchy. The 1004Kc
standardized the interrupt controller (MIPS_GIC) so it can be viewed as
"part of the CPU" and it's tolerable for it to be more closely coupled
to arch/mips/* than a typical interrupt controller driver.

The 34Kc supports VEIC mode, but the interrupt controller is not
standardized, so it's different per-SoC. This creates a challenge of
writing a reasonably modular driver, given hardware that actually does
take over the interrupt hierarchy.

Ordinarily we wouldn't bother with VEIC on the 34Kc but it is required
for MIPS_MT_SMP, so without it you get a single thread processor. The
only other 34Kc device which has an in-tree DTS file is
realtek,rtl9302-soc, in OpenWrt there is this, realtek,rtl839x-soc, and
lantiq,xway. Of these, the realtek,rtl839x-soc has multi-thread support
via an out-of-tree patch to its interrupt controller, and the lantiq
is not 34Kc compliant in that it lacks the VEIC cpu flag, causing linux
to fall back on legacy interrupts despite CPU_MIPSR2_IRQ_EI being set.

This patchset aims to tackle this challenge in a way that is most
likely generalizable to other 34Kc interrupt controllers which are
facing the same problem.

Changes from v2:
* Fix goofup that changes were not actually in the patch...
* v2: https://lore.kernel.org/linux-mips/20260430150809.1827881-1-cjd@cjdns.fr/

Changes from v1:
* Address notes from Thomas Gleixner (Thank you very much!)
* Additional info in cover letter regarding lantiq,xway
* v1: https://lore.kernel.org/linux-mips/20260425123531.270548-1-cjd@cjdns.fr/

Caleb James DeLisle (2):
  dt-bindings: interrupt-controller: econet: Add CPU interrupt mapping
  irqchip/econet-en751221: Support MIPS 34Kc VEIC mode

 .../econet,en751221-intc.yaml                 |  20 ++
 drivers/irqchip/irq-econet-en751221.c         | 187 +++++++++++++++++-
 2 files changed, 199 insertions(+), 8 deletions(-)


base-commit: e8be82c2d77ec1bb0148406e54b105028a83537e
-- 
2.39.5


