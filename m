Return-Path: <linux-mips+bounces-5794-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B1993BBA
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 02:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0084FB241D3
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 00:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8974018E3F;
	Tue,  8 Oct 2024 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wbsyNrvx"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8338F6C
	for <linux-mips@vger.kernel.org>; Tue,  8 Oct 2024 00:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728347004; cv=none; b=Nei0WKDbxtdgsJL17ofXur/TZ8uw/cQID4+/+6j+nXpPEDQZn/TyEwIIJOWlOFNJbNown2diH/U8FziHDR041w31+4IBPTYxSE2t4vwpURhoi+HVRLwTOUKywhzhQvf+/nZbdCTzZi3UyvM7DjJZPhuNCGuAjC74NZlZDnAwuiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728347004; c=relaxed/simple;
	bh=yKSSj/r7jgPw6xuaAJhixABfHrtlzD4kgzlbPv3j/NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1MCrraDIYapZbUnIEsguU89ejGlqYd4IcJvYDKC0rRnhNlumOU9ndE2GWq7a8CtWVpoAC22PuUjZcJxnurf/MgMyr1VbaXpOAm991fp5v8tu1hL7F8k82yZBB9g8KX00JkFhOwyt+LCldHNr4O2D7zFwgEMstt9Efa4BR8BjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=wbsyNrvx; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CE81F2C0E30;
	Tue,  8 Oct 2024 13:23:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1728346991;
	bh=ozBedJwE7B5aaCVTf9u+TgJiSQkiIsTVggaCg8eyvJI=;
	h=From:To:Cc:Subject:Date:From;
	b=wbsyNrvxc6ugse0g65Uf1DEoSWIs0XGSxUPq1f2yRIqBI3uKAEA8kWRjrE3fb8AB9
	 la03c8kdaTvwiu+58nia5TkRa4TpYaAMFSMwqmLKqqOuMBok7xYOsY8QO9Vzd65cF0
	 +mSGW99QY9icdUjhJmifnTj1duxh1lAV5DK56Y+jU/1/V63g9DXIVEAH3t96GG+Y7D
	 5B5iVkEHtjIu1bI2S2zjQTautfdTpgz9Kgoh6XB7e53VqG7MeJC2tu/Ed/au7TPjgd
	 VW4wAWQvv7e+qLpjPLA0gczk7EdtyW/fTKmU6RjpPy8Ax4RT75eLhQ0nPQ2e/alDA2
	 ccoJwOj9ZPg5w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67047b6f0000>; Tue, 08 Oct 2024 13:23:11 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7822313ED7B;
	Tue,  8 Oct 2024 13:23:11 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 73950280B51; Tue,  8 Oct 2024 13:23:11 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/3] Realtek SPI-NAND controller
Date: Tue,  8 Oct 2024 13:23:04 +1300
Message-ID: <20241008002308.1149983-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=67047b6f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=63fhtx2pClmO-oMQzGgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds support for the SPI-NAND flash controller on the RTL9300
family of SoCs.

There are 2 physical chip selects which are called SPI_MST_CS0 and SPI_MS=
T_CS1
in the datasheet. Via some pin-strapping these can be assigned to either =
the
SPI-NOR controller or the SPI-NAND controller. Which means you can end up=
 with
the following permutations

  SPI-Flash
  Boot Model SPI_MST_CS0 SPI_MST_CS1
  ---------- ----------- -----------
  NOR x1     NOR-CS0     X
  NOR x2     NOR-CS0     NOR-CS1
  NAND x1    NAND-CS0    X
  NAND x2    NAND-CS0    NAND-CS1
  NOR+NAND   NOR-CS0     NAND-CS0

Chris Packham (3):
  dt-bindings: spi: Add realtek,rtl9300-snand
  mips: dts: realtek: Add SPI NAND controller
  spi: spi-mem: Add Realtek SPI-NAND controller

 .../bindings/spi/realtek,rtl9300-snand.yaml   |  69 +++
 MAINTAINERS                                   |   6 +
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  14 +
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-realtek-rtl-snand.c           | 402 ++++++++++++++++++
 6 files changed, 503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/realtek,rtl9300=
-snand.yaml
 create mode 100644 drivers/spi/spi-realtek-rtl-snand.c

--=20
2.46.2


