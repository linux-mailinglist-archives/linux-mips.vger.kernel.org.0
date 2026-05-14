Return-Path: <linux-mips+bounces-14595-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKk3NDnpBWqPdQIAu9opvQ
	(envelope-from <linux-mips+bounces-14595-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 17:24:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 721EE543FA3
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 17:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4BE30CF9AF
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 15:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF32243C050;
	Thu, 14 May 2026 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="H1KKMG8M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0DC4279E5;
	Thu, 14 May 2026 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771641; cv=none; b=hj6qd464lbsxvr56PaTmyvCJFi1VrbgoPWmkXDkydt9v49grzLKoPT8jhJK55BNu/FPFE40Fodf1xM5ju9lyH1sL/1NutK+Wa4xVg5hcaM/+fmKK5wLuaOFZOKgEMUjIsPh9kF6BV9q9U/LMFeviAsTzQawN7bjELHVrXr7dsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771641; c=relaxed/simple;
	bh=1fLj/3UDcUb4DWtfM+X9V4E1moL+DU6awV2sMe6DZv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o0gwtAdM8On8WhlqaUuQ8kSlzwL51xkMvIiRoQWl81kmS2wGOvrn2OiirfMMynCoIxTthXCEQTR1se/RwmnWqDSjtxC8Dv7mfnVPrVQm3OcRRvsvVSAOA37/Q0JmdjFxUCWq8qBCxTo3vlz9qivsBk17agnY+G0k/iXCHCAvHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=H1KKMG8M; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D32C3DF7EE;
	Thu, 14 May 2026 17:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778771614; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=q+XOzO01lqse48UlRSnZqwHKzFzjG64h+3jGPYOVm1k=;
	b=H1KKMG8Mc66rKsTOOXWAJbYTMHZSes8FuW9hFLOdOwoKTB+bCeObYamYRjLwEMCe6f0vpd
	PzMZYeHTYlNptrWQDPBo0/wPF0MlD1fFlTO8JGQu8B8PXWQtbhIZjLv/XzLSJnPsQflJ+9
	P90sQJDsclxOMyfRawemtGmjGrqkZFbUfOOciEgbDgRIfUpbwC5wmv3f0XJUSHlhd3EvcL
	Eqk4MTxYt/i0BkLHEKV/NfHGKk0BrQiBxpODZqekRHe0bPGiE4DdYxN4hxF5WywGGAcY0j
	KEDdqFLkJYOLmOG1sTdr+E85H96g4IfW8NeNVsqzyXStbaFa23/2X0qV8rM9PA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	helgaas@kernel.org,
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
Subject: [PATCH v7 0/2] Add EcoNet EN7528 (and EN751221) PCIe support.
Date: Thu, 14 May 2026 15:13:16 +0000
Message-Id: <20260514151318.3444959-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 721EE543FA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr];
	TAGGED_FROM(0.00)[bounces-14595-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Changes from v6:
* s/reset/resets/ in .yaml
* s/re-train/retrain/g
* s/Root bridge/Root port/
* If module not builtin, log at mtk_pcie_startup_port_en7528()
* Do not fail if error in mtk_pcie_retrain()
* v6: https://lore.kernel.org/linux-mips/20260513191652.3200607-1-cjd@cjdns.fr

Changes from v5:
* s/errno-base.h/errno.h/
* Breakout mtk_pcie_retrain() into a function
* Use for_each_pci_bridge() to find root bridge
* v5: https://lore.kernel.org/linux-mips/20260413140339.16238-1-cjd@cjdns.fr/

Changes from v4:
* Fixed missing Acked-by
* Rebased to commit 66672af7a095 ("Add linux-next specific files for 20260410")
* v4: https://lore.kernel.org/linux-mips/20260404182854.2183651-1-cjd@cjdns.fr/

Changes from v3:
* s/initiallized/initialized/
* Use PCIE_T_PVPERL_MS for sleep time
* Use PCI_PM_D3COLD_WAIT for startup wait time
* Clarify comment "Activate INTx interrupts"
* Add MTK_PCIE_RETRAIN quirk for devices which require link re-train
* Do not retrain *all* bridges, only root bridge
* Better comments and logging in retraining logic
* v3: https://lore.kernel.org/linux-mips/20260320094212.696671-1-cjd@cjdns.fr/

Changes from v2:
* mediatek-pcie.yaml -> s/power-domain/power-domains/ and drop example
* Patch 3 dropped as it has been applied (Thanks!)
* v2: https://lore.kernel.org/linux-mips/20260316155157.679533-1-cjd@cjdns.fr/

Changes from v1:
* mediatek-pcie.yaml slot0 needs device-type = "pci", fix dt_binding_check
Link: https://lore.kernel.org/linux-mips/177334026016.3889069.9474337544951486443.robh@kernel.org
* v1: https://lore.kernel.org/linux-mips/20260312165332.569772-1-cjd@cjdns.fr/

This was split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2:
* mediatek-pcie.yaml add missing constraints to PCI node properties
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/

Caleb James DeLisle (2):
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC

 .../bindings/pci/mediatek-pcie.yaml           |  26 +++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 155 ++++++++++++++++++
 3 files changed, 182 insertions(+), 1 deletion(-)


base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
-- 
2.39.5


