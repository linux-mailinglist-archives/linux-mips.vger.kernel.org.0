Return-Path: <linux-mips+bounces-4233-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726BA92C9CA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD25284651
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165E44F8A0;
	Wed, 10 Jul 2024 04:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="UyMvdLxo"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F80482D8
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586142; cv=none; b=lbARTs+qj8PNoN9FacqYpgGOKTqTnT+z81kww5WBEwybeEfK4w767OyLgYRaeHUcTLbC9JFZbtqroBrjbv5R6fvVzTbHga80v6Oo9EmfKRlBcFzmKL/NJmljlRg/gRGn9xgjguhmiObR1d9mmG8/lAKJuLjQh9Wlmyof6wBaCAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586142; c=relaxed/simple;
	bh=8iUshweou2+JPAzV7dML+X+xGFNFc5W/FkwnZPDJzjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv/lfLnH09DedaqON8Yo2h1B9CD/rzSIuXiubCoImbvJZrS3nslu8hWErL5fYhiZ4O/OWmXAfR8ooopzLfvb9USqXOV8/lg54cBW4t68+mfLfNfk7SxmonYj+hyHu2QiKW/72O9ROAbveGMeRiTfNBpUYMx0hxSFpXnriI+QeiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=UyMvdLxo; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C6A262C0ADD;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586130;
	bh=0D0OJOD/c5JSxNJ0xWZ0yNlHTKLPrrkMHOBvpZf3s6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyMvdLxoD0P79xECPs8HL1v16xzPH4iLKSHZMfeQ8njtRXZN9vFknP1sN6mTkN13w
	 6s/s80krNOsqTMRFURKyMbimrkzXLSsaRylAlkkby1qJtR6X95DkmZXUJidFFtlDtq
	 WT5o9PgYoC48v78o8305/EO5qTwQCzBQhqf/jYP4EZq8Ge0kspHjMZutWFge6vKIVw
	 KRNYNTTQv43pn40hCbGd+z1lTKYcFA2FQm5ZpkKW02wo4LdUU7GSCZTnYgvc1SYXr0
	 VrVi8XdMT+9Ha4hx5Mgw8RF1doO6lNc/vgJLmATlrhl57sO8ppuHXa8YltcEgX0EYU
	 8FFBIgKvKff7g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920003>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0BB9213EE87;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 0976928206C; Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
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
Subject: [PATCH v5 03/10] dt-bindings: vendor-prefixes: Add Cameo Communications
Date: Wed, 10 Jul 2024 16:35:17 +1200
Message-ID: <20240710043524.1535151-4-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=9AoCKF9XAAAA:8 a=KKAkSRfTAAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=3ZKOabzyN94A:10 a=zuUzDCw_FVeVL6jMbh0G:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add entry for Cameo Communications (https://www.cameo.com.tw/)

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v5:
    - None
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


