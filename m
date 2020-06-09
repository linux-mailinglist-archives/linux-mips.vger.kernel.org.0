Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A8E1F4013
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbgFIQCv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731045AbgFIQCu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:50 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85C5C03E97C;
        Tue,  9 Jun 2020 09:02:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j10so21924778wrw.8;
        Tue, 09 Jun 2020 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CrQdTQDATqYp3sxstTL4aGf3soKrJgWCi2CiwVXCWvI=;
        b=TliqcV4BuYykND6y4HFi5OrTPpLx5KcltdDWv8GuIFIynpSyEE8ixiQio4cTKFH0xn
         LdawG/hkXYl4LWbJS9c+FmvPrX7eAcVqijr3/draDP/JGCmQ3KR8gwVKeMMhA0dQ1vlN
         9mP7GKMhEr+mDEx72cDVwnXsPnSo00t+ETBLUTS4tRje1I/V5Q0J3OqwUJxmYimtpQru
         XuuHy36KaFuQBuJjoMNqMyOChyS5248Q3MRyq92bFYbDxYdrDrD1VT9ylGcfDzhOzMNQ
         tJdrSPflcnJo5g3b64VbGpa8jw8CGIiiYiH1NCEItrvT+ecu7qz/fvmMjYi4OpPUroOr
         yFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CrQdTQDATqYp3sxstTL4aGf3soKrJgWCi2CiwVXCWvI=;
        b=HaPrSypBNLFwuwo7dE7qxaJLS3/Sg3YJs0tNXgyeTah1CVQeOgs+Q2yTd6jyGyEln6
         M+96YxXoyriaEWjWTOhHvKqgbSERoNd6VO9xKim3ZqZs4H5x7PPBjpla5TkY7dSgrKd/
         TracG0f36Yr/Y6AMzuSuY7L9I0I9mz6Gy6LR2Fm38ZK9dQ1ilQTmvhwumqmxwwlWL+ad
         DsJ0pv8U7H9XBiVrblAHU55pr+5hmA7NAGf23xeGWrdHNwHBVPAOwaaMI+FUUtW9E63P
         ajn3aPtV1GLvt/htiXBfgXiih5i08+A70tnkXcrsl5TWf5GF+6ceIoXjEONFGkfbjcSX
         fjhw==
X-Gm-Message-State: AOAM532sw3hfyRIHljH3Bd21coq6sLf3fG7fYhQYi5n/p7u9sEldwxMr
        JobrbEvUid08kvaDruw6KbE=
X-Google-Smtp-Source: ABdhPJxhJDA1raG+nucM0ohTnxqxgWYdxrzVUrFJh23s5+tDALa+JJQRgcm17gSCGQGe5YcYQI4Vlw==
X-Received: by 2002:a5d:4d89:: with SMTP id b9mr5574933wru.210.1591718568420;
        Tue, 09 Jun 2020 09:02:48 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:47 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 1/7] mips: bmips: select ARCH_HAS_RESET_CONTROLLER
Date:   Tue,  9 Jun 2020 18:02:38 +0200
Message-Id: <20200609160244.4139366-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609160244.4139366-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This allows to add reset controllers support.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9dc08ee3d6b9..e82586e7719c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -229,6 +229,7 @@ config ATH79
 
 config BMIPS_GENERIC
 	bool "Broadcom Generic BMIPS kernel"
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select ARCH_HAS_PHYS_TO_DMA
 	select BOOT_RAW
-- 
2.26.2

