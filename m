Return-Path: <linux-mips+bounces-8029-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F8AA48A90
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 22:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 665D816CBB2
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 21:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A860427128C;
	Thu, 27 Feb 2025 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="xkI1UyGl"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A17270ECA
	for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740691982; cv=none; b=pakNwcuUsyc+t0meWLtXcVXFltaFb2Cd2GZLLMMe6Bod9LHBHB9PC1pz8/ibGVTHYb2j4tyi28a8rqFYF67Rc2ERUtY4RYfhWTICe1+PLesZc+lsNT5v7Cae6s29loPF9Ua4o2fxxiX1B3oREFPa7sK7q/BPyHC84dhEHVnx2Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740691982; c=relaxed/simple;
	bh=zDFtsWgi7vJw/z4QjqAL8vfoG+KVI4FTjtLprtAEssU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JoDNV4uFRC8uGCu/vemXtzhUzBoStLM1U2cQMCzXb6RT1YytDSXtG/caDVQBx80JdH8DodApnsoCBvx95Bmh1y/Lt4ASCJlRifkMv55pXR6WLU7obmv9dAaZsbalXknJwA1k8WOWOD5JlQJlw206PF7FTNekqS6qKpPj4aRqUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=xkI1UyGl; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D6B0A2C04CE;
	Fri, 28 Feb 2025 10:32:50 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740691970;
	bh=+mRI7AEmzMx7gATbp4THP8aY4eXcjoUMqWC7MV2BTdU=;
	h=From:To:Cc:Subject:Date:From;
	b=xkI1UyGl2ng6amfCNQ6kuk5uEGQwsskUmHRtqZTLOyf0BOHkyIO6Kd5YCevzUo3ns
	 B2Iq0/lSwPITNeHj9S5B28tmXulM1HdbJDj2tyRBTaazL6u6gyShEg680kQDY1qqsx
	 rNLARVWx+crDMUsiZ9Cl2Sd9l+gAHZR9zIWFOTOEvva+W+uAacDQbH2MfAqq5/wkys
	 7+gKK0zdzxYujva8vDO+PTDgmLfPtPoKIgIopZNC9yeRdBwS47bqc+gnnXhL4blpTn
	 cYzZvZPrzJc1tLXd/VfVgF3z0qI4RSn7mCeuSOR2H47QwcIG+WdzQVBzvk1jTAiFs2
	 fs06lYQCOvAxw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67c0da020000>; Fri, 28 Feb 2025 10:32:50 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A93D813ED4A;
	Fri, 28 Feb 2025 10:32:50 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id A5D58280AFD; Fri, 28 Feb 2025 10:32:50 +1300 (NZDT)
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
Subject: [PATCH net-next v8 0/2] RTL9300 MDIO driver
Date: Fri, 28 Feb 2025 10:32:46 +1300
Message-ID: <20250227213248.2010986-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67c0da02 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=H2aqgZpJBgBZoEMRn60A:9 a=3ZKOabzyN94A:10 a=zZCYzV9kfG8A:10
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


