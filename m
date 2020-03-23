Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E9018F01A
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 08:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgCWHHQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Mar 2020 03:07:16 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54597 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbgCWHHQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Mar 2020 03:07:16 -0400
Received: by mail-wm1-f65.google.com with SMTP id c81so2936914wmd.4
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2020 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6+H3L1N6B9JwGgT4kGhTvyXOoPuS69y5RAhMF6/3IAY=;
        b=Tl6H29o84KzodraSj/8Lu6j8G6gU1mywLmC42YDgg7lakLlWht51bOWK5K+Bxjuj1E
         /hTufsQ9PX041U6vgoUdezqK+vKU26qDC3PYidkJBfxoCQt8PgmTyrqMS2us6BLLRr12
         QP4D03g3s1ajzwNoPYVwIlW1x3fApRy4/4aDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6+H3L1N6B9JwGgT4kGhTvyXOoPuS69y5RAhMF6/3IAY=;
        b=OQZnLnifqONlhDiueJs2M1PiZ18gcZ1riF4hPx0e3lLT9Z1jP5yMiIoFHJMoBzYmjx
         OEOsO92DgJKL/Gju6V703YgpAybcjc6+u/rnzyRHkl9X46KzMWxowkyKr3rqvMt3s88z
         vyrc/S6KXmcIYm7oLA79MFHZHZym/0SvUt3G6kCzr3uP464TyPmMRQUH7WitwMjhr1AU
         fM4sONjDp6G3cWngTXvJkz1UpazaMacrefLLLfaG+FgV+8ZdwtFBQxoNVe55zwqF/eW1
         7UaJWoX6PaKb3OdAItZ/s8xr0X/Zi0VY8vNOzSehg1mT/sq95ssY+8qhV0KOcUONG6+h
         8wGg==
X-Gm-Message-State: ANhLgQ3Avc5PHWLjO9obOO3JhrgNJk0U7fYjY/IkQZ7er6jd417P7Ycr
        gJmEb6Kpsl6Pj03e8DPcYngZHglU/C8=
X-Google-Smtp-Source: ADFU+vsSfC3Hj17Pt53rFgFvGSwfbnAEXfthhJMgt21/X54FlXdpmHewhUklckSBnoNd8YyT/0vtvA==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr11287399wmi.169.1584947233631;
        Mon, 23 Mar 2020 00:07:13 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id n1sm22144380wrj.77.2020.03.23.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 00:07:13 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v2 1/1] firmware: tee_bnxt: remove unused variable assignment
Date:   Mon, 23 Mar 2020 12:37:01 +0530
Message-Id: <20200323070701.17078-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused variable assignment.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
Changes from v1:
-Address code review comments from Sergei Shtylyov,
 correct the commit message and subject line.

 drivers/firmware/broadcom/tee_bnxt_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index ed10da5313e8..6fd62657e35f 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -143,8 +143,6 @@ int tee_bnxt_copy_coredump(void *buf, u32 offset, u32 size)
 	prepare_args(TA_CMD_BNXT_COPY_COREDUMP, &arg, param);
 
 	while (rbytes)  {
-		nbytes = rbytes;
-
 		nbytes = min_t(u32, rbytes, param[0].u.memref.size);
 
 		/* Fill additional invoke cmd params */
-- 
2.17.1

