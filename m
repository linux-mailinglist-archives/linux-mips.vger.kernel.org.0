Return-Path: <linux-mips+bounces-14311-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDC6N1627GmzbwAAu9opvQ
	(envelope-from <linux-mips+bounces-14311-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 14:41:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 838274663BA
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 14:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 402D9300E72E
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 12:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1E7363C50;
	Sat, 25 Apr 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="iIuobtd7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5B64;
	Sat, 25 Apr 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777120857; cv=none; b=fUnnm+chlJx/deCKSmTsJNJFBQUD9MPqNZ7MC1a2O+hOIbO5KMqfhn9pmPq2MoI3ORo2VfIdvy4A4wi5Do3f2v2ovHws9lVMJOfze50RTzAX8MXA0tfo3+1chSaemBB/H0nxaO9eTGwhi8nMvISAfUF1p0sCDI37A/VFn6dEGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777120857; c=relaxed/simple;
	bh=C1FiZQSWN4pNHKqEHtDiqhgEmtODFXmwC/SsPIKbs98=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I/zcPLvjC9+Dfc4CCg6gafgHD+l+yREqErIt4cESD23YPDPMy/n7C4cippSpmJOAmX3UaJTY/i7T5aalTp2QECj1Dz4FpoKNWAJeFkMzj5QXuB6AJM/4w7sWF8OI1/gLZML1/VNUFUb+twy0nc2lelMM4WCsZB9tCJAvtITuSHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=iIuobtd7; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 033ED1E62B9;
	Sat, 25 Apr 2026 14:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777120536; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ZC/i3BeoVR8HoA2zXNVtcnaHT1wH14+5t/jHFOLtJ8E=;
	b=iIuobtd7LawtBn0RMt/s0AMW1OX7mCfg4l+cEJR+B8va0+BxjuTpKKv+Ddjo8ohQDj6m3G
	R6EuQqxXeDIdybBNnn9KH7kp1tEBwGr9QCACs5dh2VvHzLzF0FYWd94gh/EvMojSD+ccV9
	W3CnjO0WeCUelSq9XHdXVmQfFR/Htdo5+RRNyGArnM7m4r079AUXhS+6U4qZTKfNYjP0oM
	zOYjtUIfsLoG6iZG3vgfJNicWx0DdfY/e8P5H6Pa62ab+5GKSwliNOVuOLQ9p6tfpnJgcz
	GYPz4ewECuG3hksEHGEugyUuFIceFzv0pmdWy5OVu3ax/GH2WZlHmA99cAOuQA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC mode
Date: Sat, 25 Apr 2026 12:35:29 +0000
Message-Id: <20260425123531.270548-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 838274663BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14311-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
lantiq,xway. Of these, only the realtek,rtl839x-soc has multi-thread
support via an out-of-tree patch to its interrupt controller. Everybody
else is not solving this problem and instead sacrificing multi-thread
support.

This patchset aims to tackle this challenge in a way that is most
likely generalizable to other 34Kc interrupt controllers which are
facing the same problem.

Caleb James DeLisle (2):
  dt-bindings: interrupt-controller: econet: Add CPU interrupt mapping
  irqchip/econet-en751221: Support MIPS 34Kc VEIC mode

 .../econet,en751221-intc.yaml                 |  20 ++
 drivers/irqchip/irq-econet-en751221.c         | 176 +++++++++++++++++-
 2 files changed, 193 insertions(+), 3 deletions(-)


base-commit: e8be82c2d77ec1bb0148406e54b105028a83537e
-- 
2.39.5


