Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F9E33CC8D
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 05:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhCPE2c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 00:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbhCPE2b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 00:28:31 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A803C06174A;
        Mon, 15 Mar 2021 21:28:31 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id l13so10819574qtu.9;
        Mon, 15 Mar 2021 21:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4n3te/HCS3MzzKWHw8ZXQyRQm5oWDCwPsSRFLk9uq9g=;
        b=YMLups96wnZtw41Rgt1HhJ04nluJrzdkdLyEk11vs81rQYUV0c6/mw63Aejtf70sev
         5ZC+vyF419NxPnbwXeYMhHiSzCe5blMhiqSQRlEaCU6il3Runpwm97D3Wbavvdw/gt7J
         ip3nlyBo0M9Jnmgc1EiJladdla39QAoehoBUHUccbRl6PZx86YwFnm99ebrSu2qN3C/T
         EnMSgUJb73+X6ZYX0dHAeMzBx9Hq+1H8spmQ2EQJdInJlYE3DMLROr2ttod9pxHkWdKs
         2S/auvJX6YRH+pyL48pewmg6nldyW9M4B0XhfGXbn6s3+inwjyUv63sFSIWsrQvTQbiQ
         FXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4n3te/HCS3MzzKWHw8ZXQyRQm5oWDCwPsSRFLk9uq9g=;
        b=cC+Q/bch82C8vs/WsV+JZlEXRvUY1FxFAeUF7/BI7zTVGfehE1NtQ2B47311z3Kv49
         2t6jmC5MAzU4cNAEZQ636m1QKVph+3RTOQN71/MdrMuWpJupNvYhCgSkKIPPLC5IkuE+
         BFdi0KWS9Jc/Sf/bJu4TXQEqzY7WSwvtlODCw3xec3plM4OOyfw6SFREJx9/QO8sTBra
         4gGnACfj+0ACHWxNF9/CHJGD10kdOP5BSChsXcmPiXvaMRcspG5immRXznoV9zLcy1JC
         Ocafv8Nzq7Ax9fXjJD7qs83oacQQXeurOblQIvRvOTw7nVPCh4yDP8GMngpOMYDDxp2O
         gJUA==
X-Gm-Message-State: AOAM533DHBfhgPGMOt4zCdaGeeF4S5//PpNoEx6fgNXKfbYIrkorAhXx
        MmpQD5VHIdWK4EQRi6V0KJQbOp/reK6cfEbS
X-Google-Smtp-Source: ABdhPJxUyjQvHkOYyf/6rcbqfV/4VusWwgBaf7AjqYgmcWbwazpI6QCToAdNpr6o60YNHtIjm69Etw==
X-Received: by 2002:ac8:7b8b:: with SMTP id p11mr16407573qtu.57.1615868910714;
        Mon, 15 Mar 2021 21:28:30 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.45])
        by smtp.gmail.com with ESMTPSA id c27sm13972111qko.71.2021.03.15.21.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 21:28:30 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, unixbhaskar@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] mips: include: asm: octeon:  A typo fix in the file cvmx-address.h
Date:   Tue, 16 Mar 2021 09:58:00 +0530
Message-Id: <20210316042800.2577822-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-address.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-address.h b/arch/mips/include/asm/octeon/cvmx-address.h
index e4444f8c4a61..5df5c90f6a5d 100644
--- a/arch/mips/include/asm/octeon/cvmx-address.h
+++ b/arch/mips/include/asm/octeon/cvmx-address.h
@@ -152,7 +152,7 @@ typedef union {

 	/* physical mem address */
 	struct {
-		/* techically, <47:40> are dont-cares */
+		/* technically, <47:40> are dont-cares */
 		uint64_t zeroes:24;
 		/* the hardware ignores <39:36> in Octeon I */
 		uint64_t unaddr:4;
--
2.30.2

