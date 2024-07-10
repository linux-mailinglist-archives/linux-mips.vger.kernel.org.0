Return-Path: <linux-mips+bounces-4232-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3506292C9C9
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7123B22634
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6374F1E2;
	Wed, 10 Jul 2024 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="b3GbfSsR"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD6482CD
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586141; cv=none; b=eIHvJshVntgOQ0/IinW6LXi8NzIZYZUZMaYl4Tzp4omafq9aaRCIPkqj/+2icv2VB0R//PeC5rzfpvuBmdK9PGLLt3ouqMFP4yJ6tMN79fRYPg1aFmD5V+bticefL6BJztSHznjYhKEfXlmloLQbEUVg6RvRByuaYPr/ClnXvig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586141; c=relaxed/simple;
	bh=bivDCxqnhGmdAOv0M7NTE3VhwmnpVCOIC7+U0rnBqrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYJTR2y27u/uQAWhEIttluBteIbvpIIXo3WoChdYcJy16PaX+jpHvspcEL5fHQIhsOH6JbSe/rkrPQ4t5cNofuUMuXwZBqAZCio1ryB/W9AdGthxTawKoZhsH5DGfmovPSl2O4RqxUalfmlmr9su/vG98XKSzho3cE/Tii8FLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=b3GbfSsR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CE5EE2C0BA5;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586130;
	bh=B+MHJ0FovgFTC5RrFAm+yxAZW0k7wMvGFaaUpE1DdBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3GbfSsRo1V7XajPb0L6PWGfXxmByWRPXZBJoIlxyus0flXz5OSrF9S7uylDjKnlQ
	 nOChbdLVX6weq//WGmJHtRJ+5opCzrWiRjJVvCRnoYNY51gA5IJTnW3yjTihRX2lgx
	 ZW9BT+rHroVqrHAAggzl3vxf3vUP+5UjVxe+CJG3QvD3XszGbzhEgyJ+dKJ3/B+Yah
	 78MO6To8P/3EinlAySOmgyHsPgHUzmKMT7bv6a3qBghDUw3yK3DHKGFXdjhso6f26q
	 MIyTrWiqRWzs6to7suYoplBfHxb1Re2rx/EXvw3pI16+3QC2lTy3PYdNc6Q8CPGkHU
	 ecIbXlWzW90Ag==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920004>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 10D7413EE2B;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 0E05028206C; Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 04/10] dt-bindings: mips: realtek: Add rtl930x-soc compatible
Date: Wed, 10 Jul 2024 16:35:18 +1200
Message-ID: <20240710043524.1535151-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=KKAkSRfTAAAA:8 a=NHmAL4TRMSeL2PaLwp8A:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the rtl9302 SoC and the Cameo RTL9302C_2xRTL8224_2XGE reference
board to the list of Realtek compatible strings.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v5:
    - None
    Changes in v4:
    - Add r-by from Krzysztof
    Changes in v3:
    - Use full board name
    - I've decided to stick with rtl9302-soc to disambiguate it from what=
 I
      eventually plan to add as rtl9302-switch which is in the same packa=
ge
      but are separate dies.
    Changes in v2:
    - Use specific compatible for rtl9302-soc
    - Fix to allow correct board, soc compatible

 Documentation/devicetree/bindings/mips/realtek-rtl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Do=
cumentation/devicetree/bindings/mips/realtek-rtl.yaml
index f8ac309d2994..d337655bfbf8 100644
--- a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
+++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
@@ -20,5 +20,9 @@ properties:
           - enum:
               - cisco,sg220-26
           - const: realtek,rtl8382-soc
+      - items:
+          - enum:
+              - cameo,rtl9302c-2x-rtl8224-2xge
+          - const: realtek,rtl9302-soc
=20
 additionalProperties: true
--=20
2.45.2


