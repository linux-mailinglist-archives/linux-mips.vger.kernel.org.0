Return-Path: <linux-mips+bounces-13593-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJxJBE7xsmlaRAAAu9opvQ
	(envelope-from <linux-mips+bounces-13593-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 18:01:02 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F98627640D
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 18:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE75314AEB1
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 16:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BE13FB7FE;
	Thu, 12 Mar 2026 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="l8A/OjO1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09CE3FB062;
	Thu, 12 Mar 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334432; cv=none; b=rSFpL6WlaZ1HmGcxO5M50l1SCRRgXnAO397hOg0W6yT9BduS6ncdltIeiEDBrOuBMBY1oUKzOB5vWZqi14ko94vIcYP0O3oNnEexZnqitds2UTPuZmdXcYWGogrdiDtO7I0tNlcrBfGX4HqeOA7Fyb1aAQD6B3cGwAAu+ALtXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334432; c=relaxed/simple;
	bh=yVI7BzcMR6nQuCqFlO6Vo2NmSaC1XwkVm/81Bz/PFps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZR/ku/icyHUXQHyWphF09JVDUDb/gBkgEhuA1XZMD3qxtaHgR8UhM0XqU7nVyxVRZW/sI5c7bm8zBEdfICFIlPAbfVJdfjTZOkNTApKqVqD8SuukAMcYgphasiB1UELzg9cgyfbYwF1tCgm4mBGrloxr/5Cw5u54y93CZF8H3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=l8A/OjO1; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CFE82C870D;
	Thu, 12 Mar 2026 17:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773334428; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hun8qRSx+c81aOcVRS1X8gTZpBZdlow4lndHrL4U0TU=;
	b=l8A/OjO19AB3kGar5jy2BBZYBTLdZ7lVnXXpGFSz56etijPSpu4wle11E7UW/z1bTNeGGP
	VyllTeK0O611Ym3xdVvxt8SHI9Gz8GWcoTGTwj3retpeKTc1yJrPetAvzdDAZUXckThZxR
	aaZIb4N70qETFbUIP7qDzz1um6QGfyzrQLmAVBQ72v50smTnwl5Q7r7cFt9VlWAZG7nLQc
	4w/Ee0no8N6EubpBSmdMCnBMlCLz5B6pBvWps6FXY4aZ+jlgpwfNbja92SyNlijW9AIjim
	fG4Wr9f575atj+GH6GRc9eFo6PIhMlmW81byoy/WXOu06DwaPz8CseuMQ1b/8Q==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 3/3] PCI: Skip bridge window reads when window is not supported
Date: Thu, 12 Mar 2026 16:53:32 +0000
Message-Id: <20260312165332.569772-4-cjd@cjdns.fr>
In-Reply-To: <20260312165332.569772-1-cjd@cjdns.fr>
References: <20260312165332.569772-1-cjd@cjdns.fr>
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
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr];
	TAGGED_FROM(0.00)[bounces-13593-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Queue-Id: 9F98627640D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
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


