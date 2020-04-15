Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93771AA197
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 14:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370106AbgDOMn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 08:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370090AbgDOMn1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 08:43:27 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDD8C061A0C;
        Wed, 15 Apr 2020 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586954603;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8GK3WjET2U6wp+sgAkoboHJc3uorJ17qMHhKjYJZZNA=;
        b=jPpFOTEHiayICQxpmpfRc7es/gTa73qjir+mVhEDZGPavQuLk7C3Qjopu2/3/O4gcJ
        yvOCmg8CGuqRrvJlQnTMrLtB0od8tZTD2uasa2wvb9ikMtxGjU12qQU3u4yCmmy2g1Op
        vAbyqXOmDMwTAf0yHRMratJvQXN45sR3PtCKJEIvf9/IUM/f/dCOQIMHYbqGmb4hIbnF
        Dpb6eMoqcMkYxLwalLFUvvvvVzSshMzOS3K1bIy9p50X4JNuNNL9bZ6E1Uj0xO30bRnX
        E0gAHQHrpo6BQuOxQQCykK+X+nCUx2hvIOPZyJENr6Sqkn/zM2uKshIQfbOuUbsymXYf
        fpbA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FChB1vU
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 14:43:11 +0200 (CEST)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
Date:   Wed, 15 Apr 2020 14:43:10 +0200
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
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com> <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 15.04.2020 um 12:12 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
> Hi,
> 
> On Wed, Apr 15, 2020 at 10:35:08AM +0200, H. Nikolaus Schaller wrote:
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>> Allwinner A83 and others.
>> 
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers, interrupt etc.).
>> 
>> In most cases, Clock, Reset and power management is handled
>> by a parent node or elsewhere (e.g. code in the driver).
> 
> Wouldn't the "code in the driver" still require the clock / reset /
> power domain to be set in the DT?

Well, some SoC seem to use existing clocks and have no reset.
Or, although not recommended, they may have the io-address range
hard-coded.

BR,
Nikolaus

