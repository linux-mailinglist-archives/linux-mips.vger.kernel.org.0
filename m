Return-Path: <linux-mips+bounces-7712-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B18A2E192
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 00:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F911886410
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 23:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895581865E5;
	Sun,  9 Feb 2025 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="kLZRK+/k"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172B1494AD
	for <linux-mips@vger.kernel.org>; Sun,  9 Feb 2025 23:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144882; cv=none; b=G9mCqP+dPfDe1lCmqIQYWrgweaMSvA0dJWbd2VORBXGdyJZiefuQOCZyNpYWh3m1a/dY7OQ5EXQc3zxJkRfWWdYKeRoHU5Otj+H0625lkY86GrSIJetH0N4PJgB+PGEx6jpWMm6+0/+dAItk0+8NT5bDtf20duXTGbWLFFZr75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144882; c=relaxed/simple;
	bh=ODv3GGqKUR1bqT73hWp63rcmoOA+B/mTIKwThvKgDEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AntB/88KVjOfxZuuoN8IXH4jOOGY32P7IHZUG6Q06s/T7aQd2O8h5KXi54hshifQukHI7dwc7yAvCkBJImQJhDV2TDN6FMGECAjtOIPoS7Ng2fgOX1VHRILdAHx75lAYO1GOuhn9hc36fG0kowLFYMf0aBRHpdvzgrB7wlBaM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=kLZRK+/k; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A98942C044B;
	Mon, 10 Feb 2025 12:47:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739144876;
	bh=9BTR+ZuvH19w1jZujSlCK9rC3nkRI5vZ5l365E/HXFI=;
	h=From:To:Cc:Subject:Date:From;
	b=kLZRK+/kzojT98Nk9W2oEaSNaJdyRprGADE8VNnxipXd00z4WqrxgY2usQjcd0BlS
	 BbE5lQY+PGuz9ROG17ct0U9gkTFcMYrklt6HZ3d4ROO0y8s20NRYN1PPNjoFTh1fMt
	 JBwaEEjTyk9yAmKf1+JFOnl41LNJ6AWOH/CX5OF4ZQfp4dCk142dgLGDsWLci4fM1v
	 pgk6xwHHyb8VfyNdwENYCYrG2oRL6BbMeq2ewx49lge6nZvwwt+gnvUauVDZJlzc2m
	 KVJg5a9XDZsSoilydM+qbfCi5HF30DP02MRHB9FzDt18/1ye5oGzcU1DeaxBHjE1fc
	 XdPwQK6Vy87ew==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a93eac0000>; Mon, 10 Feb 2025 12:47:56 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4A8BA13ED4A;
	Mon, 10 Feb 2025 12:47:56 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3855B280789; Mon, 10 Feb 2025 12:47:56 +1300 (NZDT)
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
	tsbogend@alpha.franken.de
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next 0/5] dt-bindings: net: realtek,rtl9301-switch
Date: Mon, 10 Feb 2025 12:47:46 +1300
Message-ID: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a93eac a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=lchjjVjLDbdZh1ZHapMA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This is my attempt at trying to sort out the mess I've created with the R=
TL9300
switch dt-bindings. Some context is available on [1] and [2].

The first patch just moves the binding from mfd/ to net/ (with an adjustm=
ent of
the internal path name). The next two patches are successors to patches a=
lready
sent as part of the series [3]. Finally the last two patches are needed t=
o
update the in-tree dts to pass `make dtbs_check`, I couldn't figure out a=
 clean
way of decoupling these `make dtbs_check` will either complain that the d=
ts has
unexpected properties or that it is missing required properties.

[1] - https://lore.kernel.org/lkml/20250204-eccentric-deer-of-felicity-02=
b7ee@krzk-bin/
[2] - https://lore.kernel.org/lkml/4e3c5d83-d215-4eff-bf02-6d420592df8f@a=
lliedtelesis.co.nz/
[3] - https://lore.kernel.org/lkml/20250204030249.1965444-1-chris.packham=
@alliedtelesis.co.nz/

Chris Packham (5):
  dt-bindings: net: Move realtek,rtl9301-switch to net
  dt-bindings: net: Add switch ports and interrupts to RTL9300
  dt-bindings: net: Add Realtek MDIO controller
  mips: dts: realtek: Add switch interrupts
  mips: dts: cameo-rtl9302c: Add switch block

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 86 +++++++++++++++++++
 .../{mfd =3D> net}/realtek,rtl9301-switch.yaml  | 63 +++++++++++++-
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        | 48 +++++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  3 +
 4 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml
 rename Documentation/devicetree/bindings/{mfd =3D> net}/realtek,rtl9301-=
switch.yaml (66%)

--=20
2.48.1


