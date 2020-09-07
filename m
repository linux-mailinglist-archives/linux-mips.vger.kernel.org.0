Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1458125F73A
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 12:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgIGKGP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Sep 2020 06:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgIGKGO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Sep 2020 06:06:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B79C061573
        for <linux-mips@vger.kernel.org>; Mon,  7 Sep 2020 03:06:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so448799pff.6
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2020 03:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=G5IfRmqPuMpaOCcxbL+BlkKGKTuCTWSjkTLclXpS/yY=;
        b=Kr5iNZy0vJn+Fttk/bFRpg7KbOBb6Fh9mExVyVsgDW22od4ehfvfFH48Rwh+rWHzYJ
         LxYg89pc91LPaf4Pv7c9yVo7fNECPVOwFMQrKr3ge+VvWB5R+D4bz5XdZOIisgdzw8fm
         P6y5A6Fr3IYtoq/s/x2mLn2/LkSgMvbOWR+aNceRNWceteeU7nCIefPCIBAHM7q02MrJ
         92DjkS235WAzjZNRVvRfYmwGLvWwrB53+nV9C0RGG0dZeLHmdZfvotP54pGrZB04b8sD
         Bd0ET063nw7uand61Y7iQUgc9cM2QRY4/TYh90BvLUA6JXSWcG0TWzRMMyU2AFl6OpkT
         uGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=G5IfRmqPuMpaOCcxbL+BlkKGKTuCTWSjkTLclXpS/yY=;
        b=E6CxkM5AEf4YzmGzNBu7yP0YhX5n5VmN30By30146WKFVlwZq9NgKEUzwlCwUofs4L
         NRh6aJMKyWL28LAeWyJYvvirJiOGB1zrt9Kff+OH0o3K3D55SxUVMa77cmdYTH8mufGz
         vpElGkNlgp4E924NVSBF7rXHiqEl77DJgTl93FwSGIDdcA+hM4ghJqmm6/sZnlkpt9Ck
         PJSptfpN2FmkDirRNCOhmhmL/Rmbd+psSIiVLDQKEVd6U5IIFS2jwDn/C55u6ekgUpdZ
         jhtPp3YjMkb8Z5DQQeyO2NUG8WznTWHbCqX2fZtHtllOvDUuWdjEIVGJ8RL+DN8NS9Jd
         RMkg==
X-Gm-Message-State: AOAM532qZ1UWhNnH68wJdm+ACtO/aJGLxKvWlWq5KpqaQ8k2E1sjRmpW
        7KM45jViQTl6iY4ho6LwYdk=
X-Google-Smtp-Source: ABdhPJw7/Bc0B4xFnULR7ZChe9F+72gza0akhwYTRoTforUjh6vz8uenu9xFTUwv1nRD/WKUKaGqIg==
X-Received: by 2002:aa7:998a:: with SMTP id k10mr1512275pfh.151.1599473173057;
        Mon, 07 Sep 2020 03:06:13 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 64sm7992238pgi.90.2020.09.07.03.06.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:06:12 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V6 1/3] MIPS: context switch: Use save/restore instead of set/clear for Status.CU2
Date:   Mon,  7 Sep 2020 18:06:07 +0800
Message-Id: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some processors (such as Loongson-3) need to enable CU2 in kernel mode,
current set/clear method will lose Status.CU2 during context switching,
so use save/restore method instead.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/switch_to.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index 0b0a93b..a4374b4 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -117,6 +117,8 @@ do {									\
 		__restore_dsp(next);					\
 	}								\
 	if (cop2_present) {						\
+		u32 status = read_c0_status();				\
+									\
 		set_c0_status(ST0_CU2);					\
 		if ((KSTK_STATUS(prev) & ST0_CU2)) {			\
 			if (cop2_lazy_restore)				\
@@ -127,7 +129,7 @@ do {									\
 		    !cop2_lazy_restore) {				\
 			cop2_restore(next);				\
 		}							\
-		clear_c0_status(ST0_CU2);				\
+		write_c0_status(status);				\
 	}								\
 	__clear_r5_hw_ll_bit();						\
 	__clear_software_ll_bit();					\
-- 
2.7.0

