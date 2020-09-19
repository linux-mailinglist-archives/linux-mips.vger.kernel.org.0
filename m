Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A037E270987
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 02:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgISAwH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 20:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgISAwH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Sep 2020 20:52:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0CCC0613CE;
        Fri, 18 Sep 2020 17:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Bdi+Xp/Uz5SX5F6bKzX/LNWrKxgSRH5Rf2H0YRsSQc0=; b=BG66IDlEWbX95+cObFyAdcEZ6o
        D99VCZK1VtNAYoSvABcVaiK5glmgseErndVLl+yO2IOFRGqpIAGjhAQx/JMonfC4EXWBGkpvPbodz
        LwfEwnRtcq0snbYdu2J4ftLEdMcg+r+0wIp0GdDUDVKduqyaSS8gbN8J0P3R9oWP5Uk9V0oxgvPQW
        vTRG0cf927OZCzIumnA0+FaQd2YPU1b1B86k/bV+33ZCFaMDm28LIwZBKo+BEIQQ225xR4p3DikP/
        br3c7LI4cU18eMI2a3A4/a4jbFcQSRjnZPHADQnLghKirP655MvVmbaM8+X587AHCRVI0ivLXAPKv
        13O2zI4Q==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJR6i-00049c-Tk; Sat, 19 Sep 2020 00:52:05 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: kernel-parameters: fix formatting of MIPS
 "machtype"
Message-ID: <c9059e35-188d-a749-1907-767b53479328@infradead.org>
Date:   Fri, 18 Sep 2020 17:52:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

For the "machtype" boot parameter,
fix word spacing, line wrap, and plural of "laptops".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200917.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20200917/Documentation/admin-guide/kernel-parameters.txt
@@ -2596,8 +2596,8 @@
 			(machvec) in a generic kernel.
 			Example: machvec=hpzx1
 
-	machtype=	[Loongson] Share the same kernel image file between different
-			 yeeloong laptop.
+	machtype=	[Loongson] Share the same kernel image file between
+			different yeeloong laptops.
 			Example: machtype=lemote-yeeloong-2f-7inch
 
 	max_addr=nn[KMG]	[KNL,BOOT,ia64] All physical memory greater

