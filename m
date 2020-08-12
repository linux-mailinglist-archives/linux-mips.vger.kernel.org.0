Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D602242652
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 09:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgHLHwk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 03:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgHLHwk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 03:52:40 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F30EC06174A;
        Wed, 12 Aug 2020 00:52:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a15so1091128wrh.10;
        Wed, 12 Aug 2020 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k795cS87OwKuyVO3rujC6YZeCCmb5P0Upy5SIYYKgDo=;
        b=mbm+Mb1LVfp1wM95jDePVO+4Hamx49VtFfDg2H0PzGP+/WEmkz02+JrVumPuF6Q1L0
         OYcA4pXP6TREQEy5gDBSuOah5XNc45V0rBSUb/74QL6kM0YwPZqTSqJXqrMhh620kAr8
         fF29dctU7W1XDf3NXrnbHVUlXZJ16xe52UH+76C8xU5/bmewRvh37Fk9EyGzhi+2FsNu
         idYV/8sF4eo+vVaWDP2CBnBHMyrloUR8qjWkFzTeHELq7z8660xTcBaJJIO8FYpAxIno
         QmDi9VodB1GQd5bjRwfzw5JuFS2pFdfA0dabJwRqYIuChqx4q5mssOFsxqxDxQPX4UOM
         ocqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k795cS87OwKuyVO3rujC6YZeCCmb5P0Upy5SIYYKgDo=;
        b=HDDhreBPIJZawBydVG8ck/RjnjzZvmBrkhJA/BfpKzvbR6Kxp7C8odQe13nQ1/9yMj
         JmkfoZylE7qAtKA0AKJ0d+icMtH0R2zgVegrAApn8sosW1ZBBpgEO8yD6E5HM3pMzHe1
         6BEzilrvJBZaFm9G8uFOJ2Aygae/q8Ah/86zcfR1jSmUfGFRqY/ffRKupQx8lUQUr/QM
         INSERIWLKcVdQ9g19LgY2YTFDO+RhVVVCiB8LRslJlXx9HsMaNTlrZdVb0v9oezSb28d
         KO9HiALr6jMA80vSIHjn1KIRxJQwmEL9PJE5Sl5XApmKtDJJmnvMlhd1ZmQ5kwsqdqdo
         kvCw==
X-Gm-Message-State: AOAM532LHIW86quuvdOStKMRPEdlknsrWapU0EsyrjamOpBtnK+VABf4
        v4iM0XNLsgTJ641vetN6AtE=
X-Google-Smtp-Source: ABdhPJzknrzfXN9Tkt6EkQuzqcitN3D20GBfvMDx/Rx/iPuj3YEEifWby+hgjNx8nGBtZWji//sytw==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr32710290wro.307.1597218757537;
        Wed, 12 Aug 2020 00:52:37 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 6sm2470984wmf.4.2020.08.12.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:52:37 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 0/5] MIPS: BCM63xx: board improvements
Date:   Wed, 12 Aug 2020 09:52:30 +0200
Message-Id: <20200812075235.366864-1-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v4: Split license change to a new patch.
v3: Reword DWV-S0 board commit description to avoid possible confusions.
v2: switch to SPDX license identifier.

Álvaro Fernández Rojas (5):
  MIPS: BCM63xx: remove duplicated new lines
  MIPS: BCM63xx: remove EHCI from BCM6348 boards
  MIPS: BCM63xx: enable EHCI for DWV-S0 board
  MIPS: BCM63xx: refactor board declarations
  MIPS: BCM63xx: switch to SPDX license identifier

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 625 +++++++++++-----------
 1 file changed, 306 insertions(+), 319 deletions(-)

-- 
2.28.0

