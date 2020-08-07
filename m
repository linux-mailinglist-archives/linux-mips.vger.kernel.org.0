Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC6923EA8B
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 11:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgHGJii (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 05:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgHGJib (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 05:38:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9E9C061575;
        Fri,  7 Aug 2020 02:38:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g8so1150447wmk.3;
        Fri, 07 Aug 2020 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvHBHIoB+ScAAg9yLcMcG6JzuWnjVuFMmIuss4QEkjg=;
        b=U2Q3dsLvieopkx9+Xxa0EghfS5n/PZAnRG+pjymuvrr1FZTFQKFtkHw/LpGqMXqeo+
         fEr7arsocl3G2Oe0IPOKX36l2FxxYc25AodnIKkevNQB9ph2U2tPHo+Q72G9G2XB4jNj
         jVJ+V7rAv52qgSi0Y6fxgKNhX1h+hC6tAeo7w4B9dvTMYekxxgtZ+r/MOqSp6kK8zd1D
         cT1JXI3rBcqcFoUoyQuAaw/X1INTW48psy2+YWAfiY2Wij9HRjymls4LVMZaOS16xycs
         NeYXqqH+4JEvi7OuOZmT9+Sy6+QoVvdfiVZct0xGxXQyo1tJL+fGxB+n6k4L7ZzikHH3
         oxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvHBHIoB+ScAAg9yLcMcG6JzuWnjVuFMmIuss4QEkjg=;
        b=WlOrxz0rO3EYniy/WdXh4bW4VyAS0WuskoRAnHqA3vTbWDnK2/Et9PAFTYO3Df8s2c
         Ka8uo1mPyhu/RrONi8KkEK1Ae2oIBb0w4onIa73SMgE0+QUFjrgxhN5nl2FA8XlK9BnL
         kLXlf6sJvUlIq+gunck4Xvgl4ZniqcCChv6AjgEFglYVMTEYH4MsPkvE2Ni7P8ekL42G
         7DQinKHTKZsiU8uGOVNp/P2Muck+nf3DUYNwLzZRaa93GsNqcMi1BJm/bBXlcYUtwnyu
         dCeG6o+i3ZEJNJzNxkoVIxcvVYnOvsmPMBT6j9sGhr+ZISIhF8DHboT5VHRSVF/sCT+k
         gd9w==
X-Gm-Message-State: AOAM533o+0XUSiz6emc6EFw9PA2vGQxvdVGC+Fo3xkQwUitJJqah/oox
        rLSkvguRBuLiTnA+e43DC6zxrGuB
X-Google-Smtp-Source: ABdhPJxBnb4MAzk5PImU+oJ32uf8yejYmTkE5G8u+bnrXBY9JbHcGjllTmSDfplANaszrDCay9WjMg==
X-Received: by 2002:a1c:4e0d:: with SMTP id g13mr11879540wmh.177.1596793109572;
        Fri, 07 Aug 2020 02:38:29 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id q19sm9460529wrf.48.2020.08.07.02.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 02:38:28 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/4] MIPS: BCM63xx: remove EHCI from BCM6348 boards
Date:   Fri,  7 Aug 2020 11:38:23 +0200
Message-Id: <20200807093825.2902474-3-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807093825.2902474-1-noltari@gmail.com>
References: <20200807093825.2902474-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There's no EHCI controller on BCM6348.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 744aa16bab12..45f1bc437245 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -285,7 +285,6 @@ static struct board_info __initdata board_96348gw_10 = {
 
 	.has_ohci0			= 1,
 	.has_pccard			= 1,
-	.has_ehci0			= 1,
 
 	.leds = {
 		{
@@ -338,7 +337,6 @@ static struct board_info __initdata board_96348gw_11 = {
 
 	.has_ohci0 = 1,
 	.has_pccard = 1,
-	.has_ehci0 = 1,
 
 	.leds = {
 		{
@@ -441,7 +439,6 @@ static struct board_info __initdata board_FAST2404 = {
 
 	.has_ohci0			= 1,
 	.has_pccard			= 1,
-	.has_ehci0			= 1,
 };
 
 static struct board_info __initdata board_rta1025w_16 = {
-- 
2.27.0

