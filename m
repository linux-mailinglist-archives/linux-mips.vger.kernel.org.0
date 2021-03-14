Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB3B33A66C
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234537AbhCNQfY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhCNQeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:34:50 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9302CC061574;
        Sun, 14 Mar 2021 09:34:49 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso18825612wme.0;
        Sun, 14 Mar 2021 09:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XsF4pRChA1Ha2gSTM5EdXn1jGLqo4s8Tu6y/cQj9RhE=;
        b=pczcrESx9QQkwk8rN0QRnVqRy/DxxwCx1dRp+0s4gGu35+FoAF5Omg/nCW4TOIggN6
         gYWxzk4W7AWHffQmpyo24go9q1AemoRuqIIkmpeuohqvjCjNuFFMKF1mltl/gCSTM3CS
         3m6eQFTDl0QGfVt5fvWW0izSCVA6uXaDasaMShdn9d9PTzzon5Igq7qr9zJoEpR+cMbE
         5ZjBrhbMZH/IkaggaxrujIHsiSthHSIWrYnZsi62NSFIwn0EMZgxvigmBJNRn38624fL
         PmX47fat6JtWTR0UAbXIk7Lae5K/sC6eA+/BHS7OrxKtU86XgTwhM+7aRN635zooLZZ8
         0k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XsF4pRChA1Ha2gSTM5EdXn1jGLqo4s8Tu6y/cQj9RhE=;
        b=TqF5YDHyL/bsN+xF2qpw5C3fCJasRsGsNPiUMPlPCz+qiBHpgoIJu2MbLlVHTT7TNy
         mRNGQnPoDWqYJOGv8sFfmC36c/Nf0zHX8qwwE3j6xGzqKp9qF0fh796DyeX17CYn6KsP
         hRtRL5cvbuC9DtrH3TwFIM0emwN0Ph9F0ETrbK/dyGp+FmAtsix0AC7Cs4v8tY+vEuW0
         Fe9FDhhdhOW2uAK7bI+lxBwkwL5jrbeBMFAfUEMMgeiimYXquHhyLbLawW+AiXgE7/UE
         19DO0QoHyde76LPFuPyl45uY33y9bzF5I2XxkTnEChnSpTvx7azDpAWTa4plqeulx0Jr
         n4NQ==
X-Gm-Message-State: AOAM533OR1fYF67TjBH64QGPDT+oRwQcMI5jfMMqBR+mYzSl8PNJPwhg
        R0q9j0hoxEaq2V4KZln9EqO7lN76khDMOA==
X-Google-Smtp-Source: ABdhPJwYThi8TzwLzPyvZZSyCzJYyqXPLbfbFYMzlvUWhF3zFceAY9ui5MqEPrW70aqHOAIaVHiABQ==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr22412490wma.157.1615739688228;
        Sun, 14 Mar 2021 09:34:48 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id h62sm10547804wmf.37.2021.03.14.09.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:34:47 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 0/5] mips: bmips: populate bcm63xx device trees
Date:   Sun, 14 Mar 2021 17:34:40 +0100
Message-Id: <20210314163445.6976-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These patches improve bmips bcm63xx device tree nodes.

Álvaro Fernández Rojas (5):
  mips: bmips: fix syscon-reboot nodes
  mips: bmips: bcm6328: populate device tree nodes
  mips: bmips: bcm6358: populate device tree nodes
  mips: bmips: bcm6362: populate device tree nodes
  mips: bmips: bcm6368: populate device tree nodes

 arch/mips/boot/dts/brcm/bcm3368.dtsi  |   2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi |   2 +-
 arch/mips/boot/dts/brcm/bcm6328.dtsi  | 119 +++++++++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6358.dtsi  |  85 ++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6362.dtsi  | 129 +++++++++++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6368.dtsi  | 129 +++++++++++++++++++++++---
 6 files changed, 414 insertions(+), 52 deletions(-)

-- 
2.20.1

