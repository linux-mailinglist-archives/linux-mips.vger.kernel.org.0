Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78A1323043
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 19:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbhBWSJ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 13:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbhBWSJZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 13:09:25 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD456C061574;
        Tue, 23 Feb 2021 10:08:44 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id n4so23552057wrx.1;
        Tue, 23 Feb 2021 10:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iwA6k2udcIWazgsD7KMZFuIhReErgsHT2KV6vMPXjo=;
        b=V1G0PHrhZ4UmnDBFdTXtlbCpNVJgqmsJS04GHQ91cYa7ZpBI6c8ozUaBWWpFovFLyW
         jDt2W05JNdvV7a1DncElvDc7f9Kq2/FBkKk7Wdtfsa+6xJVSFYKQKoqVZVMAkC2RznWU
         DZTbIhWi2jC1spqe+uonetd1mRHsrcPiA0mx951QUzXyvBxktXQydoguCpcc7EK2/gEH
         Pbxri8Hgy0DsMjrlO65CYjGHBpwKaIsNAdM3MI47qoI8zwAKU502ZVfj2IoVvxJ5CJvC
         hbm0gBlhqvyDvkdHxSLyBQDUIJgIoIaUxGQ9pqZZ0K/nrbeFCGYtAlONMrNwJOYn9Vv9
         Xcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iwA6k2udcIWazgsD7KMZFuIhReErgsHT2KV6vMPXjo=;
        b=csaQgBtp9XE6UWFAwnNymFDYjkxnhBqY5cXmWFzBARdvLqcoRPaKQCkKTyUyH3P1cj
         50B5jooCxlC6drL+36UtXKMx+yaRjudye/3NMy5oebmP3Sr5RALBiV0IHOsrzOxfz7Ou
         uLA4qi6FW0hNikqGGWXuGOBrDnqoMKWKLrmhUcA9Nix9Tn7uFdWnfgAuaUP+FUKp2OQ1
         LsCXzCqnBjpZBYZco/WSGsXFYTgwu1d0UVZ4azfiumDSyfD7X24xdO4o/8uNVqxnwmv1
         Q0TB8tr20gTYRrSasodkfAcFMU8SVxjvJ5Wcy7NQP1qlvDv622Q2VgTKU+60Z2n6Cp54
         ZrDw==
X-Gm-Message-State: AOAM533lgG4Dyz2Z1j5ONVHALuApCG1sPrJxcX1w4EnjhJmYv2E1/9H4
        2EdfIAEAmwVxQfd1iEX627BWYhiFAA5tprft
X-Google-Smtp-Source: ABdhPJxHhTl0o+4wyil5am89fRmV/YALN1F94lTErQk4gOAVwT/8YfUTMZw63LLPnarNlbJaPI0xWA==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr3538693wrm.361.1614103723608;
        Tue, 23 Feb 2021 10:08:43 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id v18sm31101709wrf.75.2021.02.23.10.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:08:42 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: [PATCH 0/2] irqchip: add support for BCM6345 interrupt controller
Date:   Tue, 23 Feb 2021 19:08:38 +0100
Message-Id: <20210223180840.28771-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This interrupt controller is present on bcm63xx SoCs in order to generate
interrupts based on GPIO status changes.

Álvaro Fernández Rojas (2):
  dt-bindings: interrupt-controller: document BCM6345 external interrupt
    controller
  irqchip: add support for BCM6345 interrupt controller

 .../brcm,bcm6345-ext-intc.yaml                |  61 ++++
 drivers/irqchip/Kconfig                       |   4 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-bcm6345-ext.c             | 271 ++++++++++++++++++
 4 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
 create mode 100644 drivers/irqchip/irq-bcm6345-ext.c

-- 
2.20.1

