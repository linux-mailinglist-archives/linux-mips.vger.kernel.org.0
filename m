Return-Path: <linux-mips+bounces-14702-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIleOnlHD2ptIgYAu9opvQ
	(envelope-from <linux-mips+bounces-14702-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 19:57:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA45AAAAF
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 19:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF2F8315F54B
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 17:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C404639D3F1;
	Thu, 21 May 2026 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="sC3HuWKZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230C368D74;
	Thu, 21 May 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779384011; cv=none; b=dyEwdZ09oLJWk6TRMfBBp/gBDOtDRohstbKFvTXO2Vp7yeJwgQV7IU4UJ+4JhXld++DB9hAFXZHRXra9bEs4AoeV77ud87cJP4fV5wPdxdyq1Roc5ashGvGgmVTZjbRACiIHsRtznV//kvU8jejKFhd+/eIQMdzGqI92IeTvzY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779384011; c=relaxed/simple;
	bh=eM/Bzqu9eJX4yaHCMA7yz1SzKcgfL1zNte9+2MUmIVU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q3oED2g9SwW+NMojYKdkPmVYr2fMDvlkVAS5elO1+Sm0VR7ZrviTgvbE1iqcC4jUpoi2VlnsBVve5xKnuMkofAOIkFvNK6/vZWkw0tzHL/KI2/XwalnAX9pXMLjIbdUp83AEn9e2+R/ysxWENE3bREDjjVC6nrRsXI4BVKevijQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=sC3HuWKZ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CBB645B033;
	Thu, 21 May 2026 19:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779384001; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=JVuwPZqwH+POZcdbj/NmNEAj+bCTq3Cg4BUiBPTfuww=;
	b=sC3HuWKZZ6nY3DoYPYuOojJGJxpn23UUeOt5OAgQRScLqVb7SExyjjYhn5rd+tc6Uq+oA0
	P0/f0SnnsHv/8Y2KKJ3lMJ/vpOf5Ryjar/3tt7wg3QWfCvlXJZJnMob5ORcUPLbbNCB6tM
	AlS5H4lOGkaC1isy0WLYl50l6UtNpp8yseXm5+08oOMIE9n/oktPAQbFXFgHErPrymeaZ3
	ocdNRKsjwj2oWR+YfVI5cYZILpBixYiGeD54fmqBeT91VTbCrj3pPY2lfsfnl1hgvRDUe5
	gg3L2anvowVOvMU8EniHQjGaA9XvqOZawoQexFZZKVr6o2q25uH07mHymzY6OA==
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
Subject: [PATCH v9 0/3] Add EcoNet EN7528 (and EN751221) PCIe support.
Date: Thu, 21 May 2026 17:19:48 +0000
Message-Id: <20260521171951.1495781-1-cjd@cjdns.fr>
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr];
	TAGGED_FROM(0.00)[bounces-14702-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:mid,cjdns.fr:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 72DA45AAAAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tested on TpLink Archer VR1200V-V2 (EN751221 with Gen2 device)

Changes since v8:
* guard(rwsem_read)(&pci_bus_sem); in mtk_pcie_retrain
* v8: https://lore.kernel.org/linux-mips/20260520183827.908243-1-cjd@cjdns.fr

Changes from v7:
* mtk_pcie_retrain retrain all root ports not just first
* Include fix from Manivannan Sadhasivam, wrong usage of virt_to_phys()
* v7: https://lore.kernel.org/linux-mips/20260514151318.3444959-1-cjd@cjdns.fr

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

Manivannan Sadhasivam (1):
  PCI: mediatek: Use actual physical address instead of virt_to_phys()

 .../bindings/pci/mediatek-pcie.yaml           |  26 +++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 170 +++++++++++++++++-
 3 files changed, 194 insertions(+), 4 deletions(-)


base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
-- 
2.39.5


