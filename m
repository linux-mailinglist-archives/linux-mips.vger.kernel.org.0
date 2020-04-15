Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487D91AA31D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 15:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505855AbgDONE1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 09:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505845AbgDONES (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 09:04:18 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3063C061A0C;
        Wed, 15 Apr 2020 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586955856;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=CdHAABA4O4WBpGafReQS38iVaIL+NYE+i3qxsiPxeAo=;
        b=F+hKm3C3XOqEnTBDZBXnjx3O3HH1Va/Qp8roEBX1UbgZttATFHbN4Z6n8DeoxdWTID
        LJW0Tz+xqOF5eiUenpEg39HyhB4YVGuKG7nPH45zfd6e5co8uV9GDaIUvxSqHnV7Lmlh
        cqmyt+YYneMN4Z/MXySw4m6Z8JTipneBQhEUNqz/lDMoys2y7p4jo4kQ+G1LeM4UCk7g
        J0bv6y19KvyWs0lg2w9Mm8jSTCVwDIufJQuC/bxYXJ9b7awJva1WNigZ2mPoa065vCYb
        7MFcCXXaquEqHUM44jLoxQ0oTVu3cvh0WGOeJKKuifCM/taOOuJFEufUSGelk+cpm6V8
        06oQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FD47231
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 15:04:07 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
Date:   Wed, 15 Apr 2020 15:04:07 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <20200415101008.zxzxca2vlfsefpdv@gilmour.lan> <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com> <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>,
        Philipp Rossak <embed3d@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 15.04.2020 um 15:02 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
> On Wed, Apr 15, 2020 at 02:41:52PM +0200, H. Nikolaus Schaller wrote:
>>>> The kernel modules built from this project have successfully
>>>> demonstrated to work with the DTS definitions from this patch set on
>>>> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
>>>> partially work on OMAP3530 and PandaBoard ES but that is likely a
>>>> problem in the kernel driver or the (non-free) user-space libraries
>>>> and binaries.
>>>> 
>>>> Wotk for JZ4780 (CI20 board) is in progress and there is potential
>>>> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
>>>> and CedarView devices.
>>> 
>>> If it's not been tested on any Allwinner board yet, I'll leave it
>>> aside until it's been properly shown to work.
>> 
>> Phillip has tested something on a83.
> 
> I'm a bit skeptical on that one since it doesn't even list the
> interrupts connected to the GPU that the binding mandates.

I think he left it out for a future update.
But best he comments himself.

BR and thanks,
Nikolaus

