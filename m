Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F073A3659
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 23:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhFJVrN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 17:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58136 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231147AbhFJVrK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Jun 2021 17:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623361511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=guTfU4e8GDRqzy/1ajS1PObKT8FQPjuFX79A5J7ymwU=;
        b=aJRQep7gTA8uYRTz6oqy1GQO2rcA/QCQZJD/Mk5l/ARJJMaCv7EMmPCwB0iYWtiNGvmRCa
        pt4kp7MbUQTWMjK+G3ZPWEe4PNZKiiyw+omQmOy5EZFKrQLdNe3qqlSN1Nno1/CqMGHknE
        ukgZzBTNwk0XnGCH3E4DuJRbnIHXmAE=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-UpbVHmbvNxSK-_rAHVqIbg-1; Thu, 10 Jun 2021 17:45:09 -0400
X-MC-Unique: UpbVHmbvNxSK-_rAHVqIbg-1
Received: by mail-oi1-f198.google.com with SMTP id 19-20020aca12130000b02901f43fbf2170so1894165ois.5
        for <linux-mips@vger.kernel.org>; Thu, 10 Jun 2021 14:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=guTfU4e8GDRqzy/1ajS1PObKT8FQPjuFX79A5J7ymwU=;
        b=pTnVRAsTnKHpQ434jzcDo8dIBIzMAFQidI+Wy8wFXA7ocpJCpVyuK4gJXVH87bJS+p
         v6ziu7J//6iP4d7P4eO3p94Em+z/bwqFyTJpJ5GCcaGqUptzQeqLZbzUkMuqkmfNNQKY
         UakxFQxswViag3F9kOwrLPgWKkSZ6t7FNZkz5dcdVxl0CDtCoe78Th/X7jvRQrsFFyjU
         s2z+l00wHOlHmoG4BpPFFkEbtSP2mRC2r6vzTid5rn+0NAImle2ZXiBnAW2PJ4cAskKo
         CfHXDupIHuazSnU1Z/Jv3tv/Dpno+mO3kbLmEujPHZfkMLDKEkATpT0q0lGUv3K6Ahzt
         FneQ==
X-Gm-Message-State: AOAM531Vzpwsk2ShHSKcyzuAqdkxmZv0CQg1DkxsU4Lx2qKnExpYI1Fy
        fZMzjhDcYQcfkXDtUDpRL8QgXmZp/mKTYWrr/fOSbQJfc02XC0tS2EDNE5R0IISn6tAguaB8eve
        9VhwmVmGoHkK84aufmUs+pQ==
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr386207otj.92.1623361509076;
        Thu, 10 Jun 2021 14:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjBwKjRTZldk72q+UJkwklQ0sAnXANOb5b/9su/9MNUdqJcH0ISmXgySFJudebSgHFMzWVdQ==
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr386187otj.92.1623361508840;
        Thu, 10 Jun 2021 14:45:08 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:45:08 -0700 (PDT)
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
Subject: [PATCH 0/7] check Makefile and Kconfigs for SPDX tag
Date:   Thu, 10 Jun 2021 14:44:30 -0700
Message-Id: <20210610214438.3161140-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A followup to
https://lore.kernel.org/linux-fpga/YMD2yxtsQN16MoPA@kroah.com/
So I do not repeat this problem,  add a SPDX checker for Makefiles and
Kconfigs to checkpatch.

Then treewide fix the malformed Makefiles and Kconfigs.
Those missing tags are numerous.
Kconfig has 46
Makefile has 141

Run checkpatch generally over the dirs with Makefile or Kconfig problems
to check nothing broke in checkpatch.  Fix the few problems turned up


Tom Rix (7):
  checkpatch: check Makefiles and Kconfigs for SPDX tag
  mei: hdcp: SPDX tag should be the first line
  drivers/soc/litex: fix spelling of SPDX tag
  MIPS: Loongson64: fix spelling of SPDX tag
  iio/scmi: fix spelling of SPDX tag
  mt76: add a space between comment char and SPDX tag
  mt76: use SPDX header file comment style

 arch/mips/boot/dts/loongson/Makefile                 | 2 +-
 drivers/iio/common/scmi_sensors/Makefile             | 2 +-
 drivers/misc/mei/hdcp/Kconfig                        | 1 -
 drivers/net/wireless/mediatek/mt76/mt7615/Makefile   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.h     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/Makefile   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/Makefile   | 2 +-
 drivers/soc/litex/Kconfig                            | 2 +-
 drivers/soc/litex/Makefile                           | 2 +-
 scripts/checkpatch.pl                                | 2 +-
 11 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.26.3

