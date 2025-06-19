Return-Path: <linux-mips+bounces-9406-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4FCADFA91
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 03:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52B33BEC02
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 01:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B98A19ABD1;
	Thu, 19 Jun 2025 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dKJ7MWj6"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630C18DB20
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295282; cv=none; b=EbaqE80nHKCwB23y9Fv2uxK2XcTjOUebibQTNNQ7tfUlMSBGuyMK30YvQzevC3iiR7FFZsa+iVyp9u59WBOpv2NqZrw5ueJesnehBXhOHVL+V4auBboGNhEnh4jB4f2cjbuVKTVITULwZwts378q/0Z2xpM834F+WeNHK3SJ6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295282; c=relaxed/simple;
	bh=9dx2Bp7Fz2kJQ1wK1pPMYN/B3+qfbPpYdSDnI/2M+6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1PE8A97EeBwdaUPCjNIxAXZBxbqT24OmkJ2n1lZXeE2RLI41Pt4fw02nLJIRWsW0VFWGZU0Eh2Q/mWKvjE2pEyctxlmz86lcbAZ/F+gHzq1t8mmYdFWd/3YiP3/UAai42fqC0rqTHeVeTUFMbeMZM8HMz0mm2K1U3YRl5twddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dKJ7MWj6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4A2BB2C097B;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1750295278;
	bh=d6fQpCd/tGiiYo2KaJm4qfwVgUBw7EZikZ+Ox0tD/5U=;
	h=From:To:Cc:Subject:Date:From;
	b=dKJ7MWj6QhTjTaV7g++zJ/GrYzFKP5aKv3p3H3OAMc7h6UZzYwlO7EtL1Y2ERj3E9
	 s4R740jJSQ9IUn3X7LBDsGqaM2Is9Cs9SLZ/OlhHcrMKCeGSn3okk++kuxYdlY0Lvq
	 e3EUbvtaICRjJGgwxd3khYzexH7Gv/p4cRsPlGIrutBjraEvvV9tg+FYGv6bHcRCbu
	 dxYo4VxCkWQglTs9ETntEREx9LgE8J9AehRolUYvnSpFlGMO4DiaqdjbqPpKQG1+sS
	 vxg10JkfeTbVUd76stKsOt+SB1H0/V+uiAsuE8bqOHVJ6EdQ5bm9t9okaHH7ixpw2R
	 IXWrdJxp9b8Ow==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B685362ee0000>; Thu, 19 Jun 2025 13:07:58 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 01CE013ED6B;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id F403B280993; Thu, 19 Jun 2025 13:07:57 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sander@svanheule.net,
	markus.stockhausen@gmx.de
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/4] mips: dts: Updates for RTL9300
Date: Thu, 19 Jun 2025 13:07:50 +1200
Message-ID: <20250619010754.3760612-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F7/0dbhN c=1 sm=1 tr=0 ts=685362ee a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=6IFa9wvqVegA:10 a=yObgpN-EOfBVP0ifAR8A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This is a series of small dts changes for the RTL9300 to enable various
peripherals.

Chris Packham (4):
  mips: dts: cameo-rtl9302c: Add switch block
  mips: dts: realtek: Add switch interrupts
  mips: dts: realtek: Add watchdog
  mips: dts: realtek: Add gpio block

 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        | 96 +++++++++++++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       | 31 ++++++
 2 files changed, 127 insertions(+)

--=20
2.49.0


