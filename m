Return-Path: <linux-mips+bounces-10327-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F346B27FE2
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 14:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAC731CE454E
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77338304995;
	Fri, 15 Aug 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="1ol/K+Dk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA61730497A
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755260208; cv=none; b=DPevaJjUT7j2pFd2JQPrqnQWm7KeUc6DyoyBrZP+LVdF43EQoaeOyvliRZ2KSCxDX2L1zQ8yXDZ3wGJcBMX2R/u5wlCbBKcLH0cPSxjogRplkY0/pwXRmrsJH8UZo9sOcJUVfhTNdlMhqnf3OqRPM/hkxFfRAdm3hz8BAbA5Ogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755260208; c=relaxed/simple;
	bh=NbbnhG7V+vl5U1+YJnrVj1ogrs9erTio/i//AGOZzOA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndnig99R3XSsvXHdzKjzhaxoDPJ4Vnt0Iq5DlIf4utrswntNJvo7+9j/lwOMI2ZfcndjrqVlZcpivxsTN0q3tHD32VARDy8pdo+f6PbWf+8gTW/yLQw3cS2LXEw4nGOp98XmGjfknEcFjZDmFZrDYqIufTSwiaizWIGbpcBHEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=1ol/K+Dk; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 1332 invoked from network); 15 Aug 2025 14:16:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755260204; bh=XottfDTJ3G6nJndrCm4cjXt23u+R3hnCONSdUmC/xL0=;
          h=From:To:Subject;
          b=1ol/K+Dkzo87hZWbOz8D/zVVNgTlTXA9a5zl+beMVsLvB2DKrvpldfV9cEQCPGq78
           F4LgpMX8WiCEV1lmyHsPfjGBOITHNweNCFv1RgkuUK3badfy5wEkt9QBb7d0lNWXpL
           kaCoXO6u+uSX2p9ml5Y++VufNbol2RQWE7xYObUP0WQIB/gTrZShP04QtxCj+uVanU
           HqfWjZovFgLMkDm2gC8qQaXEmeG6Fszb8TfOUOuXPCLZs+RQysLoM95VzzCsQ6kekU
           LqOJZ+Yp4AjlB/ZY4fuSPdrmP7ujPBWC0HcCTWj7TCJyK1rMf8/1j55tk6vtFtsz+5
           jebYOpuUuNIfg==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <john@phrozen.org>; 15 Aug 2025 14:16:44 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: john@phrozen.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mips: lantiq: danube: rename stp node on EASY50712 reference board
Date: Fri, 15 Aug 2025 14:12:24 +0200
Message-ID: <20250815121635.3397802-3-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250815121635.3397802-1-olek2@wp.pl>
References: <20250815121635.3397802-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 66a8a3946718ff3d7fc98a32b19a6db2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [URJh]                               

This fixes the following warning:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: stp@e100bb0 (lantiq,gpio-stp-xway): $nodename:0: 'stp@e100bb0' does not match '^gpio@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-stp-xway.yaml#

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube_easy50712.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
index 1ce20b7d05cb..aa7256ddd529 100644
--- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
@@ -91,7 +91,7 @@ etop@e180000 {
 			mac-address = [ 00 11 22 33 44 55 ];
 		};
 
-		stp0: stp@e100bb0 {
+		stp0: gpio@e100bb0 {
 			#gpio-cells = <2>;
 			compatible = "lantiq,gpio-stp-xway";
 			gpio-controller;
-- 
2.47.2


