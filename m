Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0AD13A3695
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 23:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhFJVsf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 17:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30484 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231522AbhFJVsJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Jun 2021 17:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623361572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=70NgQXU1//Wzo0iLFWpl3KegQtCCZiFqqErbm/ywz0w=;
        b=Vrg4XV9hgyphlC4J6SavACOWbYunocoMgGzQMYEVEGpZJ2gaAlbF54D27zkeGJxN3raSad
        OV6LieyfXL9jZWa39pAnDdrZzV99KDo0Jjf1c6GV4rBU+kS3ZBGQPSNXyVQgALHMiMIbrR
        Avx6WvzKl2wJgH+Z4nKj8iKlFKO3m5w=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Ci1LlG_1Mk2EyQhqMBw-UA-1; Thu, 10 Jun 2021 17:46:11 -0400
X-MC-Unique: Ci1LlG_1Mk2EyQhqMBw-UA-1
Received: by mail-oi1-f197.google.com with SMTP id v142-20020acaac940000b02901f80189ca30so754175oie.22
        for <linux-mips@vger.kernel.org>; Thu, 10 Jun 2021 14:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=70NgQXU1//Wzo0iLFWpl3KegQtCCZiFqqErbm/ywz0w=;
        b=gieZxMnbXwuN9HJsOUx8rH+bh4MYUKxYoDjr+SpyeAxSoGn3eciMtcVJ/4r6WdLo5J
         lEfKZG0GcAcr5QfrrbNAaU8hPG20avPlGn2jK9SlgV0BmxWZVD6AFfno9BB9ScMyKHk7
         91FkyHoemAx9ucCCcA6wKr+R4lhEgrtuHH0BPo3wGXVcPoX8Y6RzlZOGrTeD2mUjujJo
         ZGyGiuxY1yieFTn0If3JJMELNTzVinu0qrI6vsRsDGowABZ7PKXdw5CEU8q2MN91ZACw
         tyn5FBc/hmcxxogflsgVSMRI2Gdezq/IMKvx+AvyJ6PXhwjNQda/4g3J+8yZmbdbIcU+
         CfLA==
X-Gm-Message-State: AOAM5325ML8oWxYr3d/+YAUgVQ2aptE0HliUTGfo0aEm/+3weN+cRpoo
        lypXxTK4NveURA7vilTrwJYIPx5sOZ7Lpy3DFibT6KfHYl39Brv1noDp4p6RZHV23/CP05CPAfi
        Vx9Gz2ricqL3wP9H2gdoSUQ==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr358465oti.237.1623361570539;
        Thu, 10 Jun 2021 14:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5xdp4Jwej97Ul1cmx7ubsXWjXdzvP8bKBwCPJ0ttg8L6uH+IckI6kmbkyG1b9obIsJHKQNQ==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr358446oti.237.1623361570280;
        Thu, 10 Jun 2021 14:46:10 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:46:09 -0700 (PDT)
From:   trix@redhat.com
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
        lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, nbd@nbd.name,
        lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
        kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
        matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        zhangqing@loongson.cn, jbhayana@google.com, sean.wang@mediatek.com,
        shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
        shorne@gmail.com, gsomlo@gmail.com,
        pczarnecki@internships.antmicro.com, mholenko@antmicro.com,
        davidgow@google.com
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, Tom Rix <trix@redhat.com>
Subject: [PATCH 7/7] mt76: use SPDX header file comment style
Date:   Thu, 10 Jun 2021 14:44:38 -0700
Message-Id: <20210610214438.3161140-9-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tom Rix <trix@redhat.com>

header files should use '/* SPDX ... */
Change from c file comment syle to header style

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.h     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
index 05180971de841..03877d89e1520 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2020 MediaTek Inc.
  *
  * Author: Sean Wang <sean.wang@mediatek.com>
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 8f8533ef9859f..397a6b5532bcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2020 MediaTek Inc. */
 
 #ifndef __MT7915_TESTMODE_H
-- 
2.26.3

