Return-Path: <linux-mips+bounces-14594-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHD7HzTpBWqPdQIAu9opvQ
	(envelope-from <linux-mips+bounces-14594-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 17:24:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB125543F85
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 17:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71B083145D4D
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032AF42883E;
	Thu, 14 May 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="rC99kBpE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7333E0730;
	Thu, 14 May 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771639; cv=none; b=QF9vvGxLbt7Cv85QUhvXLXpTHgKE556P/QKFJirYE8cPry5TKC7DY2Roqbh1hZ1QN0hvtEeOFX1PPRDWUqUstAq1NZj7OKwhUgGtOuOgTYivR9TuYT20LmF+Aw9GByxlJ1nlS68dEpYf2OXsk28MSmXcHTE2xMoAINwhe0mY5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771639; c=relaxed/simple;
	bh=waINsKFbSyXcxAqUAzgj9r8Ga8BceWjqseF36ALPBz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dr9ZwFgKRbXQir0SsFRaEewQuNK4nbhTt6v0fF+YLtCfwi/a63SdEBqDAgMjOjOtxM4bzspMvi3cjpwnHspDALCv7066Tv5kg3LZW1wW4Q9tUhkbWmt2A7WiLqkutGNPvdGjk+9pM+MswAJo+DjRWAUs/uV3jDGnaCmPv7RhgOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=rC99kBpE; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A12A3DE9FD;
	Thu, 14 May 2026 17:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778771619; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IXgx7gfpsPR0kF8ck7MRUn7Q28yaC8th/9vky8kZIes=;
	b=rC99kBpEKBGa64ABDuQPgBe81fMPPr6gfCljJMEdZ5GznYse2DToXnWL74StzfSuu3RU+H
	Hv4CJ7RPv5blLgrh4mrM7qqVhvBHTcB/qHT07fAZy7AYk9OPP3XlBtQzW1Hcvqs4bzrJfU
	yfILM5+CV9zgoYVEK7bzfMHE3YqFE0VBJiptVNZdOMetLiAbF4dNdeIQk2FZC57VmWTFKQ
	WSUcjAJ2IxYtH3DMhQ0XVqeQY7U09FCYjLtt5jNAVWkYp2tvvHgchbbFGYjLIjAZHyQfkS
	PL5dy0e9RS0K2QVdYPXQotyEAvqYBjXP0hhZRR/gpsvfHthsA5XqlGsp1FaEIQ==
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
	Caleb James DeLisle <cjd@cjdns.fr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Thu, 14 May 2026 15:13:17 +0000
Message-Id: <20260514151318.3444959-2-cjd@cjdns.fr>
In-Reply-To: <20260514151318.3444959-1-cjd@cjdns.fr>
References: <20260514151318.3444959-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: DB125543F85
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr,microchip.com];
	TAGGED_FROM(0.00)[bounces-14594-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
binding.

EcoNet PCIe controller has the same configuration model as
Mediatek v2 but is initialized more similarly to an MT7621
PCIe.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pci/mediatek-pcie.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..c009a7a52bc6 100644
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
@@ -226,6 +227,31 @@ allOf:
 
         mediatek,pbus-csr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: econet,en7528-pcie
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        resets: false
+
+        reset-names: false
+
+        power-domains: false
+
+        mediatek,pbus-csr: false
+
+      required:
+        - phys
+        - phy-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.5


