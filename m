Return-Path: <linux-mips+bounces-4236-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C192C9D8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6E928464D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8C17D08D;
	Wed, 10 Jul 2024 04:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="e8t1Vy4r"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E535FB95
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586145; cv=none; b=Z7Q7AH3FsqzpEnglSvtru+uTxC28Ou2zJbmP4tv5A4nxIOoJg28rKS1MUJ/ZB3nIaOUPb2syl3YN1ObvEK7loqXd67bhbTnk9iZt+mi09OLBr40Cx5cZlQn4Bvhurgjp8CHLiXCtGgLPV+093bulQZgR6m6xtlZnAxKlElKVoEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586145; c=relaxed/simple;
	bh=gfmhluNVb9qxakzJic448YYqQ6PnVg1JEejaRHQKyD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH9cnT/PitbrgN1lZ4R7dPDpxM8Bkrfee4XSkVXUQyBAUCnnWnriOb6e/9eal0AgK8CfuZ+AwGMgn0aVcM7hQzRPJXBBSPAZ1o95M+51pIQS89JzMmFpOVw1uWe1/fSeVYBgkuQ2hSu+3XSdzZlBC82xSIXBgax8MaK2Oo8Leak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=e8t1Vy4r; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F3ECA2C0C3E;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586131;
	bh=sj9TF1USDV3Y5wrmBM81bTyRhqGpRFWpn3hjQMHSDzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8t1Vy4rwt6BVY9cdi5a0X8jfW2PxPg0CXmxI8cLNYvB2uyMCwepTAful4ErqZd+d
	 voZdZ7zFAyCovmmaUpWt+p7FsaVpQp7fPPNm0CBjC1B6u7dmXIAToHDEXfjDU8w6L/
	 8qVjmrgQDB067elaMVVFt61Sp87AlkWBIjND6YL+ivwQkgb49B+RK7tunCnapWjHf9
	 MLaOZGqckpopPJQ0GrpOocLITmCXZxvZyN7MYPsAmKIw+DTJBEOhAzH8/nys+ofV52
	 xima/L/TfV7vbqhyWdNwAgiDEmq49r3a4I1e29k1alpkeyEKzB3mWpQk5IN+aGujK9
	 YwVYtq5qJpjtg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920007>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 230DF13EEA1;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 20AED28206C; Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
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
Subject: [PATCH v5 08/10] mips: select REALTEK_OTTO_TIMER for Realtek platforms
Date: Wed, 10 Jul 2024 16:35:22 +1200
Message-ID: <20240710043524.1535151-9-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=BeXzrB99bI5bNkdFKp4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

When MACH_REALTEK_RTL is selected automatically select the
REALTEK_OTTO_TIMER option in order to support the Realtek platforms that
require it.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v5:
    - New

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f1aa1bf11166..df29c3930ffd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -667,6 +667,7 @@ config MACH_REALTEK_RTL
 	select BOOT_RAW
 	select PINCTRL
 	select USE_OF
+	select REALTEK_OTTO_TIMER
=20
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
--=20
2.45.2


