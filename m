Return-Path: <linux-mips+bounces-10344-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA9B28E19
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFFD01C8809C
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 13:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5AC2E7181;
	Sat, 16 Aug 2025 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="wFzQlAtG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86972E5D39
	for <linux-mips@vger.kernel.org>; Sat, 16 Aug 2025 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755350413; cv=none; b=dNYV5HtEeGw6LfrGcY22RH5FUVQ6d08/xjev6BH8LxRZKc9iuSXhJc9sbfp8PhG1hE+KWWVGnkvI7ur37K1UCRprCZ0BJ73bzFGmTowbECu2Y/yRZu7Ims8IL31w0xcI7R1hiDetlEOz+Hki+PTI7nbaZBPKrhvJextnSUIWrfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755350413; c=relaxed/simple;
	bh=h/v9ujGE8odtWlDIS1VYDDLdtv2P8kRgkNSSPf9ULfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVrgt3/VLIRolLfAQv94kVB2E3/Px6j1BaJ7VwFTNRlY+I0aUx1UHUXYyEdnFqe1aoJY2JXdB7qer4juwpk7hWs0tMnGfKJ8iGezBKpzgbsfmGsMbo2lGigoc36Omrh3Zg11K+A2iESlC0LZEfJD2c6mFNeM0x4HI7s+fDmI5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=wFzQlAtG; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 21064 invoked from network); 16 Aug 2025 15:20:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755350409; bh=BSybUhQorMByn+HYAhAbD0K4nDxfFdsvec1CtZCfSCw=;
          h=From:To:Subject;
          b=wFzQlAtGRDRgiBFKu1IZjehEKETbwIrkiVSDRlyKcyuvf+NFubpLBSuhHvep4HyC2
           Z4V+alW04vBNAaXwCuFwL7bXNO0PMaB/v8vQApYABBrsGVyrooaqq/A16EduDbV/kz
           F4Ni1Ui6fNa6K2ANUYGE9WFk1r3k1H18gnQ8C6mvx/DuoKDYE7M9kceccXZZLybgKf
           /Po6OR9YbafUZ9rudpYybrxAFB169er8/LAgh43C1DO9EWdhwpQoWmHUMgUe80UZNO
           GaC0zY6bgnS7LnLtDbkpwykJWc1E6/w6Uz7WPlNlvtzMs3ayluMJT9kQkPxjoyCB3L
           l+2l0HmvBQjWA==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 16 Aug 2025 15:20:09 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mips: lantiq: danube: add missing timer interrupts
Date: Sat, 16 Aug 2025 15:16:23 +0200
Message-ID: <20250816132002.3632343-3-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250816132002.3632343-1-olek2@wp.pl>
References: <20250816132002.3632343-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: dbf883a0be23ea35d53b0d02bf1fe655
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [odPh]                               

The driver expects six interrupt lines to be specified.

Fixes: 30404aec4d09 ("MIPS: lantiq: adds support for gptu timers")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 7a7ba66aa534..8e92573aaf75 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -71,6 +71,10 @@ fpi@10000000 {
 		gptu@e100a00 {
 			compatible = "lantiq,gptu-xway";
 			reg = <0xe100a00 0x100>;
+			interrupt-parent = <&icu0>;
+			interrupts = <126 127 128 129 130 131>;
+			interrupt-names = "timer1a", "timer1b", "timer2a",
+				"timer2b", "timer3a", "timer3b";
 		};
 
 		serial@e100c00 {
-- 
2.47.2


