Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B844A9474
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 08:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350077AbiBDHWA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 02:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237760AbiBDHWA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 02:22:00 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7A1C061714;
        Thu,  3 Feb 2022 23:22:00 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j25so8880148wrb.2;
        Thu, 03 Feb 2022 23:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IwVIWVckYYgd6gGmEDTtJt0ORxjCJycIWfV3dXhvGfs=;
        b=CobX3Vg+/Wn9oP7odoBqOXIB05QbV0yCTcx6lJmDKwFtZIUdM42zwMx35Ne0qTuUoP
         L/ar2xVAMgLYfEDxDWfX2TNVyEeDEurVHUuGQqkLfgq5EGvwmobmN5xk2OcXxAGmtZb5
         DPO8R7gDGYAckKm+Wwk7AGtWIFiAlN0GrjSyIHX/XRLDbbe2pf5fwHGJFTPo2b5VioC9
         7P1csI1u0FDuMqFoPPY7eqxDkbR7qZohIHIdC91UMy3XM3cUPqblLyzeivQkLE5fPDpH
         ZG3tzoJ05HhzK+B5JRwnWxKFuLzSTI2TwM713G6+vCnbGOcUAPzlNOBJxx/o1FiWVFuN
         kYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IwVIWVckYYgd6gGmEDTtJt0ORxjCJycIWfV3dXhvGfs=;
        b=uA6L4j8xH7T0y+/tgey+IhXZrKRDHdaYDgNiwZhIeXNxObsUkxMhWh0Ht62rmr0Ojp
         WBpnslOf5lTKXM3Mda+CiMlLOkHbdIGQzm2X8HLPUF1siIk2a3W/Ad01PsqMVHHjLUDL
         sD3ri66VkUR4fBrhKW2aQvAmTfq0pM4mFdHiEybcuSjYdFBp+fqT+va8352dAhLwofwC
         /gEXONm/Ug84IWUbYzZAg6ljOlPWM1XL4QaHMFhHojKJxbM8dJUZmei86WI2TkbX9u3D
         HJsXN5QLV8CeeUP5UcBtQj/hZyG5XX5Wu/MdEsA8NHtVDh18Yaxo3Yiz3EIRlpwncyXU
         31cg==
X-Gm-Message-State: AOAM5319EAWvQfjy1MuFHdeMtWFiO//KLak9sX2O/ffcoC+JRm3dswEl
        3QWjg2JirkPHVKBSsTd8NQst3aSnnJcJD4tf
X-Google-Smtp-Source: ABdhPJzscJ1bJlWKO8SIMztBaaBgLGFi4eZQOP2sdZ4wYgIj6JOywcOv1uz/6QmymezNdyaC7aVw+w==
X-Received: by 2002:a05:6000:12cc:: with SMTP id l12mr1336924wrx.468.1643959318655;
        Thu, 03 Feb 2022 23:21:58 -0800 (PST)
Received: from hp-power-15.promwad.corp (mm-89-21-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.21.89])
        by smtp.gmail.com with ESMTPSA id c13sm1096524wrv.24.2022.02.03.23.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 23:21:58 -0800 (PST)
From:   Siarhei Volkau <lis8215@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, Siarhei Volkau <lis8215@gmail.com>
Subject: [PATCH v2 0/1] clk: jz4725b: fix mmc0 clock gating
Date:   Fri,  4 Feb 2022 10:21:40 +0300
Message-Id: <20220204072141.542909-1-lis8215@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
References: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
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

Changelog v1 .. v2:
 - Added useful info above to the commit itself.

Siarhei Volkau (1):
  clk: jz4725b: fix mmc0 clock gating

 drivers/clk/ingenic/jz4725b-cgu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.35.1

