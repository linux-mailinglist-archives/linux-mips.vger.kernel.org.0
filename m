Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13960B25CE
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389763AbfIMTLn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:11:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35208 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389759AbfIMTLn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:11:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id n4so15740120pgv.2;
        Fri, 13 Sep 2019 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zB86a38t1j6pUZX7wKvKorzViHS3w+ckWmUmwp2h98E=;
        b=gI7HG/XiUYh1Ao5+fEC3rcxYJuPN8EUGQq+DlRy7ZJ37U4S8LjOzSVFBmtuJq/gbfA
         14T0ut9/EOlCiuRj6xvuZz4ifF9MUWmkeryAIKF+kxYdHJqNEz3oXbC5BAIF8NTe6Bt2
         XRTBc7grg0kubTUQBjMR4jeg2jhcr+9LkP9LOAV4PNS//Pg7pcYxrWvRyUJrhxzIICp8
         oKz1+PAi7B3oa1rA/PIpDdCyjP/tNElWPXCUNt4ANAbZy8pFFrkDhgXjcVbTsWNXa61k
         d0cfgRtzxvBhIlBk/ANreARsylptwd5yS8ErdzUe8m/PQ7JC7mTe4my6pCA/H5kLlw10
         PrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zB86a38t1j6pUZX7wKvKorzViHS3w+ckWmUmwp2h98E=;
        b=Y0P2GEMR3MnuJhQ/TKCjqVmoFz0F6OySQSEzr1UTZKwfHJWMKDhp6tG2NJF16tZU+m
         X79FpK9oEZAl3zXLFMl7mN29vjbcNqjYh4fzLlWJCRRXE9sD7Kwuk1OxI5r9FckJKdf/
         mgWPNX1SwVcxzJcwFjpcUzLClJvYcE5NCMjtWC+vC11YnpwlLjpFmcsBUPYG7P9RZhH/
         AEmc+sHOQYxthvdTH7xPuBbrlR7ShkPtA6g3c23RapR/OdsoNdY/p7p5gQe/DI02LXFs
         jq5TYW+V7Vc0OOrKNcU3i/jQAanNxbbCbnNIzxEyUqyg8KsCGz4GVXjGpZGRFxM5vwqz
         ND5w==
X-Gm-Message-State: APjAAAUYZMnurgGo9tTE54b6UBrCh7Hn/R0TITd8PDQW7us4hDh8FOZm
        XbQLOdPrlAp6WZfg/HWhmbMbKGfUvyE=
X-Google-Smtp-Source: APXvYqw4n6cKLv1Cs9UOwQMhtv0NBTQj3q8b1m4DAIG+l+RyQ5psZVTENsDUHI9MZwX+E/djQh7vFw==
X-Received: by 2002:aa7:9d8d:: with SMTP id f13mr58858236pfq.196.1568401830211;
        Fri, 13 Sep 2019 12:10:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm27273779pfc.3.2019.09.13.12.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:10:29 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH 0/6] irqchip/irq-bcm7038-l1 updates
Date:   Fri, 13 Sep 2019 12:10:20 -0700
Message-Id: <20190913191026.8801-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc, Jason, Thomas,

This patch series contains some updates from our internal tree to
support power management and allow configuring specific instances of the
brcm,bcm7038-l1-intc to leave some interrupts untouched and how the
firmware might have configured them.

Florian Fainelli (5):
  dt-bindings: Document brcm,irq-can-wake for brcm,bcm7038-l1-intc.txt
  irqchip/irq-bcm7038-l1: Enable parent IRQ if necessary
  dt-bindings: Document brcm,int-fwd-mask property for bcm7038-l1-intc
  irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
  fixup! irqchip/irq-bcm7038-l1: Add PM support

Justin Chen (1):
  irqchip/irq-bcm7038-l1: Add PM support

 .../brcm,bcm7038-l1-intc.txt                  |   9 ++
 drivers/irqchip/irq-bcm7038-l1.c              | 117 +++++++++++++++++-
 2 files changed, 124 insertions(+), 2 deletions(-)

-- 
2.17.1

