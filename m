Return-Path: <linux-mips+bounces-7817-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9450A39C8B
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B1A188C8FA
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF28525A620;
	Tue, 18 Feb 2025 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Z+608SsJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811E51ABEA5;
	Tue, 18 Feb 2025 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883152; cv=none; b=qLanCO4FczstK7QIKN/efRJ5HDY0yvjoiom49xk98G7iwwl++J9lQVl/gyy2YFb35cr8qCHJ65Lvnu4skXbx7IQBg+FWMDlXujPa81VpjUHOgPnYN7q4HdO019gNx4GWKb3k64HDOPAkmrpqmojtz7mnvo/++l2/rna9hqBc28g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883152; c=relaxed/simple;
	bh=ozqzKBaZp7THjUy8Frl0csVo51t11dKyaoRQzyPOS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F35BHyn/X6wKrpf6cTTrZAwYO3ZEaauBwhBriLtQmUY/B4BUe7q8DQGiVa5I1ykITqsm5R/mccaQ7GBv7XLKE8rn8BhYGNR6kjmZCBN4ul+GxyJVToIGYrOodZHQ9MADdM4ok5f8ufoRC1kWjE0T4vsV7BlYqT7CyMJ1H9c1Twk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Z+608SsJ; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883125;
	bh=ikvmjdBqBWtzjLpRsgXdFU5i2uUbwM5rbB8j6aNXBLY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Z+608SsJvCBmfvsozJzFyPA2pxCSO47DNZwOLz4/9Iq1c3FS8j4DQGSAeMx/Qq7ez
	 FmxyIE3ESVwGupJCkVbYO/UgzBocfgq6+aAdmih5jm2TR6HL8jNSMsnDsmMWs71ED0
	 tQ1FlN/l62eLz6D/LFHkR8LogkIw0KB3iK0WkPlY=
X-QQ-mid: bizesmtpip3t1739883073tocqmdk
X-QQ-Originating-IP: C6fzMKU50jlhRjqH9yg7T1ID+cGXKwH0cAaoJw7bVqo=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 20:51:12 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6899335646084924292
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de,
	macro@orcam.me.uk
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH 0/7] MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors
Date: Tue, 18 Feb 2025 20:51:01 +0800
Message-ID: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
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
X-QQ-XMAILINFO: MavvAJs3NvAhUfmTVx8SHfqqW2NMg4JA6H1tn+T/BpmMPfMLwWiamBmt
	9yMBpcQdaEdtZF3QVyMPudHu0+kb4f6UM/cm30egBPez3wneKDWWdN7ehBjDiE2QuGlvC1L
	7RTQ4Enu1AntIbodEMCPbTrVf6s5BBYc/Bjq9GNBACBeyQQuzRMcoANgFVgtml0cfiJDmQg
	5DgC39z4Ts41N5hSOvuWmDSlTjA03SyTfoKHA3AnQEv3rWpUgiPeW9jHyWqLNJDPCoVZkaD
	vb1f2hEo339uL1vpatE5SBjuT6nPHUSQYttV7ZY0yTNRvSBIW9LaYushtzHXgAFSmfb21ML
	kDLNKbW28rTNWJ5iQah2Zo26hEQoR1Eli3f92dsbdA/jlqQ+ht9coY8id1q3h/xyMdhN69I
	h4VYwSk0EXRi4fWz3MAOb/Wkbf4zMJ8XoEienOjSnqjkWNTA0egbCwugtsk8PM+aFVI3bZK
	9F6xS4gK0FTX0QpohVT49B2kBMnrNhDYiEcvloe3CN1lit2P0tDveRVIBlb5pMg75/ysTHd
	0itBTQNyCLdyWVSH1KHO5WV+jU9Dpaft3mEAqDAtN05JG1La04MjB+qP/RQ82BGAyquRXL9
	pB4DxNV916KRU0jC0w8EmZKARqn4VUj4LCTzVEYk6zfqVTfvwl6LkbNK6JwQQf0yodooh5I
	89cbWp5oa2qELG02kphm0m9oQq7Yr0ybgIMnnA/v0jDkGaliUNiMFfS3w0MhlamOwSy1n77
	vK5a16HMCycLewydR8CIjwiLO88sKgnLhwuuCnyxGgsi3uue83knGpiSYYdtLoYUMY+PB59
	dgoz+MmMbs3HuGXVgs0OCTAy4eDbz5A35xb22X0n1RAzcbrOiUOSPI55YiAPlox60Aj0fQm
	V5652KtqzG4sS9Ix7Lmbhz3mfulWcO0h0NbTdBnpPZXiHeb6HRj+bgynvrSEL9Q26UjpI69
	DubBxT4ZpqR4thrEPwLLwNpNeI1P/8wRgkuIZrX2i/XEKefpCe1MyGlKVTApphrN2phMzI/
	kcGtS5pHUD0s8xQj9HNrDNB2iSvwh/tqGePJOWFA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Patchset ("MIPS: dec: Only check -msym32 when need compiler") from list [1]
allows us to compile kernel image packages with decstation_64_defconfig.

However, compilation warnings remain during the build.

Address these warnings and enable CONFIG_WERROR for decstation_64_defconfig.

[1]. https://lore.kernel.org/all/8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com/

WangYuli (7):
  MIPS: dec: Declare which_prom() as static
  MIPS: dec: Create reset.h
  MIPS: cevt-ds1287: Add missing ds1287.h include
  MIPS: ds1287: Match ds1287_set_base_clock() function types
  MIPS: dec: Remove dec_irq_dispatch()
  MIPS: decstation_64_defconfig: Update configs dependencies
  MIPS: decstation_64_defconfig: Compile the kernel with warnings as
    errors

 arch/mips/configs/decstation_64_defconfig | 45 +++++++++--------------
 arch/mips/dec/int-handler.S               |  2 +-
 arch/mips/dec/prom/init.c                 |  5 +--
 arch/mips/dec/reset.c                     |  2 +
 arch/mips/dec/setup.c                     | 15 +-------
 arch/mips/include/asm/dec/reset.h         | 17 +++++++++
 arch/mips/include/asm/ds1287.h            |  2 +-
 arch/mips/kernel/cevt-ds1287.c            |  1 +
 8 files changed, 44 insertions(+), 45 deletions(-)
 create mode 100644 arch/mips/include/asm/dec/reset.h

-- 
2.47.2


