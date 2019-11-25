Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5E04109135
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 16:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbfKYPq1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 10:46:27 -0500
Received: from muru.com ([72.249.23.125]:43484 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728554AbfKYPq1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Nov 2019 10:46:27 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3A89A80EA;
        Mon, 25 Nov 2019 15:47:02 +0000 (UTC)
Date:   Mon, 25 Nov 2019 07:46:21 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>
Subject: Re: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
Message-ID: <20191125154621.GY35479@atomide.com>
References: <cover.1574595627.git.hns@goldelico.com>
 <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
 <1574600246.3.0@crapouillou.net>
 <20191124174837.GX35479@atomide.com>
 <FA810F13-BF2A-4849-9BAA-01FA2F768976@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FA810F13-BF2A-4849-9BAA-01FA2F768976@goldelico.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191124 18:00]:
> Hi Paul, Tony,
> 
> > Am 24.11.2019 um 18:48 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > * Paul Cercueil <paul@crapouillou.net> [191124 12:58]:
> >> Le dim., nov. 24, 2019 at 12:40, H. Nikolaus Schaller <hns@goldelico.com> a
> >> écrit :
> >>> and add interrupt and clocks.
> > ...
> >>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> >>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> >>> @@ -46,6 +46,17 @@
> >>> 		#clock-cells = <1>;
> >>> 	};
> >>> 
> >>> +	gpu: gpu@13040000 {
> >> 
> >> We try to keep the nodes ordered by address, could you move this node where
> >> it belongs?
> > ...
> 
> Yes, I have noted.
> 
> > 
> >>> +		compatible = "ingenic,jz4780-sgx540-120", "img,sgx540-120",
> >>> "img,sgx540", "img,sgx5";
> >>> +		reg = <0x13040000 0x4000>;
> >>> +
> >>> +		clocks = <&cgu JZ4780_CLK_GPU>;
> >>> +		clock-names = "gpu";
> > 
> > Just checking.. Is there something else to configure here
> > potentially in addition to the clocks?
> 
> It doesn't look so. Unfortuantely there isn't much information
> except a v3.18 kernel supported by the vendor and that one also
> just has a gpu node with clock control.
> 
> > That is, do we need to do some interconnect specific
> > configuration etc in addition to the clocks to have
> > runtime PM work for enabling and disabling sgx on
> > jz4780?
> 
> I think we have to leave that open for further study.

OK for now, let's assume we just need to call
clk_enable/disable from the PM runtime functions if a
clock exists.

Regards,

Tony
