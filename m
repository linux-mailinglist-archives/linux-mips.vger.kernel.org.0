Return-Path: <linux-mips+bounces-7821-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86013A39CA3
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 14:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C8617053E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095CD265CCC;
	Tue, 18 Feb 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="AJWuty4l"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB52264A65;
	Tue, 18 Feb 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883545; cv=none; b=Q7x/Uy1pnrzrO/hVtJQSiqgLwMD02Eqi2hTJzeNFrteu8vCiXAAMY4XMPaN3qF7NRvEfK7uUCHStOFD2AiUkMJhHBij36Fqt+NPBWu9iJTdK5afM+U9uz6aPguTjtXX0sX0mgIVxt1tmcSz3RhEOcU/PVpUM3UWQYiDySTz2p5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883545; c=relaxed/simple;
	bh=lOSMJwejeI48r5X/uxUNPbe6m5DJ7Oz1bKD7op2ABfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7E7CCbDLAt4DViTmIAXOiyxFydnZZM04GcpY7g37nWtTkODesLFUY1X8o1dUcIwoxAfcMqSo/BNyGsOwkVG2ihiDAgYHYYnxBxhFaxgLRUIi9V4mUJbB4aJlg2WvRFhI1pd2OD1Sw7uYEMMdASTGsevwj4tIBxLfY67wDDg5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=AJWuty4l; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883527;
	bh=q3DOjpewePmV51uT0y+fwg6nBfRHlVwep0EKCAsnWSs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AJWuty4l7OgpjDVLd3JSSHlTNhfqkyajgk72mrMvIOp9WMMX6KP1tustEbOlOu1a5
	 lUP440bmjQ4iPnnTQEGbxyJ1hRr7xW5O4GXl60j0ajORCtMgkIHNLL6rUSjDyF6wZo
	 8ZFm3c6GkQJ4e4w8rU/uB4+aO3kLvwpKGe8dT+R4=
X-QQ-mid: bizesmtpip2t1739883480ta6rkl3
X-QQ-Originating-IP: Lg/bf8HK4AHRgOwJTXa3vIiUaIhPvRsAc9QiLASbRcQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 20:57:59 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17186450553818784558
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
Subject: [PATCH 4/7] MIPS: ds1287: Match ds1287_set_base_clock() function types
Date: Tue, 18 Feb 2025 20:57:55 +0800
Message-ID: <A769C7B3BA9BCC35+20250218125755.667335-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: Mdc3TkmnJyI/MuVmiG7DVUPoiOFkEQsLwmk7+xkPx5vB44S4XIupU1MW
	wgLWB65CYy3NRCwkaQbIroKP6wOjZw/YYYRsJUxZd9a2PBkR15Whv+X0RbTKRWFHDPbGEgm
	T6eAdtdFGCNQ9+yR624ireAUrCqtrpM0kX0h4rC8/9i7FugyR+w/Brl+lUqJeUApMSOb//a
	THF6V26PCR6TDJjjA/8N4FIp2MD+LwE8+B1O9TECYOWmKPk6pXsHsM7xJGn4txCZm3/jNNn
	Q2yOPUGB4j2J8uVQYVxYOnWGpn+l5wwyNC+9FAl6n9SOCtt08t9/bqJhcXGyfTQS3+0wxiF
	Iiyn6e9vj53FkGJI2yfTPKjOgV8OPhLQVDBMsx3FVUDSEnnk79ZE6WsCttWPkGVbz/VP1+q
	Bu+QuQK+Ki350cszautsUlWJF36dC39mZP3V1b0gh9D5lV5IAzQRSnHMURNwcTl84Nb1gsW
	g+ndXLYXrhGvmtZ6FXZsIW29co6hqfHPlqnVwGYoFmyXGrgUM0zSJwoFcOQ69Cb0P0O7A69
	4BAN15Z4/qFfxiSLdnQ/lilvE43A5EsBO2IbD9qqu2TXBTf6okrcEU4E5LDjmnP8jmPgkYU
	Yfch11K2fHaRI1WkyKDeLfTuDDgtai4saHUn7v5KjsnVQfaw8zTU08Usd9U7kh0y8PpFS7B
	HQbNEwSHpxLfMQzqIV3gDx7Z7DQIhgLDqsPLabERhEeXL9ajXOJGXow2eiKDwUJ32z5wkN4
	ZZ2ZFQH9htZXrLRzGEQuqLwtvIo3RLoQwKY5jidCtq3oJHQXSoCnLwcKO7a84+q5sOluCZU
	gGVP0suIWmPxl7LcYS3QzH77jfPliPGra5PYoIk0j/KSulZfJbnJH0n0UPfrw+TiGKhuPD/
	m3hQvRIQFHeXBqpFJ4jiQBZ0busXMYvmUqqvNH2SQxcls8wUoL0VyKAPxotrtdVaZpN93PE
	1K/oaG01mIf0PaAsL5z+GrlLZU9esE7QJoLzLac+0dMe+NY8dv/c32rRJfa2eg352Ko7Vob
	4Oa5ilANzMf8eR8iF6jR0KedrWpnQectIIaE4FHiqVUv3ZM/1d0f982Ko0DmSyYbVw1ArOQ
	w==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Synchronize the declaration of ds1287_set_base_clock() between
cevt-ds1287.c and ds1287.h.

Fix follow error with gcc-14 when -Werror:

arch/mips/kernel/cevt-ds1287.c:21:5: error: conflicting types for ‘ds1287_set_base_clock’; have ‘int(unsigned int)’
   21 | int ds1287_set_base_clock(unsigned int hz)
      |     ^~~~~~~~~~~~~~~~~~~~~
In file included from arch/mips/kernel/cevt-ds1287.c:13:
./arch/mips/include/asm/ds1287.h:11:13: note: previous declaration of ‘ds1287_set_base_clock’ with type ‘void(unsigned int)’
   11 | extern void ds1287_set_base_clock(unsigned int clock);
      |             ^~~~~~~~~~~~~~~~~~~~~
make[7]: *** [scripts/Makefile.build:207: arch/mips/kernel/cevt-ds1287.o] Error 1
make[6]: *** [scripts/Makefile.build:465: arch/mips/kernel] Error 2
make[6]: *** Waiting for unfinished jobs....

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/include/asm/ds1287.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/ds1287.h b/arch/mips/include/asm/ds1287.h
index 46cfb01f9a14..51cb61fd4c03 100644
--- a/arch/mips/include/asm/ds1287.h
+++ b/arch/mips/include/asm/ds1287.h
@@ -8,7 +8,7 @@
 #define __ASM_DS1287_H
 
 extern int ds1287_timer_state(void);
-extern void ds1287_set_base_clock(unsigned int clock);
+extern int ds1287_set_base_clock(unsigned int hz);
 extern int ds1287_clockevent_init(int irq);
 
 #endif
-- 
2.47.2


