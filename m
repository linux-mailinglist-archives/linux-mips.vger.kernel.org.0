Return-Path: <linux-mips+bounces-3813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D692C91195C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 06:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBB9DB21CDD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 04:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0290012C475;
	Fri, 21 Jun 2024 04:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ptFIK+Z6"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274CA12C481
	for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944075; cv=none; b=DLTFR0KYIaRiV8YY+MoCQBnYAsX5/B7EpyY9QHk25MZSjHaaIYNVuTkjbvlg5ITywZ2X4ux7nWesLf2MfVLFxeStbA9wy7XDOJgKrGofrQT5b+ujrG82JKlbFvbKvD7ZpfESQAmTyzVYbjyPHwQD6R5ETKPP1WoK/mwJIO2p68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944075; c=relaxed/simple;
	bh=s5sE9dG3z1ribe8LQscp/XRfjcJCTaReeAjv9ZSrZ6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdm8f2WjKLIK8SkZS0pRMqZ9KEhZukVvRx5rtCYkQT8LWnA0t0EDrqoZzmHFrMGNN79P/BxBA+JOSx5T6AuwHGG06Sv3ZvCP5VUdYfpiW8ssGuWgVcnhyEmtHNZE6KCtjDs0P4vJxqgh8CoORIpXi9LILTNZYpGRL2mPaB3A6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ptFIK+Z6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CAA0F2C03E8;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718944064;
	bh=H8nnewnVctraQiDGQIZE3K3KHwNqVYmo5akwtS+bcRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ptFIK+Z6l2lOY9VnBEq4P5KGDhBJjZ+haOf+ZIFVPCb5OM+5di63S93BjnB2QeJFd
	 rstSBtZhk3crs4fRgMuXWm+oVa0rWIJB8spx8pjnu4IjDKsptPM6L+ZkhfBlRLO5yT
	 eeQWVNGFSLly7tYdj21Rx2GE32N8emTO43WeyvE5IsVwiCbLUxB/nVC99F53tSR+9H
	 m0nd24CFNxCYZctkkkENC7nUMP912G20usFvGYNS3EJ0C7kSRvGF5aaEQWTH3eRIUU
	 imuIvXr3YM/SGKw784V6YUgeVKdz+JC/Earhu/ppygUkxxbYWWRl2mCdTWR9Nj6kPy
	 qf40UaAVnrekw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667501400003>; Fri, 21 Jun 2024 16:27:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4E4E213EE87;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 4CBA3280BEA; Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
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
Subject: [PATCH 3/6] dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
Date: Fri, 21 Jun 2024 16:27:34 +1200
Message-ID: <20240621042737.674128-4-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66750140 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=h--whVKCMsWL7UODL4sA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a compatible string for the interrupt controller found on the
rtl930x SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/interrupt-controller/realtek,rtl-intc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realt=
ek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/realtek,rtl-intc.yaml
index fb5593724059..a5469a32ce76 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - realtek,rtl8380-intc
+              - realtek,rtl9300-intc
           - const: realtek,rtl-intc
       - const: realtek,rtl-intc
         deprecated: true
--=20
2.45.2


