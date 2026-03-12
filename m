Return-Path: <linux-mips+bounces-13591-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MTLJF/wsmlaRAAAu9opvQ
	(envelope-from <linux-mips+bounces-13591-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:57:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E1E2761FB
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDE963023694
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 16:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38913D9DD6;
	Thu, 12 Mar 2026 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="bCBQVD9c"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B439098E;
	Thu, 12 Mar 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334426; cv=none; b=J4axCJYRtCcLLXN4hAJV+mf1cOxpJS4xh53HHdhq6ayLZKa/6cBznlYlb0ABz+D0acgd7pUhwDyAkpTomqrIOaDa/sFWaocsVVMpBFsrZuHbQJatxuuexVu5dF3jpR2o6qLpkjGK/CZcu9EPBqVjEU4SpohyYMu7q0c7s/tb8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334426; c=relaxed/simple;
	bh=LyKCNssqnl2vztrQOWET61HDjDykU8dsBFmzjj852FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dlLVBk34sZJGybW4Xb528iLiIsPMDkvQQHU0QrttL6UQp/1mNfhtONnJwIVGssuoS8mZ5f1a/hkx3aVp1xM1JgE8jLQ9T6+Yf/yMTvZSQpMk8l+onuI/KtDI72ZyhJFppnjaIWa9TFhTToq/aF2vhvFqfTqfb30O4djvXHkNwyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=bCBQVD9c; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEC552C7C38;
	Thu, 12 Mar 2026 17:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773334423; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XfeLkzD3jHviFHfsrPQFth60rKx2osGAGkwc8bgjjGk=;
	b=bCBQVD9cJe9/f7Ts4lwAfzQ3rCqUU5OICxzvkbKnmPRDnRBybPrjcJA/h7urTkxBHCtxJy
	k09A2nov3B6wYJ6EN8nKttBYyUBWdNLK1Gri0xB63RmPl1IqKmc6EJEmOUDVMjabV5VbAa
	9XyFkoD77ySp7Id2ZC2dvj/jRm3PUyf++s+ZnYYHN6JuuTcM8YCYJ3NshUJ7W5M5Wbgjrd
	ZK/1WrPlmszCT2Q+6Q6kJkLiudYWWnBrn4oxy8fTW/ylr0DXunrD6x/0afrVYkCkAXUw+H
	cglfV/kl2ZFxMJVEeRQpofYKIugKXYxkZhuO99fJfyKarDGQKnbGP8kbYPHL2Q==
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
Subject: [PATCH 1/3] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Thu, 12 Mar 2026 16:53:30 +0000
Message-Id: <20260312165332.569772-2-cjd@cjdns.fr>
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
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr];
	TAGGED_FROM(0.00)[bounces-13591-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 34E1E2761FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
binding.

EcoNet PCIe controller has the same configuration model as
Mediatek v2 but is initiallized more similarly to an MT7621
PCIe.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/pci/mediatek-pcie.yaml           | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..ae95b635f304 100644
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
+        reset: false
+
+        reset-names: false
+
+        power-domain: false
+
+        mediatek,pbus-csr: false
+
+      required:
+        - phys
+        - phy-names
+
 unevaluatedProperties: false
 
 examples:
@@ -436,3 +462,58 @@ examples:
             };
         };
     };
+
+  # EN7528
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/clock/en7523-clk.h>
+    #include <dt-bindings/reset/airoha,en7523-reset.h>
+
+    soc_3 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pcie@1fb81000 {
+          compatible = "econet,en7528-pcie";
+          device_type = "pci";
+          linux,pci-domain = <0>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+
+          reg = <0x1fb81000 0x1000>;
+          reg-names = "port0";
+
+          clocks = <&scuclk EN7523_CLK_PCIE>;
+          clock-names = "sys_ck0";
+
+          phys = <&pcie_phy0>;
+          phy-names = "pcie-phy0";
+
+          ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00010000>,
+                   <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
+
+          interrupt-parent = <&intc>;
+          interrupts = <23>;
+          interrupt-names = "pcie_irq";
+          bus-range = <0x00 0xff>;
+          #interrupt-cells = <1>;
+          interrupt-map-mask = <0 0 0 7>;
+          interrupt-map = <0 0 0 1 &pcie_intc 0>,
+              <0 0 0 2 &pcie_intc 1>,
+              <0 0 0 3 &pcie_intc 2>,
+              <0 0 0 4 &pcie_intc 3>;
+
+          pcie_intc: interrupt-controller {
+            interrupt-controller;
+            #address-cells = <0>;
+            #interrupt-cells = <1>;
+          };
+
+          slot0: pcie@0,0 {
+            reg = <0x0000 0 0 0 0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+          };
+        };
+    };
-- 
2.39.5


