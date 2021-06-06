Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E2839D06A
	for <lists+linux-mips@lfdr.de>; Sun,  6 Jun 2021 20:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhFFSYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Jun 2021 14:24:01 -0400
Received: from mx3.wp.pl ([212.77.101.9]:46965 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbhFFSYA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Jun 2021 14:24:00 -0400
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Sun, 06 Jun 2021 14:23:59 EDT
Received: (wp-smtpd smtp.wp.pl 22137 invoked from network); 6 Jun 2021 20:15:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1623003327; bh=xsQ8aFTPuFeLl/EzuepZ3LgCC1DxOmEQ2Cs92/MgceU=;
          h=From:To:Cc:Subject;
          b=UObVZBtSykWqY04aiUaUT8/rpM5l3UVA0v868G8RS2RApXZYQnrS2Jf4gTVvmEkXe
           YVFNuG6qu5xc3Kygo2phVV2aInGgxxajF9Ixybd5YS9qUIE/DeaNvThsgQI1g7LtGe
           tqZru/M/Bfz4/PhynFgW9hHKRfuTefcoGuUgcYuc=
Received: from riviera.nat.ds.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 6 Jun 2021 20:15:27 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     tsbogend@alpha.franken.de, olek2@wp.pl, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <A.Bajkowski@stud.elka.pw.edu.pl>
Subject: [RFC PATCH 0/1] MIPS: smp-mt: enable all hardware interrupts on second VPE
Date:   Sun,  6 Jun 2021 20:15:24 +0200
Message-Id: <20210606181525.761333-1-olek2@wp.pl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 35539085eedb8fb54c7457c58164985f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [UZN0]                               
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Aleksander Jan Bajkowski <A.Bajkowski@stud.elka.pw.edu.pl>

This patch is marked as RFC because I'm not sure if it's a good place
to put this code.

This patch is needed to handle interrupts by the second VPE on Lantiq.
It seems the Lantiq SoC is using all the hardware interrupt lines.
Currently changing smp_affinity to the second VPE hangs interrupts.

Tested on lantiq xRX200 and xRX330 (MIPS 34Kc core).

Aleksander Jan Bajkowski (1):
  MIPS: smp-mt: enable all hardware interrupts on second VPE

 arch/mips/kernel/smp-mt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.30.2

