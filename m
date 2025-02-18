Return-Path: <linux-mips+bounces-7818-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BBEA39C92
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C433A861A
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869CB25E44A;
	Tue, 18 Feb 2025 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="m2Lr2bgg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885EC1DDE9;
	Tue, 18 Feb 2025 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883341; cv=none; b=LdZJnc7JG4bwRZosNTmQM9OkhhSRgzPzuydTiGwRY0MGDXJ2GNH2WLPHtLyYMg9/7tJaqR3RtAF9W5hC1QK3AOVZ3qwooTPe+0adgeAaBquNJ47sY3813Z1Ikzh+Mq3q5OxnbB9iy82Agk5w4PkTPv3uPjubo9Q0Q2JB2gUPBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883341; c=relaxed/simple;
	bh=xJo0Xrc/RxAlepuz1Lr5txeY5Au+59t5wfpVH28jO1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAqznp3OqX5KuVt9ai+7HiORCyElSiUJkk9k5oVhVjsq4Fhc38qprwenr4ZlcN3p3h8YKHkazxq+l2jAB/j/kAGrtrMmC4q3Jpjx3lk6V/1n/d7wMof5U+DJ6+CDrz/mquHCGr5wu+93KkgwP1p+VAt6kQ/kTiS0NW5SL67+PIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=m2Lr2bgg; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883320;
	bh=PipOO5cc775nKDa2hWJYOG9AUg/xgW40yGEOyGeXg04=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m2Lr2bggD7DeN/6afpqF9V7wcOW/MfMiafNgCyVCjy2KT0sP/+GbTygFxlQ0Nnh6Y
	 anJVO4DdYs6X1So77JK5GccjgLPqjwHMRE8ZcoZIBc9FRwWXdhCHKFT5iKb3q9CnI5
	 Q7dz7yEiHOgl1B56u9vHcrJiGkvJRcsMTM2cQoUY=
X-QQ-mid: bizesmtpip3t1739883276tz850aw
X-QQ-Originating-IP: gSkUCH2fWVWVmCCXxhwuSOHKSjJQRY5yL9/DnoUs2VM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 20:54:34 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6309835871196480234
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
Subject: [PATCH 1/7] MIPS: dec: Declare which_prom() as static
Date: Tue, 18 Feb 2025 20:54:31 +0800
Message-ID: <22CF8506E42636AF+20250218125431.665670-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: N+zv///MAAEk47Uc2uTzhhAJloA+s98pwsasgf4yc//G96WycMqWVCyP
	3NQVUQt7r1S5hXhrqMlTrH/EbbzEH3VEntBOWoEYfAaAfc5tamJExkdI0sdZn09+eecxi+B
	CacLQBU+91dCMwrr5KUqSXsFoSoAKb7S7AIA3CeXR/e/Eas6onlA2r6s0k+y4ff0FJBjrSV
	Qq+by8Ov1rXCohy618G5pU8i6WwPGUCKvR/dmuH0IJEYdldbAE12lmXeMb7SuLZDpBtdOWe
	ylFGoK25oezRF33zHl/jlmTIbgha9GmtKtJ23CdQhRNuzgVUEanhBcq6QOKzAkv2/hLmMBL
	GUx+nFTAE5GMbb+MGQF1NIMZaNVlT19Oc8yikOOEzRz7FPrfZssZRy3aLsK4Szho9IqMT45
	mahIlpkg/nlJI1apZGKwfchipmgLWs6EvAVO1MyqqNBP8FoQ5I0ExwBcmAWYCGsCKO3jlq+
	JI5lK/EVb2uhrQbYaFi6Q4e969wPAMmxeddY3+XkwBoEbU3HhHLkYZZ+OhlecJhaXEOU+Sv
	5xKHd3va8fPHvpJ7ykc0NafCnDgJA4L0+09ENtMFRIbYOUT8ovAEHaX2i1NhrtmAFa8KjM1
	U/RCu4iXK3sCFDrZPFvA6dxjzuGat0Yu59h4w/ntVLRMQ4SH8+6hVHaJjGZvqIQzW+sKpbz
	KIP9IR+2fkydohuoyNUyOKctlSK7vQwDqtjPXMdKXdRBS75yze7QDK2wKdgS4fa/aybobym
	eU/VoqPYgVWpRx+kvBMrAmP8q5m1xAWDToGRpmzzzQI3L4XVOTmocNn9WOS2YSiqdnmXBCr
	AQoOPKGpP6HZEFBOA/V60BZ560AzzOh6ZoiwKbqulaGohT7lThz+LW3jttAB8obkM/Tw8jI
	PPJL8fQX8J66tdCVTnNpq5LOw7/3WOX5YBKNIayW4keCT2BF4ed9PQA7+9z5rjXdzbPZJ9H
	baTe8MU9+WvbbUS7bpUlkYiHDKhdmjz66du/bu1VIXtrfGW6j4A/hLAgWD4G0IwlTsUmsMe
	9pIZu9ysUXBoQe7mVn6nbrFX1IQVuDVOuu/A1HYJ7f/U2YylHihfcMe5KzNkqoSAnvkTUUy
	UBok1Xq4Gka
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Declare which_prom() as static to suppress gcc compiler warning that
'missing-prototypes'. This function is not intended to be called
from other parts.

Fix follow error with gcc-14 when -Werror:

arch/mips/dec/prom/init.c:45:13: error: no previous prototype for ‘which_prom’ [-Werror=missing-prototypes]
   45 | void __init which_prom(s32 magic, s32 *prom_vec)
      |             ^~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:207: arch/mips/dec/prom/init.o] Error 1
make[5]: *** [scripts/Makefile.build:465: arch/mips/dec/prom] Error 2
make[5]: *** Waiting for unfinished jobs....

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/dec/prom/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/dec/prom/init.c b/arch/mips/dec/prom/init.c
index cb12eb211a49..8d74d7d6c05b 100644
--- a/arch/mips/dec/prom/init.c
+++ b/arch/mips/dec/prom/init.c
@@ -42,7 +42,7 @@ int (*__pmax_close)(int);
  * Detect which PROM the DECSTATION has, and set the callback vectors
  * appropriately.
  */
-void __init which_prom(s32 magic, s32 *prom_vec)
+static void __init which_prom(s32 magic, s32 *prom_vec)
 {
 	/*
 	 * No sign of the REX PROM's magic number means we assume a non-REX
-- 
2.47.2


