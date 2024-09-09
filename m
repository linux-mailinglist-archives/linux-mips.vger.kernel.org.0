Return-Path: <linux-mips+bounces-5435-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88503970B77
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 03:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16F44B20D9D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 01:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E4D14267;
	Mon,  9 Sep 2024 01:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="blWGlbXG"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C059125B9
	for <linux-mips@vger.kernel.org>; Mon,  9 Sep 2024 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725846447; cv=none; b=m5Nz2dsc3SWCbeHACwiyLgHtHRIgh5XWy6ftwLhNk2EpxQILL1oUGk2U7BpLWiBD7g97xXmN2R49S+AaT8wIqn++HMgkj2qbZuihS2Eqsvx8nTnArC83+vPOY2mGGlYEPmYNGdq7wG1qoL+DodwE5n+SXtHbvkC9k40ogU9VJ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725846447; c=relaxed/simple;
	bh=2y5wdO/3iwmTpC+Dy9a9hYLcpu4lddQbsEvTgSxsVLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQe7436HElF+/+MXNHNajUM3PcK70W0ByCSy+U3VdQ7BKkk6rADATS+tDoWdR8xa7aNRY8ooRt7j5ZXPje1IgLL6IfTw9lGKygL+kh0ejyTVOAQcI1Lz1tsOIQhmg1pZkkeq1oJqbfYlQSWsYaKVt9qJEGrMFKf1AJ9hxSN6dGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=blWGlbXG; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 862DE2C044C;
	Mon,  9 Sep 2024 13:47:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1725846436;
	bh=wScFrkueH43PqDrIo0UYjYFE3sn2heYMZ39Nmu3m3pw=;
	h=From:To:Cc:Subject:Date:From;
	b=blWGlbXGTrIYbXGUMsvURemgUBrUuPIsBjDJpdWNvU488JoYVG4W+Bb3cGm3hmyMY
	 VpUWJY7J6rT2y4SbSNKacLEaZyl1XmO3DGYZwPIt0I0onfcCqY9ZZNKi6zxQreHN1x
	 iX0Ot2+K+8wdIkjgD67FJdxqn/lx0/JHcdSkK/FtCzoP977DYrOq5h/VMoBQmhMhLI
	 0jOpLv7lBV5kDsSNIBl7OJgvqPKc9UZGwepxUJUwX2TBVmNf2PZcRwQuIGEVUWBGIA
	 NTzFRHY3CUBU3Sc0Xt85MrHdoH9shMtv9kQ60sgqtm+eV7hWdlho03YFU+5lWEyM2m
	 68xtaEQOdvOJQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66de53a40000>; Mon, 09 Sep 2024 13:47:16 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4240213ED8D;
	Mon,  9 Sep 2024 13:47:16 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3C446280534; Mon,  9 Sep 2024 13:47:16 +1200 (NZST)
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
Subject: [PATCH 0/2] mips: realtek: Add reboot support
Date: Mon,  9 Sep 2024 13:47:05 +1200
Message-ID: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KIj5D0Fo c=1 sm=1 tr=0 ts=66de53a4 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=Mt1HfaXHmOUzYFHI898A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The system reboot on the cameo-rtl9302c (and presumably many other boards=
 based
on the realtek reference design) is connected via the switch reset regist=
er
(RST_GLB_CTRL_0). This adds a basic ethernet-switch node with a reboot no=
de so
we can make uses of the syscon-reboot register.

Chris Packham (2):
  dt-bindings: mfd: Add Realtek switch
  mips: dts: realtek: Add syscon-reboot node

 .../bindings/mfd/realtek,switch.yaml          | 50 +++++++++++++++++++
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |  3 ++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       | 11 ++++
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,switch.=
yaml

--=20
2.46.0


