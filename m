Return-Path: <linux-mips+bounces-5581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5F97B61B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Sep 2024 01:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF0ABB268F2
	for <lists+linux-mips@lfdr.de>; Tue, 17 Sep 2024 23:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C8E1925BB;
	Tue, 17 Sep 2024 23:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="tLseoCoY"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89D192595
	for <linux-mips@vger.kernel.org>; Tue, 17 Sep 2024 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615787; cv=none; b=ZUdh2upVscUzxt530+M4OooZEB0tlGPFXGgPmoMBNSJOjY6z+6sxMee60SNzM65mUdDaa4ncmIP/WwS/puYJkKcd/O6J9AFAUMuH5yzTAbfGsDMhOw2PpjWOMeUIUYNRu7cGrb8il1C1bTT+FFzLl5Z0pCO4Ju+b6iSCpJmkAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615787; c=relaxed/simple;
	bh=ggT/JygajZbkwXDzCkcyJgBfpPq7WGDRNRsRLHaXit4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN6IQfVZqw22o1CPWqNawG/G+gm5uJ8+3k5731Mx33mrOVDxRI5QtIwDhw3SItXu+DTeQ2B4dTvVQTW5eLtFCNv/p51dDJuokzBEMevdCh9TdbDtoMhulas4Aac4tiZQ+5xJPRHAdJlb9HFLw/zVaS2KfhEOnkt/DQ/we4+nBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=tLseoCoY; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3DE9F2C0540;
	Wed, 18 Sep 2024 11:29:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726615777;
	bh=vi8pzi938Vj1EV8QrWqlaOuET/C1cPMvb/I5VHhl44c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tLseoCoYgQ60Jy8KnpM/1FCIgTTk9K7rBMGQLh8vUZYwZ4AdKElU4L/Zk0oLkTEcH
	 omiDOVcExE8zcDEI9VhNsAnIQRc6jbl2l2O4kOqJs8m/8gUeB45bZ+s933kwsx056X
	 mC/1mYilwYig74+gdVdBw0AfH5cq/p8LsbFqKcXZQPL7fpQpjorf/9f62S3q+kUyh/
	 T4PqENAHc41CwPnRnXeuVSSoABP1HlelKNbGQkM1pQv9JZQEH42OIqLOP/3TysxUfm
	 GC3Swe/XIJsLixkBC17b+JjKYq/oR9MxCA6fMpf+pfQ0vaYGMtIIBhyFvbhtCYPe81
	 rokTLhqgP/55A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ea10e00003>; Wed, 18 Sep 2024 11:29:36 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 82FB313EE85;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7FD37280347; Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 3/5] mips: dts: realtek: Add I2C controllers
Date: Wed, 18 Sep 2024 11:29:30 +1200
Message-ID: <20240917232932.3641992-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ea10e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=fhtXptwnTS7QFdIPH-sA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index cf1b38b6c353..c579665df700 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -39,6 +39,24 @@ reboot {
 			offset =3D <0x0c>;
 			value =3D <0x01>;
 		};
+
+		i2c0: i2c@36c {
+			compatible =3D "realtek,rtl9300-i2c";
+			realtek,control-offset =3D <0x36c>;
+			realtek,global-control-offset =3D <0x384>;
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		i2c1: i2c@388 {
+			compatible =3D "realtek,rtl9300-i2c";
+			realtek,control-offset =3D <0x388>;
+			realtek,global-control-offset =3D <0x384>;
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
 	};
 };
=20
--=20
2.46.1


