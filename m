Return-Path: <linux-mips+bounces-3965-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC264919E34
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 06:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 558FCB22D28
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 04:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326191C2AD;
	Thu, 27 Jun 2024 04:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="kIHa8te4"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5001BC44
	for <linux-mips@vger.kernel.org>; Thu, 27 Jun 2024 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719462807; cv=none; b=cIuHJzHwGGzS13XukaD0skrN2WttMBCQnZeDlDbUpWPi9ReuhQvp6wGTDB4DkIBzEg3Kx5EvG7gHo03qyrn5Ctg6VqBlaS+jxM9EeQL6e4rOKOXyVXSiwn3HzXe74VupSp5tzGkm968AyGvCChZ8viKQf6Ic7V8PufBLkENr81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719462807; c=relaxed/simple;
	bh=SxKy6c8aH+qBN/CAmRz9nQAaQ/ZLS4PmvHvoZ7ft5Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9cKzLoMAhU+hV5XPrhRa+LaNS9w/TJ545F+T94SwiIeRcbp2U9HWqHy6RHHTBfY9otuXAkm+kw/YjG8IJydwW1TjHAsWZcVf6wdn7WaEY+d6fspL8T9C2/GmLCtCtHPcKaAOWYgWP8T5ASNJu8Ag82ZLumD673vNxiBtFAuynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=kIHa8te4; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8E1592C0659;
	Thu, 27 Jun 2024 16:33:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719462802;
	bh=+6losAJiIn99Fr4mDJL5LYRb7pOWepPEf8cwsm5Q63w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kIHa8te4tNtrCc8P5N0rQpHy3MLeA9CFUfYNmynUKb2sYJHiZsNi6aOBPeReSWBFd
	 4k9OZII+bdjQFdvlnkZXhklI22WAmFockwMxepznbwRR1c2x5L8q6APNETgxuMvrWL
	 AbAKXcvK1kLwcMR3SvJTrsUDH/0ZHFE5Gmh7jr74x2IL6799DOJbwPQb5WkeaMGDAU
	 6FTEIgqMIUjttHslAdAbpjpcLgaZ0l8LL3LeY3pyQkgQWM/WkzNI48WH4n11yRRQFj
	 rlwULVo2VWuJHXO93kt8f6ETeXVPC2vzh51+XkN+j9yyeIXEZ99LHWeEHIqU8eJ7rH
	 nHgmVMmPlM8jg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667ceb910003>; Thu, 27 Jun 2024 16:33:22 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E7F2713EE87;
	Thu, 27 Jun 2024 16:33:21 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id E4D9C28078C; Thu, 27 Jun 2024 16:33:21 +1200 (NZST)
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
Subject: [PATCH v3 3/9] dt-bindings: vendor-prefixes: Add Cameo Communications
Date: Thu, 27 Jun 2024 16:33:11 +1200
Message-ID: <20240627043317.3751996-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=667ceb92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=9AoCKF9XAAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=3ZKOabzyN94A:10 a=zuUzDCw_FVeVL6jMbh0G:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add entry for Cameo Communications (https://www.cameo.com.tw/)

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
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


