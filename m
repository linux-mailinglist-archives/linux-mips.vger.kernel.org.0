Return-Path: <linux-mips+bounces-13423-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOAqOOzIrmlwIwIAu9opvQ
	(envelope-from <linux-mips+bounces-13423-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 14:19:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E123995E
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 14:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B36A4303A483
	for <lists+linux-mips@lfdr.de>; Mon,  9 Mar 2026 13:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32CB3C277D;
	Mon,  9 Mar 2026 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ehIaKPCb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8D3BD63D;
	Mon,  9 Mar 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062345; cv=none; b=WJBDvb7KnSN3HoJPy3aI6dfDec5LQyKQg2R2Xol1X9458kxmw+2R+V3E76AsPynQUw088MaUgi+dv4REFidU80zOCceqnzK2AK/Bw1o1sGv+ByFMgz1m9b99Y1O1hXHM1VV4wkkR3Z+1xnWAfMaFoVbknXzWSYXHJql5uGTFei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062345; c=relaxed/simple;
	bh=zbaVHZx10SvzVHWpOjcojCo/vRJYD1sbkwZElhT8aA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y0gas09dGcaVuyz2ofzQ/3RsiMj3/ljbFXgQkCBSUBDyJAx3LU06ZLdu75MKeZx0+/0hxzr38i0j2fXnC0dPMAuTpmv3jWTe2TgwnNup0QbabZVB3TMeuPH0wkmdp83+LOkpJPXemTrjEkWHezYX5sVNKRLjdiJFwpdBMDVtB4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ehIaKPCb; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA33F285BDC;
	Mon,  9 Mar 2026 14:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773062341; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OiRQgm2fH3aML6cl3pDo1ClODmIrMf+JKaRfp7jk63k=;
	b=ehIaKPCbQpJv7N/K2R3jc1AxUGhEwUdKkelwgQ8B9PibujelZs9PyDJFlFpM/30aGlT0KN
	jJP1w2hHUMKQSChlRCMoBJMwJbK8SkyaB8wKoYjtJ3J4h0hzhTTDZMh6rR36FgCX/j8j0M
	kpAeBi7jvCfaVZTbSe8dDLeRWyarb/3wmFMUJK/vqA8njbScl492GZRJhpGbgWwEy3QTU1
	QyjWENdyQWNo/98DPrJ7lOuk4bIqTwOcAUawzll5XtnfxzFs3stbm3ZFQmToRYvzXjvZHs
	rw4gaorrqfp852WQfiaUGdBmN+SnXl+4xIUpf14mfYBoxSz269oRp+QeLzXsEw==
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
Subject: [PATCH v2 5/8] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Mon,  9 Mar 2026 13:18:15 +0000
Message-Id: <20260309131818.74467-6-cjd@cjdns.fr>
In-Reply-To: <20260309131818.74467-1-cjd@cjdns.fr>
References: <20260309131818.74467-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 6B7E123995E
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
	TAGGED_FROM(0.00)[bounces-13423-lists,linux-mips=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Action: no action

Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
binding.

EcoNet PCIe controller has the same configuration model as
Mediatek v2 but is initiallized more similarly to an MT7621
PCIe.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..57cbfbff7a31 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - airoha,an7583-pcie
+          - econet,en7528-pcie
           - mediatek,mt2712-pcie
           - mediatek,mt7622-pcie
           - mediatek,mt7629-pcie
-- 
2.39.5


