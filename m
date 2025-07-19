Return-Path: <linux-mips+bounces-9863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C1FB0AF8D
	for <lists+linux-mips@lfdr.de>; Sat, 19 Jul 2025 13:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A41B4E834F
	for <lists+linux-mips@lfdr.de>; Sat, 19 Jul 2025 11:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FE8237163;
	Sat, 19 Jul 2025 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="K+UoZQOX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8121770A
	for <linux-mips@vger.kernel.org>; Sat, 19 Jul 2025 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752923696; cv=none; b=Mq2/ecxG7hzEBNH5g/sqv/EmiwtpD9avWS5ahudhfABSY6C7UdxDul21UGjCfAtjoIH2j+Y2Rg93Cc8pvu8xl7GbIgk/n5TZBzdV4ly3aQnE6gkdOjXAzMSQIEc9ansdMSbHGLcrKSsXtMhlY2rDP4duIR+NYAxx6A4MhNUNP6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752923696; c=relaxed/simple;
	bh=+0kK/Y15aF1bpxFAxKzHM/pKrf3ofsKUM/hU9dOfhbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMVPi8iLNnEvzh8i0OXL/e6KuNDWHmqijhhhMd0AcR3RtmcRQQTd2vExB2i5rvzZ0iLzOigrYmPz23Tmv6XfSC+tNYwZcRAYYproSe7kFHmFPaXhiLK6IKlzkdy6yu81f8zLpYyGJmxA+CFIdekoZ3JGm/vlHgZNY7qspnhEALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=K+UoZQOX; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 74012104C1F3
	for <linux-mips@vger.kernel.org>; Sat, 19 Jul 2025 16:44:38 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 74012104C1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1752923678; bh=+0kK/Y15aF1bpxFAxKzHM/pKrf3ofsKUM/hU9dOfhbo=;
	h=Date:From:To:Cc:Subject:From;
	b=K+UoZQOX3D6eH1OVq4E+TiIhdmB3havFN6P0wdgt239niSqV5a36XhpLCMzVdLpiw
	 7HUsRlJnfIJ1nn6FpSypYYC32sZnBkbcVOOfMUU6mUsxKCS4CC2I+rMApznQcB495v
	 b5DFUGiZyXq92yPX0aTwEyi4xB0gfeytvTEmTdHg=
Received: (qmail 27692 invoked by uid 510); 19 Jul 2025 16:44:38 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.975814 secs; 19 Jul 2025 16:44:38 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 19 Jul 2025 16:44:34 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id E50AB3414FB;
	Sat, 19 Jul 2025 16:44:33 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id BFD481E81340;
	Sat, 19 Jul 2025 16:44:33 +0530 (IST)
Date: Sat, 19 Jul 2025 16:44:27 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: zajec5@gmail.com
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	tsbogend@alpha.franken.de, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] drivers: firmware: bcm47xx_sprom: fix spelling
Message-ID: <aHt+Ey5AQ0dsCuB4@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix spelling in bcm47xx_sprom.c as follows,
specififc --> specific

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/firmware/broadcom/bcm47xx_sprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_sprom.c b/drivers/firmware/broadcom/bcm47xx_sprom.c
index 14fbcd11657c..fdcd3a07abcd 100644
--- a/drivers/firmware/broadcom/bcm47xx_sprom.c
+++ b/drivers/firmware/broadcom/bcm47xx_sprom.c
@@ -404,7 +404,7 @@ static void bcm47xx_sprom_fill_auto(struct ssb_sprom *sprom,
 	ENTRY(0x00000700, u8, pre, "noiselvl5gua1", noiselvl5gua[1], 0, fb);
 	ENTRY(0x00000700, u8, pre, "noiselvl5gua2", noiselvl5gua[2], 0, fb);
 }
-#undef ENTRY /* It's specififc, uses local variable, don't use it (again). */
+#undef ENTRY /* It's specific, uses local variable, don't use it (again). */
 
 static void bcm47xx_fill_sprom_path_r4589(struct ssb_sprom *sprom,
 					  const char *prefix, bool fallback)
-- 
2.34.1


