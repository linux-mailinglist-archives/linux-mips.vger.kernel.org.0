Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B23D3309E4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhCHJDt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhCHJDh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:03:37 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC616C06174A;
        Mon,  8 Mar 2021 01:03:36 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id r25so15062935ljk.11;
        Mon, 08 Mar 2021 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iLeRlBmTDyCAsTtvGgkGakyTgoKVV6RwqZdxUSlPe74=;
        b=jAG88HQ1gGvKAQrdokSZ6lq58KB5HfHEZigPfPRatjqptXiT04NyK9I/lxe1lGHSZZ
         2cUABb6AXlyJLmK9Ihl1YeiJfgsccrTqYZL/Nwan6F/3VxWqmzCh2UKr08OS5XpMAMNJ
         dKCHbaElhag0rDmSiY8kFc06bC+oSc6613ctvMH+7oGm3zzxm5K5kQWaFU/qtmPmlBu6
         P/hY4DyG2o3VoQf2wyp70QZ0xPa8seoG+Vbfya+3VBIm9VyZrs9Fci4r/EcOBa39EoXN
         8hT4wfTwIBhC3dnvS1wRLs711DPrW2FHKyJ5pD77lxFoqyo2A8VEu8vWYI0FUS711zno
         d0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iLeRlBmTDyCAsTtvGgkGakyTgoKVV6RwqZdxUSlPe74=;
        b=HIJEYHv2MvA0vbcq/45q00rgZS6xjbO6ctea1n4vPVRBZ8tpjMbXRbplgjxu9wEnSF
         EveDTL6Yyt91MKUGHtxi/JOGaLxRbLSXgdXkmaY1/T6E29GpnL0T38KTt2Xc7cNWJYyZ
         SkSamVEr3qFwNFgA0GdLz6AaiAjWoKizK3Rmr+/PuhrZ0SLoACLbYspkKfhpvmwrznQC
         Y4OlWL05LHSL6ZBg3ZwQ47dmEVtuNHKyJ5CZSz67IuW359cfoJ1ab9QRDCDBlCpNLRkv
         UhwZhrpplApDIJtoAEoVooTdqPAPCXNYeXn36FtP5n2RziRGUurVCxpUP98ftW/ddrPR
         8wuQ==
X-Gm-Message-State: AOAM531O02qPBu0UPSu/g5BllAKVIqG49/mw5GwH7z0HOIieCFwf5/Js
        cD1Y11BU4e+6SxKcwmgk5NM=
X-Google-Smtp-Source: ABdhPJwOI5MWe+FpjV37DWs4H0uKB+n84vTLiGLZRAH4Dv8A80FjvV37Ibvc3jinAyesL0eu4ghErQ==
X-Received: by 2002:a2e:96cd:: with SMTP id d13mr13552714ljj.213.1615194215285;
        Mon, 08 Mar 2021 01:03:35 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t13sm1410346ljk.47.2021.03.08.01.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:03:34 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH  mips/linux.git 0/5] firmware: bcm47xx_nvram: refactor finding & reading NVRAM
Date:   Mon,  8 Mar 2021 10:03:15 +0100
Message-Id: <20210308090320.9765-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This patchset refactors driver part finding and reading NVRAM.

It been tested on BCM4706. Updated code checks the same offsets as
before. Driver still finds & copies NVRAM content.

It's a new patchset replacing previous single-patch attempt:
[PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor finding & reading NVRAM

Rafał Miłecki (5):
  firmware: bcm47xx_nvram: rename finding function and its variables
  firmware: bcm47xx_nvram: add helper checking for NVRAM
  firmware: bcm47xx_nvram: extract code copying NVRAM
  firmware: bcm47xx_nvram: look for NVRAM with for instead of while
  firmware: bcm47xx_nvram: inline code checking NVRAM size

 drivers/firmware/broadcom/bcm47xx_nvram.c | 92 ++++++++++++-----------
 1 file changed, 47 insertions(+), 45 deletions(-)

-- 
2.26.2

