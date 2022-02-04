Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5164A9390
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 06:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238777AbiBDF04 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 00:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiBDF0z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 00:26:55 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8FBC061714;
        Thu,  3 Feb 2022 21:26:55 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso8660623wma.1;
        Thu, 03 Feb 2022 21:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sQSTJ/xqHtfSNCK/vEHaXNv6XV+rG+tvRCgBKYP3zfo=;
        b=Ab3df18tFyMLpT3jEcbWqVztPqkQA6Smrypsare7yX/wecSluDyNHTCUug09Lke/RD
         zl1uymdkmSQ+UzdqfbMMxNGhJo/MiyV+zjKx9ekWnzsNsQ1SfJYioEJbkrcNq5bhklR/
         E6TKFkGoGtAKp06/PKb0d7xEZHdGI2Fe6Tefryt5RWdYMJYrqEBweQ6nYXpswE1sw1Vh
         IdlAG6J2m4m5CrGVZl0H8Tl/+e7/VT88uInRogHYw+H5gvlRZqZPyPa0Yns7t1HaEeyM
         u4FSpTHnuBpvPY0uvDNIBeQjHblZMYEEuiXIrTpLoB9SZ0whnugIkVsqshejNwmB2XtT
         I/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sQSTJ/xqHtfSNCK/vEHaXNv6XV+rG+tvRCgBKYP3zfo=;
        b=Zm9gNf/OECrWAZYCxywED5DMR0fhHZACgxiTjw9p+T2DRobe+peRlbLCfM41VJ54T4
         eiweBRd/yXviavYWSa0+GjQnZs2CKxxkYJGLrlBLoaIrDaW7ey0zl+yU89/CLPvZOGuk
         fC475OHkfRbKAaX7l/9cENIXyDar8ikq/W2tylcDI0tiACnvwplB4MUGnPHFYP7AuKJb
         AI37Uv60RCEZNxXkhqx+QAE+orZzgqkSdjLaRzqJKUz7xHBhx6tHLKN2D3njkdZKpZZv
         F+ov6Z+rZe1pU79AhyKJQ8n2WzAIXf1eLivgMaduWhWCWNg9DsZ7L7hBJ/CmbBe2jICD
         BBMA==
X-Gm-Message-State: AOAM532RbiygsFh/pLW/nexmx4xE4LJcWjkeZdR+V8hBmLW89/ihJgWb
        25lD9L4ad4uIwJ6aK3LrjIXLbjmyFo4ZXs7k
X-Google-Smtp-Source: ABdhPJyjRVjACBFqcbKsVHNb03Pd1eB2QKXzmAdNqYY7Qk+wwuDV1UYLJds8ImGOj774s9MXUIDIbQ==
X-Received: by 2002:a7b:c929:: with SMTP id h9mr768565wml.176.1643952413713;
        Thu, 03 Feb 2022 21:26:53 -0800 (PST)
Received: from hp-power-15.promwad.corp (mm-89-21-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.21.89])
        by smtp.gmail.com with ESMTPSA id n5sm588145wmq.43.2022.02.03.21.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 21:26:53 -0800 (PST)
From:   Siarhei Volkau <lis8215@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, Siarhei Volkau <lis8215@gmail.com>
Subject: [PATCH 0/1] clk: jz4725b: fix mmc0 clock gating
Date:   Fri,  4 Feb 2022 08:26:40 +0300
Message-Id: <20220204052641.538970-1-lis8215@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The mmc0 clock gate bit was mistakenly assigned to "i2s" clock.
You can find that the same bit is assigned to "mmc0" too.
It leads to mmc0 hang for a long time after any sound activity
also it  prevented PM_SLEEP to work properly.
I guess it was introduced by copy-paste from jz4740 driver
where it is really controls I2S clock gate.

Siarhei Volkau (1):
  clk: jz4725b: fix mmc0 clock gating

 drivers/clk/ingenic/jz4725b-cgu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.35.1

