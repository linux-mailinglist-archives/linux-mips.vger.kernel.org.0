Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33FB33A6C1
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhCNQoX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhCNQnz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:43:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF82C061574;
        Sun, 14 Mar 2021 09:43:55 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso18820070wmi.3;
        Sun, 14 Mar 2021 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZGPjlZ3z0iXHQbgOKcnyBMwe3feJrOyy+y2zWfZeH8Q=;
        b=AO/qcESlKKsnWnsVSJ3QJ/Ia2G5HoTdPpgcPgtsAI+2iuO5hRQyyxl8p0ySfv82td8
         VSiMyLBch1/5T5D1yOvX/cT/J3olL1MpK0noCYVTD6lh2v5bDnhL2UlDU1JaQerphRWj
         CHDx3SFdDjoHzABegG7Ay90TdcfyLL4+AlYkVspszfKN8OHtvoBelYcJvbrfufA46ffI
         4wN8uqdxtWAvDCdGzvyluuiF8XyySV0Pk9FfdI+ekP02ySKRPV/sQkXFUCydyPCszF4K
         4sQxjIoIakk1qFQ/hfmt9iYCervW8ETM3OWw7OToJD8k8vRnrxY8+9qekDwdZtZ2oMPQ
         oUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZGPjlZ3z0iXHQbgOKcnyBMwe3feJrOyy+y2zWfZeH8Q=;
        b=bbTF60Jay5dzGxKQrYbqQFqd6JXnhR18D4m0EqN8UyO//wsg8RsphK4RBmCZsCWJIU
         HP5T9deSbVuKOyDRbZ4gIHdZAvyaaycidneygyGIOW34OAgSChwEhru92Rd3EQMqr6W0
         vsAdwa1hWH8xDdEiGV1p8u9xOM1nZ90p+Vx8CVGazjhkUnivMCnnVlIeRPfNbI36WGGW
         X86do0djK/Hk4906LUcrr9puwN9XyFhjiID3eodfXm+RHytYiAJt6YZQTmfz6sMMfuyH
         0NefaK3HMe1wps01ZSXqQnPmjT25DtNdQPWb3EUVHHppyeGXom95DoeHJPOUMXCJVFz3
         B9Xw==
X-Gm-Message-State: AOAM530hr4uVAMXixA5tVnSvDkPfDAYPwW0/vLyqQRwDtOKPHysf1JX4
        tJY9iGdmiLfVsvd0equrkQ4=
X-Google-Smtp-Source: ABdhPJwA2RvjSL6O5aWPID5G40urpELEgdzEBwnG9qhMn2FBbZtUpJpt1Zyuw4fGOz7jp5pA4BuPTw==
X-Received: by 2002:a05:600c:290b:: with SMTP id i11mr22790061wmd.129.1615740233737;
        Sun, 14 Mar 2021 09:43:53 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:43:53 -0700 (PDT)
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
Subject: [PATCH v2 0/6] mips: bmips: fix and improve reboot nodes
Date:   Sun, 14 Mar 2021 17:43:45 +0100
Message-Id: <20210314164351.24665-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These patches improve bmips bcm63xx device tree nodes.

v2: add missing BCM63268 patch.

Álvaro Fernández Rojas (6):
  mips: bmips: fix syscon-reboot nodes
  mips: bmips: bcm6328: populate device tree nodes
  mips: bmips: bcm6358: populate device tree nodes
  mips: bmips: bcm6362: populate device tree nodes
  mips: bmips: bcm6368: populate device tree nodes
  mips: bmips: bcm63268: populate device tree nodes

 arch/mips/boot/dts/brcm/bcm3368.dtsi  |   2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 132 +++++++++++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6328.dtsi  | 119 ++++++++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6358.dtsi  |  85 ++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6362.dtsi  | 129 ++++++++++++++++++++++---
 arch/mips/boot/dts/brcm/bcm6368.dtsi  | 129 ++++++++++++++++++++++---
 6 files changed, 530 insertions(+), 66 deletions(-)

-- 
2.20.1

