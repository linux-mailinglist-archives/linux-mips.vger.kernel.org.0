Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9FB18785D
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2020 05:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgCQEH6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Mar 2020 00:07:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33837 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgCQEH6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Mar 2020 00:07:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id x3so14724354wmj.1
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2020 21:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=33jKlqaYa25AsU3VntdMH3umyT6AHcOYuqn7A0K1VBU=;
        b=XULrSr+Wd/YnDJMybcFNeMh5Gg9yENwZPEIlhwbKwlq5vSDVqgNcTVtYq0bNvx3yBy
         pVODbjuuneMTk+XfxXjAJv6lp2w8hCBIk4m+O1KppoeGvDnSGsefYVfgc2O3bUYKVbZo
         S+fqFBkxEjoOniy7neehOXUGxd6n9fOb0Wodk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=33jKlqaYa25AsU3VntdMH3umyT6AHcOYuqn7A0K1VBU=;
        b=RmklOoHnavUqPFfNxltJ0S2ZxzQVp/Pgq44gz8zK5uhNhIKNyk6qocPNwIKa5VjSGM
         b0IYeJFQkgziZ3TWEmMS3Ad/SxDJTuooOZz3cETEBKikJUXCSnsyV1u3xaAYCxtGQeWc
         8AVvDp27NbhpEmsb4h2vSfQdGUHAdRdBD9wxmzmUlyBPnVPVM1rxvIyg6l3SScxfih9L
         dYaPr7Y519L0iQDSd9jWqYDX3rJisjLIaFMjb8fbCgV3cL1FvtM4chUbrOsrBZKIrNHv
         XIAyS9dRDfZGHf+Z+i0xN09o/+8o0XnRj0xVoxF5E8tsfdwRm8XRJjzF2EfaTu2+lujS
         PmIg==
X-Gm-Message-State: ANhLgQ18CAauY0FMQuYAQ4/VgwGUBYpRaWBqSmOYQTC3HakqmIX1vXaU
        3o7w7XRPQAQ2wW4eYz0FtvdB1g==
X-Google-Smtp-Source: ADFU+vvv6IHi1oLKWK4ZaJ7buqvEU1QsVEHlTLtwhB2/6w/qOCyZlOM6mC2HvWEVzlS0SrRovdZ1xA==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr2656158wma.122.1584418075697;
        Mon, 16 Mar 2020 21:07:55 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id z4sm2811766wrr.6.2020.03.16.21.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 21:07:54 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v1 1/1] firmware: tee_bnxt: remove unused variable init
Date:   Tue, 17 Mar 2020 09:37:42 +0530
Message-Id: <20200317040742.12143-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused variable initialization.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
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

