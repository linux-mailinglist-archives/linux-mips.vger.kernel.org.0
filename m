Return-Path: <linux-mips+bounces-13324-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J27Ihoyp2kjfwAAu9opvQ
	(envelope-from <linux-mips+bounces-13324-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:10:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D71F5ADC
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 489653021956
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 19:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55472423A6B;
	Tue,  3 Mar 2026 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Oy4kMsIK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E53D75AB;
	Tue,  3 Mar 2026 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565016; cv=none; b=tiYJSPVjGAV4sv2YebmA15LQI3xjy1DmZ3DToZ8XMhd24h+2yMaAO31V05kNFF0qVeYidIdO7F3xge5C/FkNZyHvH4IUQvx/v8DOmtZ5UYLpilYZ08YZDCMfCiJ8eWhE1X4rCxBls2/BUxi9VgBcVKkwso0/Pxx797/hg+QwFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565016; c=relaxed/simple;
	bh=o0Z85w/VI1CVGaEoDBkl1+BDW5F3aK86mCE2F+k5prQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X1B+NpxqxFwcwqSKm+521lJbRuAwjyE2bLb49YxGibLnqEHQcleGkKz8QYxdfG687hoCk09qEQ7gDjxwdnyMaVDTtY++iX/MNe7qeQpwa691nMzLj96p+6HQxg8yFOpJEqcbGecAU9rDwThJtT3sdSxAq44O1KzZpfpfx0pbMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Oy4kMsIK; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B8F120D516;
	Tue,  3 Mar 2026 20:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565011; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YeYcHOU6O1PcxMMN13wZpxAP+6Z+ixxDNPaLXhkt61M=;
	b=Oy4kMsIKUpN1ifXgxMapAw9eWZUzib2dteeWem3sYhWyzFArKtUyf3n1hZsmH9IaTWEhV+
	qPdtEvGKXnQOI+lDMeRoep+jsXV9Ya/XcNOY1r/bcjAbzjLiMQ8/KlJE7CmOVdDNVUOT8h
	cDB0BJvRwLk3aTYOlu4wJaAc1s2L8z8qa0IzCemII+0ANfi56E8OqGT6ddYuocq6vNGHGU
	uInyDrfuf93mq1wycS0x2/dHLdx751rIU1qQ03Yn08tWvIFAqIS5MP66vvn1tIs1QfPjX4
	/1Yl4egPmk/AwaZJOJXUrulS8+zzWDOfb+m7Id0lV8qZzUHSHIHhIFyE26hc/g==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] mips: econet: Add clk/reset and PCIe support
Date: Tue,  3 Mar 2026 19:09:40 +0000
Message-Id: <20260303190948.694783-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 2F4D71F5ADC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13324-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,cjdns.fr:dkim,cjdns.fr:mid]
X-Rspamd-Action: no action

Add clock/reset and PCIe support to EcoNet EN751221 and related SoCs.
This builds on the Airoha EN7523 clock driver and the Mediatek PCIe driver.

Patch 6 is upstreaming of Ahmed Naseef's work on EcoNet PCIe, which was
developed to support the EN7528, but which works equally on the EN751221.

There is also a workaround in patch 7 to gracefully handle PCI hardware
which does not advertize a bridge window and instead always reads zero.

Caleb James DeLisle (8):
  dt-bindings: clock, reset: Add econet EN751221 bindings
  clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
  dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
  phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC
  PCI: Skip bridge window reads when window is not supported
  mips: dts: Add PCIe to EcoNet EN751221

 .../bindings/clock/airoha,en7523-scu.yaml     |  19 +-
 .../mips/econet,en751221-chip-scu.yaml        |  41 +++
 .../bindings/pci/mediatek-pcie.yaml           |   1 +
 .../phy/econet,en751221-pcie-phy.yaml         |  57 +++++
 MAINTAINERS                                   |  10 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 114 +++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++
 arch/mips/econet/Kconfig                      |   2 +
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-en7523.c                      | 236 +++++++++++++++++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 107 ++++++++
 drivers/pci/probe.c                           |   6 +
 drivers/phy/Kconfig                           |  12 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-pcie.c                 | 180 +++++++++++++
 .../dt-bindings/clock/econet,en751221-scu.h   |  15 ++
 .../dt-bindings/reset/econet,en751221-scu.h   |  49 ++++
 18 files changed, 869 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


