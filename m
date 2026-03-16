Return-Path: <linux-mips+bounces-13698-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAuzCu4ouGnhZgEAu9opvQ
	(envelope-from <linux-mips+bounces-13698-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:59:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F929CE27
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4EEB30990A9
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2456B3B6BE3;
	Mon, 16 Mar 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="r8UOBjjD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F414F3A7821;
	Mon, 16 Mar 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676347; cv=none; b=WWF4ggurx0tWKMxDA8NFCSQBC5WLHgAcQLGuMm8Hg26rZ0eEZZKQ99bKwze02fZQlHF/jYObDleHksM8kbso48REQJn186oJxyadnSPSluUeiO5RLsHOTADKlpzmoXKzoq4Q8o/39dtWiu9rJE2p46SY25kpD5WHGprTNQGPGu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676347; c=relaxed/simple;
	bh=uUXNMZYluYxDTZUEM+CIKLtifIX4NVIKuEd3JX+jz1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BfoqLkivCNDjHhvr90sWs0bprwKO/ZMZ+6kmejHwfL/82JfBXOw3RN/kw1uhMwjNy3UK730Y4A4DyKRJs6MpdxYnh+oATUHkRNAUj3ZnEFRLL+iBN1MWQVqIQJLQ9ikrmTwhTxsEIDepqzHQfEKVl5+tnuYy9V0YZmO9ZLYolHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=r8UOBjjD; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BADB302EB3;
	Mon, 16 Mar 2026 16:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773676334; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Q11hnzTKrbJQfR59sChwy59iNTTXeocJ+Lmy3WVGuHU=;
	b=r8UOBjjDoVmxU+sPlo88yabF/Mg1DAzDSQHVocQGzeE1FKHIyY3uan5sdVc13u7FKMjQDO
	cisBH+YubhmFq9UHP8YNddsBPAtUicq25lCqPoqnwlQc0N83uWY87IkKFelWWyuXs6+4rV
	0HXANlpP9U1H+qEQC3cDfaSGBIp/CYHzV/Hr/rBeWdgv1NKG3J7+upIO+F3QVhw1F1ABri
	0PegtrcI62pXDFtWq0lumkKHeeW5rntXJdYW/HuC1hjDNDy/bWYVksyghcDz8li+ObOZBs
	9gXfRDUnBq9aqa19HaxYD+kI86NaLdjLal/96GzFgiSJi6LUkaEZ6r1fNwVrZg==
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
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 0/3] PCI: mediatek: Add support for EcoNet SoCs
Date: Mon, 16 Mar 2026 15:51:54 +0000
Message-Id: <20260316155157.679533-1-cjd@cjdns.fr>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr];
	TAGGED_FROM(0.00)[bounces-13698-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B53F929CE27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add EcoNet EN7528 (and EN751221) PCIe support.

Changes from v1:
* mediatek-pcie.yaml slot0 needs device-type = "pci", fix dt_binding_check
Link: https://lore.kernel.org/linux-mips/177334026016.3889069.9474337544951486443.robh@kernel.org

This was split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2:
* mediatek-pcie.yaml add missing constraints to PCI node properties
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/


Caleb James DeLisle (3):
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC
  PCI: Skip bridge window reads when window is not supported

 .../bindings/pci/mediatek-pcie.yaml           |  82 ++++++++++++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 118 ++++++++++++++++++
 drivers/pci/probe.c                           |   6 +
 4 files changed, 207 insertions(+), 1 deletion(-)


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


