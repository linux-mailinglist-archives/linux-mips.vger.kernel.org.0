Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB37145E17
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 22:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgAVVdv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 16:33:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50846 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgAVVdv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 16:33:51 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so283851wmb.0;
        Wed, 22 Jan 2020 13:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OTrm6LuWBv0/YMwbvKMuzQhWw/6VZQ9ZG3P7VHtMSIM=;
        b=c8tRf39ItktteljlT7FffnkYsvYDcI3IWBP5NTaHeuHGtVSiq0+WtrLuXXwhJ7XO+/
         XrTJS1n2lXBbVf3mqnyU384R7EQ+EEIutQ3xW3jJl5CtSJymUsYpZLwpoA6hg3xcR+7k
         Oiuhc6IlsNrPcXI3E2M2agxAL0pINtAxE+/YR+RqvFQ4m8jJxCuMyV4nI1F2dM9OGMGl
         TZoS/oh/TluL+ktbijLrQUIpv6qoH5xo9fxvPXH/tsaeTWTm/GP3PrnNaEj6Xrk2LGb6
         9FMrjVgKibs/aepnfx2PXy4k1a9c8QsDoFk+gZhis52So9b42QrMAGu6Js9SgmXxHbOg
         kB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OTrm6LuWBv0/YMwbvKMuzQhWw/6VZQ9ZG3P7VHtMSIM=;
        b=ZqVvGQK5EjjsBya5+VlniKlLItG/uUbKiNYR2M/7S4US2cbVZS3hj5AU6AdPtV6SiP
         mBy0whP4Gx+xNTJtpRrWRA10+hAMCrbSxBZIZ8kBiOOb2ZWXa65uO+Cpm8CkgdS4CwH5
         NalqH7Ce230NGeXwA3vacOfSSSNoFvTU5hj7ft0TyZVa0ZURqIKuoI11ijwG0eA6A+BJ
         EYSzdkAOIwg31f9LAuZomCpSa9Wq7o0QlGB5s/7cF29GaS5iscfjeIdlMwARh+qYjUFm
         Eu8iO42DEq1lEFm4FOr1iob+dh7UYg6KyXmb88uDGf9n+fVTQJFMI1kHMMDWmUb29HbK
         WYXA==
X-Gm-Message-State: APjAAAX9epXuG/xd28aYJrusTXGXK5LUcdYner6gF8Ko/ZMrJOan/KMW
        ZbRP7BTRnZDePfhILGNqyRWsyb49
X-Google-Smtp-Source: APXvYqxiiA4W87BxO4EFj0stiKNv0mHUYQt1b7kZwMG05Ed7bQdYgKtENWWyzCRoWwH343smsudGbQ==
X-Received: by 2002:a1c:3906:: with SMTP id g6mr206005wma.49.1579728828617;
        Wed, 22 Jan 2020 13:33:48 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 13:33:48 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH V4 0/3] mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers
Date:   Wed, 22 Jan 2020 16:33:10 -0500
Message-Id: <20200122213313.35820-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

V2 Changes:
Refactored drivers/mtd/nand/raw/brcmnand/brcmnand.c  based on initial review comments 

V3 Changes :
No change ignore this patch set 

V4 changes :
- Included cover letter to resend the patch set 
 .../devicetree/bindings/mtd/brcm,brcmnand.txt - Added Reviewed-by tag
 arch/mips/boot/dts/brcm/bcm7425.dtsi          - Added Reviwed-by, Acked-by tag
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      - refactored code based on V2 review changes 

Kamal Dasu (3):
  dt: bindings: brcmnand: Add support for flash-edu
  arch: mips: brcm: Add 7425 flash-edu support
  mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers

 .../devicetree/bindings/mtd/brcm,brcmnand.txt |  10 +-
 arch/mips/boot/dts/brcm/bcm7425.dtsi          |   4 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 293 +++++++++++++++++-
 3 files changed, 294 insertions(+), 13 deletions(-)

-- 
2.17.1

