Return-Path: <linux-mips+bounces-14318-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pZxZOLn77GlxeAAAu9opvQ
	(envelope-from <linux-mips+bounces-14318-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 19:36:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 365CB46705F
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 19:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E255300B62B
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 17:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFE8345724;
	Sat, 25 Apr 2026 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="qRbUKiOt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2A2AE78;
	Sat, 25 Apr 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777138614; cv=none; b=Lb6796r7iCvg0PGKJhOiccS5Tj+416+BtoxqUmD00BFbWJ8y9Bkcwd5k5vR/OQJKUeqHnb5rZj4FWkaBaJat5jc9V4bxyhmq30e4vDNR7+vi3CX8E35JK+plrmY4goVi/x6pb7ovj3eHcJtH2a+ysyJkFi3r2qeFqolpd6E91BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777138614; c=relaxed/simple;
	bh=PeuOW9x9Ym3Fe/XzTKg/qJWSDOunD8xuWWeIQguept4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T5dDb0izVVBuC/Ng1lFvT/NDsSEW77djqtR/yYBn9PCHGaBt/KAjkj+46xR279ldDG21UtRdn5ToU5x2w1eqzUDEKth9fnWCTFSXoRu9YFpH4dPh8vTseZsUn3ByeZtaalaZc4bcBjdJQr7ESINJp0aRLN+Y+czjDSMMIuuWo00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=qRbUKiOt; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C0B11E9463;
	Sat, 25 Apr 2026 19:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777138610; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5WGZ+bSSVS+1Vma9J9tn28vMMSbvmT6sMd+kIPkaZtk=;
	b=qRbUKiOtTCmWQOtAJPYD0l/oZ/AaSVMv5QE5Yb+RWEXetBAtaBrSxjW5rcwT0IlWAysUcQ
	xxpYRkmx1dyi6yrjY6LSyyy2+RsrBUf+1vmxzOKvwpZS+l+JRFqrXgoBPfF+jvU8pOM1wc
	oOHjdo9jkrWvk6WoKhGrrzeHbWme6fmWDUrqAWxz0oaeYO2iyeJ13WYVxR74AMzxA5DMnE
	HKMQdpvP4mVawndaQCxxVxS3sPOEEzTRfK0k17z/wOsAguMeWGsyLoZTdUswXjLfQWDeDG
	e5KKgzXibAV7xjQ+82qzmN7Yl7lGwQHjRnNyJx/Bn8u/GxW5v1dLBRIkFkzNvg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-phy@lists.infradead.org
Cc: naseefkm@gmail.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 0/2] phy: econet: Add PCIe PHY driver for EcoNet SoCs
Date: Sat, 25 Apr 2026 17:36:40 +0000
Message-Id: <20260425173642.406089-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 365CB46705F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org,cjdns.fr];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14318-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:mid,sashiko.dev:url]

I just added explicit includes per the recommendation of
vladimiroltean/sashiko
See https://sashiko.dev/#/patchset/20260404184918.2184070-1-cjd@cjdns.fr

Changes from v2:
* Added includes per recommendation of vladimiroltean/sashiko
* Rebased on commit 7080e32d3f09 ("Add linux-next specific files for 20260424")
* v2: https://lore.kernel.org/linux-mips/20260404184918.2184070-1-cjd@cjdns.fr/

Changes from v1:
* Rebased on commit 2febe6e6ee6e ("Add linux-next specific files for 20260403")
* v1: https://lore.kernel.org/linux-mips/20260312164432.569566-1-cjd@cjdns.fr/

This is split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2: none relevant to this patch set
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* econet,en751221-pcie-phy.yaml Refer to PHYs as "gen1" and "gen2"
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/

Caleb James DeLisle (2):
  dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
  phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.

 .../phy/econet,en751221-pcie-phy.yaml         |  50 +++++
 MAINTAINERS                                   |   7 +
 drivers/phy/Kconfig                           |  12 ++
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-pcie.c                 | 182 ++++++++++++++++++
 5 files changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c


base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
-- 
2.39.5


