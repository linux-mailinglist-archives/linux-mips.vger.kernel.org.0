Return-Path: <linux-mips+bounces-3815-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D3911963
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 06:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3630BB22056
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 04:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA38F84FAC;
	Fri, 21 Jun 2024 04:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="IRdLxC+M"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744812C478
	for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944076; cv=none; b=Vhwwg4gdVASc8jonOTnFqnn6KU5YvjYubhmrV1bZIfq0OaPOb53bLhDVWHThKmU8uw5C7xC1AcnXzXMakPyw1pMv+FSMbkuRodktcX8lIbFozNpVBpLCTMGuBs4FZSqJYFWjIrXnPBLIypI9cq4POr0JedapXRaRgKgRP0+91a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944076; c=relaxed/simple;
	bh=9F7/pDVIyY5TMdrdNAJrOgxGq2+BhjoSOQbrfcPHA8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8HoUYulT3sW1DW+0CWKbT/9aWVIH/6kBiX/aK6D0YCZ+pW+CfHNo4DwGw2XoexywpU2C0INvrY3m63VNY3kVP5l2R/HjI1knRIrvDaSWqcVmYQun/qyTVfVdfZceFlSNBRiJ+Ol/M2NZzrBNn4SnsBgQ3UexvDPIoC6F0ZVWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=IRdLxC+M; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 99D752C01F6;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718944064;
	bh=SNGmJcjAA7tZgdlqk6UBzfeZbU0k+XWZqd5KIXEx/L0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IRdLxC+M0VSknVCAgf3P/OFItJYauEYfdAvqPhJWXSCuwzrmomharOk22TiosasiL
	 rpSDmiIXi5lP67J228+UjzNYiqVhm8LoB1+HI9j/iFhrVworcQOMNRO5riR1O2a+kj
	 j63KX7jI31iISig9lR1JGj5vDMzJKRjmgiyyr/XuXfe/lYMRo5xJx/0T9lgOWbiU+U
	 CrQlfUneNfoCsJ/96JJDgsvkObR3N5pEWrZqFSy47ATf5SgLcxvnOm5kyX6Cymn5/F
	 VGTOT8AcJhY28xU7cj0lexU+VSNPR/a8fEVbzFwUFSPSrxsGhHxYmNXSJErb/7XnNq
	 I71xd3P3hHAUQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667501400001>; Fri, 21 Jun 2024 16:27:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 47BF813EE4F;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 449CC280B94; Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
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
Subject: [PATCH 1/6] dt-bindings: mips: realtek: Add rtl930x-soc compatible
Date: Fri, 21 Jun 2024 16:27:32 +1200
Message-ID: <20240621042737.674128-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66750140 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=WKw4xq4RvRPWmP5xJC4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the rtl930x-soc and RTL9302C board to the list of Realtek compatible
strings.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/mips/realtek-rtl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Do=
cumentation/devicetree/bindings/mips/realtek-rtl.yaml
index f8ac309d2994..f59249a2cefe 100644
--- a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
+++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
@@ -19,6 +19,8 @@ properties:
       - items:
           - enum:
               - cisco,sg220-26
+              - realtek,RTL9302C
           - const: realtek,rtl8382-soc
+          - const: realtek,rtl930x-soc
=20
 additionalProperties: true
--=20
2.45.2


