Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8317D77ADD
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 19:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387935AbfG0Rxa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 13:53:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53423 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbfG0Rxa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 13:53:30 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so50458666wmj.3;
        Sat, 27 Jul 2019 10:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5Pf+L6T7LGnEPjG+nasSZ7r1P10azWA9olL/Fum4o0=;
        b=kEPiz8AmY8MPEC1hi8xUhQLHX6PnlGuAGRJoemg+Cp+uqv1zP6b0bgpZ7benaFRIlk
         sIRJUY8rqb7UVMOqkHrqKEwjkJtgHYI5Q/8+EYLmvlhSnYG24TosX7WNNuyA/O4nRIEz
         0zmWqT//Mu9w+m5VKs6SAvOmTD5sYj33D8vpq6znOdaFMMKIVk6ygD1OAPCMO7TNW7hz
         nsiH1vnquw2dVo/EZ4wmqjwe4EhTEKZJ/8wcog6NoS5VTGIu98YmwyxGLRYerHDt9EJH
         mdal93ymuyJggbWpkBoVK6nyJoYRmN0NGquqBxTGDTkQIBiKxAx9CdV+w/xvCeJCVDcf
         0S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5Pf+L6T7LGnEPjG+nasSZ7r1P10azWA9olL/Fum4o0=;
        b=ejvGJhPb/LhTI/GcPAitLNgsHg3RiNh+ukIX8a2PVJPZIU5oJGHsnYZ/NN4IfVJ5x1
         8lkpu7joSC1EdzUUEGYtmTj/OkVFR2eFXTxb/uSzpSU0VkZ8dg7Aq3hQLx7UA8QDE9w9
         MIY0MBSEHON4ZC3CtYOXpfVJfRj5Rc6pcQqCpX9qGdbaHNOqiNldsbw6zsi8vw/NbVyz
         Tcqc6xLdPJ8uGJAWiB6O1DCv5Ms66KA/bXd8Ne8WJwFhLwodTulO61f9yei/fbZ1oN2G
         UwF+r/gJbA7IAFKH8BZKJ5g+tNSQsGvHVXzUI9g6XJYFRS4ZVfaZ8VrdM3+kXRke6Pxq
         3gDw==
X-Gm-Message-State: APjAAAUjqIOb5p2vmTMftDIgjLjffMZXGYvMpP5qOvxBhoFSPQPNXoC2
        IwBYVMidXY6onKA+jYTxDaA=
X-Google-Smtp-Source: APXvYqy4wPmBjjT9qioVUplXDcHwwKWmq7M7JPXcwVbstXr6+HbrIRkzsYorpImk7CCmB5VnO+IrWA==
X-Received: by 2002:a05:600c:1008:: with SMTP id c8mr91665431wmc.133.1564250007899;
        Sat, 27 Jul 2019 10:53:27 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id t1sm67705423wra.74.2019.07.27.10.53.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 10:53:27 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/5] MIPS: lantiq: EBU interrupt controller and generalization
Date:   Sat, 27 Jul 2019 19:53:10 +0200
Message-Id: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The relevant EBU code which is touched by this series is:
- initialization of the EBU WRDIS register on XWAY SoCs (this was part
  of arch/mips/lantiq/xway/sysctrl.c)
- initialization of the global ltq_ebu_membase variable on XWAY and
  Falcon SoCs (this was part of arch/mips/lantiq/xway/sysctrl.c and
  arch/mips/lantiq/falcon/sysctrl.c)
- handling the chained PCI_INTA interrupt (which was previously managed
  by arch/mips/lantiq/irq.c)
- configuring the PCI_INTA interrupt line (which was previously done by
  arch/mips/pci/pci-lantiq.c)

Instead of having the code spread across multiple source code files
this moves them to one "EBU" driver in arch/mips/lantiq/ebu.c utilizing
the irqchip subsystem to implement the PCI_INTA interrupt line.

While here this adds the dt-bindings documentation for the EBU IP block.

I believe that this series should go through the MIPS tree. However, it
would be great to have the irqchip maintainer review patch #3.



Martin Blumenstingl (5):
  dt-bindings: MIPS: lantiq: Add documentation for the External Bus Unit
  MIPS: lantiq: use a generic "EBU" driver for Falcon and XWAY SoCs
  MIPS: lantiq: add an irq_domain and irq_chip for EBU
  MIPS: dts: lantiq: danube: mark the ebu0 node as interrupt-controller
  MIPS: dts: lantiq: danube: easy50712: route the PCI_INTA IRQ through
    EBU

 .../bindings/mips/lantiq/lantiq,ebu.yaml      |  53 ++++
 arch/mips/boot/dts/lantiq/danube.dtsi         |   3 +
 arch/mips/boot/dts/lantiq/easy50712.dts       |   4 +-
 .../include/asm/mach-lantiq/xway/lantiq_soc.h |   5 -
 arch/mips/lantiq/Makefile                     |   2 +-
 arch/mips/lantiq/ebu.c                        | 238 ++++++++++++++++++
 arch/mips/lantiq/falcon/sysctrl.c             |  17 +-
 arch/mips/lantiq/irq.c                        |  11 -
 arch/mips/lantiq/xway/sysctrl.c               |  21 +-
 arch/mips/pci/pci-lantiq.c                    |   4 -
 10 files changed, 308 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
 create mode 100644 arch/mips/lantiq/ebu.c

-- 
2.22.0

