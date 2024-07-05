Return-Path: <linux-mips+bounces-4142-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0D92802A
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A791F1C22291
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770AF17BBA;
	Fri,  5 Jul 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CgOPkhg7"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1A712B77
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145738; cv=none; b=AJyUNbhaa/DfTDcIkmIXO9z4KcYLHfY4eR4g2tB2lqNrwoF7fkBWI/YhvFiY4mZjLfdV2t/5TVtovWNVNTK/3GovTuR+J3vitxEYewdhrYeDjq3bjZxQYbvQL3UJHcE4juU4PnOLCKQR5wUzbYF9hX1l5MwhsFl1DCE5/le18ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145738; c=relaxed/simple;
	bh=OAnEp0Bmesa9Q+qHEvjiX7MX7JAM0Z9VHBdTJg/KGz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBd+7gVy2EtNdYGRJZiSTliFvSe13SLTTNRzg+bAcMgwr0NYWK44ST+Wo837/OzPj6IK5S1i6H4D75n4efDq+ObuTxaTh9JwAGOCU9etbqIbgEtSGkUcWqlDau5CSe7jWer4/CIs4Tpz+yUxpty2DcM40XyFBmkzAYhCNJTUeb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CgOPkhg7; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CD98C2C0A3D;
	Fri,  5 Jul 2024 14:15:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145727;
	bh=YoAVQDCPZyq10ajfUQCGozhwzv0HeGsPpLOLk6tmiAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgOPkhg72ajOf+v9799Gs+gsA1hyFajjBnJ1zHHtSriY9n+9A2+L6uXE9aV9cmN9R
	 43Z90ZRghhSurVUo3RY13xN+epFXsd7hVnKuGJRESSmdvwSzIS9t25U15G6wMw+onE
	 kghZgNUIo4ro7MndXGGIarnnMDML79xW+/u7uuIBs6R97cUGeOkIOfosWa7OhTt6/O
	 +ZlMNo/65QGGT2m22FIUyQulkyi3b79rJhnMNDV1IhQR0liv3s/zuUSpbqOCSBO2PG
	 cpvXDUPrItYXf4Q+Ac7f6TrJ6nfcKk58yjbodPl0GkAmV1LqM9FEZdBprsKsW3pBwG
	 dKisBjTl5Xq2A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0005>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 830A613EE8E;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 805BA280930; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
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
Subject: [PATCH v4 4/9] dt-bindings: mips: realtek: Add rtl930x-soc compatible
Date: Fri,  5 Jul 2024 14:15:15 +1200
Message-ID: <20240705021520.2737568-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=KKAkSRfTAAAA:8 a=NHmAL4TRMSeL2PaLwp8A:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the rtl9302 SoC and the Cameo RTL9302C_2xRTL8224_2XGE reference
board to the list of Realtek compatible strings.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
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


