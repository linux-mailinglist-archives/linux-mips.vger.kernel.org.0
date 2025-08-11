Return-Path: <linux-mips+bounces-10055-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5CB20A5E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96EE37AA28C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 13:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B1B2D9784;
	Mon, 11 Aug 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="e3BgD7UQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422C2D77EF
	for <linux-mips@vger.kernel.org>; Mon, 11 Aug 2025 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919268; cv=none; b=QIXvpW+DC5nPzF2embg2hiK5PXqfdKue7XDGOmyd92V28zQ7JhnOWGtoS1kwyp8PkO92Zjb5VGrYi/YJ36xffNyzxmtKwJDFsDMDVcDEWVu943IzJC4XjQZDuKJXWygkIMK0nIZTSlGB5h5KA1wnVWSUkg2gZ755SSqZye1cyJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919268; c=relaxed/simple;
	bh=0I2y3imYv/y1lJZF6b9yib3gwMwpkXE9lnXTlHvAJuI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=A+L4folnh+NKPMgXcCxQXgWWgPxhwvrshw5FefKmWaNMEWQzBPKtzTYlEM2Gbp2RUOnMf711syjzJLfpmCH0OSpoaKbBizua3NdLP8xaZF7CcLfHFy1C4EWcAwGvkgqY6Qt980GkLkaGV5yi3CmUrtDwo7gZifqcio5OiSODlfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=e3BgD7UQ; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 27883 invoked from network); 11 Aug 2025 15:34:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1754919259; bh=R8I6N2HSsXIy9IsD3x/pA8P+Ez/epvlqLVGCtfepnwo=;
          h=From:To:Subject;
          b=e3BgD7UQ7gmrZTjfdbz0fdz9ndp4V7B4753yc1jY9WSsjRSyQ3fV67uXMnyUtdeKn
           3redbpkYjfYDWYm68lY8XUoaa6TOaiyWRj4B0szDUwgyWSt5rUVvlw3S1izR+IGqtC
           dlCRScynHl4wb5wkg2xns/YtehDRbMfT81r0nTh+yx0pDE8yfkXBUjlZJQkKOL7Lv/
           1n7nESIG3ERcq0RoFi9ZD08ei6ZiI8NopxZMST4v7GSjxHSCVUk9Seuqv0aIVe4KCf
           0kryqmUKtgkigZ2o7h9iBydBB0pKVVnqPIVGJxKQHnS+bw/Din5ScZWPRQv8tHF9Dn
           N0fcDgnj7LmEw==
Received: from 83.24.148.125.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.148.125])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 11 Aug 2025 15:34:19 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips: lantiq: danube: add missing device_type in pci node
Date: Mon, 11 Aug 2025 15:34:13 +0200
Message-ID: <20250811133417.840660-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 3e089445715a865be6e29e73224d6f8d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [EZNU]                               

This fixes the following warning:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 7a7ba66aa534..9cba16dd5dae 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -100,6 +100,8 @@ pci0: pci@e105400 {
 				  0x1000000 0 0x00000000 0xae00000 0 0x200000>; /* io space */
 			reg = <0x7000000 0x8000		/* config space */
 				0xe105400 0x400>;	/* pci bridge */
+
+			device_type = "pci";
 		};
 	};
 };
-- 
2.47.2


