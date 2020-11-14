Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F9D2B2D4D
	for <lists+linux-mips@lfdr.de>; Sat, 14 Nov 2020 14:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgKNNQn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Nov 2020 08:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgKNNQm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Nov 2020 08:16:42 -0500
X-Greylist: delayed 425 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 14 Nov 2020 05:16:42 PST
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C105DC0613D1;
        Sat, 14 Nov 2020 05:16:42 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 1BFA61F404;
        Sat, 14 Nov 2020 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1605359375; bh=48MZkhW0cgb7AuzN4qPK/sAR81gK90gTB56HgfUhoG4=;
        h=From:To:Cc:Subject:Date:From;
        b=gqI1UhkLu2YSMkUptHVtY5dcjvgC0xQpX5AlJk50sn3gnjEmgT33rMYaDi6xuviw2
         hiQotocyuIpqMDMQ9FN3IqnWZ5Jkf97lGG2ovlYrp2Zjs5ADVp+LzReHfjrFZ4w4Ub
         MRKhCW0npJ0JfskkbG3b0nv1rgMEKIVGM05m70SbivaNwwMVMBjcQaeApQPl/6dImk
         fEHB/IxD1cmVvGr9zrlRcDZNihHEpeVtVVMZtvtN2TB1V6xsgB/Vdm9GU52Tt9jS4F
         pOXpllMK0ncHyzlrHWm4YvJ5v0weaUOG5LPJLdIEYZJiVmRHjlElCmu0lCsWOgUqV4
         fHrfJyyZ9Db/Q==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhc@lemote.com,
        gregkh@linuxfoundation.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 0/2] Preserve goldfish rtc
Date:   Sat, 14 Nov 2020 21:09:19 +0800
Message-Id: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Link: https://lore.kernel.org/lkml/X6+wGMUCCpu2liYR@kroah.com/

Cc: chenhc@lemote.com
Cc: gregkh@linuxfoundation.org

Jiaxun Yang (2):
  rtc: goldfish: Remove GOLDFISH dependency
  MAINTAINERS: Set myself as Goldfish RTC maintainer

 MAINTAINERS         | 2 +-
 drivers/rtc/Kconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.29.2

