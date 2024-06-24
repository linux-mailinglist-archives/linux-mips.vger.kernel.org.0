Return-Path: <linux-mips+bounces-3873-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D12913FC5
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8D52813DF
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBA4EAF6;
	Mon, 24 Jun 2024 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="k/psxg4R"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E128F49
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 01:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192196; cv=none; b=eqGlFyjtnDZ1jhdF8pmufIIMVw0WAQ/LzPgezJqeM+4h9IaSOQUcrz1Pj4rp2sgx0Vz44mgtydtPJl0Jlf5V2MfJYQ9X+bbVpMjQoHfFJXltn0RCP/TZQDIPVFNuMEcZ0Vi2GUgrCXcQf6K5zrGqutS4YK7lBrN6OxrB0tcOjxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192196; c=relaxed/simple;
	bh=ajdSd7NM+Vv2ruIXIQimCde3taVyRiQIAzAI0/7JZvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ve1JSquZ8wcFqdKbdvX0CSyGIM3nAZgYWD5XvihdX3ynF3fgZ9U2lNCK8CvKCfRfFUYGGll8YeQCT8y1Uw2iE2qhQ2eAVx96WP/sn02pGQKUfZIfd3CDJnX8B1fYzn5DqkBSqtB3RefqR6qFmzhXZMB2rcETbPkOeE+ttfay8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=k/psxg4R; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AECAB2C04D1;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719192189;
	bh=qSsAQEyHoejm8axLKyoav28LK43JFUt5/VOB4Io71/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/psxg4RZn1VeRpPukO2yFF19Z08YPvfaeVIGiwHQlBK0T4fSZCoaMZZLZn7TG5BZ
	 3lGAYw1bsZW4K73ELzTeTvOy8yuVPaloW4GanPya8fSlWmrj3qcH3NtnPBNaXSOLDs
	 n8WXrYvl6yihvmsoVZbGio9U3VlFYOKu30AZoEG5IT+Ii/8zAVbXL35DYWmM+0IZ0c
	 wgj+d5qCdHglaLa0ljEP3JdQ6Rsqi9nHKQOwhPwnDDpU8wi462C5FQpATj/kMppqme
	 JhLyqb7ZVTxS1cOWMApy0F9PlScCi+8pIvS1FFudkZfJlafNcrwpeTrm3aZEg7O0qj
	 w5bBkQGl74eqg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678ca7d0003>; Mon, 24 Jun 2024 13:23:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3780113EE87;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 33A80280CD7; Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
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
Subject: [PATCH v2 3/8] dt-bindings: mips: realtek: Add rtl930x-soc compatible
Date: Mon, 24 Jun 2024 13:22:55 +1200
Message-ID: <20240624012300.1713290-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678ca7d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=U4dIIFTA8Tsx1qZWGJkA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the rtl930x-soc and RTL9302C board to the list of Realtek compatible
strings.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Use specific compatible for rtl9302-soc
    - Fix to allow correct board, soc compatible

 Documentation/devicetree/bindings/mips/realtek-rtl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Do=
cumentation/devicetree/bindings/mips/realtek-rtl.yaml
index f8ac309d2994..05daa53417e5 100644
--- a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
+++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
@@ -20,5 +20,9 @@ properties:
           - enum:
               - cisco,sg220-26
           - const: realtek,rtl8382-soc
+      - items:
+          - enum:
+              - realtek,rtl9302c
+          - const: realtek,rtl9302-soc
=20
 additionalProperties: true
--=20
2.45.2


