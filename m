Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94CD23EB22
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 12:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgHGKER (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 06:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgHGKEQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 06:04:16 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8235C061574;
        Fri,  7 Aug 2020 03:04:15 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r4so1123909wrx.9;
        Fri, 07 Aug 2020 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilj+jHSrr7fgeW0N8XtndxSzf6ChxxOAfy0ozga94ZQ=;
        b=D+ftc/u+4NLk5XDCkRCl1DFzQwEKTMyO3ARkbOOUEUOXmKRZG2D7eacrkv3JdE0Beu
         KLGcfQ+KiG07mhXKRwuwamZNo4yfDr35vi2QWA03Zq7qJj0G0fTGf2ndlFslzkE3SkX0
         UW6ZW7e1nNg6rqX9+k5A1muUiOBnRR/NDwYEwiBAgMfg/3iOTtzhgAGyDR0AW4FT4TTx
         3v2VDPDQFsBkGilDvZzWnmgQPooAF+13w7D0/J8Ig3g5P6k+dvQK5COZgTITrSbcy4VF
         gwFS91ZRcMR3aUN1nUsB1dPHP7oz0tWoVfZUs/IQfaxSAKunzoTH8Mh8v+OHw7bp7O4g
         2fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilj+jHSrr7fgeW0N8XtndxSzf6ChxxOAfy0ozga94ZQ=;
        b=shyh+gdYo2Kn86OiWx8FGBRO//3L4SMTS3uJEXY7ycBAWMOYwvozK8qX+AW6+lULaY
         lcxa/NBdHOWpHAfaWRlyxLpy042Dq0hwheMxArJ7mj25bhpIp/3zj14Y/a/kmzTwEWxp
         J2Cjwe6vIukFgd8EHOxWnXBPcDGjObmlaNide6dNXN4OnaPo1oM7gZEXZxthYrrxSfkc
         MfCoNOhWIbeqe0xe5l0qkea6sjf8ZnAQoGBFmBXcDpdsli/AyPCcTavVu4OeOKKaOlW1
         Ko4MNEex7Y/QY/jEiB1A0Gu+HkJ86jysnRMyssL2OCAd8iRLaWGReaeMFlTSGIkRKq8P
         36JA==
X-Gm-Message-State: AOAM531wh7DkLuU8hkcjChP9PYBBCy0UAujuUoJ10OR3RPCsOixl2tFw
        v7kL9ZWOPJ2P8ho+oTaAUb4=
X-Google-Smtp-Source: ABdhPJygP2NgMTBH96qrrG7050/nsTUeTYmwPhB8leMFRxMNDt46uSUrFqciP+laVCu9+YiyTViw8g==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr11188293wrq.404.1596794654504;
        Fri, 07 Aug 2020 03:04:14 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id k1sm9875402wrw.91.2020.08.07.03.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 03:04:13 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 0/4] MIPS: BCM63xx: board improvements
Date:   Fri,  7 Aug 2020 12:04:07 +0200
Message-Id: <20200807100411.2904279-1-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Theses patches improve BCM63xx board declarations and source code.

v2: switch to SPDX license identifier.

Álvaro Fernández Rojas (4):
  MIPS: BCM63xx: remove duplicated new lines
  MIPS: BCM63xx: remove EHCI from BCM6348 boards
  MIPS: BCM63xx: enable EHCI for DWV-S0 board
  MIPS: BCM63xx: refactor board declarations

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 625 +++++++++++-----------
 1 file changed, 306 insertions(+), 319 deletions(-)

-- 
2.27.0

