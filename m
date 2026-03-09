Return-Path: <linux-mips+bounces-13418-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JGiG73IrmlwIwIAu9opvQ
	(envelope-from <linux-mips+bounces-13418-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 14:18:53 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D87412398FF
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 14:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69C7130094C2
	for <lists+linux-mips@lfdr.de>; Mon,  9 Mar 2026 13:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8543BED6F;
	Mon,  9 Mar 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="GjMOdncY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E933BD63D;
	Mon,  9 Mar 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062330; cv=none; b=TQt31AEqYN3J9dvb7Kr8+BssHkH/oM2EWIwi+EPi+KFFyrkJtmNW4tnTVbQlBq4uTrNWs2EUlE7f9btrWLU0rAowizNEhZKObwFQtpvXSqsQ30JoruMTG5cWCf14BiQfWewZN1JXCOuBBAjL8qHkrs+7t90wqWA4QJSrrR3O24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062330; c=relaxed/simple;
	bh=I/fnei6+1zSYKsgxvA65UaXWt07Edw6ULpLRDKhr4Io=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZjsPyey50QBPc36eUB7jXDwwZF6XTvUuE+2lV8hnzle5tUYIwF+Afg50uUZ7niTMChRNetQM9uFVePIXiSfFdoUrvn6rHl2ZrtPnBbCr6OQ8g1RlUt24hepK/3GwJhzpOBoLwv4AmtDFTbAGW1ZmSeIqdO1vH2UgFQdxSUrQnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=GjMOdncY; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7695B284DD7;
	Mon,  9 Mar 2026 14:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773062319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Y07gyMyA+v61AkgAjpiX1Hx/H6h+2ViD5prXyk9P3U4=;
	b=GjMOdncYe6alUKv1iGSD8mSIJWw9X7w8G8Tw2F5S3/Wz052nxQrUNbclTyhViUsqFhy8uf
	C6/MKgSsiwk2MpOzEieAkEdUbYEUan9KLAJ6Cj/A/75ZTBzlkw5zTzbhwMs8ovUNnySttd
	v4Ne/HYsA2K1D9If9zwt3WXq5sYb64cYAfkGCj2Po4Pxir1dJVnEiQ0YWEYnSI6RgMB7+3
	YJ9p5GYweAJtS0hxLYE+ynGtr2gH7+YVKrdT3D9pdOwL23NOFYR7xlpuAaPel1K521I8lw
	GCEavo2ObQVrYDX3oPynx9/EjTSt4Ex/t3pyfwxOKJd44gMtMK6MlCYlu9KD0A==
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
Subject: [PATCH v2 0/8] mips: econet: Add clk/reset and PCIe support
Date: Mon,  9 Mar 2026 13:18:10 +0000
Message-Id: <20260309131818.74467-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: D87412398FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13418-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add clock/reset and PCIe support to EcoNet EN751221 and related SoCs.
This builds on the Airoha EN7523 clock driver and the Mediatek PCIe driver.

Patch 6 is upstreaming of Ahmed Naseef's work on EcoNet PCIe, which was
developed to support the EN7528, but which works equally on the EN751221.

There is also a workaround in patch 7 to gracefully handle PCI hardware
which does not advertize a bridge window and instead always reads zero.

Changes in v2:
* clock/econet,en751221-scu.h drop EN751221_MAX_CLKS
* clk-en7523.c add EN751221_MAX_CLKS
* econet,en751221-chip-scu.yaml drop in favor of using mtd/syscon.yaml
* airoha,en7523-scu.yaml drop redundant example
* econet,en751221-pcie-phy.yaml Refer to PHYs as "gen1" and "gen2"
* pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
* en751221.dtsi "econet,en751221-scu" is not a "syscon"
* Rebase to linux-next
* v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/

Caleb James DeLisle (8):
  dt-bindings: clock, reset: Add econet EN751221
  clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
  dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
  phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC
  PCI: Skip bridge window reads when window is not supported
  mips: dts: Add PCIe to EcoNet EN751221

 .../bindings/clock/airoha,en7523-scu.yaml     |   7 +-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/pci/mediatek-pcie.yaml           |   1 +
 .../phy/econet,en751221-pcie-phy.yaml         |  50 ++++
 MAINTAINERS                                   |   9 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 114 +++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++
 arch/mips/econet/Kconfig                      |   2 +
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-en7523.c                      | 238 +++++++++++++++++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 118 +++++++++
 drivers/pci/probe.c                           |   6 +
 drivers/phy/Kconfig                           |  12 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-pcie.c                 | 180 +++++++++++++
 .../dt-bindings/clock/econet,en751221-scu.h   |  13 +
 .../dt-bindings/reset/econet,en751221-scu.h   |  49 ++++
 18 files changed, 821 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


