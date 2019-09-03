Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF84A72B3
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 20:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfICSqW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 14:46:22 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:36804 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfICSqW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 14:46:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6D059417A8;
        Tue,  3 Sep 2019 20:46:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mNoJkj6Kk36H; Tue,  3 Sep 2019 20:46:19 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8493E4179C;
        Tue,  3 Sep 2019 20:46:19 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:46:19 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
Message-ID: <20190903184619.GA31812@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org>
 <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
 <20190902144007.GA2479@sx9>
 <2ac424e5-017b-5892-ef38-fe25ec5f38d1@flygoat.com>
 <20190903174212.GA22657@sx9>
 <alpine.LFD.2.21.1909031857150.2031@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1909031857150.2031@eddie.linux-mips.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>  Hmm, why do you think this would be unacceptable?  Do you expect your 
> code to cause unjustified maintenance burden once integrated?

I suppose it can be implemented quite nicely, with a bit of effort. Steps
to be taken:

1. A font needs to be linked with the early boot code. I'm using
   acorndata_8x8 from lib/fonts/font_acorn_8x8.c, but any font would do.

2. A single, or small set of, video resolutions need to be selected. I
   chose 1920x1080p and wrote those values to the Graphics Synthesizer
   video clock registers. A complete video mode line parser seems
   excessive, unless that code can be shared with the boot code somehow.

3. Implement clear_screen() and plot(x, y) for a single pixel using DMA
   commands to the Graphics Synthesizer. [ Clearing the screen can be
   done by plotting the whole screen, but it was somewhat slow. ]

4. Implement prom_putchar() using plot() for the given font.

Steps (1) and (4) could be generic code.

Fredrik
