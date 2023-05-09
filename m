Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778F66FCE19
	for <lists+linux-mips@lfdr.de>; Tue,  9 May 2023 20:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjEIS5t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 May 2023 14:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjEIS5t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 May 2023 14:57:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3612330E5
        for <linux-mips@vger.kernel.org>; Tue,  9 May 2023 11:57:48 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso12134352a12.3
        for <linux-mips@vger.kernel.org>; Tue, 09 May 2023 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683658666; x=1686250666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EvkuYPo4xqDuf6DjHpObAR30AEqG/JneBe3gJmAwck=;
        b=SVHfT9XZRdcZiRd6YqMmydbr9Q3REPeutpbB9t3RzjCHWlIcF7T7gXxP8kO9SBoP9a
         a1yHI00u8+abjzjd7aanYm0/iMh7Ea5aXtsG8R1fDz5aHrR6Y/QKm5o5NzDU/LLSsn4V
         CQJfDG/2bu0F5gbUoLwVedzfj/kZnGJP+Ee4TujDvrEmjUh7V42tIGKLwxRlvMGSEZ6Q
         1ErSli3VgErNSrZRND7LvO2+FRv2lxuxmVitzz9B0jSQu2BcNw9mT5aTM88nMRDdnWyJ
         yKF31/qwdKsnBCkww4YC8r09dwOhUEdCAJs4sroA91ya84oUTnUXKpFenHG9XMSBWpnN
         Lr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683658666; x=1686250666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EvkuYPo4xqDuf6DjHpObAR30AEqG/JneBe3gJmAwck=;
        b=GnuTThO6+XTr4fvy8AuYHRvCK57pn3dxttmicPj6jl+VU3BHXVWFmAkH3QdqlxL3mt
         j5U1G8DHaIXDW3PmyYK8kP2UP4fqRAY4+VBBITU3YjfKwN00ccr+D9CKwl/uqfVWintv
         A5DHFa7EZU7/8szXX8Qb7iBXaKr+9nt1ibV+jUJk2yHkKT/fT1ObZCIonr9WTgMcp+Xk
         nyzPYve11899bJIe3TLUORnFcKQrcDGitVOOwWocn10y6xJ6kTXDt6jAwFeA+xHpwSGA
         g2yur/gsZMcB1kR0UCnYUWhqxE+joLmppCc8kFiQxwXzaSPcm5dWZtDzisJwFPi6IcQu
         i8mg==
X-Gm-Message-State: AC+VfDxboog2JPQceZNplvKuS9hThKRHMBtNYr/c7MA+i6VuVA9l7/08
        OZLNLwB3NIeSziPLQHH2GavEycQ2rpE=
X-Google-Smtp-Source: ACHHUZ7K/5YElESDrVIE0RMOUp51Yazy0Z0RGw+LAIWyK2Ffc/Kgbj8IQ4pD8dnaBoXWVBG8FRhQqA==
X-Received: by 2002:a17:907:360c:b0:961:800b:3f1e with SMTP id bk12-20020a170907360c00b00961800b3f1emr13306504ejc.73.1683658666503;
        Tue, 09 May 2023 11:57:46 -0700 (PDT)
Received: from flagship2.lauss.local (p200300c02712e50000000000000002af.dip0.t-ipconnect.de. [2003:c0:2712:e500::2af])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b0096621c999c6sm1650979ejc.79.2023.05.09.11.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:57:46 -0700 (PDT)
From:   Manuel Lauss <manuel.lauss@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH] MIPS: unhide PATA_PLATFORM
Date:   Tue,  9 May 2023 20:57:44 +0200
Message-Id: <20230509185744.413302-1-manuel.lauss@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Alchemy DB1200/DB1300 boards can use the pata_platform driver.
Unhide the config entry in all of MIPS.

Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c2f5498d207f..675a8660cb85 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -79,6 +79,7 @@ config MIPS
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
+	select HAVE_PATA_PLATFORM
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-- 
2.40.1

