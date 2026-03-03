Return-Path: <linux-mips+bounces-13331-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AmlDosyp2kjfwAAu9opvQ
	(envelope-from <linux-mips+bounces-13331-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:12:11 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3631F5B93
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31235308C76E
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 19:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C606B48C8CD;
	Tue,  3 Mar 2026 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="jlAk8tuO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C6382F12;
	Tue,  3 Mar 2026 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565063; cv=none; b=Wq9H8H0p6L1eCtYj8Qv0xmnN0cKZaa63wO9e1bNl2BIbY2eY2gLCUUottak88R9XFr10lU6Cwmn+Uybrvn0HhYdBidEYFPW8O1s16chL9UF5kF7XlY8qCVxuW6MT7BDbJW37bZaeQIUKHAHg/2+bPy08SbAMYFxmq0yFubdU+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565063; c=relaxed/simple;
	bh=2PGhMj57dGEEnmOANxIdlxwcYZLmDMBqSl2hvks6d58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ePfXmkumldN60NUlFyVnksrRRJDUdL/5LZ+Md325jpFl1PnUJJIGroCJAnStHl8eVUxZqVNrbHb4RBkMnUJwfG1xCM22YaRAimfswYbUIonHu2SZW1NG62lvBViWRiqB2bZuo/KPUh3UT4rBnqK9kDloA4RYM7I/uWUSkhv443U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=jlAk8tuO; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DFE720DF03;
	Tue,  3 Mar 2026 20:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565060; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sAjJy21W8Agl7xSVLMb1bYPAsur47qRis49LdPPUGDE=;
	b=jlAk8tuOwAMhUY7Z41ziDfc0b593+d4+uTFvd9os9WUVwg9yOqTmu74N8h8QDkLzqohVqa
	JrvcgRl1WjOtLnmjkuA4IzW+Qvjys/XflU+VorZ5PvItFL/pFxmNQvByu7sofhq9FiSlSk
	AHqEwE2ZwEhCt5iAgSJf85eyuzyT3U6kzvE8XtggOqLeQn25Pw7NavGI5COzFG/r/giKTF
	xNxcSGgRaH40XMdfc7lfsmDYyjSfZ7wgnQBxrZgM2Yu5hjyjY02lmQpt+vYgY6JThmT5rH
	gPYPurVcGGRgO3xRe3V0TsucEPUOmWdDNUkQdYCpR5q0K9C+oSRsp9WeIIgkZA==
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
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 7/8] PCI: Skip bridge window reads when window is not supported
Date: Tue,  3 Mar 2026 19:09:47 +0000
Message-Id: <20260303190948.694783-8-cjd@cjdns.fr>
In-Reply-To: <20260303190948.694783-1-cjd@cjdns.fr>
References: <20260303190948.694783-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: AA3631F5B93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-13331-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Action: no action

pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
registers unconditionally. If the registers are hardwired to zero
(not implemented), both base and limit will be 0. Since (0 <= 0) is
true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
gets created.

pci_read_bridge_windows() already detects unsupported windows by
testing register writability and sets io_window/pref_window flags
accordingly. Check these flags at the start of pci_read_bridge_io()
and pci_read_bridge_mmio_pref() to skip reading registers when the
window is not supported.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/pci/probe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd79..4eacb741b4ec 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
 	unsigned long io_mask, io_granularity, base, limit;
 	struct pci_bus_region region;
 
+	if (!dev->io_window)
+		return;
+
 	io_mask = PCI_IO_RANGE_MASK;
 	io_granularity = 0x1000;
 	if (dev->io_window_1k) {
@@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
 	pci_bus_addr_t base, limit;
 	struct pci_bus_region region;
 
+	if (!dev->pref_window)
+		return;
+
 	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
 	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
 	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
-- 
2.39.5


