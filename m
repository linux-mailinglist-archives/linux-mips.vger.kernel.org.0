Return-Path: <linux-mips+bounces-14631-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPOLD60eC2q8DgUAu9opvQ
	(envelope-from <linux-mips+bounces-14631-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 16:14:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A793256E795
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 16:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A314430233E1
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 14:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18908481244;
	Mon, 18 May 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="sFzYYcFA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF0472792;
	Mon, 18 May 2026 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113642; cv=none; b=nw2xUNwqvHZvR/D+7JNfw7a/e3DgVTP2VA7B1fLbJhdbhBUYjaVqvOl81347EzBnf0+9K+SR+sHBNBDFxUPot2cfUj4EXKVuaYgagX6TF/+h4H4kjaSrvVhi27cf+52D4IwsBy1+BPaGR3L/a0rEMIsHvqWsBZoo0URWN1S92E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113642; c=relaxed/simple;
	bh=nBQekn0qf4Lgr2PUdRmTnvv84D/PAvBZXAfqEhhAfRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c9tMxdxXafxGdXF0xeikHhG+Pud36jE9t5UMtaO7x8Tg0UYIJqdFpc/VZoqytcBjma6voKKiIGhUD/Jg8QxBaSkiNwOGFVEOoOb1WWB8pBtz+HL1Mx1XHCAcrnNCdYpKVTg8AFfw4IlqB+3cDBMVMP6+iRbhoiTiitHJb5w0VlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=sFzYYcFA; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08DDC411FE1;
	Mon, 18 May 2026 16:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779113631; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=rfFFQuODuaTYtZSsyNaLADFkxWwAuLJW9UKSGomhD64=;
	b=sFzYYcFAxp5pKWjsKUVnhP6MZyu9mHflIrRhDc6vBvpJnGrKhEg7c1aAOHekjLjzxbmxmG
	C2DoFGNESfj6bBkWZuej73Pv2F9bDcu8DBM3jBjhAvoLGpQReYGuYVDoqAuF0wZwxPN1oE
	b86gxAsFVE2vbztpu9wd6VFTtMVX+c7Fr3b4Hb+qntabdBcCGxIVCJTF8ZoK1tIqNQuiyy
	CfoDY9CmSYJN2nd1zNsO/W+KR5i/5yyRLCxVga3Ldpa6ypuv1ZN1leaownml/BSBMjdRjl
	QwfvI3FWKyDGi14AzkCFOz2HAzL7M1u6nJzLPOJ6hQTS/O9tBpO/HvAR3/rG5A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] Add support for EcoNet USB PHY
Date: Mon, 18 May 2026 14:13:41 +0000
Message-Id: <20260518141343.401555-1-cjd@cjdns.fr>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14631-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A793256E795
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the USB PHY found on EcoNet EN751221, EN751627, and
EN7528.

Caleb James DeLisle (2):
  dt-bindings: phy: econet: Document EN751221 USB PHY
  phy: econet: Add EcoNet USB PHY

 .../bindings/phy/econet,en751221-usb-phy.yaml | 128 ++++
 MAINTAINERS                                   |   7 +
 drivers/phy/Kconfig                           |  13 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-usb.c                  | 558 ++++++++++++++++++
 5 files changed, 707 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
 create mode 100644 drivers/phy/phy-econet-usb.c


base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
-- 
2.39.5


