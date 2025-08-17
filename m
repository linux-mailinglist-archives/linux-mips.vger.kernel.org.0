Return-Path: <linux-mips+bounces-10348-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD09B29333
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 15:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 076737AAB24
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 13:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4DB284B57;
	Sun, 17 Aug 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="Or+C4YJw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC0239099
	for <linux-mips@vger.kernel.org>; Sun, 17 Aug 2025 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755436241; cv=none; b=YlTAf0asbiuRHTiYCsaBV81+i2YhCZSJYFjaT6+34CIsji3FEAxscS72wAlAfA0MmMEwUzHpBUcckjqiEYUAeWsxvvGuk8DOM5NJ/1o72jeUVNha/9ICSnBujPf1lmT0D+5dah4B/CH7eww8FKFHcoNeMQa8nZbst9TM9clHwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755436241; c=relaxed/simple;
	bh=8aueD4LZAmwg5aZHlopS76L5StWw14x+UcnJwKcFiGk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+JQA+J0xKxlqa388DpmktmJSrVK2bnx8ClvTH4R2P9V2QiTZCpjDsHKtR6E8E1kttiFzTp0A/rlB7l/ksrKRAMfBs07ef85A6xrU/8ZWuVnIib5E1OuZXbPWEEt6b0JyC7A86dJeJkfBe4JPFDFwn6BDIbbV1fPbSCjuTPghW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=Or+C4YJw; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 42800 invoked from network); 17 Aug 2025 15:10:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755436231; bh=J8bY8XzRhO9uRmNXMNrZ4j309FM0iyVDCmnGWEK7AkQ=;
          h=From:To:Subject;
          b=Or+C4YJwcsZs6ue7SxxH4+JvEFajVZXc52HtWA3ysZWTxymR97UVnKhuak8L9w2wS
           ofDAXYRi9cwFwiHxb4ds5rIUOpbp1We+Dt6xGsKs/+y/mMsw5ntVYuwquTu6u1tmrw
           Medg/EKKz9pBwhVq1Z2Oj6SKPk9qYsuBuyLV99JB4maPnD+KZYf0Ayf9WV72NuwEvg
           Np+pqdq7a52JiTUw0LOQDc6FhjQyPl7AHr39wRs5HDQyuMB8nr9c44INekGjoxb5PZ
           Lcy7kkPjB9y1PLB6qsj6JUuACECxgBBPDvRznJ4LNeIdr2wiz+lv/htoRUizwghIQe
           KNyIjDjYeDHLw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 17 Aug 2025 15:10:31 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	john@phrozen.org,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] mips: dts: lantiq: danube: add missing burst length property
Date: Sun, 17 Aug 2025 14:49:06 +0200
Message-ID: <20250817131022.3796476-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250817131022.3796476-1-olek2@wp.pl>
References: <20250817131022.3796476-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 17e6220015e61466cc5f973a3dfaf8be
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [MQPR]                               

The upstream dts lacks the lantiq,{rx/tx}-burst-length property. Other
issues were also fixed:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml#
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'lantiq,tx-burst-length' is a required property
	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml#
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'lantiq,rx-burst-length' is a required property
	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml#

Fixes: 14d4e308e0aa ("net: lantiq: configure the burst length in ethernet drivers")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube_easy50712.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
index 1ce20b7d05cb..d8b3cd69eda3 100644
--- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
@@ -87,8 +87,11 @@ etop@e180000 {
 			reg = <0xe180000 0x40000>;
 			interrupt-parent = <&icu0>;
 			interrupts = <73 78>;
+			interrupt-names = "tx", "rx";
 			phy-mode = "rmii";
 			mac-address = [ 00 11 22 33 44 55 ];
+			lantiq,rx-burst-length = <4>;
+			lantiq,tx-burst-length = <4>;
 		};
 
 		stp0: stp@e100bb0 {
-- 
2.47.2


