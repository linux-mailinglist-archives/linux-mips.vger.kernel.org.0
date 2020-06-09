Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4281F3CD7
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgFINmh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgFINmg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:36 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A447C05BD1E;
        Tue,  9 Jun 2020 06:42:36 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l17so2895536wmj.0;
        Tue, 09 Jun 2020 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lTf+Sd5yaFapTCjKu5qesxFzYkBarG1WB0tnN1EJVIU=;
        b=SMyUMT4r4GLoqclpTP+ykfxVszTnQIGdc4+XMmFuLPfxG4+U0555JNSV7xy4GSwqbS
         OzoDgXNhBcJ0/A0rkdCfQwaSDrIHjgxqVr/OgnzS1nO/Ngo+73Peip0ox8/dy7wXZiwD
         QSIiIqdjjaNB8BqeFBI501HSv3ibuLdxKh+FCU4cW55oTJ09e94YsCdvw/R/wwUlKSZF
         vmCG54DFuAoGEKFtlb47vXJcroscT8JpjOzl0ORv298ieZgMJCtnefOZDEPcBe2+V8VW
         Zcqp6tEAEhBOX4ZtSaC+b9a1Xcg/n8cqO/riPXr0edrkh3jamLWoDFb8o67J21A2DgPB
         rBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lTf+Sd5yaFapTCjKu5qesxFzYkBarG1WB0tnN1EJVIU=;
        b=U7WGcJzCKDlmIp/Z27k5WrqSzRTcKbcZwDvhNU4LlwGyKY2P6hOc+rOuyj50kCTGUA
         GUjdtDjnpFFG9dn+09FUddhZzQqScTu/TA5vP8U3RWNojnG2ONHEAOFyokVpVu+1GyKu
         rxB03wXViubYXevH7dK3GtHgS4R+ghz1LaLUN0TFPVKQ0/9WpubV2ayWnBj4pkM2XgSE
         uZv4asLm9BcFeIkSTaGgt6c46Hjw42QxavdXcF53EdXEZKaSbx/9dUb26XFRUbe5sqCV
         QlNxcbZga2URctS1EPg6f/n9hbVLzFOwqlZ6BX9GN6BIdHVqq17vo4AhZtOjpGIUOQan
         sUlQ==
X-Gm-Message-State: AOAM5301luubERIXurW3y0rSj5dZwleveiNBzJyaU8JnS5iMLZvmpjaG
        ZKH4HQxq23JdbxgiEQMIJOI=
X-Google-Smtp-Source: ABdhPJzFClzGVLeB+bU4YWUUIW9B/nQ4MwkVTdSTM1g36ZiNtF/Kbz+8nr0s0q0oKu83w/dMWH+qPQ==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr4389225wmi.185.1591710154732;
        Tue, 09 Jun 2020 06:42:34 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:34 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 0/7] bmips: add bcm6345 reset controller support
Date:   Tue,  9 Jun 2020 15:42:25 +0200
Message-Id: <20200609134232.4084718-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM63xx SoCs have a reset controller for certain components.

Álvaro Fernández Rojas (7):
  mips: bmips: select ARCH_HAS_RESET_CONTROLLER
  dt-bindings: reset: add BCM6345 reset controller bindings
  reset: add BCM6345 reset controller driver
  mips: bmips: dts: add BCM6328 reset controller support
  mips: bmips: dts: add BCM6358 reset controller support
  mips: bmips: dts: add BCM6362 reset controller support
  mips: bmips: dts: add BCM6368 reset controller support

 .../bindings/reset/brcm,bcm6345-reset.yaml    |  37 +++++
 arch/mips/Kconfig                             |   1 +
 arch/mips/boot/dts/brcm/bcm6328.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6368.dtsi          |   6 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-bcm6345.c                 | 149 ++++++++++++++++++
 9 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
 create mode 100644 drivers/reset/reset-bcm6345.c

-- 
2.26.2

