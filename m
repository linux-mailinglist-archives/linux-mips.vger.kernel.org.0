Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9D9330420
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 20:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhCGTId (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 14:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhCGTIL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 14:08:11 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033FCC06174A;
        Sun,  7 Mar 2021 11:08:11 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id q204so5654043pfq.10;
        Sun, 07 Mar 2021 11:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwMIYd2aV+XXRot1tFZrSh9m+xuglTUB/+BUvlkK3IE=;
        b=PosIdd0P9xOzXAH2spYx5P0uFH1CYzD8cR1Ef5KfZSig0LgtZ9vNNS+Sb1qVqnJCpz
         ds6aAZbcCNhJrgUAq6UsUODKfXNxqnYp13P7QGnXoWudzwG+PusG6IQTmpIfkqU7tRnH
         lWNaw8Wc7GgMvnRhRqwcIkij5oQaD7EOx/A1LoeGu1jI2Jr7Y6AxFFIR0tMzjWiZ1jny
         eGgSH28X/Mm4MTLALUwHYByF7q+WxfrsxzpzhFJq7WkrjWEohN2YemLSF5FtQJwLAYBq
         0fnqVzC9gWxKm9tczVhG1Re2efdrjwEXXBg3csuKmbf6FEoKLbrt0KahNCqogqSMiZKn
         mhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwMIYd2aV+XXRot1tFZrSh9m+xuglTUB/+BUvlkK3IE=;
        b=FXdsFMjmsxl2TJOFPirwLepxrVSLmkQJY3KKxwvbypH7G498Yyj6mtn5ul1jPqmvjc
         afbLSLC/3ymkID5f+hVaSIJnQdqJB/0T20HWLB67Y1eFVawKd82r4sNQCthp7AUfHdJw
         VT/R55Lt75yH5KdlnylgM28oQYtUKhlsJNHtmsdxHMMHUdi6ScMjtUdj94ROigptnP1h
         P97xgsxVUBAAe61avuzkmivNH9dQDsafxc5g32K2r8QKrjnMfXK4OqdYNKlY5tyq+EYO
         tYYwkALJ+kyQkoD/HrSo5+2fLf7qyvm5W9Yvl8+AC8EAGaLwnYas2ccA/iR2qJRQ3ahr
         WySw==
X-Gm-Message-State: AOAM531HtQg2Me7MvVkzwTiIGadIDlBH5swPWzLnhEyv7D7kK8+FPG1l
        m2/tRyyOUMK+yzPswHP41T4=
X-Google-Smtp-Source: ABdhPJySoqAvxLUXrLa3YBV7XlcOUT2CqkmnMeSZihLSaDXIXhJUDJKp5S66ABbDs0YY+CgaLG1d/A==
X-Received: by 2002:a65:6209:: with SMTP id d9mr17256515pgv.206.1615144090625;
        Sun, 07 Mar 2021 11:08:10 -0800 (PST)
Received: from z640-arch.lan ([2602:3f:e6a6:5d00::678])
        by smtp.gmail.com with ESMTPSA id y63sm7499955pfy.68.2021.03.07.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 11:08:10 -0800 (PST)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: select WEAK_REORDERING_BEYOND_LLSC on MT7621
Date:   Sun,  7 Mar 2021 11:08:06 -0800
Message-Id: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Upstream a long-standing OpenWrt patch for RALINK MT7621 SoC. Selecting
WEAK_REORDERING_BEYOND_LLSC fixes random kernel hangs. This bug and fix
was reported by MediaTek WCN division [0].

[0]: https://lists.infradead.org/pipermail/lede-commits/2017-August/004537.html

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/ralink/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index c20c44788b62..31671bbf26ff 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -62,6 +62,7 @@ choice
 		select CLKSRC_MIPS_GIC
 		select HAVE_PCI if PCI_MT7621
 		select SOC_BUS
+		select WEAK_REORDERING_BEYOND_LLSC
 endchoice
 
 choice
-- 
2.30.1

