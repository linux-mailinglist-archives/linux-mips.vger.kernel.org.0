Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6310617AAD
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 11:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKCKPn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 06:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiKCKPm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 06:15:42 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE47D25ED
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 03:15:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z24so1600187ljn.4
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba2RHuNnxHRUZprt+7VnyllD6dviYtxroBxHsg3w0zo=;
        b=okvYEstr8o0X+egV+NqRu7sN9zBUTuobYcLeNxGvIN6AtiFlBwcjRUsdjq3TW1IfgM
         hy/+eX3RM59+JGMhDY+AQU4m3E4//GvJichRV5bBrdGPdsvuIMVxUkuqX82hUunxMWRJ
         fpNbhwL6gf5XKehxzPmxsXdfalA7wiWtwszWZiqZT56qqQOpNC8ABf5+iUPMCpohwk7n
         u1YVG2icGXbXbZEDgzje3DPUOXFRyRI3h/sWCuQ/e6Qp7IEurb3MoYvfeIzzi/j3qkeo
         T0Y1lrTQToQmQhymtBR9aYophGm2x8pqWeIZyNHmOJQsVWNFiSpSn6ujwipT1uW34Lva
         Nztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ba2RHuNnxHRUZprt+7VnyllD6dviYtxroBxHsg3w0zo=;
        b=DYLbq6deeg5M7M4g8MgUHzTYJixgajN48MqLSLPY65faEyZJqlJOItfHavji/TWPpl
         bzDHoN3Vg9SRus8NJoDBwJpB9H/KIUER/ohYA4UoDbV5B2HF4OGfwUNbJqzBp40iOYcu
         X/mxqPVrs/GOPwaHzDKHqAnZqWg2t8rhqMbbsJv6ngllK9yF6Vc15jfm3/WciovDERsa
         SjxM0orRS680SbgMVcIy9FHeHFVO7EnklfMUExChvNSVLR8dyMwjqex/+FkNU1Go37f2
         LQuek4SgB8NWaiootKgqux8xgdsomsJBs7vvps6cC7SnL8TMpjimJi0YX+mvGvfYQ0m4
         a5MQ==
X-Gm-Message-State: ACrzQf0PUxBmRV4383gyERSYWB1FPutowNXU5gnwGZ9/C5kfsTLL/gFj
        cb33sEoGAHIkdOJ+dV03Sgy+mg==
X-Google-Smtp-Source: AMsMyM4m/DC4U+EW2Pl5GRZ8fuvaxRb6DQwE6k27YCeX1672wBcGk+QuwiLrjKygR5BEdt8ea3+6eg==
X-Received: by 2002:a2e:bc11:0:b0:277:6018:6f07 with SMTP id b17-20020a2ebc11000000b0027760186f07mr6517510ljf.16.1667470539142;
        Thu, 03 Nov 2022 03:15:39 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id y6-20020a056512044600b004a45edc1de2sm72091lfk.239.2022.11.03.03.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 03:15:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] mips: alchemy: gpio: Include the right header
Date:   Thu,  3 Nov 2022 11:15:35 +0100
Message-Id: <20221103101535.715956-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The local GPIO driver in the MIPS Alchemy is including the legacy
<linux/gpio.h> header but what it wants is to implement a GPIO
driver so include <linux/gpio/driver.h> instead.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect Philippe's review tag
- Resend to the right MIPS maintainer
---
 arch/mips/alchemy/common/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index a17d7a8909c4..1b16daaa86ae 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -31,7 +31,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
 #include <asm/mach-au1x00/gpio-au1300.h>
 
-- 
2.34.1

