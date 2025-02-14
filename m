Return-Path: <linux-mips+bounces-7766-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465EA35AEC
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 10:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B103AA772
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24A0253B46;
	Fri, 14 Feb 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="HDPpDJFs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C32586D2;
	Fri, 14 Feb 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526977; cv=none; b=bQ6TlRidZpoIUT0TCXQ2yjSP4wAAK+RhawqhgmjaIk1RRNwGSEEMq3MJGzn88nxn6JRl8iGjJV5IYDfs/yG7BxqSCfyJQLePH8WaCtacb1FxklZLsyK9LX0QIppSYqNkf9o877WnfCkL2bGowCWyG6BHQi3XVHKuCG9zHxjnKvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526977; c=relaxed/simple;
	bh=/PufZwqWVimIvDJ4/wjK3f7QfsYqtKpkCV8G3C59qHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaOuJU6fP/pPByXe1u1/Kw/YP1J0uogacactsX0d1TjT4n0XV+vdUdphE/aOUqANk/LxEzK9565Zv/pyzjSep4hquDVW1KI6mGFWpHu4mnnkpQcuLBIrRvrmOi1K8iNlLm76rnNEpMD9qNG5g6AA849VMmcmWT2kUWRzhwinXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=HDPpDJFs; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739526943;
	bh=rWxgDkWT3SNrx50PWh9YGg/Cq7PqeLp2YzPZdThzNAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HDPpDJFsIuJ6i74NBFqsX+OPmvGjl2rlnP2DNROpvINXUcAQJZ2CKh9DXF2uKlvja
	 TJUKwrTRPVIjvM1cnvYILuTDHVbCMgLlygpeLsemBiuMGxH+HQYLAOw7R3qW6FfBW3
	 zvjZigk/KjNA/S6gxQrbUlthunRyYkjUBpnJ+Rrg=
X-QQ-mid: bizesmtpip2t1739526933t1d2myj
X-QQ-Originating-IP: kHvtQo+ABm9+6mqznQlCq5NZW+eJquBxVSU3r1vqfB4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Feb 2025 17:55:30 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2994338102361065913
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH v2 2/2] MIPS: Eliminate Redundant KBUILD_SYM32 Checks
Date: Fri, 14 Feb 2025 17:55:23 +0800
Message-ID: <36DD6436DDFA21E6+20250214095523.175229-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com>
References: <F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MWxexosv2xAzR66ufJOV9v17pHqcG5/T5P+R7jXzDzXNC7Qq3uJqnk/4
	k95A5Wmx+h1Xo6Y3Npwkw6ubj4b/Y681oHT8vtxSC6sJ7aBaVsJhDiJIT6ehr1g3dUYfP0F
	Tj+IWtSLuxnfh773OqiU+6RhpxFZPQ7IS7BspMrfPslWxDtMO3Ps1DPUnFw6dhYp7ylPxYn
	2NjREB/qWMIg+kg1dkqWyBhC3uK6Lbn7hFH3rZ0RhU9yrlDj9FA/swRlGVgSZf294Ufxqw9
	924oFF/bedq4yJZtmhlQYBjEqqIMDchnUbI/8pRuTnUZO1WN2IohDAKzv3eMqmuchr8tilz
	u29cMEY6C8zh6JS927wZRN3/B3ibJg9f1/ph0Jgvb8Pilzy75PXKMw6yflJwYrmK5/MgwSg
	Iffv/NDTjsQRMk4uWekOWWc5UVFSGR4IaZTbXuXGAnnnixjX3wcZsK4tddF3entGmQ8Zfe3
	AdOZg3+ni88aIt+Pk0ISQXlcsqdZC2glIYNe51h6xow0uCf2fRPz5cFbG9abXqkpZTfRlLT
	YchJGy/Os/4FyPtcmj3GoTlErECmCigihEVLLFjDPHXez3GXTogvOhkclIsymHzCJ4CThi0
	NcfYSlLLZByqI1/4ScZx6a47msLSEbfIjZbjSmnIZUx1TguVYE2bSETmBGTeJ8+dvbFQcqQ
	LJKBMcrUfcT7Pm0R4bupQa/uS+w/mNbDRof4wt0nQTqAY30QgBUInyj08nMCQE3/dM+q0VD
	u/XfgszC9QQrfPZFoZ7sY1Q8Kr9swh6wahQaM7ZzA5xAh5dqbDj/oG1NX9umoQDZYvhkg8H
	zn971JHuvV/eIO6lc88sNwtDCRwOH+P8fasjcpGwjrQuIpkafoOZqf2SX5shKuPzjQTVh6B
	HciK+I4c0HtTmlxt4tC0D6JxZTQYWul1iVKk0WGfXNTHiHNw15mmhhU5a7E4vdN8BupAXrl
	/8dTpVZUaUNXX2VZi7wKSCFPccPBiYqX056BiO6hr0DhVLar6u+8Ob3tGhF7ibQFqrkIoiv
	IRcDsgNlKD58wDkZ3AHvgbb3WCFFGb8aODz3X+0an9mVt6+SUgeSwE0/eNHSy35RnKNFiZS
	+lFRrqSc7DoWSDntukHHvx7TvV1CGVA6A==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Given that KBUILD_SYM32=y is a prerequisite for this statement to be
executed, it's logically redundant to verify KBUILD_SYM32 is y again.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 4d8339d2f20f..005174ae3892 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -302,7 +302,7 @@ ifdef CONFIG_64BIT
   endif
 
   ifeq ($(KBUILD_SYM32), y)
-    cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
+    cflags-y += -msym32 -DKBUILD_64BIT_SYM32
   else
 # Do not fiddle with the compilation flags when no compiler is
 # going to be used. To get rid of spurious errors.
-- 
2.47.2


