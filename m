Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88D85F509B
	for <lists+linux-mips@lfdr.de>; Wed,  5 Oct 2022 10:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiJEIGV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Oct 2022 04:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJEIGU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Oct 2022 04:06:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F050870E5D
        for <linux-mips@vger.kernel.org>; Wed,  5 Oct 2022 01:06:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d6so10331459lfs.10
        for <linux-mips@vger.kernel.org>; Wed, 05 Oct 2022 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MoUuIKPDtLCIa0RfYYExyQUD8JlkodJH+xqoxCAK9yw=;
        b=WW+SQn7JH32yKaHFFczhhexvTedgdOWuOfGd35zj73xuoKksLvMU1LD22avH+pf22o
         HkahNxm28l+mjCBy2ywbLGVKRxdpjZCqluOk15AWLJXyXJCh/BtIlzpWXyXDDO7nglbx
         /oxpRAoN5B2Os+Kz2GrXKLif5ZPHRLy9pBVGkD3MOrBKYEQVRj5ixSpIMNplE6xDdpr2
         JvilTWY67VyxzoKutIKzCtLmv0xxlILCe/RedUwnpJeAEnN+MuJyl/TFrJtgCd04Hp2n
         DvChdOl+IIvOxLUZPpGdKLgxsBDZUo1hW/hhgZRKHOWfS0liMdryAH0YwgK0vRmc05TJ
         LUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MoUuIKPDtLCIa0RfYYExyQUD8JlkodJH+xqoxCAK9yw=;
        b=ULEl4xpmGiZDbRZT2n+s/Dl+vKWTIKWGeIN/cxJdi1DJGD13XyecSTLKND+ECBR2Uk
         rEEYODfQH/cv5V0iUqZ6hfB6iX7J2ilUYmsG+DMW6iZBzaRkZ6WbBXQSqhCiyHzzzO9N
         Mb1PU2E7r8k6iDySqnvbNfcrKR/gAmy0VRaTnS4aWHXb9U0w3MIrxsXeIj199C95TcfD
         z+Py6/v3i+q/L9QKOJqzGGsCUdWosxX6gInv5kMxSM75awNsuyQluVVIWADybNANCjUf
         V7y9ZGCgbegLnMBV/ft4Ye8hXaEknItk3w8SVYI34Ws8KECs1B1hw6ZtiD/6rxbaqmJP
         KWaw==
X-Gm-Message-State: ACrzQf38zdXHEqNBNTPfSrY9pH7H58Vd6+PWmYee0ebXjGCfRreIZQUJ
        gOMW0nT4dnH9nFIKMrzNLNWolw==
X-Google-Smtp-Source: AMsMyM4hji368/52NvISHcEAvvm0f29NYiGHXs5S30A5ncUvCS25ptbGa/FFbn7eILAcn42vl0Bhgw==
X-Received: by 2002:a05:6512:2207:b0:4a2:6b5d:8afc with SMTP id h7-20020a056512220700b004a26b5d8afcmr402516lfu.261.1664957177326;
        Wed, 05 Oct 2022 01:06:17 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id m22-20020a056512115600b0048ae518364dsm2250947lfg.148.2022.10.05.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:06:16 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] mips: lantiq: Silence compiler complaints
Date:   Wed,  5 Oct 2022 10:06:15 +0200
Message-Id: <20221005080615.2656309-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With recent GCC this warning appears:

CC  arch/mips/lantiq/prom.o
  arch/mips/lantiq/prom.c: In function 'plat_mem_setup':
  arch/mips/lantiq/prom.c:82:30:
  error: comparison between two arrays [-Werror=array-compare]
   82 |         else if (__dtb_start != __dtb_end)
      |                              ^~
  arch/mips/lantiq/prom.c:82:30: note:
  use '&__dtb_start[0] != &__dtb_end[0]' to compare the addresses

OK let's add & in front of the addresses so it's unambiguous.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/mips/lantiq/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 51a218f04fe0..3f568f5aae2d 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -79,7 +79,7 @@ void __init plat_mem_setup(void)
 
 	if (fw_passed_dtb) /* UHI interface */
 		dtb = (void *)fw_passed_dtb;
-	else if (__dtb_start != __dtb_end)
+	else if (&__dtb_start != &__dtb_end)
 		dtb = (void *)__dtb_start;
 	else
 		panic("no dtb found");
-- 
2.34.1

