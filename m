Return-Path: <linux-mips+bounces-7671-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13AA26A65
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 04:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60DD61883E2A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 03:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1F314D717;
	Tue,  4 Feb 2025 03:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="uO754Zj5"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBF4085D
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 03:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638181; cv=none; b=Rub5D0LRob66vikAW3Gg61Wtb5s4HGp3IeEIJzphDBd3VkuXY1LjaLS8s/UU1tpS7KCxOd1xQKj2N6lyka+DKJTMdt0V0wlofsDddzlGGalED3K0QP46+jIH6QHGIDaRCxfbZTF4T8FMQOrFSQRB/3WgsBJmGy3pOOcIyaRmSgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638181; c=relaxed/simple;
	bh=AljLlpBgRQjQAfgQN6eKucpPl/dPKCNkhE58V6Yjsck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pU/WIA2iC3n3S19TI9M+pKAwezMQUsGHEjOwb5d0DWzUrpL4LhNCpTLvyayR1oWCOTd8Uh3+tKZLfvd3ynMAD8PZ/i/vCwZNp53wwIBpqD7oJDuK6TQLvgQGQAxyEbvdzXA9449crewGa0ELYE9sY4Ki1wOdUJMbWbAW7dzR/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=uO754Zj5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7B0762C022F;
	Tue,  4 Feb 2025 16:02:55 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738638175;
	bh=HqWCWRRdDyMbbXsv5hMVrTkG8PiypX6mT+KFCWzynx4=;
	h=From:To:Cc:Subject:Date:From;
	b=uO754Zj5/KgoOr+unZAlS/Zag7tSGnMpzkRzLbVDd+pVSes1jVmMj6I5yw0Si9zf0
	 DdJ2MmRR/UOJoPXc/pTb+oSo9qgNcwI49hbIPrlWZeIZf2D8Z6UrwKGGuqxLgaISnS
	 lba8xS0UEyzg6ZK8w+A9fiI+gP1OqR+StE0WQYYZrBjNE9F4odScLdSuXp7V7gxusE
	 CPyrOpwzjr2yKH7RoNvYUiyTGSI9draKQFNP+S0b9bmcfwNdp7CsmK409YrGJnuYMJ
	 Bs9y9Pm1P6cm9Tf68LMfTcqCJirmT/nAWmvxYsFtOqzEQU0C8WZ+U0wX3/796HTYM1
	 B1JqIjCuxAVDw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a1835f0000>; Tue, 04 Feb 2025 16:02:55 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 46C0513EE36;
	Tue,  4 Feb 2025 16:02:55 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 412532804B6; Tue,  4 Feb 2025 16:02:55 +1300 (NZDT)
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
	sander@svanheule.net,
	daniel@makrotopia.org,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next v6 0/6] RTL9300 MDIO driver
Date: Tue,  4 Feb 2025 16:02:43 +1300
Message-ID: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a1835f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=2fb9Dq4sOb5bA3HnAgEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds a driver for the MDIO controller on the RTL9300 family
of devices. The controller is a little unique in that we can't access the=
 SMI
interfaces directly. This means we need to use the hardware description f=
rom
the DTS to compute a mapping of switch port to mdio bus/address.

Note that the dt-bindings: mfd patch is dependent on the dt-bindings: net=
 patch.

It looks as if we're off Google's naughty list. It's kind of hard to tell=
.

This iteration makes use of the ethernet-ports property to figure out the
mapping from port to PHY which removes the need for any extar vendor spec=
ific
properties.

I've sent this as net-next. The first 4 patches could probably come in vi=
a
net-next if the mfd maintainers are happy with that. Not sure about the m=
ips
ones. I've included them because the updated bindings will start complain=
ing
about missing properties on the one in-tree dts file.

Chris Packham (6):
  dt-bindings: mfd: Add switch to RTL9300
  dt-bindings: net: Add Realtek MDIO controller
  dt-bindings: mfd: Add MDIO interface to rtl9301-switch
  net: mdio: Add RTL9300 MDIO driver
  mips: dts: realtek: Add MDIO controller
  mips: dts: cameo-rtl9302c: Add switch block

 .../bindings/mfd/realtek,rtl9301-switch.yaml  |  47 +-
 .../bindings/net/realtek,rtl9301-mdio.yaml    |  86 ++++
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |  96 ++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  33 ++
 drivers/net/mdio/Kconfig                      |   7 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-realtek-rtl9300.c       | 472 ++++++++++++++++++
 7 files changed, 741 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml
 create mode 100644 drivers/net/mdio/mdio-realtek-rtl9300.c

--=20
2.48.1


