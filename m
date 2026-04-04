Return-Path: <linux-mips+bounces-14038-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id baZkMUFd0WlnIAcAu9opvQ
	(envelope-from <linux-mips+bounces-14038-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 04 Apr 2026 20:49:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71F39C1E4
	for <lists+linux-mips@lfdr.de>; Sat, 04 Apr 2026 20:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6D9B300957F
	for <lists+linux-mips@lfdr.de>; Sat,  4 Apr 2026 18:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4394329992B;
	Sat,  4 Apr 2026 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="WHk0sXCA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66EA21638D;
	Sat,  4 Apr 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775328573; cv=none; b=n9jD1Oo7M3+ZXxMn2dRZgKg0/+CHLyD51nSsQT6Mr1IXUdiZBcjpFPKlXcBgWjBer3g8BEVUFisv0TpL1B4MlyymZ1dhsvDObd71y6yDyE8nRJz5eIjIoYBi8lRHm+zOB4A7QH+5r5pIV9FsphA+wkI4mv6kKWqS3qxlzbOc6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775328573; c=relaxed/simple;
	bh=IPBbkO3fjU8G0NNKxLCIFQuUl4/s13MtwUDedAGC0XU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QCFsR+LJok0dX1GJ+snW8ybUCnIpbuJ7J3D1LxRPcJ15zba3ZL0CLcoYrnOn5LAchPAdT7xtN7dJRa6tkr9+o9qmsKVjgJKdjphW6JVgkReTsUfiNNxIddvknM8fS5qZnAlEJaIIIAQKZTnmE6OzUQV2H6cnRd9iw4HWeGDniok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=WHk0sXCA; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02C9F18F6BB;
	Sat,  4 Apr 2026 20:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1775328569; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Lu1Z3Rm1rWWGK7Kmxsqji1TBL5EuCNVIhoEedYUd+lM=;
	b=WHk0sXCAClAoKmuPkc5zeS+xpLerVE5gqqmUaYRBnKnKoZ1m/hySdZyYkJsE5UkXnsqx5y
	MhQryGUsFeMU0Z2cPscikzHcdE4UVWsHZiIUuyamTutQCduIvOcZ8gwxXZRlFRkE0cs8RT
	CZyGB2hgX0ESrwf3ABPRaqNjm8IYhBv2t0dja409ccZ3lu+uobebC473dThkgAqIwY8Qzc
	mnXuEV6xTaadAEUXnIqsFyvRMxpb0Zpbqv+eXH9VTdj10+Ot/pmM8S0ok5pc8yHFKkzf2/
	8eBAo2hscqgwduxY4ctKZ1zAXxNdosR0cn4CtPhuO45O04veoNeUGapfovRrOw==
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
Subject: [PATCH v2 0/2] phy: econet: Add PCIe PHY driver for EcoNet SoCs
Date: Sat,  4 Apr 2026 18:49:16 +0000
Message-Id: <20260404184918.2184070-1-cjd@cjdns.fr>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14038-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:mid]
X-Rspamd-Queue-Id: 2B71F39C1E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add EcoNet EN751221 and EN7528 PCIe PHY support.

Re-sending rebased v2 because there have been no comments since March 12.

Changes from v1:
* Rebased on 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
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
 drivers/phy/phy-econet-pcie.c                 | 180 ++++++++++++++++++
 5 files changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c

-- 
2.39.5


