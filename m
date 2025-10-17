Return-Path: <linux-mips+bounces-11770-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CBBEB23A
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 20:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC47E4E4B46
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 18:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321DE2FFFAA;
	Fri, 17 Oct 2025 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="LvX26175"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08A2C21D4
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 18:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724101; cv=none; b=qseP6fF93bSTMY14XT/7Ky5ACAtsaZklBV/5djWcfqqYJmZtqT3H1Eu+N7aUQL+0CnKcy9rZYd6ZgFFl/AZWrtKxgWeUb0g0i51YVSVujWY1IO/1PDk9W5Ps4j+0QHxz4sTei0o+ub1Chf6fBBBWaHZhdBTi6YpwTxIL1LyxKJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724101; c=relaxed/simple;
	bh=uEz8JPPhrI+Zgyxi1YiGmOrJxuRQ6sLk9rBqa8GNTCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHs8ZKxOHMtlcF9A3duK8L25jQG3tm8CzP534jek/dhK+DXNToqfGlkxbtvaJYULQ0UFneZJPnr5KbU5VhQwiAZnxRzJAm9fMjGVEtRCcgveUCaATw27/Yvtwh9IN5V20av5yOdPwkO16BhAARrOHxkNqoF9q2V0yJQQqBbpIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=LvX26175; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 301 invoked from network); 17 Oct 2025 20:01:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1760724087; bh=55VmtpXFFb4oHifdRS0/Qic3faGPb6qOmUUmEq1Bvpw=;
          h=From:To:Cc:Subject;
          b=LvX26175n0nVoaS76aZsMrflTUwWcQTxmLLeZBJTeHBPqri9HBaekcOSo7etxRMR/
           2h420u/0nL+AD+CLzbk2TUBlfla9JTFtHRHYT6D2d5/3fWLsaX9iU+TZ784+NUOe0t
           YjxFE7tqvD7yg8MmXjc2FJ2xsmHQ7hEnbW8fuD3t3oIE24W2hncLrAMFFZxYJgq+CE
           WC5/vmZyCCUWdno/3xK+IX96cO4HVP8i59+ImgqyJsm2Go8wujvN94ayBSD2bt/Omd
           jnNHYxTRq9HlhJWmZzGerKh9o5fks8p/4RpMKf1kKLQRyFYsXuxxEkD9x2B1cSfpXW
           FVaTkMy6bhuLA==
Received: from 83.24.149.147.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.149.147])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jd@cjdns.fr>; 17 Oct 2025 20:01:27 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: jd@cjdns.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] mips: dts: econet: fix EN751221 core type
Date: Fri, 17 Oct 2025 20:01:19 +0200
Message-ID: <20251017180124.67687-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: c5c271ad7cb4d967f2347832fe9b88e7
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [URMU]                               

In fact, it is a multi-threaded MIPS34Kc, not a single-threaded MIPS24Kc.

Fixes: 0ec488700972 ("mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/econet/en751221.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
index 66197e73d4f0..2abeef5b744a 100644
--- a/arch/mips/boot/dts/econet/en751221.dtsi
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -18,7 +18,7 @@ cpus: cpus {
 
 		cpu@0 {
 			device_type = "cpu";
-			compatible = "mips,mips24KEc";
+			compatible = "mips,mips34Kc";
 			reg = <0>;
 		};
 	};
-- 
2.47.3


