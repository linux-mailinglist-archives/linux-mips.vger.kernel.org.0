Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD21250C29
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 01:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgHXXPY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 19:15:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40622 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXXPX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Aug 2020 19:15:23 -0400
Received: by mail-io1-f66.google.com with SMTP id q132so107838iod.7;
        Mon, 24 Aug 2020 16:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=glE9MJLwvJksS6Kq8WSkXlWHv26cBEY9xO46r0OVXSU=;
        b=Snifu9Q4V00yZgnz+O+oBIwsk8zNp/jBywO1B5XMHY4Lamv9KfIZ+7WCQBPCf72TYj
         bkj7eDmhPR4fVgPuYvonWbbPu9rCsr+srkOhvIGqSwoU7Spz3N+27juQCF24blaJwNz8
         jH0MrymzkJ6COKS4mNdHl1BFFhrI7JzfVaaRsoeylIAhZPB7JMP1Vu7vy2fvIwDsPrJR
         gUakRkmzN/7eWjz3sEfMpSEEQ42hbOxtXJKItzcDQCCfQdxd0vXwppvkv4Vjz+y/LnoI
         yIlg8R6MPSVKZ8zXgj3UPRKoEHh3vFiovoXllqHuEvKGDkpNa/J0Sdy0SJ+K7/Jzj32D
         F0Pg==
X-Gm-Message-State: AOAM532+Mjf2SRjKEcyYWXHrr9GW5yA39QcnOcgzoibHu2TDP11gjVEa
        89r1ZN5F+xUXgjTow6cfGw==
X-Google-Smtp-Source: ABdhPJyi8756H2KScziyvfj8N3dhCo662Valtwe3X4z9g1X/I/OGyZyNv2EQX/btFiKGf0FNeNSZVg==
X-Received: by 2002:a6b:bfc1:: with SMTP id p184mr6858446iof.193.1598310922357;
        Mon, 24 Aug 2020 16:15:22 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id a71sm8392575ill.19.2020.08.24.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:15:21 -0700 (PDT)
Received: (nullmailer pid 3515104 invoked by uid 1000);
        Mon, 24 Aug 2020 23:15:19 -0000
Date:   Mon, 24 Aug 2020 17:15:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] mips: bmips: include dt-bindings headers
Message-ID: <20200824231519.GA3507085@bogus>
References: <20200812063129.361862-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200812063129.361862-1-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 12, 2020 at 08:31:15AM +0200, Álvaro Fernández Rojas wrote:
> Allow including dt-bindings header files and use them for bcm63xx.
> 
> Álvaro Fernández Rojas (14):
>   mips: dts: brcm: allow including header files
>   mips: bmips: add BCM3368 irq definitions
>   mips: bmips: add BCM6318 irq definitions
>   mips: bmips: add BCM6328 irq definitions
>   mips: bmips: add BCM6358 irq definitions
>   mips: bmips: add BCM6362 irq definitions
>   mips: bmips: add BCM6368 irq definitions
>   mips: bmips: add BCM63268 irq definitions
>   mips: bmips: bcm3368: include and use dt-bindings
>   mips: bmips: bcm6328: include and use dt-bindings
>   mips: bmips: bcm6358: include and use dt-bindings
>   mips: bmips: bcm6362: include and use dt-bindings
>   mips: bmips: bcm6368: include and use dt-bindings
>   mips: bmips: bcm63268: include and use dt-bindings
> 
>  .../boot/dts/brcm/bcm3368-netgear-cvg834g.dts |  2 +-
>  arch/mips/boot/dts/brcm/bcm3368.dtsi          |  8 +-
>  .../dts/brcm/bcm63268-comtrend-vr-3032u.dts   |  2 +-
>  arch/mips/boot/dts/brcm/bcm63268.dtsi         | 12 ++-
>  arch/mips/boot/dts/brcm/bcm6328.dtsi          | 12 ++-
>  .../dts/brcm/bcm6358-neufbox4-sercomm.dts     |  2 +-
>  arch/mips/boot/dts/brcm/bcm6358.dtsi          | 12 ++-
>  .../dts/brcm/bcm6362-neufbox6-sercomm.dts     |  2 +-
>  arch/mips/boot/dts/brcm/bcm6362.dtsi          | 12 ++-
>  arch/mips/boot/dts/brcm/bcm6368.dtsi          | 12 ++-
>  arch/mips/boot/dts/brcm/bcm93384wvg.dts       |  2 +-
>  arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts |  2 +-
>  arch/mips/boot/dts/brcm/bcm96368mvwg.dts      |  2 +-
>  arch/mips/boot/dts/brcm/bcm97125cbmb.dts      |  2 +-
>  arch/mips/boot/dts/brcm/bcm97346dbsmb.dts     |  4 +-
>  arch/mips/boot/dts/brcm/bcm97358svmb.dts      |  4 +-
>  arch/mips/boot/dts/brcm/bcm97360svmb.dts      |  2 +-
>  arch/mips/boot/dts/brcm/bcm97362svmb.dts      |  4 +-
>  arch/mips/boot/dts/brcm/bcm97420c.dts         |  2 +-
>  arch/mips/boot/dts/brcm/bcm97425svmb.dts      |  4 +-
>  arch/mips/boot/dts/brcm/bcm97435svmb.dts      |  4 +-
>  arch/mips/boot/dts/brcm/bcm9ejtagprb.dts      |  2 +-
>  .../bcm3368-interrupt-controller.h            | 19 ++++
>  .../bcm6318-interrupt-controller.h            | 84 ++++++++++++++++++
>  .../bcm63268-interrupt-controller.h           | 86 +++++++++++++++++++
>  .../bcm6328-interrupt-controller.h            | 68 +++++++++++++++
>  .../bcm6358-interrupt-controller.h            | 38 ++++++++
>  .../bcm6362-interrupt-controller.h            | 71 +++++++++++++++
>  .../bcm6368-interrupt-controller.h            | 71 +++++++++++++++

You'll notice that there are essentially no other headers with 
SoC interrupt numbers. That's because we don't do defines for them. It's 
pointless obfuscation.

Rob
