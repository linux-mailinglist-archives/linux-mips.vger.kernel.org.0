Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B73634BA7E
	for <lists+linux-mips@lfdr.de>; Sun, 28 Mar 2021 04:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhC1CkM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 22:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhC1Cjs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 22:39:48 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC7FC0613B1;
        Sat, 27 Mar 2021 19:39:48 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t20so2752816plr.13;
        Sat, 27 Mar 2021 19:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KY07dtiSbQ3SbfmuZCvFR/go4sGKiptIa+i0kD0WZqc=;
        b=tdjkd1nOHESNUMfs/T4ucw6BA6QQBvW/f5fplya6uOf0fq/Xmw3o38e5XnxDdwcsGb
         Wf9pTIaUsK0LvpWrAlkwhOY2xG+5IRRq9tWRUJoyQHM+Q/SEJRfjKd1mrwlWpXeVf4PY
         Kn5e9vs+FefkbLun0kGdJRUslQ+83PuitX2yMPl34WdFrUar2vsONQRicMiK9bafb+hm
         ioTW9D4xG8XMC8uRQQk+pwI1B/wAZuTXGE6OhlAjGfi8lxaQqS1yyoeXtE2FDCb8+9/S
         aenuPQGzaO1BOKM2/Qzwr0rxpD87QQDg8eJ93+w/B1AO3kcsJf1FHa11vgEEZzRJXmAT
         FMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KY07dtiSbQ3SbfmuZCvFR/go4sGKiptIa+i0kD0WZqc=;
        b=Tig+vymru3jep8HgpkdDV17eqYNv77d0JSzWhDh0i6sInbEkG1SvLaHS4Y3fituOEp
         D8QQuzonB5JlEx+4fgu7Xzq7ruLjOTG16XmQbeuK+iOrTMBHs52x09reSJETgZiyW7Z1
         nf5W65eDTW40gkmdTOKKhWLv6jA2O4NgoO3qG1r4qBXSon837f7Wm6h789WMk8oUutJI
         5DGpKa+oNsJcIYdVBxj5AyPGIE2U6rib8wC/N9eKgPE8p1cs3VnO8T3kRay93Jm19i2L
         CD7fu2lgSiBebPK21tcaIoLk7EQLEpt25PbzeDfq0Q/LMbbV3QBrM1+V7heMIl69KqeL
         N5Ng==
X-Gm-Message-State: AOAM5329wumBNvudfABJS0O6xhZjHwNWenfGJkPjwBDHhv6KoUryLYYY
        c+udtDNoMEFqLATmg1t964k=
X-Google-Smtp-Source: ABdhPJxh7tUNCHZD2GFQe0k6tjBkNKtK98QJ158nUaZyll9zaON5o/PeyEk5/WE0c9bYkn7F7pZSwQ==
X-Received: by 2002:a17:90a:2c4b:: with SMTP id p11mr21428264pjm.75.1616899187997;
        Sat, 27 Mar 2021 19:39:47 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id c128sm13209952pfc.76.2021.03.27.19.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 19:39:47 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     davem@davemloft.net, herbert@gondor.apana.org.au,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Cc:     ilya.lipnitskiy@gmail.com, ardb@kernel.org
Subject: [PATCH v3] crypto: mips: add poly1305-core.S to .gitignore
Date:   Sat, 27 Mar 2021 19:39:43 -0700
Message-Id: <20210328023943.15540-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210328014052.8645-1-ilya.lipnitskiy@gmail.com>
References: <20210328014052.8645-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

poly1305-core.S is an auto-generated file, so it should be ignored.

Fixes: a11d055e7a64 ("crypto: mips/poly1305 - incorporate OpenSSL/CRYPTOGAMS optimized implementation")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 arch/mips/crypto/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 arch/mips/crypto/.gitignore

diff --git a/arch/mips/crypto/.gitignore b/arch/mips/crypto/.gitignore
new file mode 100644
index 000000000000..0d47d4f21c6d
--- /dev/null
+++ b/arch/mips/crypto/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
-- 
2.31.0

