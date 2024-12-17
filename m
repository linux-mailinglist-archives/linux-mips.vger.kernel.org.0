Return-Path: <linux-mips+bounces-7067-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5B9F59B7
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 23:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAEB81890EB9
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 22:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A891DED49;
	Tue, 17 Dec 2024 22:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="cqiHXzKB"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34A1F9F79
	for <linux-mips@vger.kernel.org>; Tue, 17 Dec 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734475508; cv=none; b=jK/lCQCQkCmpqOUQna8s7MxbBUnaZZjmS3zJU7Q3uVUb70pJVHBFncnCJvBI/VUlOVF8ZYTjsqbg10dTYu89RJP8R+ugXtqVZEg7ZQ4ot0o/BCGVFPve9cf+ZNjh60gRYBsCX81S5J64gw5Fwa75NzDABARsaUbNN1O6Bte7dDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734475508; c=relaxed/simple;
	bh=GodzzK/SHP3FLIiRQaRZCw2o62o+OtxGQPxthp05hos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bl5DqDXETXQ7YejuFMVWsokHWHlgXVRfRgv1EZwZJLg+xXHr+gFdf+3vB0VdBmY4YLE2iEml6Aqstun9Gg3aOuYuPuL+emttbFrznkWCobfl3GsLly5pNyCVmRzDR6IAoDcw9xBXYIkwaDBWATnfXM9z7AvkTaZo9vij8kWWnVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=cqiHXzKB; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3DB242C0A6D;
	Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734475503;
	bh=XnLK1Qp2oJondYT2Ns5zwG1oB9Q9bpYTdgWPD2mP5ms=;
	h=From:To:Cc:Subject:Date:From;
	b=cqiHXzKB+9UXLqR++hJYQtsxE7zjrSArWrlz5eMwO5dqYNglkkBQ/VIs929ZP9/AN
	 WGWhH6Ja0csE2Ex7r0WYbB8TB1lTBqAK6FrAGUI8A0VTvj0q0IOcgkpkTqsjgO6IPg
	 iDpxMJFlx0RBEENzihYw9fwICk0BhyJ2RfBTyQd4SGA/pd3a1n5EmJepC0l6b9xVy3
	 T2Z12v4ujZoNydceFWRoD5eE9dGBLRWSferp9KkI3CSUOKQ3+H1E7EsmV6P5DVcyvG
	 dFqjcc7yxsZDa6B1kjIOR22rkNu7qjAu9kWUTBLciuvn154P1IE4pwaLvYnvcCVZTJ
	 vu2E1B9RGtbdg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6761feef0000>; Wed, 18 Dec 2024 11:45:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 08D7913EDC3;
	Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 012C42806F6; Wed, 18 Dec 2024 11:45:02 +1300 (NZDT)
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
Subject: [PATCH v3 0/3] RTL9300 MDIO driver
Date: Wed, 18 Dec 2024 11:44:58 +1300
Message-ID: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=6761feef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=RIclbMKvLBhRl8Y64RUA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds a driver for the MDIO controller on the RTL9300 family
of devices. The controller is a little unique in that we can't access
the SMI interfaces directly. Instead we associate the SMI interface with
a switch port and use the port number to address the SMI bus in
software.

Lee has picked up the mfd binding change so I've dropped it from this rou=
nd.

Chris Packham (3):
  dt-bindings: net: Add Realtek MDIO controller
  mips: dts: realtek: Add MDIO controller
  net: mdio: Add RTL9300 MDIO driver

 .../bindings/net/realtek,rtl9301-mdio.yaml    |  82 +++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |   8 +
 drivers/net/mdio/Kconfig                      |   7 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-realtek-rtl.c           | 341 ++++++++++++++++++
 5 files changed, 439 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml
 create mode 100644 drivers/net/mdio/mdio-realtek-rtl.c

--=20
2.47.1


