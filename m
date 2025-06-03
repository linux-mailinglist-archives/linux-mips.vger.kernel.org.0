Return-Path: <linux-mips+bounces-9155-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD40ACC00D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 08:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907FB3A061B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 06:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3B5146A66;
	Tue,  3 Jun 2025 06:12:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EA8494;
	Tue,  3 Jun 2025 06:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748931153; cv=none; b=OeMiI7C0iDyDZRHMRG0pkNrnFVqQJMO2fFiXa+ujjkuqYPhVMCJHd9ce8wxjIGUClxP/deG922/Y64SEJNMXmMbCzpTpLYTAwNyYDcWY8amxZPHHmPeQ0oYcvvBBSrTOAzsx/PudSp6Qi2HWlLm5u9C6p1v/lnJ37XOgTjGqk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748931153; c=relaxed/simple;
	bh=BLBicKxUdfy3A8BLWdtrjmCmWquuwY3rJHu/dkcCUfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WUKODcO/5bNSUTWqJKaqeGHyLBx5nsfh5Yz8vezzdxPA8PRaFqp76ebnL/SD1iUHyK6kKU0xFYY3vGj9Jij9yYUvwmrz8Ttcggxl5u9OzvXp/Vfa0wtSOmSe+1CpxZcLubA8vi67dQlj1x8oYwYuTTNXDmzmpb3xzNE+Gl7WJ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADXhtXpkD5oBobTAg--.17728S2;
	Tue, 03 Jun 2025 14:06:33 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: cjd@cjdns.fr,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clocksource/timer-econet-en751221: Convert comma to semicolon
Date: Tue,  3 Jun 2025 14:04:50 +0800
Message-Id: <20250603060450.1310204-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXhtXpkD5oBobTAg--.17728S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4rCw4kuw4kuw1xGrW3ZFb_yoWDCFc_Kr
	n2qrnrCrn0yr90gw4Duw17Za9akF1vqw1Fqrn2qasxAa4UAF1qkr4DZr1293s8u3y0yF98
	C3y7GFW5Zw13WjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfU1l1vDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clocksource/timer-econet-en751221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 3b449fdaafee..4008076b1a21 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -146,7 +146,7 @@ static int __init cevt_init(struct device_node *np)
 	for_each_possible_cpu(i) {
 		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
 
-		cd->rating		= 310,
+		cd->rating		= 310;
 		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
 					  CLOCK_EVT_FEAT_C3STOP |
 					  CLOCK_EVT_FEAT_PERCPU;
-- 
2.25.1


