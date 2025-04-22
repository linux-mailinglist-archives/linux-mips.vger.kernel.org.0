Return-Path: <linux-mips+bounces-8686-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC3A96405
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 11:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F8E1885E11
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 09:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D001F1509;
	Tue, 22 Apr 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="aHdWa7rb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C018E3F;
	Tue, 22 Apr 2025 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313501; cv=none; b=GY4WqioB5GH703ansIB9T73gdKUvBZmED1UBh0vTC+XGybU5smkjg/UmKDllAEekIjBVyxNI35adzN9pxxzQanrMnNDhfhdRGfXRfzZ3qVYowkTAzloxS/2xhyYyv3rEaGAiKHVsRePlPUR9VEZhZoRSqpUJga/kREMZPIH3VXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313501; c=relaxed/simple;
	bh=ahUrLKUy5cKBw3CCcbzKd4Qd4em2A+c8Vv02kzDIBzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V6JtccoJjDfV61TQFGT/wlncylv8Ccq70lRsHXrhW/b1gmCpyZYWvIsazxjcmYtvACdSxJyIZaELHo6uIpqRIOTOTejbHvrY7PfAhnlBe2Y3udv06PWuCM36XeicDs9tG0dMq5Ng6JC7xBekAV5od4C7LeiXY8yR5z7lxvJfe5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=aHdWa7rb; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745313433;
	bh=iGkIVWXFOyVsd4uMO+SSpTfRM67ip4m1rYsko5Qs5AA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aHdWa7rby8JmH/g6tVdSKt2CgjT4BpgsVgk1sv/CFWUI2mM0G/vMY7e2nGVBuhayy
	 XAcpW0kfFx7KH/1o6pajPBt1SWkF1q0xzFndEYmHHSq1vdcFqVLCV0/iQ9ZUdNMoH4
	 W3tuhp9Udle+nAIUJfBYU2eJtN5tMspEuXtR96Wo=
X-QQ-mid: zesmtpip3t1745313415t3daaa261
X-QQ-Originating-IP: j1RNao9pu3ZOoDyXZrFlPdWn5P6r/D0upx564EzC170=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 17:16:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4643946903979290159
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: macro@orcam.me.uk,
	tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.4+] MIPS: cevt-ds1287: Add missing ds1287.h include
Date: Tue, 22 Apr 2025 17:16:48 +0800
Message-ID: <CB3E3A9CEA5227BE+20250422091648.116984-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N34HGxtl3nZNGOKxccmAw5hb6+nu/qSRzx28mLLa0xo0l3x4TJObnebb
	uc5Dii4gWRaCibxuC02o3LhUFTqLj1M6wY6T2D8FR6DYtiaDnjSkiIWfvjXVq2bDHhKLZ2e
	UA3wEk1qlAt26kqmHJpvDJQp6lKmF6wCAT716pzW+/bC5uWPaRVVqLw1ge4YCWCsqZvd+XX
	LwXUmXnNENSfMVBCXwF8zns7vIwu8EXde6K7LI+daTu9PexaEusNL1fawFPuMs8XZfm2i/U
	jqJzaB0A5uonemKYsKJNVL8emtvi02aLViGVu9xb4LO3GK4vKpLkj8uEzFGxxFpebn0M310
	LNq9ggnB+8z0sXDzIqMDCpxqS4j9twi8kyZaApaWhbxNoFrh9H/L23vCT0ikSfMO05+Z927
	xPxvcWqrxHlsahsY57x5j3ceJoVfPAkRr/9B2vIQOabJV265EGTmWdnksvi3tZTq7C91RAX
	dPCbrUhWc9qs0cgmjWOHVD9ivluuRrCPD9wT/sbb1TBdsvTe6Mbk0dSmxzuNtruO/7vXMZz
	Agk5pMY+6MazjxmOIZLQhhwqzdCEThqguUCivWavmiIveWnjW7TNLsUDcvDkULoDa0/UFrP
	FyrKRy605rxajAt5yNSQjJv5o9Za/z+XXAh2Per2nddp0LhxDcpG4kqcwXlcnsqk6BeBedn
	l5d1MMF/JHJ4oGye4Dc8DApl0/IaTKeC8+GJcmkTz/gRA4plOCoXJwTwzlJHJKagS5LF7FI
	5CPrW4ScOPHkwMQOt+uXJ9tKvc5doLGzJIPw3cboMaeaoNKuvpavRgFcj/C3cwquwZAJnXq
	IsvhSg7G/hGhx4aOfgoCiktWpL9PUyu1AIo9mY17gli3QsWtqKAQJNl+4tW5cuqkY+czMXl
	nrISiU5oknnU9mILfQILANK+FsmnJYiHVBUdsxQ9QRxOpOjAmCrpDPgGesUBDs5yNzGfhY+
	66eAa1YCXUFdW510yvO9ApXy0qC722wgyfIAFCePVgg5L/HBFaZuuPia8MK9PTln6ekZcpf
	t5CV5p1KFaOXd+rSkO7UipK1SxF7k=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

[ Upstream commit f3be225f338a578851a7b607a409f476354a8deb ]

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
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
2.49.0


