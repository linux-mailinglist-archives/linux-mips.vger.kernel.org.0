Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7182D8D31
	for <lists+linux-mips@lfdr.de>; Sun, 13 Dec 2020 14:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406772AbgLMNVE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Dec 2020 08:21:04 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:3231 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406755AbgLMNU5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Dec 2020 08:20:57 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9BB723F99B;
        Sun, 13 Dec 2020 14:20:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.901
X-Spam-Level: 
X-Spam-Status: No, score=-1.901 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, NO_RELAYS=-0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Yz9lJqpYhZ98; Sun, 13 Dec 2020 14:20:10 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 87A783F859;
        Sun, 13 Dec 2020 14:20:10 +0100 (CET)
Date:   Sun, 13 Dec 2020 14:20:10 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
Message-ID: <X9YVCmHsBXAe/jcD@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org>
 <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 02, 2019 at 09:12:22AM +0800, Jiaxun Yang wrote:
> According to kernel policy[1] no more new FBDev driver would be accepted.
> 
> Please refactor it to DRM.

I obtained a functional DRM driver a while back, but unfortunately it's
a poor fit on the hardware, for the following reasons, in brief:

The DRM subsystem (in general) breaks user-space in significant ways:

- fbset command timing mode settings are ignored;
- attempts to set modes with /sys/class/graphics/fb0/mode are ignored;
- /sys/class/graphics/fb0/modes outputs incorrect refresh rates;
- relevant modes are missing in /sys/class/graphics/fb0/modes;
- the standard DRM video modes seem to mix up the sync and front porch
  timings in struct drm_display_mode but this remains to be confirmed.

DRM seems to rely heavily on EDID to negotiate a video resolution, but
EDID isn't available with vintage analogue display hardware.

The Graphics Synthesizer (GS) hardware is essentially a serial device
that accepts sequences of commands with data via DMA. Notably, it
cannot be memory mapped.

Can the GS be modelled, in a reasonable way, on existing kernel video
interfaces, when taking memory efficiency and performance into account?

For anyone who is interested:

In addition to this patch series and its documentation references,
some background information and details on the Graphics Synthesizer
are available here:

https://github.com/frno7/linux/issues/10

Fredrik
