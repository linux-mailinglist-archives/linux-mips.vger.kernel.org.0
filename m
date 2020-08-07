Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4E23EA7E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 11:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHGJi3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 05:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgHGJi3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 05:38:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF70C061574;
        Fri,  7 Aug 2020 02:38:28 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r2so1053947wrs.8;
        Fri, 07 Aug 2020 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRA/Ec1phDZ9ifdzzg+f1VG1p8nLkuX/lWSlBezr99E=;
        b=SwKLz56aHUSNaW8koc8LXzIObdcIuOessqMSkz6aarQTsbi3QI6ZDydboBg+1ySQjv
         Nlq0xx12Qw0vktDMc/atfbgFWAaG6VQvi7MZ/tFbMSYj73iD6Rmc/HTMdFVBSvJDXoAN
         iGi2qyrYHtY1dwapNnTzR91qq0OyQMD3fda7uW60gzmIwORKE8kGXES9dGaKfct/uXyT
         0oFg/SECZ7HPb3VPKcxfxdZfTc7rlhrgWkVmEEfbjNXoXhk3603Nxq2mGA8XRV9fT6Sm
         t5lfyDrR8eFIFB2Wx3x0Gl0pt53ADtXCAV+w1tC+0vRxXcAblGuSIySBM91qZuIBrySQ
         Q1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRA/Ec1phDZ9ifdzzg+f1VG1p8nLkuX/lWSlBezr99E=;
        b=j4A+Me2H4OCS4cbuWgHL9EeQaZy6ipXUAsxTlNu3At8tvEWwmWa9z4+QgFSrSrB+o5
         P5iGudfx71jl2VpE+y3+ZaOcgPVVOqpDdYYHcBjtbp7RbsV9QN5v1/YdFMA2zB2HYLo1
         JDf+tb3Ojoc2i57lsbnmssb+twS/bkzmSJIfJyi8wfaKpEd5nyv/x+EhwOZjBgpQc6DB
         uH3goqDjBkXRWgOeYBt5k6YhLBuLP3VQegxxQo5fglHep7e68dkCmU3/+E9wiI77MABq
         AkLYbuSuu1bqE8ht9ExJKkQMqsxxOoidZeVjQ6+eHeMQFIyHDVBMrPPio1mXzgt/D1Bu
         Qs1A==
X-Gm-Message-State: AOAM532sz7t/dVqlXygHx7lLVTj3Ov2sm+ZlO446zcxn43FuAfxvSbIC
        O4MzAz7WXx7ttoc0ag1I0/8=
X-Google-Smtp-Source: ABdhPJxVX6qDldtW3OvRgpYMyVjMJAimJ+1fr0tKWw+0Ev0dH3Yqra6+hmAYjC70DmDGqmZp8ivZ5A==
X-Received: by 2002:adf:8bd3:: with SMTP id w19mr11111730wra.167.1596793107428;
        Fri, 07 Aug 2020 02:38:27 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id q19sm9460529wrf.48.2020.08.07.02.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 02:38:26 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 0/4] MIPS: BCM63xx: board improvements
Date:   Fri,  7 Aug 2020 11:38:21 +0200
Message-Id: <20200807093825.2902474-1-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Theses patches improve BCM63xx board declarations and source code.

Álvaro Fernández Rojas (4):
  MIPS: BCM63xx: remove duplicated new lines
  MIPS: BCM63xx: remove EHCI from BCM6348 boards
  MIPS: BCM63xx: enable EHCI for DWV-S0 board
  MIPS: BCM63xx: refactor board declarations

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 622 +++++++++++-----------
 1 file changed, 306 insertions(+), 316 deletions(-)

-- 
2.27.0

