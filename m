Return-Path: <linux-mips+bounces-496-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBE8031E4
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C71F280F09
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2EF22F10;
	Mon,  4 Dec 2023 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADQLkfR6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E1022EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CD3C433CB;
	Mon,  4 Dec 2023 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691068;
	bh=K/hCExDh0cBht9JYKXc5uzgnRoEPgJr0wTezykOGsCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADQLkfR6/G5iW3ZcRBZsrLpUf7s7lsovxNQBaHMvyKPYeFp0oZCVZjDtndv5cqYGU
	 lPehDNZvpC3yAwufw5khufsbAMNoUFlNIGaI1yaBHqFuz1YaRZn4DbGi+XyYodJY4q
	 4FGW/Q8TD2NbPaDJTJzbPs5JocjhRDz/r10nks0EMew/v78e3FQ91HM77SxJFZmLZu
	 K1u6XrPv6lv3yGQeOH0UHn1M2hB4siZN/MF+K3rFdNM/LfD4YlAX+aoDVXXwjSO94M
	 13d6FrGBXNG0XJkWcWHV+bV0VVGwbcr/kC/CzRz4CGGN3Z74yD5c5PzADvR+dGvIGu
	 TmWWTsA/e0SSw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 15/20] mips: mt: include asm/mips_mt.h
Date: Mon,  4 Dec 2023 12:57:05 +0100
Message-Id: <20231204115710.2247097-16-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These two functions have a global prototype but the header is not
included before the function definitions:

arch/mips/kernel/mips-mt.c:50:6: error: no previous prototype for 'mips_mt_regdump' [-Werror=missing-prototypes]
arch/mips/kernel/mips-mt.c:159:6: error: no previous prototype for 'mips_mt_set_cpuoptions' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/kernel/mips-mt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/mips-mt.c b/arch/mips/kernel/mips-mt.c
index f88b7919f11f..c07d64438b5b 100644
--- a/arch/mips/kernel/mips-mt.c
+++ b/arch/mips/kernel/mips-mt.c
@@ -19,6 +19,7 @@
 #include <asm/mipsmtregs.h>
 #include <asm/r4kcache.h>
 #include <asm/cacheflush.h>
+#include <asm/mips_mt.h>
 
 int vpelimit;
 
-- 
2.39.2


