Return-Path: <linux-mips+bounces-5612-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC29839D0
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 01:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE3A9B21635
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2024 22:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6910612BF25;
	Mon, 23 Sep 2024 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="XCIuF2AR"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D52126C00
	for <linux-mips@vger.kernel.org>; Mon, 23 Sep 2024 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132248; cv=none; b=Z5/6oQnZE+FAFP3v4MGLqgSMgGpyefr0cj//cMiyQEK8EWD2dLZCBvAMtsweLidsP07HeWPg04GnFjmYy2iGH+dvZlHRdtEcPWCTFZqt6WPc41bECVikSqHetv+AR1pJ35EWI9fj0PpP0ZfP5zdiTJgCq6wn+RvS4a9uu1QIrpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132248; c=relaxed/simple;
	bh=M9w5EuhY1PNsj24HWMLx48l4QyXlzj1y9sUmf4u3Yhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJNQZanPD6vHm5pQVNK8gDJ/mGmyvd6lojzgi7J1Nl/TZbdxUuGf+UWmc23xiaFmsy75JAJZin86OFIprBIJK7SnUAbsVy1LMmlgjvJBFXW1gtq0N80t6woQbqsV/NV22ROuAOJUXpfqgue9c2ntu3rey7NeFBPCgtS733Enlyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=XCIuF2AR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 24E9E2C03CB;
	Tue, 24 Sep 2024 10:57:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727132243;
	bh=rUOrO1XKZYuxEwj3C8rWh27ySMIPsl0xUQfGZRV4i1w=;
	h=From:To:Cc:Subject:Date:From;
	b=XCIuF2ARKaEqz5qE6hrHX1gS+RcvbQGe0mMYyIp4rA9nR6EQQTGMsOsjFXrAHcw1y
	 0L2xlSMrMsnlgEObI2O/nhi3D6IVKEfps+kUxsgYtv0PDFWvE1RepF5mNrbM+POhld
	 hdfp1HiqJgfeazd3S3zP1tHAkTirqJADd7az1z6jSfnsBbqZs3NkJZXhpPTaYCv4Lb
	 oZVLjg28lUSAGFKZzSmhxjkEqmqsr4ya3Yh4mnex/Bry8coOMdiwumQr0c2GZ9tbdz
	 kwPgXCBFQkSxOW/xLVd60uUdvKTtrnG2brDM04200ismcxlj6XKKxJ8zwYjP+Vhz4c
	 Yq+rJwuhCG6hg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f1f2520000>; Tue, 24 Sep 2024 10:57:22 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id F107513EE36;
	Tue, 24 Sep 2024 10:57:22 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id EB37C280A3C; Tue, 24 Sep 2024 10:57:22 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 0/3] mips: realtek: Add reboot support
Date: Tue, 24 Sep 2024 10:57:16 +1200
Message-ID: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f1f252 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=Mt1HfaXHmOUzYFHI898A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The system reboot on the cameo-rtl9302c (and presumably many other boards=
 based
on the realtek reference design) is connected via the switch reset regist=
er
(RST_GLB_CTRL_0).

Because the switch register block encompasses a number of functions that =
would
normally be separate perhipherals I've represented it as a syscon node. R=
ight
now the only peripheral I've added is the reset (using syscon-reboot). Th=
e
binding and syscon node will be expanded in the future to add some additi=
onal
functions (e.g. I2C, GPIO, MDIO).

Chris Packham (3):
  dt-bindings: mfd: Add Realtek switch
  mips: dts: realtek: Add syscon-reboot node
  dt-bindings: mfd: Add more RTL9300 variants

 .../bindings/mfd/realtek,rtl9302c-switch.yaml | 53 +++++++++++++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       | 11 ++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9302=
c-switch.yaml

--=20
2.46.1


