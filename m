Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2C31C4EB1
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2020 09:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgEEHAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 May 2020 03:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725320AbgEEHAH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 May 2020 03:00:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAB5C061A0F;
        Tue,  5 May 2020 00:00:07 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2D9DC2A19C9;
        Tue,  5 May 2020 08:00:04 +0100 (BST)
Date:   Tue, 5 May 2020 09:00:01 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     tglx@linutronix.de, cheol.yong.kim@intel.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
        arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
        brendanhiggins@google.com, linux-mips@vger.kernel.org,
        robh+dt@kernel.org, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, qi-ming.wu@intel.com,
        andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200505090001.145c5e8e@collabora.com>
In-Reply-To: <6a41963b-e018-1a2d-88d4-5bb59d56a7e5@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
        <20200429164832.6800fc70@collabora.com>
        <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
        <20200429173107.5c6d2f55@collabora.com>
        <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
        <20200430102114.29b6552f@collabora.com>
        <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
        <20200430103658.4b0b979e@collabora.com>
        <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
        <20200430143600.27031639@collabora.com>
        <20200430150124.7856d112@collabora.com>
        <df7c1952-bc9b-bad7-bf31-d09707a0829e@linux.intel.com>
        <20200504090824.1eb16b78@collabora.com>
        <854521ed-b0f9-0f0f-2cd7-5ad11b2d059a@linux.intel.com>
        <20200504091755.0d0e73aa@collabora.com>
        <db023399-8b4d-c75c-30c8-b35e38e2e5f8@linux.intel.com>
        <20200504105828.72aaf7b8@collabora.com>
        <6a41963b-e018-1a2d-88d4-5bb59d56a7e5@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Vadivel,

On Tue, 5 May 2020 13:28:58 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 
> >>>>>>
> >>>>>>      ebu_nand: ebu_nand@e0f00000 {
> >>>>>>                      compatible = "intel,lgm-ebu-nand";
> >>>>>>                      reg = <0xe0f00000 0x100
> >>>>>>                      0xe1000000 0x300
> >>>>>>                      0xe1400000 0x80000
> >>>>>>                      0xe1c00000 0x10000>;
> >>>>>>                      reg-names = "ebunand", "hsnand", "nand_cs0", nand_cs1";
> >>>>>>                      dmas = <&dma0 8>, <&dma0 9>;
> >>>>>>                      dma-names = "ebu_rx", "ebu_tx";
> >>>>>>                      clocks =  <&cgu0 LGM_GCLK_EBU>;
> >>>>>>              };
> >>>>>>
> >>>>>>
> >>>>>> 	 &ebu_nand {
> >>>>>> 	         status = "disabled";
> >>>>>> 	        nand,cs = <1>;
> >>>>>> 	        nand-ecc-mode = "hw";
> >>>>>> 	        pinctrl-names = "default";
> >>>>>> 	        pinctrl-0 = <&ebu_nand_base &ebu_cs1>;
> >>>>>> 	};
> >>>>>>        
> >>>>>>>            
> >>>>> Ok. If I understand the SoC topology correctly it should actually be
> >>>>> something like that:
> >>>>>
> >>>>> {
> >>>>> 	...
> >>>>> 	fpi@xxxxx {
> >>>>> 		compatible = "intel,lgm-fpi", "simple-bus";
> >>>>>
> >>>>> 		/* You might have other ranges to define here */
> >>>>> 		ranges = <0x16000000 0xe0000000 0x1000000>;
> >>>>>
> >>>>> 		...  
> >>>>
> >>>> Sorry, we do not have fpi tree node in our dts/dtsi file instead we have
> >>>> the below one.. , that also not included the major peripherals
> >>>> controllers node.
> >>>>            /* Special part from CPU core */
> >>>>            core: core {
> >>>>                    compatible = "intel,core", "simple-bus";
> >>>>                    #address-cells = <1>;
> >>>>                    #size-cells = <1>;
> >>>>                    ranges;
> >>>>
> >>>>                    ioapic1: interrupt-controller@fec00000 {
> >>>>                            #interrupt-cells = <2>;
> >>>>                            #address-cells = <0>;
> >>>>                            compatible = "intel,ce4100-ioapic";
> >>>>                            interrupt-controller;
> >>>>                            reg = <0xfec00000 0x1000>;
> >>>>                            nr_entries = <256>;
> >>>>                    };
> >>>>
> >>>>                    hpet: timer@fed00000 {
> >>>>                            compatible = "intel,ce4100-hpet";
> >>>>                            reg = <0xfed00000 0x400>;
> >>>>                    };
> >>>>
> >>>>                    lapic0: interrupt-controller@fee00000 {
> >>>>                            compatible = "intel,ce4100-lapic";
> >>>>                            reg = <0xfee00000 0x1000>;
> >>>>                            no_pic_mode;
> >>>>                    };
> >>>>            };
> >>>>
> >>>> other than this, rest all in independent node .  
> >>>
> >>> But you do have an FPI bus, right? If this is the case it should be
> >>> represented.  
> >>
> >> Yes, FPI bus is slave to core which connects all the peripherals.
> >>
> >>    Or is the "intel,core" bus actually the FPI bus that you  
> >>> named differently?  
> >>
> >> FPI slave bus connects to core bus by OCP bridge, so here it is named
> >> FPI bus, but SW perspective didn't have root tree which has all
> >> sub-nodes, as of now each peripheral has its own node.  
> > 
> > Duh, not sure that's a good idea to hide that, especially since you
> > have to describe the address translation that happens when crossing the
> > FPI bus (the ranges thing I mentioned previously).  
> 
> Thanks! for the keep reviewing.
> 
> SW Address translation is not required, after discussion with HW team , 
> came to know that 0x17400 and 0x17C00 internal to the SoC.
> 
> NOC will translate 0xE1XX... to FPI address 0x17X... internally.
> There is an address translation in the NOC.
> 0x17X... is not visible to user.
> 
> so far added hard-coded values to CS0 and CS1 is not at required.
> I will change the code accordingly and sent to you.

Hm, you told me last week that writing wrong values to this register
caused the NAND controller to not work properly (you even had code that
was overwriting the dynamically calculated values by hardcoded ones, so
I suspect it indeed didn't work) and now you say this write to
EBU_ADDR_SEL() is optional?! Sorry but it's hard to believe, and I've
received so many contradictory information from you on that matter that
I can't really tell which one is correct. Not sure I want to keep
reviewing new versions of this driver in this context.

Regards,

Boris
