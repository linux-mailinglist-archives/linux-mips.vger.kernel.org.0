Return-Path: <linux-mips+bounces-8696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0DA965D2
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41BD3BC86F
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FCD215781;
	Tue, 22 Apr 2025 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="H+FXgYcj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A346215173;
	Tue, 22 Apr 2025 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317469; cv=none; b=ZLH3dJoV4RQzFH2ZkQJrx8Xcypb4lmU6aJCqJUVPJPc3RbrIo2DGqM5E5dboknNSSp6cCLJz7haQ6kGvZ+nsWKN58CcQ/2zqWGudkv4/Lb39hhQBvtpeR5DHlWtNfXH94QK2TbFaMaTcPORH8lT3pvqSqImyYIH+HSBiIQi34EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317469; c=relaxed/simple;
	bh=niHZ7SywtqEBXhJxXUoQ5qHTD9B3hV3qxTLETfQVkRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLI/5uL91Nbm29iyPzZH8ZNWDsuJ050TvPyLeqwKXGFoQAM+dCuIOCDEz+f9z2ADa8XqjPK8yqJphZgvnS/sSjMt1bQX+ayKHZpJ/JilknKMBQM3SEckSmDtHiuVCOzhQWHRd/BtQ7998mWDoGHL+CyQm4ReBYvnst7MW9jDZ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=H+FXgYcj; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317454;
	bh=TTsZEPwrBCz/1dlJoPGkzqJ2iCyPoKODASZBVNBm63g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=H+FXgYcjRd57r/eHrlvaQFcywfddTIcB7oF7VLfF2ptSO7t56F5Ujdgc4zOaZiOzc
	 wAxOO7MZcJ8Tca+qTODn+s3vsf7EC+3nN08l63sGUkb9nIbkmV+8sr8QXzo9L/CaE2
	 G5KitIdBMrUePjAECogPlVyzxQCx8Re5zDft3GY0=
X-QQ-mid: zesmtpip4t1745317409t6fbbb0f7
X-QQ-Originating-IP: 3ilSgnN/hpCJ+v0evZYAElIP8wKs9EEd3cnDgrh72YI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:23:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1331914406803930652
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH v2 6/6] MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors
Date: Tue, 22 Apr 2025 18:22:53 +0800
Message-ID: <2AEFB36427BDF18E+20250422102253.137944-6-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M1EFJi73A4mxs/cags2Do9xngT/5dq0dzmyJlacxwRLzPdQ/8mdDvcQ6
	h3Xo5pR0v5/zpVV0Pk5sxlv9mbQ9FZZs+8kCVSxDnNHqmRUk8PZeKHvl6TrmSfbwdHsqFIV
	MeLNSlfcbYaTWGS3T6THgxS4JQfBJlTO7EgCOp+GFnga3a6f4Ccbu7F4bzDGeBNgv9YtRiP
	ItuZDiy9oI9jCYa9KcefHoot+MPGg6U4OOQjDbcM//3kULHUn2rcU2UI7XJ68+K5HWHttxF
	quIW9ex40OAFim7X9B2QWFeBIi/mIhdJERDTfUjCvmdssP2TflHDJ1tIsQ7uwZUoGvnjQL2
	1KGuPKHfoAaYb9nFd/WxA2DjsOlxIEeQ8qcC7egNxSHVWzw8Vn5/8o0jcW4FUlW7Bt9Uylh
	t4DoXoAPcD3CDgPt50ofu+BjnBkIHhvu4V8axwT2xkcN75H6hduRonidfSgAwdj3c+p+L26
	JUO/gNBsUynkuFdvKrVGEvM7JI3B/IDiPbBJ5ttX/Nbx/edyUs1sgGu7B151lYZsNvX9i9n
	YJiGYUFA1FbvpuoCDSC5HpMhmnDT6EcnL1KVV5lDPJLdohRWMCTAcaru663g0VZ3VXj/awC
	By7+k6sRSEo64HsVFDO11Tq5r84yNA1/qBFPdjZp7thDsbXGpMbc29ky8xEELqj2JT0oAtE
	SGlomGaMxe1ZS1fz8kIVoqfNoWQkOmkU1t+cvPLopmUo2q+r9hZNHilFiUWGBx1UZuy+Xkd
	2JPYiqVkRQGLOa9ZBPTNIPU4C4iRlI0MDP/3jaF/z8vP4bJOKQnxDjM3D+2SGGqFFgzq8fV
	aBXlMvbzut2pLjrgEBB0CazwmHAB0Tk0MLtcJp2e7mCu535zddT1fH79Pkxw8FEHL5xqXqg
	wjFTY9WO4u851CEWNQoGaSvo1g+uPBn7QMvEUqIhCMFuLWef6UNKggN1uVARMJHr7Y3bCSw
	W3aLiuVrlrzWOLDllWg8pG/BxrlWKwC/GNQiL48Q5YL8y1rVW8tB1jo1DKWnRSRm0DGKzHz
	upbTeCDEQaGoNYIfn9SoSBMXetRyzKtcN7yKhX0SzsLtduBXAA1ywXmCiC16xacFOI111Rf
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

All compilation issues under decstation_64_defconfig have been
resolved, and it is now safe to enable CONFIG_WERROR now.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/decstation_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index bf579866cf4b..12415c5dd28c 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -1,3 +1,4 @@
+CONFIG_WERROR=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
-- 
2.49.0


