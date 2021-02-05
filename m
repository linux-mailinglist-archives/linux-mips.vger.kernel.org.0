Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B30310AF1
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 13:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBEMMw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Feb 2021 07:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhBEMKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Feb 2021 07:10:38 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB12CC0613D6;
        Fri,  5 Feb 2021 04:09:57 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id e15so4741154qte.9;
        Fri, 05 Feb 2021 04:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AKJJb9hFR8meN+MzNeGJsFocuDXG3mrmwna70luXyQY=;
        b=HiOlzhGDI4qqOaO9gSNkedo+mJbjBo2C7lH3S4Y/+uZ9+TXDBJeBVQ0edMEdTZbYtc
         44OtT4g0+66qMmHIK1K7f+vqQ2RrZo++GomTA6uehCsA+TDeOf1h/366fctYCYUVJX7p
         IybfLq+rkFfvgStqckKR2973C1Fulm79HAlFPSjDUOM+e3uehg83Yn8wE0IELlvmDtlP
         eq9PGqjxJLrkBvBIrXeh/K0ayXxJgq0TT12DOPJRNPlQlsXX7sAP/m+KG4G4j08tVu6o
         nef/Er3mUarYBTj+23zBcUMD/bafDZpVJq01zU5HQgI1IW7MkuJ9uzvUqANTNw/Dd8w5
         b3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AKJJb9hFR8meN+MzNeGJsFocuDXG3mrmwna70luXyQY=;
        b=ajnddP1hHZcpbmvFM+AoULvS52kzCPeP5him7WBgPB5IPIJnBVApn6qzo82P47UyxK
         sho96sr+1odjgFGEK7MbNSlAhgosWVNUAnWBWVBCJP3i80Y+n2DrFMBHjouwt/+Yljtz
         YrJKxVRNV6e2dmA3ZEzcL/k/b/cPKGWezMQKx7BHGKD/dWE3r50QFbPyTHYRdYRtXJSP
         BDplZ7htofaKAQ8TFFN1TBDGkTe5B9afVyH6DnCDftg00S+rTWz+rKsDj/Bg8tRa1Lp4
         Gsb1RIUb01qwhIsMfsPn0/ojB2PIa4iwnDdlTzGyzj4n0IbMCiO+CSV1zk/M87MYyRMm
         ApMg==
X-Gm-Message-State: AOAM5302/niueBglI85uoT7Tk+LvYMFk87cXMKkIGhBSflFf8nOgQKKH
        IV3hJolWWPgx/JpqphfL2MY=
X-Google-Smtp-Source: ABdhPJx/xPTw6Vs5bNE8UzXPYEK9fzcsuEzQXt3Sf8xwr5XkVk2lTfxcYEMwdHCpiIbm/CqxsMMI+Q==
X-Received: by 2002:ac8:110d:: with SMTP id c13mr3709053qtj.361.1612526997044;
        Fri, 05 Feb 2021 04:09:57 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.106])
        by smtp.gmail.com with ESMTPSA id 133sm8897456qkg.38.2021.02.05.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:09:56 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] arch: mips: sgi-ip22: Change the sentences with better word in the file ip22-setup.c
Date:   Fri,  5 Feb 2021 17:39:45 +0530
Message-Id: <20210205120945.1301719-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



s/fucking/"doing anything"/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/mips/sgi-ip22/ip22-setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip22/ip22-setup.c b/arch/mips/sgi-ip22/ip22-setup.c
index b69daa02401b..41c4e46a3bf4 100644
--- a/arch/mips/sgi-ip22/ip22-setup.c
+++ b/arch/mips/sgi-ip22/ip22-setup.c
@@ -36,7 +36,7 @@ void __init plat_mem_setup(void)
 	board_be_init = ip22_be_init;

 	/* Init the INDY HPC I/O controller.  Need to call this before
-	 * fucking with the memory controller because it needs to know the
+	 * doing anything with the memory controller because it needs to know the
 	 * boardID and whether this is a Guiness or a FullHouse machine.
 	 */
 	sgihpc_init();
--
2.30.0

