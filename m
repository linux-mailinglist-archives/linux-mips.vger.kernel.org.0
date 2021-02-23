Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48528323247
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 21:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhBWUoe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 15:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhBWUo1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 15:44:27 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE457C061786;
        Tue, 23 Feb 2021 12:43:46 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m1so3654778wml.2;
        Tue, 23 Feb 2021 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Uq6CUCBhhW7miA+1Vr5da9UH6aaggOorzfhtY5yTY4s=;
        b=bzYWGjSEzzgIYQXCqxhSPoH5OmTrN5FyF29IGCsVxpKj1XR8HwQRHiP7B4fMMl8Jsm
         /zsPK7y5hAT+JWIUgZcJWPdjnNQjrohDLi5BKWXICS5Vawca0LAotXoLozrS77ug68el
         qHOYLTVMBIx3ijD6TyIyfDObiwRGKTKSv8UycFK4cJbCQQAcIkYwG8/2AXWKI3Ae7dH+
         Oz+LXpOYG0fGuvGvw50h+b0IkUXRVgKnNtZVDCp742PivvtIriQcqz6K7+MMqStgu7ub
         YZLDZ/77plLFefL+JqeVF3EGG0LvODTJnUed9OqtblSUJdtvYGxS+jV4FP5WhFcL/Y/R
         3Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uq6CUCBhhW7miA+1Vr5da9UH6aaggOorzfhtY5yTY4s=;
        b=Ax1vPR2PzlIFlEMCALc+azjW72yjrYRh/i9sY6hzXkpQYBQzX2elHf1CR87BYBxLdI
         oRFccVWN259Rmv/sp3HxJ/G1KaAWDXtJoXEyezKnHQGIeyaEKR+IT+W4fVaNH/IT7QGD
         GJqvQZeg9WhI0vbtq+2yIfFCCrb+WrEu4sTf4mUg8Yoegrm/pNt/RzydeU5lL+STwBRv
         Bl3TOCEUBUQ55JkmqeLe0CHmfqaorNUgwfQSG1RnH86F8wsUlSAXr6WrlWrXoiTgqVvC
         04xo/0okzPGwi3BqYLXt/NBHGdVp1Pg/GsgbX+sN4Qnwvc5x89UBp04o66yXcN+no4OX
         vcVA==
X-Gm-Message-State: AOAM5317Vmgb3cCeisHmyMmn45D15JVlgPkTvhop8e0LdbBZYzws2Ie5
        QFmCFQL5+j4E2QDU6+LEK8OXJrGEbcOqen9I
X-Google-Smtp-Source: ABdhPJxM0+cOlmdG8VkcQjM7WiB0Lz4seM+NV2HB+NMFciVAuESONndurlO8uvgT9AFPvrrmpwHRJQ==
X-Received: by 2002:a05:600c:4f86:: with SMTP id n6mr544671wmq.22.1614113025463;
        Tue, 23 Feb 2021 12:43:45 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q140sm4048935wme.0.2021.02.23.12.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 12:43:45 -0800 (PST)
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
Subject: [PATCH v2 0/2] irqchip: add support for BCM6345 interrupt controller
Date:   Tue, 23 Feb 2021 21:43:38 +0100
Message-Id: <20210223204340.312-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223180840.28771-1-noltari@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This interrupt controller is present on bcm63xx SoCs in order to generate
interrupts based on GPIO status changes.

v2: fix documentation title typo.

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

