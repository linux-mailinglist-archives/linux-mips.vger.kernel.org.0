Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEE23ED1F5
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 12:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbhHPKaU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 06:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhHPKaU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 06:30:20 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9DAC061764;
        Mon, 16 Aug 2021 03:29:48 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g138so11231713wmg.4;
        Mon, 16 Aug 2021 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zC6T7bwIy4U4vQbxXdGtxZMXQsi3PtjnTtfgcrsYRhE=;
        b=FPOqA7xi7oANwZC58CFFSVRXHbzeGBVYfw1vS8K9e5GA/5tjXBZiCMTP96f+Z0+7Nu
         MFIVrTtQEnh411BFcqJYmumAHifswyjhxeIv1D5Lmmd2mfIeZ6v1c9WBQ7g/gnRcq8Fx
         spHvJ9NdNpSAmxKMgTUswYW/6m9LjknaNWh1mnMcGzc0uyKdMMxima0Lnlyzk3TJ0s/d
         zwtGzAJ1rBcnhsJKRtqHkSJE9gK5STDWJUaUV3dfV4vczF5fJIXEnOIiyHNjjwjAI3kE
         nNBN8kd/EXbtiO3Mbvc8UvOEchgf3DuOBnNG0f+8+G8L92RUt+KNJAA9jL2IKEztSmE3
         0RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zC6T7bwIy4U4vQbxXdGtxZMXQsi3PtjnTtfgcrsYRhE=;
        b=WvRmPN51iiem2y9DAmuNrz2jtqda+bYP4RIYa9rMJkDBwxRccUGx7pJkTwoRKluQsf
         XmyZg2kB+1dERc5V17i7qIVfXk+h6guUhVLofupZtrb5UbxaX+AWzFVQin80aDpXc+Y0
         8GHo6FI0OfBc7ZKWszJbcdJhT+Th7fWaPOjoHIFvdFHYhXLdZx2DmIyB0PnoiPNgh2CC
         MIiAq0fVwIw14T0fZykjsbQ6NUO1iBMfu5ghEmRHastIcJP1V9CjnzaLkHYnuBoBenAl
         DnnIZYLcgXuFozX2oFgPr9H2ADQQK8C6FZ25c3nPqbLuRuofRq3AOvYPTgEhRxXuxgvl
         BFbA==
X-Gm-Message-State: AOAM530O+e+okCwtWqHrppYo96Vxq7KCIbBSot6zr2pNFq0ui+B7US1E
        uopy7EerjbSL8UsEj5h26Ik=
X-Google-Smtp-Source: ABdhPJxj9jwaASRpwTTbZVwcKbG924+JuU0ncGwiIXxe1ss32NyyWPXMUmc+Nec+9/r0sbHas2oXGw==
X-Received: by 2002:a05:600c:1d01:: with SMTP id l1mr13472797wms.178.1629109787293;
        Mon, 16 Aug 2021 03:29:47 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id e3sm11767136wrv.65.2021.08.16.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:29:46 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James Hartley <james.hartley@sondrel.com>,
        linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust PISTACHIO SOC SUPPORT after its retirement
Date:   Mon, 16 Aug 2021 12:29:42 +0200
Message-Id: <20210816102942.6976-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 104f942b2832 ("MIPS: Retire MACH_PISTACHIO") removes
./arch/mips/pistachio/ and ./arch/mips/configs/pistachio_defconfig, but
misses to adjust the corresponding section PISTACHIO SOC SUPPORT
in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    arch/mips/configs/pistachio*_defconfig
  warning: no file matches    F:    arch/mips/pistachio/

Adjust the PISTACHIO SOC SUPPORT after its retirement.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210816

Jiaxun, James, please ack. 
Thomas, please pick this minor non-urgent clean-up patch on mips-next.

 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a2d3ee2711e..8276e59406e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14802,8 +14802,6 @@ M:	James Hartley <james.hartley@sondrel.com>
 L:	linux-mips@vger.kernel.org
 S:	Odd Fixes
 F:	arch/mips/boot/dts/img/pistachio*
-F:	arch/mips/configs/pistachio*_defconfig
-F:	arch/mips/pistachio/
 
 PKTCDVD DRIVER
 M:	linux-block@vger.kernel.org
-- 
2.26.2

