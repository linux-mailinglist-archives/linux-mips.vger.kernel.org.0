Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83030744DB8
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jul 2023 15:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjGBNcN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Jul 2023 09:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjGBNcM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Jul 2023 09:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE9DE67
        for <linux-mips@vger.kernel.org>; Sun,  2 Jul 2023 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688304684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IhA8PQHFplolrCTEWNVaJX0ddk8c61/nnX2OVi4x/HY=;
        b=dohvSNlXZFaTc8IdXzTrsMbpC5j6ewjStkc69xFAUlDKFtiW6OCcAsbja1H0mgqmwu9Vw6
        PqXZBf2dAIINyJdsx4ZA0YnqZj862LMwbs5TMQ1BRpbt/FHt1oAhWptPIsnMWjX7HsU+BW
        aw5IMGwhDcIPCn2Nxfl20f6iSnfcu+Y=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-trsk8quPMSaSo2l3Xw0R0A-1; Sun, 02 Jul 2023 09:31:21 -0400
X-MC-Unique: trsk8quPMSaSo2l3Xw0R0A-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3a337ddff03so3566583b6e.0
        for <linux-mips@vger.kernel.org>; Sun, 02 Jul 2023 06:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688304680; x=1690896680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhA8PQHFplolrCTEWNVaJX0ddk8c61/nnX2OVi4x/HY=;
        b=fMJC/LBfB9ZGdG/4hw0ahnGAmS1TKE8LoYI/QuGKWKaZexkTI7qenK4t9cQTmzXquG
         d2zncMhiiKE+BdHC3fFV744nBHGnAg4ZgDN7SXOxqiH4S0O4MSm+4UasOtCOZ21wWtcg
         X5KUu7mmNfIkt367IjX2xpMZGM/FyhOhX8LOcPgqVoYRUgppxt7GOplJ1NcyQ14YjRr+
         EGx5xZ4aY46NOdpE2ln9EIJ0+a8N9Gugrs0YTAzlPQfzbhG3km0tx3oRPin40dZwGmOn
         X+1Nx6BMzi58GJBEI0Ktc6waGU7H/p4c3AYu7e4jZPBe7oFYLhhqFqHsN+uq7svg00g8
         BlCw==
X-Gm-Message-State: AC+VfDxvgsJuCDXuu6nDaa9zgjQ8jHhEhRlv1/8zNt6w+Nj3w+B8UmH0
        OPUBmF6GR8XNIVho8NHPMRShRfVcdNQH8xsn6aiSylK1M5pUB+CrSr50alT5sdpoVd2CbpWEaBs
        0SEyuYOeKFwOCV6YkYNcVEY243vXDiQ==
X-Received: by 2002:a05:6808:150f:b0:3a3:6f81:49e0 with SMTP id u15-20020a056808150f00b003a36f8149e0mr8282881oiw.6.1688304680428;
        Sun, 02 Jul 2023 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jHs6x35k/Ksnct8fSfwL+ZA8Dffms9gAWwn/v+wOt1OUbuK6xkMVZcapNkzJw/IkWcnNogw==
X-Received: by 2002:a05:6808:150f:b0:3a3:6f81:49e0 with SMTP id u15-20020a056808150f00b003a36f8149e0mr8282873oiw.6.1688304680123;
        Sun, 02 Jul 2023 06:31:20 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id ev14-20020a0562140a8e00b00631fea4d5c2sm10206248qvb.98.2023.07.02.06.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:31:19 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     keguang.zhang@gmail.com, daniel.lezcano@linaro.org,
        tglx@linutronix.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] clocksource/drivers/loongson1: set variable ls1x_timer_lock storage-class-specifier to static
Date:   Sun,  2 Jul 2023 09:31:13 -0400
Message-Id: <20230702133113.3438049-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

smatch reports
drivers/clocksource/timer-loongson1-pwm.c:31:1: warning: symbol
  'ls1x_timer_lock' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clocksource/timer-loongson1-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-loongson1-pwm.c b/drivers/clocksource/timer-loongson1-pwm.c
index 6335fee03017..244d66835508 100644
--- a/drivers/clocksource/timer-loongson1-pwm.c
+++ b/drivers/clocksource/timer-loongson1-pwm.c
@@ -28,7 +28,7 @@
 
 #define CNTR_WIDTH		24
 
-DEFINE_RAW_SPINLOCK(ls1x_timer_lock);
+static DEFINE_RAW_SPINLOCK(ls1x_timer_lock);
 
 struct ls1x_clocksource {
 	void __iomem *reg_base;
-- 
2.27.0

