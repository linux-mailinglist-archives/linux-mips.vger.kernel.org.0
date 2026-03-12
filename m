Return-Path: <linux-mips+bounces-13584-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ILrB9/osmljQwAAu9opvQ
	(envelope-from <linux-mips+bounces-13584-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:25:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D227589D
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DF393012239
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 16:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F28F3F7888;
	Thu, 12 Mar 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Rhkhpphm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436B3F65E1;
	Thu, 12 Mar 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332699; cv=none; b=Ol1xeu3GbYfzNuQoQsn56QBd40I6Nl0dChQzCyQMiSqydCLS6/H5fimBfl+WnPW4ztPWTVKkoYYZkBnRfG/ryvvLSozS3QEqu11+JkBUfOaancvtGPg8ybceFJL3FMa0Si+lu+zL5b/zYGlqvpeZQgxc8+eUkvlDKSUdRwDxXhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332699; c=relaxed/simple;
	bh=6IwVJTofdZ8BLKg5U2Lut3DaisA8JOECUcgf1obka5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ls5P304FSkwW6cAY2xcmXv2+byT0AOsokfwOhb6KfDxwwuK9jL+cDhaKiSgj37XhzqRyiuzxOTj4aCCiBNJC9ufSI3XPZK6SVgAEqBvSD1ZKG0m/5RxmMKXPr85jqRCyXDtstKJdKVcbIrq+Wb8mmGnLRjn7YxwkNVhyIjZRqys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Rhkhpphm; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EB4A2C5D6F;
	Thu, 12 Mar 2026 17:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773332695; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=jkxvw725jDsklLexZLE6LwE9E9TAxzqCFTDGwh44o8E=;
	b=RhkhpphmAPmAZaNLcpprWp7ytojPMEbURVGltBAzKvSg1dRKrJW42jGBuefo5rirfvoit0
	lvF2bId4mEYrAzvtHAdgip9jzaf1+AjN+31tUCwEzdklCneThLJ6M0puclIFuOt84SPtlA
	CVODdTEDlsFgdUvj6O90P/PUe1hRamDIJd5SIKzWqm4U8VAr0DDO+11j1S+f1rcG97x2C2
	0DstiPpa6lemkTweNYksCjpVeGrvByUDrAabyL4QH/r+60fYZ9CfsOgrzyvOXTY4rELPXl
	/fVoGZJ5Gb8CW5qERIxnbQcT5B8jy62rtmwhDn4FPkh1lZl/WdorDjlNAYwiXA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-clk@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	bmasney@redhat.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	p.zabel@pengutronix.de,
	nbd@nbd.name,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] clk: airoha: Add EcoNet EN751221 support
Date: Thu, 12 Mar 2026 16:24:47 +0000
Message-Id: <20260312162449.569359-1-cjd@cjdns.fr>
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
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13584-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,baylibre.com,kernel.org,pengutronix.de,nbd.name,cjdns.fr];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AC8D227589D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock/reset support to EcoNet EN751221 SoCs.

This is split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2:
* airoha,en7523-scu.yaml drop redundant "items"
* econet,en751221-scu.h, clk-en7523.c remove "HPT" clock
* clk-en7523.c
  * define EN751221_SPI_DIV_DEFAULT
  * warn if get_hw_id() fails
  * check key >= EN751221_MAX_CLKS before clk_hw_register_fixed_rate()
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* clock/econet,en751221-scu.h drop EN751221_MAX_CLKS
* clk-en7523.c add EN751221_MAX_CLKS
* econet,en751221-chip-scu.yaml drop in favor of using mtd/syscon.yaml
* airoha,en7523-scu.yaml drop redundant example
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/


Caleb James DeLisle (2):
  dt-bindings: clock, reset: Add econet EN751221
  clk: airoha: Add econet EN751221 clock/reset support to en7523-scu

 .../bindings/clock/airoha,en7523-scu.yaml     |   6 +-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 MAINTAINERS                                   |   2 +
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-en7523.c                      | 223 +++++++++++++++++-
 .../dt-bindings/clock/econet,en751221-scu.h   |  12 +
 .../dt-bindings/reset/econet,en751221-scu.h   |  49 ++++
 7 files changed, 291 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


