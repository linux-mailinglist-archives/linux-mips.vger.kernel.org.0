Return-Path: <linux-mips+bounces-7965-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32EA4512D
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 01:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDED67A4050
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 00:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B4428E8;
	Wed, 26 Feb 2025 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="T1ffb+zW"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B50C382
	for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 00:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528484; cv=none; b=uDYoDPA8qvGvRG+uKIKnnq2u3WUNuqms+PimnlVG1DX40Oh7uSmwpiQ9CYycKFrA5jmNCgRRLrGtuMod6E5Hjtfi89z0ra/+mftPfITItFataz7pfSBSf06EpYWomCALhLdwms1Q5XNPCpiJKcKLVAjjoYsXR/wrk4dxhB50ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528484; c=relaxed/simple;
	bh=zDFtsWgi7vJw/z4QjqAL8vfoG+KVI4FTjtLprtAEssU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGoouPSe2cO/AedVb6pEcMYZGp3m25ndTh1xQJckh27YFUlpjxi0o/FajgBjtq/ivy8qIixoxO+ZVogi9VQRmF43ZMYlDI51XmLkfV3dERM11haszFZMr8wAvpGuoEl7mVKNXiI/rXM8+OMhTwj46m6F0Nf7oL9u1EkLa7wwGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=T1ffb+zW; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C0AC72C0343;
	Wed, 26 Feb 2025 13:07:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740528472;
	bh=+mRI7AEmzMx7gATbp4THP8aY4eXcjoUMqWC7MV2BTdU=;
	h=From:To:Cc:Subject:Date:From;
	b=T1ffb+zW07JHG6tr9ChwuqXEZAYLY9zr6xwr/gn3+nY7/7c1HqcjELVL30GmblHJX
	 j3zKRSciORJGH0otlE57gmU/fHisbYEhnRPoEChS5D8QDsOn+0JvveVclTJmMsrCMH
	 wcKkik8Y67YGy+jOmZm2hg0FeGSqBE3vjDMAH7ulppqqkA6tB59+9vrZKLVA0JbonJ
	 ExVzS371nLpxnTWVAZTL4DSuTwGNfIVmY2sSt3HMLo7hf13PeVaxoO6g9LQZqf7bvt
	 2CzaSJYNzodP1sbIFFrseFe2pVM8wiIB2ArZOSL7GHeDADFdI4/nwdVyl37cG1PniV
	 zraS2qfASfkFQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67be5b580000>; Wed, 26 Feb 2025 13:07:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 952A713EE7A;
	Wed, 26 Feb 2025 13:07:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 91BC6280594; Wed, 26 Feb 2025 13:07:52 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	sander@svanheule.net,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next v7 0/2] RTL9300 MDIO driver
Date: Wed, 26 Feb 2025 13:07:46 +1300
Message-ID: <20250226000748.3979148-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67be5b58 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=H2aqgZpJBgBZoEMRn60A:9 a=3ZKOabzyN94A:10 a=zZCYzV9kfG8A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds a driver for the MDIO controller on the RTL9300 family
of devices. The controller is a little unique in that we can't access the=
 SMI
interfaces directly. This means we need to use the hardware description f=
rom
the DTS to compute a mapping of switch port to mdio bus/address.

The dt-bindings have been applied to net-next.

I've dropped a patch that added PHYs to the cameo-rtl9302c board as I kno=
w that
will need updating once some of the other in-flight changes make it into
linux-mips.

Chris Packham (2):
  net: mdio: Add RTL9300 MDIO driver
  mips: dts: realtek: Add MDIO controller

 arch/mips/boot/dts/realtek/rtl930x.dtsi |  33 ++
 drivers/net/mdio/Kconfig                |   7 +
 drivers/net/mdio/Makefile               |   1 +
 drivers/net/mdio/mdio-realtek-rtl9300.c | 475 ++++++++++++++++++++++++
 4 files changed, 516 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-realtek-rtl9300.c

--=20
2.48.1


