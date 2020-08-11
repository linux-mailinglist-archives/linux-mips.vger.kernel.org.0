Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7129E241CDD
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 17:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgHKPBq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 11:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgHKPB1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 11:01:27 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592C7C061788;
        Tue, 11 Aug 2020 08:01:27 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so3168449wma.2;
        Tue, 11 Aug 2020 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/PamCJTJWS9McL3YMw+k49gmnnx82kmNjt/V1IJPP/I=;
        b=oYmEnwpIQfNzxBaW7xyHlYGZ7gBxIlmi7VVyyEY9i+tNIV1xQSkmcPcaNt7ExW8gDT
         9vDMuoZUE7maoFTnSoXHDOirn4ztEaKTVHNBozUX8qm+swQHSEH1rX/JXuDDZJCfy/pb
         TuyjB1LV3W0FuvpXiXYZbRR0wkgNMfWGdyNZQdEyyKPOQUB34I+QYtawzU5+71YLfjAy
         wvw039t3mNJ1aglJS8/da2lyCVRmgHf7RZQMprMrXIBxuNO0z6J4gjBeOOhvmQwke5TH
         Yby0cOubgbbPViPvN4v1zwOdWIT745QAmxo8/n9i3SJb4IRv6B0pqCsa0wmGd9K4nbW1
         q15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/PamCJTJWS9McL3YMw+k49gmnnx82kmNjt/V1IJPP/I=;
        b=f/8y/F3oNRMSDm9amIlM2aQs9WskoLkm4G9VaPJFob89bKrBsrXDjOy518fWCZyOtH
         LqInaMK99pfeContxs6hL5Ijqagiq0QaXVlPFvOY2do5C8vrfeqciflMqXcx5KZ+HOGv
         W8l3AEmMikyGdy8V63uPVXYrxHa21vN7+88mCS9YUo3+LQBXZdiKzQ1cyjc4Qf/Uygvj
         E1ZX5ynXNh4S/pFWoHhPUT/A6jKHwayj0fLO3rvcjTNb7AAxzcmq2wkkNIJculaq7NaR
         MwOVQq+zgZRbyvK757zeZJvTLCXIC8YpOisIxVwG1fiawEk7u17uy4UABl2SdHXBneCh
         55Hg==
X-Gm-Message-State: AOAM532pwGaSmJHgSNoTcBNNMx4zfoJAGJCQ9+60tn0dJV9dR02m5/5D
        Z8f7YXoj6eR2uLmVweilnsE=
X-Google-Smtp-Source: ABdhPJyB6mUBDCgmoeQDB4nnf4wlqRwmDF87BAw3MEbpoX0X0eFFZ3M+TFnnTF51izQ+sNRlvQn2Uw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr4556815wmj.174.1597158085803;
        Tue, 11 Aug 2020 08:01:25 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 15sm5350494wmo.33.2020.08.11.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 08:01:25 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 2/4] MIPS: BCM63xx: remove EHCI from BCM6348 boards
Date:   Tue, 11 Aug 2020 17:01:15 +0200
Message-Id: <20200811150117.254620-3-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811150117.254620-1-noltari@gmail.com>
References: <20200811150117.254620-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There's no EHCI controller on BCM6348.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: no changes.
 v2: no changes.

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
2.28.0

