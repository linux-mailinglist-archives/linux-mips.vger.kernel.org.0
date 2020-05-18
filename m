Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE3E1D8688
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 20:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731884AbgERSYp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 14:24:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729955AbgERSYo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 14:24:44 -0400
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0777B2083E;
        Mon, 18 May 2020 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589826284;
        bh=4enFI36R6diBkb+gKGhwExmrDx+XcgPAs342xvS1tyA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qMgzXTpgzcX/Oit85pI4z9hKpzqyrwpwUWnordtNIqxN+h2HwZo7eoTNmFui5ft58
         zblAZ4ImaByNw4dTzjObfyDNCtWPKdoT9C8zO6JjO3XUcynjG32dAXQqfA62cnZZk8
         UExxla2pZzcwYCkbGBzpUj46i9Ff4k84yCSJ6mv8=
Received: by mail-oo1-f51.google.com with SMTP id c83so2261330oob.6;
        Mon, 18 May 2020 11:24:44 -0700 (PDT)
X-Gm-Message-State: AOAM530QYl6rZNmSik5fwpEROj2dz7/yPTx7RRjfDLaLqOlZ2nKS3vT/
        2UHtk/h3zMuyyTq8HCmkNmGlgPUyskqEsbZKCA==
X-Google-Smtp-Source: ABdhPJysCAF2m01NkslVAsSntTiUS/xi7dJDbBIKhlzFQaR4jWhennVyt0j+R7miFuq23VHXoO29v9QPs/K2DAV/BxA=
X-Received: by 2002:a4a:9285:: with SMTP id i5mr13579789ooh.50.1589826283325;
 Mon, 18 May 2020 11:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200514130321.GB8436@bogus> <3248d380-1d08-3088-8d18-0373a8a5aef9@linux.intel.com>
In-Reply-To: <3248d380-1d08-3088-8d18-0373a8a5aef9@linux.intel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 18 May 2020 12:24:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3g-QYMF0PMSuHeoaZ5x88fg4TbzVbDUO6=ugxEZRpbQ@mail.gmail.com>
Message-ID: <CAL_JsqL3g-QYMF0PMSuHeoaZ5x88fg4TbzVbDUO6=ugxEZRpbQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh R <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Brendan Higgins <brendanhiggins@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "hauke.mehrtens" <hauke.mehrtens@intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 8:06 PM Ramuthevar, Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
> Hi Rob,
>
>     Thank you for the review comments...
>
> On 14/5/2020 9:03 pm, Rob Herring wrote:
> > On Wed, May 13, 2020 at 06:46:14PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> >> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >>
> >> Add YAML file for dt-bindings to support NAND Flash Controller
> >> on Intel's Lightning Mountain SoC.
> >>
> >> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >> ---
> >>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
> >>   1 file changed, 83 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

> >> +      clocks = <&cgu0 125>;
> >> +      dma-names = "tx", "rx";
> >> +      #address-cells = <1>;
> >> +      #size-cells = <0>;
> >> +      #clock-cells = <1>;
> >
> > This is a clock provider too?
> Yes, it is getting clock from CGU for nand-controller.

That is a clock client (e.g. 'clocks' property), not a provider. The
CGU is the provider.

Rob
