Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0CE331E63
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 06:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhCIFXJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 00:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhCIFWi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 00:22:38 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBD0C06174A;
        Mon,  8 Mar 2021 21:22:37 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so5146983wmd.5;
        Mon, 08 Mar 2021 21:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQPV/D5Slla4tO1OZEdplYJsUdKoA4adaddnoqiUdzE=;
        b=j4nx9wi2uDYxsUVnmo9+5g9FZwURUigLvfcxKssOyiTLzdGf0nJf/BKNn6jBiylSle
         U8aK52HsqECZTfVKnL0q9HgbQOtEo804zwcyrUdnuAPBC4Mcak9hP6JcfuXFxSPIjuz4
         3kzhKt/UtYwealsmYwSvy6I2XdAG42b0gwTqbzhcMZjBO3En1LpvLcj1cbuLyBQ2wX5D
         jpw9AgQq8sX2qGVtAbnqeDMZPcmBk7VdcEoKje+lfYBwd5DQICQ7jTxtgEbteB3QdLqB
         szLHy+4mpEkGclJUVuR/9wagGP2ZOneWzArX/p70bv2IckJibwLWPNSpv+4RPVxX2ThB
         A6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQPV/D5Slla4tO1OZEdplYJsUdKoA4adaddnoqiUdzE=;
        b=X4UUqfASFh7I4uewgcNmtLTheD9iQa9z9xk56ZBvBXp1ai9kM4CU1w+wbElbdaEi8u
         mycTxJClE/lWp7rHJjEL6NNbmwk354dDitW/O2sxSQnnPDUSc1FGnOQb/gPXaGoReqjB
         MSZj288ZYDdKbzNxzeesY1zHlJDTrfjU0am7TgPS26FOltldRbmU81fYm7g9SPJbIA/P
         NHKeZZhSd1kRqztUZSg87cc3MdYTwrGFQp9HWsReHJDrF+fwhyhXJuey80XOLrlBqhBi
         WUl8L60qcJte9q8KWE41Z9HwG+m4OnPRaQXsua0sKao6OoidjRguaQGAGkj3F/cCHyjX
         02cA==
X-Gm-Message-State: AOAM53337VAoag3ozGCHMgc9SeFM1jQ3fadUlG92l2SORTbWAfcWdtWH
        dsRTnlBxIo3oklgP8tle9RA=
X-Google-Smtp-Source: ABdhPJwr04NnozIaTUbjHRSOni9XcQDzRZS5zaH95MTIJP/0BiEEHYQCPeg17eIMZqefkx1YwjHujA==
X-Received: by 2002:a05:600c:4a06:: with SMTP id c6mr1969051wmp.35.1615267356763;
        Mon, 08 Mar 2021 21:22:36 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id c11sm23450743wrm.67.2021.03.08.21.22.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 21:22:36 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Tue,  9 Mar 2021 06:22:26 +0100
Message-Id: <20210309052226.29531-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
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
index 809a68af5efd..ecad5d972122 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11288,6 +11288,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

