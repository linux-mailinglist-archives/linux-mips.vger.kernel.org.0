Return-Path: <linux-mips+bounces-6956-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A99EDC45
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 00:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA691678C9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 23:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57B91F4E25;
	Wed, 11 Dec 2024 23:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ppXO5a6M"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF53F1F2C46
	for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733961242; cv=none; b=urybn7LlazqZSR7yfsMQQmBiPGk8R8VscBLG6JDr2hhkk3TQG4hsGB08glLRzOZRL99oeVSNagxDrAcRQdqZLIfjGZyl46b3UG+MNZ7+zZr+pg1WUlq6MpT++qWrDA6PyL+YaD0OMnUyQIqaGOBgJt1gLgELxtpM46dSha8qaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733961242; c=relaxed/simple;
	bh=stoC1G8iblU8O30Rj/lDT0olK4BzpBBbuTHrpwSS1QI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNQQLZH5hX++WmV+3m5UvTJvhF+dqFbO+5epiYoI5WU2k8/Ed59e0HZjfU1wlJ7ordew9NUjL/M1wXZPHCl5qgxJH3TKKavtZZdY3+C+EpKDUT5kAFiapDO1py5c1QoNib78e4qdhrM0OYW1+MqUksr/O++Lfj+sGlnYrqzBZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ppXO5a6M; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6BF2C2C02B3;
	Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1733961231;
	bh=4b/0gkfN184TVJOckeIG7K3tpwmKYJFz5jFNpK3jJS0=;
	h=From:To:Cc:Subject:Date:From;
	b=ppXO5a6M9r/vOK7DwBNsrNxLqRDLjeXFzKkR2VLHBGYSl72Y1JyZiJPiUVrqe5buZ
	 BJLycwwTQQmylyCM6DP8rWrlQsYtuFmqMttyJqXZmQhwNNSv90GqGitOqQ7SJFqmgM
	 l9MzTljuTd8oGXTRvDvov5P0sOakQHbzUdXoimbaabEkJlEl0d6EkIi2K0B5D/IGEg
	 UPmM4KUsb4ONbCp0nhc+GyZsIZT4cVYIpSUjTFByWX/8ZingB4v0l8a2ikMhPh6Efc
	 CS/MLFuB1ad4csa36yswEsd0RGiUO126luunkGcBLqmzeJy26EnSIVh5h6X7YzSl0d
	 QLoRDOfr/JK/Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675a260f0000>; Thu, 12 Dec 2024 12:53:51 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 20AE713ED7B;
	Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 1B2E72807DF; Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tsbogend@alpha.franken.de,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/4] RTL9300 MDIO driver
Date: Thu, 12 Dec 2024 12:53:38 +1300
Message-ID: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675a260f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=_n84Z-pW24laMXaj73kA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds a driver for the MDIO controller on the RTL9300 family
of devices. The controller is a little unique in that we can't access
the SMI interfaces directly. Instead we associate the SMI interface with
a switch port and use the port number to address the SMI bus in
software.

Chris Packham (4):
  dt-bindings: net: Add Realtek MDIO controller
  dt-bindings: mfd: Add MDIO interface to rtl9301-switch
  mips: dts: realtek: Add MDIO controller
  net: mdio: Add RTL9300 MDIO driver

 .../bindings/mfd/realtek,rtl9301-switch.yaml  |  15 +
 .../bindings/net/realtek,rtl9301-mdio.yaml    |  82 ++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |   8 +
 drivers/net/mdio/Kconfig                      |   7 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-realtek-rtl.c           | 264 ++++++++++++++++++
 6 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml
 create mode 100644 drivers/net/mdio/mdio-realtek-rtl.c

--=20
2.47.1


