Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1AF3239A2
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhBXJjn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbhBXJjk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:39:40 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8A4C061574;
        Wed, 24 Feb 2021 01:39:00 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id k66so1226521wmf.1;
        Wed, 24 Feb 2021 01:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0LD4QEgcwTwBW/rcUT9PybUVkZiGCFY7DhaMEH0u/4=;
        b=mJGU45HcACainENsihPUrjniELpZmGEzfrCDQAdRjkAkOtWuKSOz9SC5sJnDvLC9Q1
         aebr+cFNe29P8BsJsYZx5nM6fPQkizVhnYHkm+W9NNcHNjwQ0gu2q+wjQWyTYQy9j8JR
         9EvX4yLb0PcFvVcUUqTgsppoNqVtNIGBVYBjc8WnYgj3xsA1UBGkHRxmqwRMEGYa1eI1
         76wAIatEPIhxi572BX1jD8tqJjI1idKHQLkD55edpZRLCBCbelbGvRr3FX9wTsS9aICp
         bdXBJJQKud1qDqncLI2l/dW5YLGFXRUQM+C6sMDO1VIUhoO6+Z/W7rFhRW597vzWjFYC
         IZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0LD4QEgcwTwBW/rcUT9PybUVkZiGCFY7DhaMEH0u/4=;
        b=SD1wJYpyRjFLqF70PNZFlCggu7/yzW8ZynUI4sdTazOQReEL+VvwMqOjtETH9x0JeJ
         c9uIjgKXnNMLYFoOx3Gbt4EJQFlUge6IoEVFgBoY5T0TzrR5JrHdSm1xyRsbwLJs6U2X
         vsUiA0tG3RHcJmtSCZrEjYkEVeNjHVJTBvJkO+LC+oNIKMTS29C4ffd/5LqjL/J2kobP
         6bIHEQiSO4X3CQPX+zfhEggdKCTTpzAchW1DQ24chdhIk4wbscI3btl9vDxEqH7Ssg43
         qLl5IdR0Q0ptyy67GTdcogy/YwpdinrjPfITn+0CMTqMGmbBNSV8jesw3BilX9UC50wd
         FT9Q==
X-Gm-Message-State: AOAM532b8CCGhuudHi/qV2K9Ph0mY3hTInC2Xydy7Bd3KPyYzhxhbUht
        iPjt4fbG4gL3N1TTM167yTw=
X-Google-Smtp-Source: ABdhPJyvlHS14tzygGjVCxQlTesi71g5loUxbFgW8o3yPr8cj8Gxzz+rw9rqh2vA2+cAE1KNXtTmZw==
X-Received: by 2002:a1c:7705:: with SMTP id t5mr2969071wmi.148.1614159538793;
        Wed, 24 Feb 2021 01:38:58 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:38:58 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 0/7] mips: bmips: include dt-bindings headers
Date:   Wed, 24 Feb 2021 10:38:49 +0100
Message-Id: <20210224093856.2021-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200812063129.361862-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow including dt-bindings header files for bcm63xx.

 v2: remove irqs header and add more bindings.

Álvaro Fernández Rojas (7):
  mips: dts: brcm: allow including header files
  mips: bmips: bcm3368: include dt-bindings
  mips: bmips: bcm6328: include dt-bindings
  mips: bmips: bcm6358: include dt-bindings
  mips: bmips: bcm6362: include dt-bindings
  mips: bmips: bcm6368: include dt-bindings
  mips: bmips: bcm63268: include dt-bindings

 arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts    | 2 +-
 arch/mips/boot/dts/brcm/bcm3368.dtsi                   | 3 +++
 arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts | 2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi                  | 5 +++++
 arch/mips/boot/dts/brcm/bcm6328.dtsi                   | 5 +++++
 arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts   | 2 +-
 arch/mips/boot/dts/brcm/bcm6358.dtsi                   | 4 ++++
 arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts   | 2 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi                   | 5 +++++
 arch/mips/boot/dts/brcm/bcm6368.dtsi                   | 4 ++++
 arch/mips/boot/dts/brcm/bcm93384wvg.dts                | 2 +-
 arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts          | 2 +-
 arch/mips/boot/dts/brcm/bcm96368mvwg.dts               | 2 +-
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts               | 2 +-
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts              | 4 ++--
 arch/mips/boot/dts/brcm/bcm97358svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm97360svmb.dts               | 2 +-
 arch/mips/boot/dts/brcm/bcm97362svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm97420c.dts                  | 2 +-
 arch/mips/boot/dts/brcm/bcm97425svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm97435svmb.dts               | 4 ++--
 arch/mips/boot/dts/brcm/bcm9ejtagprb.dts               | 2 +-
 22 files changed, 47 insertions(+), 21 deletions(-)

-- 
2.20.1

