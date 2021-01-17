Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D612F92CF
	for <lists+linux-mips@lfdr.de>; Sun, 17 Jan 2021 15:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbhAQOUa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 09:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbhAQOU2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Jan 2021 09:20:28 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AC3C061573;
        Sun, 17 Jan 2021 06:19:48 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id w124so15017771oia.6;
        Sun, 17 Jan 2021 06:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Brwn/7+ZmOI0Syh1i/4d/aeihHuPyP4rZQrZ8fYf/FA=;
        b=nIInBjkgxsHYEMSFkMycHzEXMWQGclKjYqX1PTbXSsKrBOroyJ6ALCYdbsCoN8By0l
         ++cIamjhq3AD2pWRyrt4CEhrc11h1rihn7RZ4V7jnayx3ZMgS6DnS9SNDk2V4NEeAZe5
         LlewmjFn8+a00WWP4QLAD1bU+oUm3ZoHdBKSCmgE7OGTJCKPDHvnr0wLGVCO+X9uGci5
         x1o4p3OW62oybZKxWIEzheAvBJPeWrFLv7/EWC71kd76CtYUKswuPFiXIj/3vfu3MY0D
         WSO520XehT260MQ5LXUC6XKgoEfoQDGaYSjdgr6AJCMIqznRe/J8pR0ishYORnFxWT3r
         YypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Brwn/7+ZmOI0Syh1i/4d/aeihHuPyP4rZQrZ8fYf/FA=;
        b=Gr+XpuamUz7FAwgPpnw+QdlcZASq95vB1HzR8BQL04Pyk4UbnUn6WO8TZZdjIdWH6e
         VMm4qFMg8rt8W4qWIyGexX9bVGu0C0eOpd0iv54ZNMseH2jtEmRvi2cbln6OflHD9cad
         UUJfmovtaUoRwY4twnklbxMIeSmVbut7ylTH5Snj6gxugV3t80o60NHAzxhgxnpvRr98
         wWeS0rzWIhrRra9ZSgOHot1ICR1cOEUp+XAT+TKq+LOrUPaYbT1XpMC3oTr5UfgFk9ql
         Z/qApCpP4751CGjTrPfbKcFichK2yKlUk8mzxkeKu2nEuWV9KGrY3fuDpK20GbPUYaKo
         XEXA==
X-Gm-Message-State: AOAM532npl6PAmqhb7MW8LpaNPk7ACWJg+z2YZ5I5gVcJqGNoaV72s8A
        sML0GPUqg+iqu+zPmmgrgRIuoSmEm0jboS0jsQA=
X-Google-Smtp-Source: ABdhPJymVFK4+IY43zE3dBqMHm5sgwwFVFkkkd7ZJ2ChTrYNG9U48WgIfcGKdmfPdyLKbbhGiVfU66aKI8m2/VvJsE0=
X-Received: by 2002:a54:4817:: with SMTP id j23mr11055958oij.158.1610893187531;
 Sun, 17 Jan 2021 06:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 17 Jan 2021 15:19:36 +0100
Message-ID: <CAMhs-H92MHRO9RqkBW-c_+dVEtVUF-eHH4-zVXO2wCpdX0A55g@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] MIPS: ralink: add CPU clock detection and clock
 driver for MT7621
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

On Sun, Dec 20, 2020 at 10:37 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> This patchset ports CPU clock detection for MT7621 from OpenWrt
> and adds a complete clock plan for the mt7621 SOC.
>
> The documentation for this SOC only talks about two registers
> regarding to the clocks:
> * SYSC_REG_CPLL_CLKCFG0 - provides some information about boostrapped
> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> * SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> all or some ip cores.
>
> No documentation about a probably existent set of dividers for each ip
> core is included in the datasheets. So we cannot make anything better,
> AFAICT.
>
> Looking into driver code, and some openWRT patched there are
> another frequences which are used in some drivers (uart, sd...).
> According to all of this information the clock plan for this
> SoC is set as follows:
>  - Main top clock "xtal" from where all the rest of the world is
>    derived.
>  - CPU clock "cpu" derived from "xtal" frequencies and a bunch of
>    register reads and predividers.
>  - BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
>  - Fixed clocks from "xtal":
>     * "50m": 50 MHz.
>     * "125m": 125 MHz.
>     * "150m": 150 MHz.
>     * "250m": 250 MHz.
>     * "270m": 270 MHz.
>
> We also have a buch of gate clocks with their parents:
>  - "hsdma": "150m"
>  - "fe": "250m"
>  - "sp_divtx": "270m"
>  - "timer": "50m"
>  - "pcm": "270m"
>  - "pio": "50m"
>  - "gdma": "bus"
>  - "nand": "125m"
>  - "i2c": "50m"
>  - "i2s": "270m"
>  - "spi": "bus"
>  - "uart1": "50m"
>  - "uart2": "50m"
>  - "uart3": "50m"
>  - "eth": "50m"
>  - "pcie0": "125m"
>  - "pcie1": "125m"
>  - "pcie2": "125m"
>  - "crypto": "250m"
>  - "shxc": "50m"
>
> There was a previous attempt of doing this here[0] but the author
> (Chuanhong Guo) did not wanted to make assumptions of a clock plan
> for the platform that time. It seems that now he has a better idea of
> how the clocks are dispossed for this SoC so he share code[1] where
> some frequencies and clock parents for the gates are coded from a
> real mediatek private clock plan.
>
> I do really want this to be upstreamed so according to the comments
> in previous attempt[0] from Oleksij Rempel and the frequencies in
> code[1] I have tried to do this by myself.
>
> All of this patches have been tested in a GNUBee PC1 resulting in a
> working platform.
>
> Changes in v5:
>  - Avoid the use of syscon. All drivers of this platform are just using
>    platform operations defined in 'asm/mach-ralink/ralink_regs.h'. We also
>    need them for some PLL registers that are not in the sys control area.
>    Hence, since we must use this dependency avoid to define clock driver
>    as a child of the sysc node in the device tree and follow current
>    platform code style.
>  - Update bindings documentation to don't refer the syscon and make
>    remove 'clock-output-names' property from required ones.
>  - Use 'asm/mach-ralink/ralink_regs.h' platform read and write operations
>    instead of regmap from the syscon node.
>  - Remove 'mt7621_clk_provider' and directly declare 'clk_hw_onecell_data'
>    pointer in 'mt7621_clk_init' and pass from there into different register
>    functions. Remove pointers to 'mt7621_clk_provider' in the rest fo structs
>    used in this driver.
>  - Remove MHZ macro and just pass values directly in hertzs.
>  - Avoid 'CLK_IGNORE_UNUSED' flag for gates and add a new function called
>    'mt7621_prepare_enable_clocks' to prepare all of them to make clocks
>    referenced and don't affect current driver code.
>  - Remove COMPILE_TEST from Kconfig because of the use of especific arch
>    stuff.
>  - Fix commit message where a typo for "frequencies" word was present.
>  - Make use of parent_clk_data in 'CLK_BASE' macro.
>  - Remove MODULE_* macros from code since this is not a module.
>  - Remove not needed includes.
>  - Hardcode "xtal" as parent in FIXED macro.
>  - Change 'else if' clause into 'if' clause since a return statement was
>    being used in 'mt7621_xtal_recalc_rate'.
>
>  NOTES:
>    - Driver is still being declared using 'CLK_OF_DECLARE' for all the
>      clocks. I have explored the possibility to make some of them available
>      afterwards using 'CLK_OF_DECLARE_DRIVER' for top clocks and the rest
>      using a platform driver. The resulting code was uglier since we only want
>      to use the same device tree node and the top clocks must be copied again
>      for the new platform register stuff to properly have a good hierarchy.
>      New globals needs to be introduced and in this particular case I don't
>      really see the benefits of doing in this way. I am totally ok to have all
>      the clocks registered at early stage since from other drivers perspective
>      we only really need to enable gates. So, I prefer to have them in that
>      way if it is not a real problem, of course.

Any comments on this? Is ok to maintain this as it is done in this
version or should I change this to any other approach taking into
account my comments in device tree related PATCH? Nothing has been
suggested there yet.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos
>
> Changes in v4:
>  - Add Acked-by from Rob Herring for binding headers (PATCH 1/6).
>  - Convert bindings to not use syscon phandle and declare clock as
>    a child of the syscon node. Update device tree and binding doc
>    accordly.
>  - Make use of 'syscon_node_to_regmap' in driver code instead of
>    get this using the phandle function.
>  - Properly unregister clocks for the error path of the function
>    'mt7621_clk_init'.
>  - Include ARRAY_SIZE of fixed clocks in the 'count' to kzalloc
>    of 'clk_data'.
>  - Add new patch changing invalid vendor 'mtk' in favour of 'mediatek'
>    which is the one listed in 'vendor-prefixes.yaml'. Update mt7621 code
>    accordly. I have added this patch inside this series because clk
>    binding is referring syscon node and the string for that node was
>    with not listed vendor. Hence update and have all of this correct
>    in the same series.
>
> Changes in v3:
>  - Fix compilation warnings reported by kernel test robot because of
>    ignoring return values of 'of_clk_hw_register' in functions
>    'mt7621_register_top_clocks' and 'mt7621_gate_ops_init'.
>  - Fix dts file and binding documentation 'clock-output-names'.
>
> Changes in v2:
>  - Remove the following patches:
>    * dt: bindings: add mt7621-pll device tree binding documentation.
>    * MIPS: ralink: add clock device providing cpu/ahb/apb clock for mt7621.
>  - Move all relevant clock code to 'drivers/clk/ralink/clk-mt7621.c' and
>    unify there previous 'mt7621-pll' and 'mt7621-clk' into a unique driver
>    and binding 'mt7621-clk'.
>  - Driver is not a platform driver anymore and now make use of 'CLK_OF_DECLARE'
>    because we need clocks available in 'plat_time_init' before setting up
>    the timer for the GIC.
>  - Use new fixed clocks as parents for different gates and deriving from 'xtal'
>    using frequencies in[1].
>  - Adapt dts file and bindings header and documentation for new changes.
>  - Change MAINTAINERS file to only contains clk-mt7621.c code and
>    mediatek,mt7621-clk.yaml file.
>
> [0]: https://www.lkml.org/lkml/2019/7/23/1044
> [1]: https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133
>
> Sergio Paracuellos (6):
>   dt-bindings: clock: add dt binding header for mt7621 clocks
>   dt: bindings: add mt7621-clk device tree binding documentation
>   clk: ralink: add clock driver for mt7621 SoC
>   staging: mt7621-dts: make use of new 'mt7621-clk'
>   staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid
>     'mtk'
>   MAINTAINERS: add MT7621 CLOCK maintainer
>
>  .../bindings/clock/mediatek,mt7621-clk.yaml   |  52 +++
>  MAINTAINERS                                   |   6 +
>  arch/mips/ralink/mt7621.c                     |   6 +-
>  drivers/clk/Kconfig                           |   1 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/ralink/Kconfig                    |  14 +
>  drivers/clk/ralink/Makefile                   |   2 +
>  drivers/clk/ralink/clk-mt7621.c               | 411 ++++++++++++++++++
>  drivers/staging/mt7621-dts/gbpc1.dts          |  11 -
>  drivers/staging/mt7621-dts/mt7621.dtsi        |  85 ++--
>  include/dt-bindings/clock/mt7621-clk.h        |  41 ++
>  11 files changed, 571 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
>  create mode 100644 drivers/clk/ralink/Kconfig
>  create mode 100644 drivers/clk/ralink/Makefile
>  create mode 100644 drivers/clk/ralink/clk-mt7621.c
>  create mode 100644 include/dt-bindings/clock/mt7621-clk.h
>
> --
> 2.25.1
>
