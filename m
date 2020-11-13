Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3858A2B17E1
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 10:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgKMJLO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 04:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgKMJK5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 04:10:57 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DFBC0617A6;
        Fri, 13 Nov 2020 01:10:57 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id j7so8939718wrp.3;
        Fri, 13 Nov 2020 01:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g0CHHJRFLkJgpWDc0kWpwLPadBEpgRbUEt1rTCDH2OM=;
        b=D4gyFtmnvMDTS1VEiZeY7wc2KHvHol8ijYHtMFfyx5VbwjErW66XQTz0w7lCQFArnK
         XPxkxdBykxUHPdhUCQuboujhx2cbVUeHYe2V+ppviGv0yVlG5sYZNK6F1CLc1HmFdrQT
         q8xD+UYA6Z+KNkkrbi2rYokMRdrKQ0GT5JdjSGXnlIeUMzd3HoYLPdycuULkuGEIC7Q1
         Ffublk3nJFT9eWAExx9SzFMDZLw2ZkJlr/tsQUypphx9yw6lmVl13jvwC6LEAVM4WKLr
         +MCxB0uHr+cNv32fwaPK/SFSvyKydc1HWFHyvCz8+2f4BufFCC518Rm95o+E4/GDBpUf
         QiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g0CHHJRFLkJgpWDc0kWpwLPadBEpgRbUEt1rTCDH2OM=;
        b=n4w1OJsDMQjeiN5XYgRelnrPTZBe8zhKjnSLH2agHTmr89ivKntvNwJgpSyI1IKn/N
         reiywriJi/aOCZH96RXF1QeIr/M9swM2lKpfd0wjINX0uHQdPyKMooizOz4/SKfCeMqb
         4L2y1is+CJVFhZaRuK6swKGXibcm+0bWwSH8+kaPdMVb/MiKU0hqg6uIMqr4WYHGKGHd
         0fTHtpqco+qKQ8caYeG4n2NXzjgtxxWhzw4rDd+i0YC7lwyHoGsO9Yj9Lk3PsAdN+DPQ
         xzlBRjZaKKtdp0coWqwMgXeOgK0ofN2c86Lmusk9OIuCz7qKdHLE2UkrpX9rH8xAtqIK
         VI8g==
X-Gm-Message-State: AOAM530vd8SCsQ6tP5iJFHuiUTIbRw0GHRB6Zfcl3JmgAd9u4/WSRhLz
        tWirNG7bYf/WNC1aRVqv7rA=
X-Google-Smtp-Source: ABdhPJyciHbl+LA+gvNXReZgkWMntgWiftBxUeKU2/A5fHAhGlcnRxlfHeTL61G7xGNH6ujrauQYzg==
X-Received: by 2002:adf:84a6:: with SMTP id 35mr2167644wrg.18.1605258656126;
        Fri, 13 Nov 2020 01:10:56 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id 15sm9266183wmg.1.2020.11.13.01.10.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 01:10:55 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v2 5/5] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Fri, 13 Nov 2020 10:10:46 +0100
Message-Id: <20201113091046.30964-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
References: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1f088a29bc2..30822ad6837c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11142,6 +11142,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

