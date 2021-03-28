Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EA934BA67
	for <lists+linux-mips@lfdr.de>; Sun, 28 Mar 2021 03:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhC1Bvw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 21:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbhC1Bv2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 21:51:28 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0478C0613B1;
        Sat, 27 Mar 2021 18:51:27 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 11so7479382pfn.9;
        Sat, 27 Mar 2021 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ltty5SJ2LY2RYq7s8cHOh4rUOt7Z1AfLLrBG/U0fphY=;
        b=UlM83tvQDDWa5wui+K+jgGCOiCv01D8B6XsyjeHu9639KFwcbpPaUKcXqFU36e5A6F
         6pNg6g+hjXRQNoYO5KRje5BXRN/TGEPgoNKHDNYxRageUsgFxZ+gRCAzEpneB8nGF8w/
         YBplowRA+kQRyOfm/iqrz7Ap7NcLeOtBVGgNGGYDkFvm5WVp8irnODFfpap1MVvJL3mN
         jaYbRYgD1ulIjVePyBiZVfnLNIaQQRzgibHPYCW78arI4qAwgz2qSPRr+urCXh7JakdQ
         uQOcit5fwRXY8Ml9vqjzxMhvob2jPkx0QKviW0A9BYt7GcuWXdF9AMmAPz+mDS6wL8pt
         Pk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ltty5SJ2LY2RYq7s8cHOh4rUOt7Z1AfLLrBG/U0fphY=;
        b=nZrhcHvmsBQCd2i8kARlp8JDVA25Flnlo7IjYgyO6TTHOjjLvPDzIzp9LvNrpazNnN
         OBZRyZ8xqIMi+MggKKnDEjMU02QpVxbewhgEyH1aOrOAsegJkPhKG1JM33ZeLie/PMX+
         QASiUQH646EeKE2IDMLBdIEjNGCEF6XKDxrM/yGeI+jOY0ngP9NA8n/aZXvr+25drIGM
         nww829Xnb6/GX3fFkSkg7jAMWYG2aK5AxqMK+g81lwizytc1s/LmLoCYs4i+QnoRT5g+
         dGaoETWqBBiVKYdnaRIzOk/RQLDOE+w8fl0vxDVUp0qAXFS1O6EESAGBYOoHCzwxsw9U
         bRXA==
X-Gm-Message-State: AOAM530NPCKa25vmR43N53pK4TZsVep/R9EQdvRjhR32fdq9raxJI0BV
        S/eKQSe1wpfctKTUeKwA9/0=
X-Google-Smtp-Source: ABdhPJzzRjxFW0V/4Q2VzWsjfy+WHrIEQfZHojCvDxfBeEZhqercxBhPI9onxsxq47z/1E82meXMHA==
X-Received: by 2002:a62:2a83:0:b029:21a:d3a4:80f2 with SMTP id q125-20020a622a830000b029021ad3a480f2mr19013440pfq.47.1616896287260;
        Sat, 27 Mar 2021 18:51:27 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id 6sm13209028pfv.179.2021.03.27.18.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 18:51:26 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     ilya.lipnitskiy@gmail.com
Cc:     ardb@kernel.org, davem@davemloft.net, herbert@gondor.apana.org.au,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: [PATCH v2] crypto: mips: add poly1305-core.S to .gitignore
Date:   Sat, 27 Mar 2021 18:50:52 -0700
Message-Id: <20210328015052.10789-1-ilya.lipnitskiy@gmail.com>
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
 arch/mips/crypto/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 arch/mips/crypto/.gitignore

diff --git a/arch/mips/crypto/.gitignore b/arch/mips/crypto/.gitignore
new file mode 100644
index 000000000000..4882ba199071
--- /dev/null
+++ b/arch/mips/crypto/.gitignore
@@ -0,0 +1 @@
+poly1305-core.S
-- 
2.31.0

