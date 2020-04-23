Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878121B544D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 07:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgDWFm6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 01:42:58 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39819 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWFm6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 01:42:58 -0400
Received: by mail-io1-f67.google.com with SMTP id w4so5122489ioc.6;
        Wed, 22 Apr 2020 22:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gmCpsolV5O6IrBICHK4TbSGq0+YV2uB2pTUJIO1xgPg=;
        b=I0erHkM9gab2v6fIm/fx9sY8JccCgcSBStlCz385vJAPG9YuLcg9qAX+jMoRXwqUk+
         ausA3ZEJUt0I2WMsPso/MtHa4VrUqdOLCjkYAvOYVEiiGTtlSyz6b9KeTY3XIWCBLjsc
         CvjWnYdz1DRFJhff0883zp8KW/d/vcdmLg0b1ICVc6MypJkIqSy0euo9spetjT/eX1If
         GYt5Yg/yXN+JZyv6Jxzkk26eD9ZMD8MjbMy+QHf8qWLEgBE5UBmDLSW1PimKmQxK6fJC
         b9+TTe6BJfVIg0B9UTtAow7r35joAzeucB/0maq0O7/SnfhF0ehFQMiq9iSmZQEYcYhD
         O4Zg==
X-Gm-Message-State: AGi0PuZSkufsw/aes9zq5p/0xsXn2uSDyqgRaqqB+9CDNWbTqWGHz1+M
        eO+p2AMuKc0i4p+LeN8iq74wO4TJmDtQ1QgH0lU=
X-Google-Smtp-Source: APiQypIsomUxi7LXs971z/6bCPclQ9Yy5q0il+Vgc/GXU9zRdFij6HYKYfU6mC4VjIKigwxWLOddJLzfuGIzAxd2cbk=
X-Received: by 2002:a6b:6c01:: with SMTP id a1mr2149899ioh.196.1587620577403;
 Wed, 22 Apr 2020 22:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 23 Apr 2020 13:50:20 +0800
Message-ID: <CAAhV-H70zSz0T5QYHXAEZP5vJA67+8XRsx8n2wgdpfjigaiofg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Loongson PCH IRQ Support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

We have established a rule before, so please don't call the PCH bridge
as Loongson-7A or Loongson-7A1000. You can call it LS7A, or Loongson's
LS7A if needed.

Huacai

On Wed, Apr 22, 2020 at 10:26 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> This series mainly added IRQ support for Loongson-7A1000 PCH.
> DeviceTree will be added later as PCI support is also pending
> for reviewing.
>
> Jiaxun Yang (6):
>   irqchip: Add Loongson HyperTransport Vector support
>   dt-bindings: interrupt-controller: Add Loongson HTVEC
>   irqchip: Add Loongson PCH PIC controller
>   dt-bindings: interrupt-controller: Add Loongson PCH PIC
>   irqchip: Add Loongson PCH MSI controller
>   dt-bindings: interrupt-controller: Add Loongson PCH MSI
>
>  .../interrupt-controller/loongson,htvec.yaml  |  59 ++++
>  .../loongson,pch-msi.yaml                     |  56 ++++
>  .../loongson,pch-pic.yaml                     |  55 ++++
>  drivers/irqchip/Kconfig                       |  26 ++
>  drivers/irqchip/Makefile                      |   3 +
>  drivers/irqchip/irq-loongson-htvec.c          | 217 ++++++++++++++
>  drivers/irqchip/irq-loongson-pch-msi.c        | 265 ++++++++++++++++++
>  drivers/irqchip/irq-loongson-pch-pic.c        | 256 +++++++++++++++++
>  8 files changed, 937 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
>  create mode 100644 drivers/irqchip/irq-loongson-htvec.c
>  create mode 100644 drivers/irqchip/irq-loongson-pch-msi.c
>  create mode 100644 drivers/irqchip/irq-loongson-pch-pic.c
>
> --
> 2.26.0.rc2
>
