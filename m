Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6B03220D9
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 21:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhBVUei (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 15:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbhBVUeh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Feb 2021 15:34:37 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A4EC061574;
        Mon, 22 Feb 2021 12:33:54 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f137so461262wmf.3;
        Mon, 22 Feb 2021 12:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+J05iBPkWaNdPyV+jMQZJzXzfmTKQmwmnHoTRui72ag=;
        b=jfiXcNnjlgUCVOV8yCp/kOY78YiYcdKX9t9E7OAl8tiwn6/FAxURq9Um+k7gXQa8uX
         CdIlmm0zNJP6snVVN/1l77pYHigIdFQuYHYrWWfk897HLcRwpK8aPKJsBR5iuajVOmyE
         GJDtzW52gVpGIGzd8JuX2jC1qIyogqhtEYtDCewraA4yy0gr6sv0uLB8ej0Y87C7+CqB
         MJ0hP2KEnJ5OSyiEn0HDSOQ/hvnCuH+bBzyY8OqHrCX/QsGUeDxDxqRk/BP7JwriksA1
         iT/uWx1JbWTK3Yxg9Ce3LBZ979xNGbkRD/BoBo2NoqS/uHLWr5+mvUzBLEXJ/ozqnREM
         Q3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+J05iBPkWaNdPyV+jMQZJzXzfmTKQmwmnHoTRui72ag=;
        b=jMiPOanCucw2n/c6U80xSC+d48JcGHnQoUsqkjbvYQpsggMF42KYa/6BcJWmn3DhV1
         5OMC2IpmCAvXRIhnZ5ajY79wGsVirsuzgPBKm3OoM7jJAEXSFxl9HXtytjAny2u5SNOr
         mwppqC+cg9aarnoq22x2jBidJSstOCkf+C4BZbK/n1f/5u/JkZXwM8FWLzfiDTemHXJ8
         Z8f5SoWpld5BG8QUN5TpaR9l6780FG2w+BQ6cgDvJwIlTf/KHsnDGtblOXRLO4ZdgoBT
         PJX8HYRKYaJkoB1G+TyiBysZONF26r2PqgEdZRNZyibImJs40GZd4X1vkWBaoa7hvqhJ
         Mdvw==
X-Gm-Message-State: AOAM531cEmtUXnN9UtlET5bReSbxsWgXtE/mgc6LtPe7ciA4oesQouJw
        c9L0uaenG9ngHh70M5XZfMU=
X-Google-Smtp-Source: ABdhPJwo9eHcA5W16ZGhk1E9OC6ZPII4jKfeVCguHLkvkL+TZsCw/K8FG66HkTz0bMYqw7R9EnDO+g==
X-Received: by 2002:a1c:dc42:: with SMTP id t63mr21531967wmg.153.1614026032962;
        Mon, 22 Feb 2021 12:33:52 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id d7sm18137380wrm.62.2021.02.22.12.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:33:51 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] mips: bmips: init clocks earlier
Date:   Mon, 22 Feb 2021 21:33:50 +0100
Message-Id: <20210222203350.4249-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

device_initcall() is too late for bcm63xx.
We need to call of_clk_init() earlier in order to properly boot.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/bmips/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 95f8f10d8697..31bcfa4e08b9 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -196,4 +196,4 @@ static int __init plat_dev_init(void)
 	return 0;
 }
 
-device_initcall(plat_dev_init);
+arch_initcall(plat_dev_init);
-- 
2.20.1

