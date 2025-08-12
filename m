Return-Path: <linux-mips+bounces-10233-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA20B22471
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 12:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F674189C857
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D57189F5C;
	Tue, 12 Aug 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="rIZHafz7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C12DAFCE
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993837; cv=none; b=oDFMwx5HIyF79BeTaUUi4jdKK4YPBj49I8FPJ6rO635QQtSkldJnoH56MNUC74m22buIyWYKaE+BU3vOaN4xeKyBo1glgG9gDlzDuwKAKhM/uIzkNMdWTsq4g8Sr1rltU7nH+27jlRsk2l5EXRXt5VlLv+Pwg0+Obhmzx0SS1g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993837; c=relaxed/simple;
	bh=NbbnhG7V+vl5U1+YJnrVj1ogrs9erTio/i//AGOZzOA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ULY7tuYUCrQdsfGImI2atOPvCWt+Qa5aTWsXxVn3g1+xpldB9cot+gToGwCcgJhyCdlRvqLrHMEdq4nvZMAFplBIHBQ+vsnsF2r//OhVQkvzWbCNuIJCbb5R+09fOaD82yGi1KaaUQBNX+TArnenqoMArR3HZMqOXkLfVnSR23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=rIZHafz7; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 48360 invoked from network); 12 Aug 2025 12:17:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1754993822; bh=XottfDTJ3G6nJndrCm4cjXt23u+R3hnCONSdUmC/xL0=;
          h=From:To:Subject;
          b=rIZHafz71lSXYkFaWhxFrwSwnQyzT4lSQM+2eDYk2joOhfxzH50+lvTn33sYPRc7q
           YLLZnlx6ARB5mL3eImD2r7tchmHMtaffzVRrYMG7LiMQE8fz5QqBpi+rF/iI2zw1hF
           mhkySKiBnOE8C7jEvX51aC/9FmS+Ac+yslqEfJhgwlTnFQfJgsLJHwlIbMqD/SCgy7
           4kczrAkfqxTn56jeFL34NG/3SnxYsUIy1qc9c2vBuSM/bQVZff687HoGJ6pyKGC9VZ
           F4lbR9gh3EDT+oCsr54FTKXwiNxHQycoCBpIHtqCphkpSVMh6MU64CCxgoQvenP/On
           arZMbO5mGwvGA==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 12 Aug 2025 12:17:02 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips: lantiq: danube: rename stp node on EASY50712 reference board
Date: Tue, 12 Aug 2025 12:16:57 +0200
Message-ID: <20250812101700.970879-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: ad10e5644dcca723fe192dd19dad4262
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [EWNk]                               

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


