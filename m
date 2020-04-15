Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FEE1AA1BA
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 14:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370212AbgDOMqK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 08:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370205AbgDOMqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 08:46:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2AAC061A41
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2020 05:46:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d17so12059658wrg.11
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2020 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=HL4CMR1gS/nWPdlxWM3XgPiFWUO4q+XXr+2sGU/Jcy0=;
        b=EcI1XYssAQQBvpE6ce+63x1UL40ahrxAaNgwhpoxxoPh4+b1K5dk52zgKooeKHAwba
         qUOz99SOkEPtOGU1NG1N6yxN4bOV75qHpx9CgDO4VGhe5ThFmWERoUq0cOH7U7qu7R/C
         Q0VnNHzqw3XzPnGt8mjG5OWl+yCm0GTBxQtWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=HL4CMR1gS/nWPdlxWM3XgPiFWUO4q+XXr+2sGU/Jcy0=;
        b=jVVSYNK5DZHT464MiK83JAwo3p/MgoglQyWV3Q+LKoPFxlX9bjWMCJhB8gVb72Kss/
         r8U4wY4pcOzZ4+q7XND1mltbwjVUiU7+WEHNisASi5RpuHxeME+1b7rmxEmzg5Vh6nLp
         utby1/FzusWYCQzBx5EcE8Uo6OP8/PmVVe1fSXHa7/moVvZKaP3OODCHN+qSgA01XI6y
         yZz9yIISUjdLoMPCVVuFOJm1agApi3itztYRPAQ5fPBdork8cUuwmcM2biNpCKP8H/gy
         aSo9dBHOaKe7QietVvJerP/O1rOoFZa5FNC5y7r1XHGRh3ZZZKZdWrg4SDb109VzgVkV
         7OMg==
X-Gm-Message-State: AGi0PuZ4ShFIR8momjEaClq5L3S6PRk3Ty5RHqmN5GNBhPhhJlWVgFRO
        jjrZGFbsMhABGHc1ZmMgUZhSYg==
X-Google-Smtp-Source: APiQypKV70qPHujs63QOoEQqPabK+YMwDDUBWb3RGBt2OldSHbduIv5lkfbp46jW19E2GgiMgeWn8w==
X-Received: by 2002:adf:a509:: with SMTP id i9mr9354350wrb.20.1586954763462;
        Wed, 15 Apr 2020 05:46:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l5sm23334725wrm.66.2020.04.15.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:46:02 -0700 (PDT)
Date:   Wed, 15 Apr 2020 14:46:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
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
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200415124600.GD3456981@phenom.ffwll.local>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
        Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 15, 2020 at 02:41:52PM +0200, H. Nikolaus Schaller wrote:
> Hi Maxime,
> 
> > Am 15.04.2020 um 12:10 schrieb Maxime Ripard <maxime@cerno.tech>:
> > 
> > Hi,
> > 
> > On Wed, Apr 15, 2020 at 10:35:07AM +0200, H. Nikolaus Schaller wrote:
> >> * rebased to v5.7-rc1
> >> * added DTS for for a31, a31s, a83t - by Philipp Rossak <embed3d@gmail.com>
> >> * added DTS for "samsung,s5pv210-sgx540-120" - by Jonathan Bakker <xc-racer2@live.ca>
> >> * bindings.yaml fixes:
> >>  - added a31, a31
> >>  - fixes for omap4470
> >>  - jz4780 contains an sgx540-130 and not -120
> >>  - a83t contains an sgx544-115 and not -116
> >>  - removed "additionalProperties: false" because some SoC may need additional properties
> >> 
> >> PATCH V5 2020-03-29 19:38:32:
> >> * reworked YAML bindings to pass dt_binding_check and be better grouped
> >> * rename all nodes to "gpu: gpu@<address>"
> >> * removed "img,sgx5" from example - suggested by Rob Herring <robh+dt@kernel.org>
> >> 
> >> PATCH V4 2019-12-17 19:02:11:
> >> * MIPS: DTS: jz4780: removed "img,sgx5" from bindings
> >> * YAML bindings: updated according to suggestions by Rob Herring
> >> * MIPS: DTS: jz4780: insert-sorted gpu node by register address - suggested by Paul Cercueil
> >> 
> >> PATCH V3 2019-11-24 12:40:33:
> >> * reworked YAML format with help by Rob Herring
> >> * removed .txt binding document
> >> * change compatible "ti,am335x-sgx" to "ti,am3352-sgx" - suggested by Tony Lindgren
> >> 
> >> PATCH V2 2019-11-07 12:06:17:
> >> * tried to convert bindings to YAML format - suggested by Rob Herring
> >> * added JZ4780 DTS node (proven to load the driver)
> >> * removed timer and img,cores properties until we know we really need them - suggested by Rob Herring
> >> 
> >> PATCH V1 2019-10-18 20:46:35:
> >> 
> >> This patch series defines child nodes for the SGX5xx interface inside
> >> different SoC so that a driver can be found and probed by the
> >> compatible strings and can retrieve information about the SGX revision
> >> that is included in a specific SoC. It also defines the interrupt number
> >> to be used by the SGX driver.
> >> 
> >> There is currently no mainline driver for these GPUs, but a project
> >> [1] is ongoing with the goal to get the open-source part as provided
> >> by TI/IMG and others into drivers/gpu/drm/pvrsgx.
> > 
> > Just a heads up, DRM requires an open-source user-space, so if your
> > plan is to move the open-source kernel driver while using the
> > closed-source library (as that page seem to suggest), that might
> > change a few things.
> 
> The far future goal is to arrive at a completely open implementation,
> but nobody knows how to get there. Therefore we bake smaller bread :)
> 
> step 1: get SoC integration right and stable (this is what this series is for)
> step 2: make the open source kernel driver work with closed-source libs
> step 3: write open-source replacements for user-space

step4: clean up the kernel driver
step5: get the mesa driver and kernel driver reviewed
step6: get it all merged

It's a very long road, but awesome to hear that someone is taking care of
pvrsgx. And I'm totally fine with landing stuff like you propose in step
1. Just not the driver/uapi itself.

Goog luck and have fun!

Cheers, Daniel

> 
> > 
> >> The kernel modules built from this project have successfully
> >> demonstrated to work with the DTS definitions from this patch set on
> >> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
> >> partially work on OMAP3530 and PandaBoard ES but that is likely a
> >> problem in the kernel driver or the (non-free) user-space libraries
> >> and binaries.
> >> 
> >> Wotk for JZ4780 (CI20 board) is in progress and there is potential
> >> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
> >> and CedarView devices.
> > 
> > If it's not been tested on any Allwinner board yet, I'll leave it
> > aside until it's been properly shown to work.
> 
> Phillip has testes something on a83.
> 
> BR and thanks,
> Nikolaus

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
