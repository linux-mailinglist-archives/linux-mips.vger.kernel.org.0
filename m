Return-Path: <linux-mips+bounces-7824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4482A39CAD
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 14:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7A63B0A11
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1CB25C6FF;
	Tue, 18 Feb 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VQzKTkTZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682BA2475E3;
	Tue, 18 Feb 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883684; cv=none; b=hwNmSnPS/YnLadeRqcMcv1JrRaXPH7xwq0tZpckq15HJslVkSW1WD6ElGKPJvXLEjlPSdlKMZvyJSmO1k8KGQ7SBvRboayRPiNm2dKpHcFYfFN80XRlrUc7i8aFF82jv0dMbwZ5yxb7LzjysYRM5GuXuAC3md2sZrFNQJWWEF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883684; c=relaxed/simple;
	bh=REMDhOVh7pJ5KFuQlenUTEO944Cb9VC/25T5owjMRlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTMFNwJc34yV1TD7sUlaqkvA9oG9h8MPhi+Pu+IagFlBMi5cIGY6ZZVcSBG3YDh3Hx56QiVK6MeyKDCVi3RZleU/Od6XSviMAJKKLfGV1wTO+xw7/hi3haxP75WXaFjDHgFNusW7W/B9BkyfGtWsreRtprIMSw7aDtIVIpu7FTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VQzKTkTZ; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883638;
	bh=vu9AhJ+sH4SiA9VYYHMJNNq3mIbaKW1m2kie1eFfosk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VQzKTkTZtAF89B1DWJjhgmqKu+3UVYMKg8dJLKnoFvxxwn+jUflmN5kPSW6Du83Nk
	 ZNCnBjj06tV91TrNnRsO2bQktndPzdCxJ2gd8QVzAmQPcaPuJpHloC2F/7PpOERbxe
	 6YYrOYvbZN4HAO/s5hVBZczx0PDZBtLpgqaMWz84=
X-QQ-mid: bizesmtpip4t1739883626tcxbnq6
X-QQ-Originating-IP: kYssLISZAcBG86zvva6DvONeMTAgztYYkGvTh2hosiU=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 21:00:24 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14385670806022170288
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com,
	geert@linux-m68k.org,
	herbert@gondor.apana.org.au,
	ebiggers@google.com,
	ardb@kernel.org
Subject: [PATCH 7/7] MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors
Date: Tue, 18 Feb 2025 21:00:15 +0800
Message-ID: <5CD9CFC46F6AC7FE+20250218130015.668651-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NikuFQrTsu3BJQDMA2+Etm1PHjFA8b62Q2dOGzF7I/DYNyRmYBQ2dLpu
	hKQ0LpY6WYFbPrzVxcgZIcUceQnVS5IlyavqmVw8pLP4eooQzm/9GoY8jIMycNhF//Wb6ch
	X2B0pr1SeSKUi9p0ODmu/LpLcJU6sGyemThoaSXjHidnnwYmvG2b0u4tdiMz3paEK5oCEEO
	boUM36TnGeliw7lwvCEhe7JQWIuG+d+QDrFagSp7HcruHCUu1hYsaKtgqlhJbraC8Tf7n2m
	Y+rPMkNPvg3KYHmxFaRunWsfd8ZcXtwVMxZmEywCY3rr3cDkXMvwrHe5xzObuKCXJENstz/
	N+rld3HnYsIv9eFe90KprARbfTkuY62fnkjp8d3g69LlnUErt9LMkUQaMtOIctTm28/cyPu
	rYOv2BiTNlW7SWcWxxx2epiPcpa/VfkIlvkktm6G76ajly1Znvh/GiXiEHQr2LZXatupFi/
	h2SaA5QXXnctgfuokqvI/idsEOphtQ1b0kfwFXc7ELY/KIWd1IqJbbH05sjVeyFv3fZi7jw
	F+CNTIg5jELuMqUhbz50FtpWpnqvHAZ5Fb2UQXyI+IbpbbVeFCRKwAgfspioYtmpwCpIWGi
	73A1zU4LiEdMOvNTwU35YNYIqfxW79cCizjYkGk5bLQYWSMbL9GL5kZYls+T7tLvWNmuCx5
	ApePES6NzGcauRXIZ+xX+9inGAf6n0yTJce5khahpPjKZyGTmAaQKMTf9QxVzIFSB0WHx6W
	iQH1bIHwO+SJk35GMMrIcfC7iw5ajidDBA06GpDViZXNzgtSADvCqPJL1RqJFlQK9uVYw+/
	MkRQYiMsJFMvyQS19GkcO3kqsKD4i72qM45ITvQHB3TH3Bgs2aaBR+PgqnLbAcoc+GRkyLA
	XLZQ5mWukHyTIzwN9jxvVBAIcQe0T1mLAO+5ikybOyVgF9SoFSTlX6UXPMq74pN3CMY+hyU
	nM38aQeE9AjgsQ47FjOnXLkxviTMpwAtNU2IjGseKY8ojZqSyrknjyVsANSP+j9rfL/0mgS
	Wlkvx4/ZeIslGxu1mJIs7oN0HCmn9tPul/GJGRddIdHUTuiT5unagylYnQXv7ykr1Z1DIs4
	AdptKaASB6lgpPQ48s67nlL91ZXZxTD8mZV13ajwJfnvwb5qxvhquSOKFiEjuiXJknImn8e
	XPzH
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

All compilation issues under decstation_64_defconfig have been
resolved, and it is now safe to enable CONFIG_WERROR now.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/decstation_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index cf8e72164e40..66bf399bbd66 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -1,3 +1,4 @@
+CONFIG_WERROR=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
-- 
2.47.2


