Return-Path: <linux-mips+bounces-12660-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83318CED363
	for <lists+linux-mips@lfdr.de>; Thu, 01 Jan 2026 18:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1FE03001021
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jan 2026 17:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D162F069E;
	Thu,  1 Jan 2026 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="kFW7bhvN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627C2F0C48
	for <linux-mips@vger.kernel.org>; Thu,  1 Jan 2026 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767287546; cv=none; b=TGiSoaLXrCDyVZ0kxQo3XfsJ1GJ2fdKikLDNwMixedgVDWPP0dqUQ7HlP0A++r6SlSDaksyxbYPgkmD3jOenzNmtCtpX+sAXvd2pGg6NyZm0XOINAnjhxP2OxunC/Dd1JjtPNhV1A7J7QNxyLBy+2eiFxyJRXrccTd7Aq6t36N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767287546; c=relaxed/simple;
	bh=rnjOeI1AkNjJXoYzEwu8ftdMfRCYM9kz3NFT+/aiEgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGAkm/xStSqUAubt4JORS7vuKQA6sc58ImTnw3N0wAdjb0/3vQTz1JsVioKw8NkzaI5mrB/wdBhIjXLhfrSCwzL1q5V2ypG8AAeqMxyik1lfJplMuo0T9jMMwXhM7mZkwJgpA3GEVX+GHskbG+GwsI062ZgTOHZStfJolKV4oEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=kFW7bhvN; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 25178 invoked from network); 1 Jan 2026 18:12:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767287534; bh=NZ9wR2ReHBYF/AExO/WGqvTNzHA5m3q65auZ2OTpjQM=;
          h=From:To:Cc:Subject;
          b=kFW7bhvN9BxEmu+7B2mW3oWjdvnYnU+N1cWxWqg/of50k2cFP9LHWo+8rrMalhkMe
           4g+fRhE+ypAZiJh65gQrpR09G37HoitAQDuqYu7TDW337tk6VMC2F+op4uXyxlgR9r
           6sG7dpKJ/JeV13i03W4T8W+8OAjuqAopPYcS5aEo7+GTxFtGbtS3E7PeuheeFDqKWX
           eYp70Ifz6bPi/JxpQ2vtWGRVu8jFP1FABtT3eJeAxT9T9RNR1SJsFQ+Jutn1Mh72gY
           hxREG8Ry3SU0qE/tKrrKlP6S76JWbCd+tSDdLTLnKSt0+6o342U7l2SvyOPRTphh6q
           ATf6tDaTuctOg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 1 Jan 2026 18:12:14 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	chester.a.unal@arinc9.com,
	sergio.paracuellos@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	tsbogend@alpha.franken.de,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 1/2] dt-bindings: crypto: Add support for Mediatek MT7621 SoC
Date: Thu,  1 Jan 2026 18:12:04 +0100
Message-ID: <20260101171212.1861241-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 105dc3b8181124504b8ee5fad02c645f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000007 [wYQR]                               

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same os in the Airoha SoC.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..8ccff64f5c1c 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -33,6 +33,9 @@ properties:
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
+      - items:
+          - const: mediatek,mt7621-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - not: {}
             description: Need a SoC specific compatible
-- 
2.47.3


