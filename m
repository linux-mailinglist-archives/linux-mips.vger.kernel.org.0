Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E67D522A89
	for <lists+linux-mips@lfdr.de>; Wed, 11 May 2022 05:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiEKDxN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 May 2022 23:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiEKDxM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 May 2022 23:53:12 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8AA4BFEE
        for <linux-mips@vger.kernel.org>; Tue, 10 May 2022 20:53:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j10-20020a17090a94ca00b001dd2131159aso3775928pjw.0
        for <linux-mips@vger.kernel.org>; Tue, 10 May 2022 20:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNKpWzYHI9Vgstna+3ALIzkg0zGqDA41g9+YRGC2T5M=;
        b=HMiHyjKoAn9m4gcFlJI5LTXOM6uIALb1YBOFu5efQLjDgcs5QRf0QLtaAhAGlOfjZJ
         yQhgo0+1hP0fKHDwyFVS1b4m2A7iwJrAlhxn53XzbHAQTsfMm2szI6t9d87+AkIVnvnL
         mdSsZGtpRnGFZdls+zq9Y29/347xqfMt7g8uGKMWmh8Tp7UC1fJ9v+m8IWgTyJHxXZcS
         CrYHXew9UJTvWdpwQlV1sYAa7hZMtZxoCcbYtcwHkjLqOnXC86diYxVc3nnPyjTD2Ssp
         xA/Kf9gzIeDDqtg/ydXj2PKq7c2R6xwgWhtiRdD9xwkIvejUUW+BRnDFe5K/15VMAeoG
         EdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNKpWzYHI9Vgstna+3ALIzkg0zGqDA41g9+YRGC2T5M=;
        b=WhTO8k0gVFOWcUU3qwooSU9KVS/QD+cJz81FxUgCmK6mPvYvbonHQ3OlQbAR/zfrL8
         7Qs1tKhygM11hyxl2MoXUakgtccG9OtaWPIEwbdt6FF9ief7xTNHO5AW68LJSFKzmnif
         gNLJNj8vLtm6hArPTpE8Rey1LBarnkUg9j3OpalG1WITkwSjlF+Cy2DHYzbIbIZIw50E
         hYc1qxdGhvwWiyFvqGcGK+c4QUreFbobz6a8qWSoxCi20FPX5mkePT7Q/Fzee1cIfrGH
         bo9+f/+q/2ACVFJjFfuD1Z3iAvzJmaOWVprDcRdDtVOo/nVFCVaBIzLHXK6DTJA4nTeU
         UsBQ==
X-Gm-Message-State: AOAM530ZIze7HGjxmspoJzlBAolcByYfpkjP/YKZ04SLIqwbCOYmemz2
        thlp8nALqCk+FatHgmoHg3Fylw==
X-Google-Smtp-Source: ABdhPJxHw7dmFAcXGY6fz6nB+/XMEkWocXYbhlmS9LW9oH2L8/y5kiJhfQEHiHw5ZJocGRqTqcKoCA==
X-Received: by 2002:a17:902:e812:b0:15e:a6cc:e015 with SMTP id u18-20020a170902e81200b0015ea6cce015mr23693391plg.93.1652241189761;
        Tue, 10 May 2022 20:53:09 -0700 (PDT)
Received: from localhost.localdomain ([180.217.250.247])
        by smtp.gmail.com with ESMTPSA id z188-20020a6233c5000000b0050dc7628133sm374652pfz.13.2022.05.10.20.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 20:53:09 -0700 (PDT)
From:   Scott Chao <scott_chao@wistron.corp-partner.google.com>
To:     paulburton@kernel.org
Cc:     ralf@linux-mips.org, jhogan@kernel.org, christian@brauner.io,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>
Subject: [PATCH] [v2] media: platform: Add moli to the match table
Date:   Wed, 11 May 2022 11:51:47 +0800
Message-Id: <20220511035147.28532-1-scott_chao@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Google Moli device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Scott Chao <scott_chao@wistron.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8c8d8fc5e63e..25dc7309beab 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", "Port B" },
+	/* Google Moli */
+	{ "Google", "Moli", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.17.1

