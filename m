Return-Path: <linux-mips+bounces-3966-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83778919E36
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 06:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1931C21645
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 04:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45D1C6B2;
	Thu, 27 Jun 2024 04:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="T+9nBxDg"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A481BDDB
	for <linux-mips@vger.kernel.org>; Thu, 27 Jun 2024 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719462807; cv=none; b=JcpFbcw5N/5wxu43eLbUKvwXxbGUc1X3qmE6D4YjQgC68JUYEdFxJzKXkJjuWqraMIfL4tBOIcagsbSOvPYwvvoU8dNyLVyCvYQGdKgv4LAzXDy0mo8xMpS0WvjYYTBLO/F38oyH3+zFRKw8yoIiGmUDMj7DhOc0kVBL85YqjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719462807; c=relaxed/simple;
	bh=qQR/McBQUictKN6FDFcmG2wHXZ9K5U/5SuRHpnHk9NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Erevw+lngLUfCmmCvDJzv6AV6ajopA4AWuHUrQjNvSk9a/WujGqxHnrqsDdia8XQh8/NwT3VcW1I3C9xYCkvn6bL97BDnqbJZG6+Mw8IpRyvoaQ0iGbUZr0lrbklM5iS+JYKNF+2xr0BYPwIIOD421jOr6OoY+PrykniIaFaxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=T+9nBxDg; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5E0F12C0241;
	Thu, 27 Jun 2024 16:33:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719462802;
	bh=VqDnsxa9IRPhUHF/UMDGZUqazd5Q4It/crg+iHCE85s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T+9nBxDgqzJDwWQNn8g27evUVmFMhwYOl7rd3cgBGD92+GCUkRbrHs8z7DHs2aLIa
	 N7TQrrgf+UYZ+V1y0dc+geYmXF3mkEwiVUpWyQ1jThRfQCqDeh6j7FXpe4cRlWpgu6
	 E5fYG8muxkFQxQRf/On36c6P02JdAuAhAYaAZbmmSZea6N7Kgjl6s7OU1nSquJGnFV
	 scfeVx05tQucUU0y4DokonWMEjRY63ZaLX2/3XQCb9yDAr4KZLvf3iM4oES6gS5GQ3
	 0qBQ/fukMLUQfJQfGfnX1vk151VWTSlMbyGz26IhrHayT/07zX202+uh4ehi0HHvNS
	 1DIq3igs/NPmg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667ceb910002>; Thu, 27 Jun 2024 16:33:22 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E3FCC13EE84;
	Thu, 27 Jun 2024 16:33:21 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id DEFF3280930; Thu, 27 Jun 2024 16:33:21 +1200 (NZST)
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
Subject: [PATCH v3 2/9] mips: dts: realtek: add device_type property to cpu node
Date: Thu, 27 Jun 2024 16:33:10 +1200
Message-ID: <20240627043317.3751996-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=667ceb92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=WrkMwgpS-tb6rWOXYdcA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device_type =3D "cpu" to the cpu node for the rtl838x SoC. This
resolves the following dtbs_check complaint:

 cpus: cpu@0: 'cache-level' is a required property

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
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


