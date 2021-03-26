Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404B534A0D1
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 06:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhCZFVD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 01:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhCZFUn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 01:20:43 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B47FC0613AA;
        Thu, 25 Mar 2021 22:20:43 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id g24so3496422qts.6;
        Thu, 25 Mar 2021 22:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKpE25UiGOpkOs2MOY32phVCun3lMkaAw7Uz7QAedb0=;
        b=IljPKYzK7gOVM7DHUHI5y/mpwSJ7xbEpUYmKYWtAgw/SE5vjfjLJ2NzLtWFSVeVlGV
         I1zeUINeQSgQ5Y/ygVpDGHwAI4OJpCjOKQihLYoHLKzwO0VKEf2jt20gAhXZe+pOy3di
         bkkeaAt4g8ZOKKUS9rGu8zo721N7/lQp9JkPN+lGymrz+hH5V5llNm5xCb9Z1G19GSjU
         H/PvW4LEQoCwJG99Qcactg2VMuIB+kN99Bq+ujXqsfS/MuHGywPmVsxJ/j/2nHOOznlO
         srpMFqyGccfSNPm9UOLf/TMhRQ0X56qkNaUdjQY3dy8mt6aUoyPkOYdva1aSfvTQ/xlP
         o7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=YKpE25UiGOpkOs2MOY32phVCun3lMkaAw7Uz7QAedb0=;
        b=YyNWJ6zD0jrUx9yOSD4B1iLd4frlHdTi7u26Y6czY1D1XnshGNf0KUv/EulGLAPw7K
         OA3rY7h7faD068qJFew7uFhfsGoRkQBXWRJ6W/V1LRlTRMX9MQH92cLfpFU/cHznoLlJ
         yZXMs0LDnmNjOq/KKTGdI9bkDCmRwT8BNrQJM3Vb9zxq40WrBaryeou1zl5Bs3nT00kB
         I8OChqvCe5IPUtyM7/GHabvzOdngiU9Mj2BLdFjmSZYF31lSzoW7xo98NAsUeBx+rwY/
         2xMh1P8GGLp5V2/8KaCIdBMGmrUlJ2NhHB9UVq/P4DZWtHmiA9djUgf8lqStGYOIei/m
         f3ig==
X-Gm-Message-State: AOAM530lgQ5+fGVhxZXAITlsKFQbmOnL5h7hwqm9/8WwR6Iy1TGdiyD5
        iE8pt8j5ICqn9sFqVd2GD53jz4SOjNTg+HJ9
X-Google-Smtp-Source: ABdhPJyeNdP9wda/CcLsHAnj/tLP2o+GphZonGBl59sv1GQK1/J54b5AUsYKdHXUcHTJaFhmidgKUw==
X-Received: by 2002:a05:622a:216:: with SMTP id b22mr10811177qtx.263.1616736042199;
        Thu, 25 Mar 2021 22:20:42 -0700 (PDT)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id d24sm5702504qkl.49.2021.03.25.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 22:20:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        fazilyildiran@gmail.com
Subject: [PATCH] arch: mips: fix unmet dependency for DEBUG_INFO
Date:   Fri, 26 Mar 2021 01:20:33 -0400
Message-Id: <20210326052033.35001-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When SB1XXX_CORELIS is enabled, COMPILE_TEST is disabled,
and DEBUG_KERNEL is disabled, Kbuild gives the
following warning:

WARNING: unmet direct dependencies detected for DEBUG_INFO
  Depends on [n]: DEBUG_KERNEL [=n] && !COMPILE_TEST [=n]
  Selected by [y]:
  - SB1XXX_CORELIS [=y] && SIBYTE_SB1xxx_SOC [=y] && !COMPILE_TEST [=n]

This is because SB1XXX_CORELIS selects DEBUG_INFO without
selecting or depending on DEBUG_KERNEL, despite DEBUG_INFO
depending on DEBUG_KERNEL.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/mips/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 7a8d94cdd493..f5832a49a881 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -77,6 +77,7 @@ config CMDLINE_OVERRIDE
 config SB1XXX_CORELIS
 	bool "Corelis Debugger"
 	depends on SIBYTE_SB1xxx_SOC
+	select DEBUG_KERNEL if !COMPILE_TEST
 	select DEBUG_INFO if !COMPILE_TEST
 	help
 	  Select compile flags that produce code that can be processed by the
-- 
2.25.1

