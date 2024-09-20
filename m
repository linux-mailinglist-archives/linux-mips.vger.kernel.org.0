Return-Path: <linux-mips+bounces-5600-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953F97CF74
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 02:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558E31C21F22
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 00:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A278488;
	Fri, 20 Sep 2024 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2/DtCvEH"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8361388
	for <linux-mips@vger.kernel.org>; Fri, 20 Sep 2024 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790506; cv=none; b=O2sxsXojZOpUn6FZqVJQ0nF/2c3mU+ERTR87O95gvD9EjKkJJMpHQHZfPLbeNCuZftkaRS8tyQcsgltEcTwg00EOzKK/VQNI/VStxOsj3Djy0OiMuz47+NerR1o8CcAUOs3u9lWy16ZnK2iRECGtsHpL3ZAr4HfyrUD+yGg2Y9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790506; c=relaxed/simple;
	bh=kiaUERNi7FEMa0DTaZm84QrpQQft/7yi3856MUwyh6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXmjI1cUbC5PhtzbLcWrztFrwdPWgtn3Oiyu8AzM7Fga8OIKMa1GvZm9SAdFaaHEsYq0Vat4jW6kOjimyWRfx5fQoOggSR7+sXQ1pdLOrWHqnWzFBtd/27VK8giMu1/t2sN35dsLobsq+EdwV9Bb7eofK45hjNBfuFY2o2/76b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2/DtCvEH; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 13E582C062F;
	Fri, 20 Sep 2024 12:01:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726790501;
	bh=6JCffrXjBW+Wl+ZcE0nsaWc7MZMZ3P1777f6qTIS7V8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2/DtCvEHG7ccckotTcaUMJ83pcphrWC32e8gxBNvmDQBD/joMYqVEeGqc8qiQUsPd
	 IkdWDi60MWOP7a5C61PJSBGRQbaZa2NIGL3/XKYbSjGopNW2iUtjsx4LG9z5CEYHgz
	 4HJPZzJ8R0h/OG0SYSbOft5ongh8hIgJJxTxg2oRKBf4pOIzp065EFc6BXB1i/fxLT
	 yrrpK8yuOBPjJjOHU8ZzU5RyIPcycNdICHg0//hMAjA5t6pLfD2GSrsLbhS9ed+vb0
	 g1VSH+88+obKjcsmt99xsiUyGJ5MrNb2EOgaohV6vyj9Rj1m0GgSMQmhxG9W3nUS7G
	 ymb6jLD1rSMcQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ecbb640002>; Fri, 20 Sep 2024 12:01:40 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id BDB6A13EE84;
	Fri, 20 Sep 2024 12:01:40 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id B9E81280968; Fri, 20 Sep 2024 12:01:40 +1200 (NZST)
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
Subject: [PATCH 2/2] mips: dts: realtek: Add syscon-reboot node
Date: Fri, 20 Sep 2024 12:01:38 +1200
Message-ID: <20240920000138.1826123-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920000138.1826123-1-chris.packham@alliedtelesis.co.nz>
References: <20240920000138.1826123-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ecbb64 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=dg6lvUh7t3K6jr6pP5MA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The board level reset on systems using the RTL9302 can be driven via the
switch. Use a syscon-reboot node to represent this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - None
    Changes in v2:
    - drop redundant status =3D "okay"

 arch/mips/boot/dts/realtek/rtl930x.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index f271940f82be..cf1b38b6c353 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -29,6 +29,17 @@ lx_clk: clock-175mhz {
 		#clock-cells =3D <0>;
 		clock-frequency  =3D <175000000>;
 	};
+
+	switch0: switch@1b000000 {
+		compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+		reg =3D <0x1b000000 0x10000>;
+
+		reboot {
+			compatible =3D "syscon-reboot";
+			offset =3D <0x0c>;
+			value =3D <0x01>;
+		};
+	};
 };
=20
 &soc {
--=20
2.46.1


