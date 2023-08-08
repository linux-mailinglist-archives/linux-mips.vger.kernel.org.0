Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA587740A6
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjHHRHb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbjHHRGr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:06:47 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D4D5FDEB
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:02:51 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bdf08860dso365466b.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510529; x=1692115329;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anuYTtEViMW4nrjJPfmB+dcKnLZHUPG9Gjj/JVLBORE=;
        b=ZXV2bFrtlrw2PSvWdUmzKxGBlGeRDaWFHMVkcYCiqcaG6MMBygq9eDTSJIzIZwmkES
         KZ3HINTbjl47otnVGpKI4T8ciLBqVb3WV4gDe2i3GuefiFAom2Ze7UKTEdozoD7aXct5
         3q/LUrVnhc7HcYxlP4Km6ltr4AHdW4j06zN5bAhSjjK/TPPxc/QMJwE+w1Ocveu2p/zv
         SHLVmfWtFfYrozYikELxc2au6E1e8tAqBx0KY5ioEtsMtVFqtn/sSfxdCiUUlokiNAdO
         NRHDGB+c4ukYzyXOUMlbcdyEcGEGRoLpy+s3Y5Ui8GMZzcPTNiYpwroHX7qoUw+umlaG
         RQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510529; x=1692115329;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anuYTtEViMW4nrjJPfmB+dcKnLZHUPG9Gjj/JVLBORE=;
        b=F3l8P7LpYEqyS3SmENM4jBuhkr2bqKmwyVHtHlWdOWhcUOQ7gL5cVY+XmVzq1qodSa
         ayl1GIH5iDaTy9rR6wSTFImvjAn+I6DVti82wm20UtFha+XEy/k4DWjnxTAe910BsEzV
         8aYZS0E5LaRwQ6P6qMXt9Npa1qjzfUpd78jFsz4YO6SEa2oz2VsOLlrY4b+PbfYCNDrP
         8czjq19BZcMVt6TEAyfCxxeX+YOFLs03dL1JgKCk7sm0RJCB0jy1W6aQo3Cb/L8Z+fJV
         akxRVl9fQvPNZugbTTWBjyrmy0YES/M+Ee20q0Pa9mh0CU2yN5wM37AXCp5+ONDKGEu5
         OJWQ==
X-Gm-Message-State: AOJu0YxoqapGeOr+f+SqqjWNecpUEAPnsB3i3DWSuDZAZUcv43z+pp/F
        v0DqpOaAzs9/hy5DFh3gxBQ5TpxkFW4AiW/pbQ4=
X-Google-Smtp-Source: AGHT+IExib52NOOu+oE06KDhOXHVNqwrDLcdqVkpVygSHkJ9Hrps2AVdFNXnNOa2I25iZ3v1cJAjCQ==
X-Received: by 2002:ac2:4e04:0:b0:4fb:8aca:6bb4 with SMTP id e4-20020ac24e04000000b004fb8aca6bb4mr2837425lfr.20.1691486994246;
        Tue, 08 Aug 2023 02:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r20-20020ac24d14000000b004f9c44b3e6dsm1809545lfi.127.2023.08.08.02.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:29:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 11:29:53 +0200
Subject: [PATCH] MIPS: Drop virt_to_phys define to self
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-virt-to-phys-mips-v1-1-af6fcd45ed31@linaro.org>
X-B4-Tracking: v=1; b=H4sIABAL0mQC/x3MQQ5AMBBA0avIrE1SJZSriEXD0Fmg6UhDGnfXW
 L7F/wmEApPAUCQIFFn4PDKqsoDZ2WMj5CUbtNK1Mspg5HDhdaJ3j+DOXlDrlhrVW9PYDnLnA61
 8/89xet8PyclIPWMAAAA=
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The function virt_to_phys was defined to virt_to_phys and then
implemented right below.

I can't understand why, just drop it and let the actual function
slot in.

Fixes: dfad83cb7193 ("MIPS: Add support for CONFIG_DEBUG_VIRTUAL")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/mips/include/asm/io.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index affd21e9c20b..18ed44843541 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -111,7 +111,6 @@ extern phys_addr_t __virt_to_phys(volatile const void *x);
 #define __virt_to_phys(x)	__virt_to_phys_nodebug(x)
 #endif
 
-#define virt_to_phys virt_to_phys
 static inline phys_addr_t virt_to_phys(const volatile void *x)
 {
 	return __virt_to_phys(x);

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230808-virt-to-phys-mips-226e409a84a7

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

