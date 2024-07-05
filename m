Return-Path: <linux-mips+bounces-4144-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57F928035
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8021C222F5
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC13E487;
	Fri,  5 Jul 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="qbrBRVn/"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A65C83
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145739; cv=none; b=jPi3lnPE2gC5Wpkd/Dg5ZeEPk9Z7+in1erw43WsUZml11XSPJQClLOTazKR2qHFWUrS8mJRS8S5gDIC2YrsoE56yeIyc1hmGjNNfGPPvWY/oiBeJHCLfxo1Vt08XKDvcNiqsCiaNddK/iu0hO7i7orE+zyqUSuJO6xDXJ+KTQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145739; c=relaxed/simple;
	bh=2gd9m3WOrTSPpsDRst3JZkPcImeXTBGoWMAIPBErfg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZK1ah0il9hssc4Fc4mOdkQs9HBmhbsywEOAuiA0UlA+ytHE/6+rILOHh/bWxRY8yS7LqZ0LZSPJJL6ZypjZQ2Lg/a4VzS+x6pBFJ3l614+1h5iu7yLzJixE9668fqU19UNvB3sBu/BBxcnwk64DzqNwz6f9cpsBO9g79jkOT0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=qbrBRVn/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4B1262C09AD;
	Fri,  5 Jul 2024 14:15:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145727;
	bh=PRCGi+QoVilDqD6eak7iPG0Wodg2ajRnL70N7bxACg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbrBRVn/IUBo4tOb0sprSlkfgfdDQtzsX1T+rhmDuHBvCSZugAYZGvaxddO7gmF/F
	 fyjISN1oGpKPfea/fxdLP9Rx9GaxMjVTYDW5fHEC8dbWvCTlYDmqX3k5gZnv/65Wl5
	 D/z3XaU/dyqTndmjL7ywkKUfECs+G1VQbKi8k/O6mMCzckcuRv4bw9hixq+bpqnGJ6
	 ZmWmt7rTt3ZuadA6VIfm0+w7ah622ztsAwOzU8tWWN3X/fVsyF7+MJngrXXNm6x2zS
	 JUHyQVKSCJFu3ow9482swy4kXGMFMAvJXNSyQoyqjQ28/zWIqzvguQNnd/1POvl3qq
	 ddUAY3YDMDzoQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0003>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7C0F713EE85;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 77586280968; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 2/9] mips: dts: realtek: add device_type property to cpu node
Date: Fri,  5 Jul 2024 14:15:13 +1200
Message-ID: <20240705021520.2737568-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=VwQbUJbxAAAA:8 a=WrkMwgpS-tb6rWOXYdcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device_type =3D "cpu" to the cpu node for the rtl838x SoC. This
resolves the following dtbs_check complaint:

 cpus: cpu@0: 'cache-level' is a required property

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
---

Notes:
    Changes in v4:
    - Add r-by from Marek
    Changes in v3:
    - None
    Changes in v2:
    - New

 arch/mips/boot/dts/realtek/rtl838x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts=
/realtek/rtl838x.dtsi
index 6cc4ff5c0d19..722106e39194 100644
--- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
@@ -6,6 +6,7 @@ cpus {
 		#size-cells =3D <0>;
=20
 		cpu@0 {
+			device_type =3D "cpu";
 			compatible =3D "mips,mips4KEc";
 			reg =3D <0>;
 			clocks =3D <&baseclk 0>;
--=20
2.45.2


