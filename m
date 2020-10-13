Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9317828C703
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 04:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgJMCGb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 22:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgJMCGb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Oct 2020 22:06:31 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828B4C0613D0;
        Mon, 12 Oct 2020 19:06:31 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n14so15615126pff.6;
        Mon, 12 Oct 2020 19:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fa52/taPMpSK+5UvZunrd+zAFeR7a3RyeoSOWcuS0To=;
        b=dj8HniD2DQG5fVXd9l3obZdRt5OEZSQvqoTvtvhjlCo2uj+ivLILTMxxtsjghrlR/8
         s+8NIv4rW8B/3UifzHX7sB9ScpPdnGbShFnwVSIJFNDNylWF3jZjHi7gX8mw/hvTIoc7
         cKfcxcC8Z8P77B4PFS3+r/Mq466t46PMxc3jR+NkR3PXZRxNxGcZmmtAPO/IbnzWTovv
         tNcWdZL8UvIzzNuYv1T07+yq8MMEXP6DasMliLT4CT4YAmO6/wY36vE2zd+W57AWXDfe
         vE6BrHsAwayMfQ6CHbM3niISNx4x4X0C0y4kyXlZ045mCRnOrwsCAZHsods99gW/Dawj
         qCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fa52/taPMpSK+5UvZunrd+zAFeR7a3RyeoSOWcuS0To=;
        b=Qz0iBSj3KODzbu+M15PNUG+T890zGbi7U+wM52RVgDqjdJwSp/dM6lVHEdi4TnZLiE
         L0enAWeq5HDW+3U+YyXIL9NMmneYepFCG4z6nzMHrK7CvbTpyV3cFmmJ6gqt31+mL7Nx
         yv15hHoebvRPuATbnQVb55A0vqhD23NzF/S3R1ns02pNb6nvuMeP8Be1008bUDb1unoO
         nT5x4n8FpEKF7kw1boJlgo0zW9dGRY7BBNOmkvxBMyKDEOwPuAOYWJ4idpoC9IOxqiy2
         hxUGeRmbrePl0rV0AsMjVp/8YEl/nxYSFn2HadSO/n6N0wnn7zsZxkGFGiy5xGowwI/2
         EB+w==
X-Gm-Message-State: AOAM530TVqYyGoX/e49p9Rr4ddPGh8V0GBdiN8qaJ4R3KW+Ac70uznPb
        3ac3zdegD0aSll9epKC5c+eCX4sLGzo=
X-Google-Smtp-Source: ABdhPJym78jVwK2DB36Q9AqQ6ihE1MAbN15BW2tF5Vs6oOdKRJc20gjb/BZ0xtXYOikWs/aqiAvaMQ==
X-Received: by 2002:a17:90a:4f01:: with SMTP id p1mr22421114pjh.144.1602554790803;
        Mon, 12 Oct 2020 19:06:30 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:940:2525:1069:aebf:b411:6781])
        by smtp.gmail.com with ESMTPSA id e4sm22383718pjt.31.2020.10.12.19.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 19:06:30 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mips: ralink: enable zboot support
Date:   Tue, 13 Oct 2020 10:05:47 +0800
Message-Id: <20201013020554.1317237-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some of these ralink devices come with an ancient u-boot which can't
extract LZMA properly when image gets too big.
Enable zboot support to get a self-extracting kernel instead of relying
on broken u-boot support.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f52fa211a4cf..534ecff2e2c5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -618,6 +618,7 @@ config RALINK
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_ZBOOT
 	select SYS_HAS_EARLY_PRINTK
 	select CLKDEV_LOOKUP
 	select ARCH_HAS_RESET_CONTROLLER
-- 
2.26.2

