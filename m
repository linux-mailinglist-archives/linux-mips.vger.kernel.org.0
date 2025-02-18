Return-Path: <linux-mips+bounces-7820-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E6A39C9A
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BA13A8E96
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DA1264FA8;
	Tue, 18 Feb 2025 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="pjrqVmDO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D89264A91;
	Tue, 18 Feb 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883509; cv=none; b=LgOamuX99qshNsa1uAf26QFJKmtPfq2WQWY1dC3idJotVWPBk1IqbCqs+JJLcgkLpX2/LMDFRKTRXuJUevlORM8GJbkq/du6Y1tQE2tyOxh5ujuHeuRaN6PWMI+86Gsc23ffhnPciJ2txOsHfAXEdnQqspJG89saWmSjtqsh66w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883509; c=relaxed/simple;
	bh=JJlh/bjdYAPnydJgo042TzApMxiaqJrFo2/KXVAdsNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/2oCri1IdAwrLu55egn+gY5MXQkZB1xbcUU7sQEl7QVFVT9Ql17AteZ+VKnzVBtJwLrr5ZzhqTT8cfo/RLbfIlKO5/I3yGtaogIBEI7qupZ+eWPkF7ZDYuHMmlGZdT4L7MHj3hAsYULFTMPkKkO8KekkfB6kWqaL+AT/wSKDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=pjrqVmDO; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883494;
	bh=2zCWdRd1PrOVUVSxD8wqwoiJzCtYme80y79Zs2msm2s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pjrqVmDOvYJs9lRzHGDYlsQ+i5RFzbG0ZsBmURx20cT0xIzUC63JMPOEHrJOsHAYo
	 I6uP2OwIxG//zWA277Il9zGcNrJUbdFC8xOzzFOL4R3tU8+Cbhm0ZroH02HO/pBQry
	 a7hRxYPBu3Qqwj1cLKPPcDEfVQOtaI12n4+IYTzo=
X-QQ-mid: bizesmtpip2t1739883448t4da3sb
X-QQ-Originating-IP: mGMHbKw3tTDM8SfAf0LzgUC50c9uJ58QL0TdxvUEBfo=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 20:57:26 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18014004292230785986
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH 3/7] MIPS: cevt-ds1287: Add missing ds1287.h include
Date: Tue, 18 Feb 2025 20:57:23 +0800
Message-ID: <6A027EE413E09E1F+20250218125723.666989-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N5WxDrSUSX1PFCLI/iX7P1eZ9zo+KJOX21FLALxaDVZl2Ky5+jgYFTMV
	0fk+RVBZGqReriMOyt7GfqMOoLkZdOu3r5Hx2qs6gq1A/WI5DeMvf3tr73tTV/BXApyHjGc
	6p8k02x7vaBFk9Lv6r77bdx4AZ2mrULVM7b2A/E+27F9HG/8NZlYob1cbrZJWWyIUcXR5eK
	fEb6g/OkO0vRtgwVwe0WX3vZUjVJu3KzExFLPDWNx5NzK0vMYoHdrfdvTsv6bQqBaxnSHh6
	ptDIn+tdIFjQlKgZLrkF6V4fMHGNDk+caBP18hTmBdSj8qEQTyo/AKTuy5q6hMCbGMNfgDD
	WWzk0SNvs5FaG0YMA6qxxE5ymd0dycTqbfq0OA4wCqSNhg+uKpGZL1WQ3fmI61mbFbPIwHf
	+NO57PBlT7zX9+Gx5lvXXOfz3XG99/FERJ28hYbSvICvLB/UXbhjvexSQPIt32icPQT20/e
	KjvnBetdcEo06b4AL4zdaalZDweWoshS6gIeatuJP5IONX3Vu6vhN50ChS46ahz05D95Urr
	hqKgo5C1FA1mmcAUjNPx/0l3qLAWnQCqtLuuKeRLxq89+mv8qNsiGj2CfjJP4fsjEauzIOw
	rzua1NTr9in8mAl8tG+rzbMIWstSOb5XEkJg0A1M7gXr5nNrpL03fY5C/UuV4ggODNCyhQ/
	wXHNNXAL9UXgq5JvddNHcPLJaDU5CrlBLzQ6W7CODITQsW4gJ6Nra0bg7WYc0lu2vNV4MdT
	a/aPDHP8QwDRSFwGwaVdQYFEkCmLgLnyMExCPMNgC3snANzjxoc4Jpn09vM6t3GVevDJVLg
	Men6K4iGxasLwuECfDPIt1g6UZMV9upDVmz+n0sv3YY/ETNE4hoMCz82hAd854CcoVNi32W
	LdPXj1e75v90BEBz3uO9KlV6Oy0eQoThn4rEJxp1e7Ez7iUsvARMrllktMoN1JEo3pJojNX
	QRM/KYdNSepzDVFRnHn0j1xg3uRU/1Mm6NUGoTvjxQHm4kvOcNwo7yoQMPcqr7TzAPmLOzg
	3F3mSAT37RBSmtQHYgf5JlaMkLe36pos0YDno5+2UGNEH1iXvn
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Address the issue of cevt-ds1287.c not including the ds1287.h header
file.

Fix follow errors with gcc-14 when -Werror:

arch/mips/kernel/cevt-ds1287.c:15:5: error: no previous prototype for ‘ds1287_timer_state’ [-Werror=missing-prototypes]
   15 | int ds1287_timer_state(void)
      |     ^~~~~~~~~~~~~~~~~~
arch/mips/kernel/cevt-ds1287.c:20:5: error: no previous prototype for ‘ds1287_set_base_clock’ [-Werror=missing-prototypes]
   20 | int ds1287_set_base_clock(unsigned int hz)
      |     ^~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/cevt-ds1287.c:103:12: error: no previous prototype for ‘ds1287_clockevent_init’ [-Werror=missing-prototypes]
  103 | int __init ds1287_clockevent_init(int irq)
      |            ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[7]: *** [scripts/Makefile.build:207: arch/mips/kernel/cevt-ds1287.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [scripts/Makefile.build:465: arch/mips/kernel] Error 2
make[6]: *** Waiting for unfinished jobs....

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/kernel/cevt-ds1287.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/cevt-ds1287.c b/arch/mips/kernel/cevt-ds1287.c
index 9a47fbcd4638..de64d6bb7ba3 100644
--- a/arch/mips/kernel/cevt-ds1287.c
+++ b/arch/mips/kernel/cevt-ds1287.c
@@ -10,6 +10,7 @@
 #include <linux/mc146818rtc.h>
 #include <linux/irq.h>
 
+#include <asm/ds1287.h>
 #include <asm/time.h>
 
 int ds1287_timer_state(void)
-- 
2.47.2


