Return-Path: <linux-mips+bounces-8687-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E323EA96430
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 11:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9331628E8
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977521F3B98;
	Tue, 22 Apr 2025 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WR1PNINK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3061F2382;
	Tue, 22 Apr 2025 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313933; cv=none; b=OEX6TqK6F/WbvBi0DIVbleXwz1hQAGrHrHTNX7bmEZx1kol0Jx5JbVt8kmdZaXOaN76wOuWMDwVG7UcvdM2Svgu/OiodAwlfRjM59ebCFHhXJZLt/PgCmdoHecPHQ9c50rfmBfTMpUrr/2e3PsQXW7t5P6/60kfyxguzjpit3ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313933; c=relaxed/simple;
	bh=5HXOfChdntgYLWeKK+lob+HMvx+eoXiews4WXrPNji0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uzi/+pxKzhMlxUMePJDIVEWYsZZlXHEmff7c46ufxllbQfnECKInJO181cAVionXpBP60kq3kK30E8DCPoiC7fFBYOZPe3gzWvu4BgywW2PQGvEWFXLkX3Pe8VAA43Q4tVHmZ6Q92w3jqp2L4neGAR34jGi2QoHdPe3PxKbqcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WR1PNINK; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745313878;
	bh=OGDnSMArk/WrjO2UTNNnGOJJKTaitd2ENOoLaZYFrmo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WR1PNINKFJ7G0lQVO2eczeXOsij7wKAbOWPlTPRpXzZA7PASGsGD04g0aTwJ0HEII
	 9aAKzQP+iI6Z8wEkATXkXLBKJqrVTEV53lAj3PhicUPQtdixyW3hMsx5yw1pg+RhwL
	 T5DQ8g6Fwlkz+lvCyBKJe05SpaVNE80AXYYC5xJ4=
X-QQ-mid: zesmtpip4t1745313861t42375df0
X-QQ-Originating-IP: rbmCeOYn6fTV13+abiw/rrLT1iX6vvePKYuombisU2k=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 17:24:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4302771691292400825
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
Subject: [PATCH 5.4+] MIPS: ds1287: Match ds1287_set_base_clock() function types
Date: Tue, 22 Apr 2025 17:24:15 +0800
Message-ID: <418FF04C2B5B986B+20250422092415.120647-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: Oah+0YjUCNSuh5RbwCP+5zcKnQdodoC5VcXnY5+8dpcUpUOEiDuLG1HS
	Yv5+aZ7PCsUhuqpyKa7lL1VoHpjDX9KQar9ddnI3b3tDM+VDMnhc4SknWGmfyysswLw6/5L
	9ExNFJANE2bOkI5gzS8AUjZmBqjgR2HsG7u8d2bkcWHAyRcFCUVJJaOd2ETEqmx+nfqSFYB
	g86fOddrLdpYQ6OURCSsao31VhsdrxygvynxtkA8kS6KH2wl0BAkV56Z8xOYQ3urp1iYAwB
	wpysMVzja6Mlp7aWuM3tvc0liKG5GT5pBW58sRJL9LoGBGs8PNvCl3/UN9KTG3VKwOgoFXP
	rRstCpBXEYprCzfGmL6MRMIqQt7p3X19YqL7/4D7ZwFfJP/JYz6mSjvgJDhuo2Atq6oy4Zh
	jmWsyo4KFavo9pbI4DtZ/UlOr/EfCPMS0gxELj0Gz7aavsROG1PJHh13QW1ggrgBk7qrFVQ
	Hp73ppOJgwJlQ8f8DAJfyDnC3tmSBvA3sDfgykv24q2P34lgLkOtvMRU5mAGcWafFdxM/Ht
	L/Q5ns9PzcWiuksOEJhVSsQ68zwenRmtkAxcXhMpw9G0vFMOrGKBxaTPRWv2+KzEcu33B2B
	DsQZJG9zSk4Cq6kUGuFbIxT+4Mv9brYc1Yw2304UpspVVPwMoVyjX58/+OExarANpRMXOHY
	2Idjx5GzjgBZZomsO1cZizJmWXbLdqBqoTgW6fpC6C66t65gDcBLx6FRGNm3wSueSSrZ/XR
	npmE1HxmLyUOUISthvZ4OFun53gUavW/A+XhmBggBxZrtbXEn6PMk56dRTzdaHnMUmcZDhe
	+XKeLo3v8N5gNQZYwIUI3higNRvc6yS1WVrcNUwamhRl8tCWGEFNYeEslyetXWbdwZTqmrR
	3eW0zYb0ULcY09JpQmCaN7zuVeR5yu29A7amzI74cqMiTbj8IsLmsGyF0iGfOI+scgIdBgL
	g2bG6HCu7iVt1aWim//K1s1WkAG3Rl0WzGlKGs39vpElqIR0GQsFlGSqYOqA25eIBUhHzHW
	Bh/ACwiYtUULB+4xTr/Os771X+Unu8NrDveeDVkkDJVOJgc3m4B65W7HQHRQmD3NsHN2/qz
	wY45oLl+G49t/hU/ZMuyJM=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

[ Upstream commit a759109b234385b74d2f5f4c86b5f59b3201ec12 ]

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
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
2.49.0


