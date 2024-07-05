Return-Path: <linux-mips+bounces-4141-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C303E928029
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D565B22641
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128A8171BB;
	Fri,  5 Jul 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="xj86XDE0"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E214A81
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145738; cv=none; b=GPEl/l0tGLR7KIvymoMEGRkQjn+eICCtgdVhcvQRjNffvt2Bd05/XfFrdRSNzGI1HpU0A0uZaZwYtLqOC+tYQEda47tj1axShEEg19MfugZ9UP3gSWkmQu64dG/Dtt6QPTMKF8xo2QLOQUzvrwTpnR5tK8gkYRQYjT0cMog6d9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145738; c=relaxed/simple;
	bh=oboBZkqER54wOmwu+rzM4nCOahuZA/6oG78lA5ZJ8qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shnnnVdz0sbnOhfcfOHooFV42nVeNI9DDMB7x8Mf/DGUopUtb8RevriRVIh9KvHYOI4VMcnasTAX0XhZLKDr2H0h0u51RfEhMnfnE8vfNmE51rnnqqGKczSasjidjDuuV76v8mWxAdfIrPzN1rMO/mx6KB9syDbJYmX4LaPpFq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=xj86XDE0; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 87ED92C09BD;
	Fri,  5 Jul 2024 14:15:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145727;
	bh=yJuzH3G2PxWmdcbMjXGKSigf/af6MCPAIVJH2sihe7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xj86XDE0EQ+3SSEzcuhFF0RmGf9bEA3onkH1vDRTFwB2GlQDgN6IWnCB3tRHAUQzm
	 2MbPWvc1X2IvQZ6f17FyAIdKgwNvK4V/++++dVwrAXLGOIZeqcBZRJYRKkyOSGfYKp
	 +0urpTMERyTdmT7NTwfUut6etMmN8I14T9ySGfM1zu/HDA1I7ky/a1RrZmt9Pab1Sn
	 S2bc+/2Cdbi2G+1LstQKxjLqs2FN/8t9v0ytZQLQPxTGtY9Jxy4qjcCVhnaihWIhSl
	 GSg732C8ASB5E6mPESDc49XKRQCbAPiqpbJvOX4Jx/as7OtWmxFGmtgJW9c98Cos1I
	 u25cBR+4OX9YA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0004>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7E6B813EE87;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7BCFF280930; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
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
Subject: [PATCH v4 3/9] dt-bindings: vendor-prefixes: Add Cameo Communications
Date: Fri,  5 Jul 2024 14:15:14 +1200
Message-ID: <20240705021520.2737568-4-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=9AoCKF9XAAAA:8 a=KKAkSRfTAAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=3ZKOabzyN94A:10 a=zuUzDCw_FVeVL6jMbh0G:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add entry for Cameo Communications (https://www.cameo.com.tw/)

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v4:
    - Add ack from Krzysztof
    Changes in v3:
    - new

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..67550f0dd189 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -246,6 +246,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^cameo,.*":
+    description: Cameo Communications, Inc
   "^canaan,.*":
     description: Canaan, Inc.
   "^caninos,.*":
--=20
2.45.2


