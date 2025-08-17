Return-Path: <linux-mips+bounces-10346-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA6B29335
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 15:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88384188E8BB
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 13:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016B8246BC9;
	Sun, 17 Aug 2025 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="CNlusVoJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDC123BF83
	for <linux-mips@vger.kernel.org>; Sun, 17 Aug 2025 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755436240; cv=none; b=odaa8qrzhZ/hO5y/nzMEEb8EnE/H2/nFJxolOF6IGc1hE9OA33hUvSXiSWdu/Vdido3G0zcms5et0fjhnnahdr4LxFGyAARAJyb4FoNafr/RkN2s4MP9PgjjIQSDamXdp8Qz7ND/caDYGch7rhIXy/wDbiJ4d9LB0eQVGrXigPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755436240; c=relaxed/simple;
	bh=qvyPL+OnX4gAOYPzS957ni/30ldw08avClgjr5yeEbs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M+cRFCeVPuB4iluus0CY51wnB66Oy/KipCxTPx+jreSqA+F8SpUEu0FFmtur51PYVcFMDQ99rE7QF8bXaIgsAyg1/VuyG/b9dIxWYt2ZinQd6HjMda40WUBXP7RglZKu7ERC8zYOzaA/MP5puuaX41X0kbsq12ks77M4d0KC4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=CNlusVoJ; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 34713 invoked from network); 17 Aug 2025 15:10:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755436224; bh=RhthSyV3t/gyGPi39+Cup5UQ7hIQmjcMOs6E6JDWgz8=;
          h=From:To:Subject;
          b=CNlusVoJOdFTvO3Pksk/6W1/gabPuDvhNimasuqdLmxpNOqHemBqjj3uQAX1xe0UE
           HizGJZwzFzCKsGrSq/tU5tpNtQrOoKOiB1BBvzcPhLX8mjxkLEn8n11zX6WMz1ftBs
           +M1cAyJWvQqdt0LUJPi+8MSmCpU8g0svwZMy0DwKxyVvyu/4JCXFd/zjs5lV2F6CAF
           58UImR1vdYcfFU9DILIY6jbm8Uu8WohruTT6ZIF9O3WlidP++Wx7ipCJnDGKWKXJlk
           p7r9JR0FMwJMO/6evXCEEganuXFlKcRXIiQP+s9XMbMDoqLkOY45TAtBMQb8MYyBMH
           WjJXpGIRpqOAg==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 17 Aug 2025 15:10:24 +0200
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
Subject: [PATCH net v2 0/2] mips: lantiq: fix ethernet support
Date: Sun, 17 Aug 2025 14:49:05 +0200
Message-ID: <20250817131022.3796476-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 086d2ee042e4bcc9373b0416932c200c
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [sYNE]                               

This series fixes broken Ethernet in the upstream danube dts. The
driver doesn't attach due to missing burst length property. OpenWRT
has its own dts, which is correct, so the problem has only been
spotted now. Other dts inconsistencies with bindings have been
fixed as well.

---
Changes in v2:
- renaming clocks in sysctrl
---
Aleksander Jan Bajkowski (2):
  mips: dts: lantiq: danube: add missing burst length property
  mips: lantiq: xway: sysctrl: rename the etop node

 arch/mips/boot/dts/lantiq/danube_easy50712.dts |  5 ++++-
 arch/mips/lantiq/xway/sysctrl.c                | 10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.47.2


