Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC78441ABBA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 11:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239897AbhI1J00 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 05:26:26 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:10400 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239708AbhI1J00 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 05:26:26 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S8A28M025160;
        Tue, 28 Sep 2021 04:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9VqIQz/1HqDmwPai2TYqvrCqYupABpAsyUut7dZ736M=;
 b=pFLUqA3rP6s9vALO1j4rVtdJ880oQlmw2WpBASjERkcmuXEDpPkdh+ZRgwwaSlJs6zie
 Ku0jyFaBkG78xmZ+YdNpQYf9Y0IvyZersPlmkBZvWSk5BWHPJhkyUWaCc2DEq07T/x2t
 c9X+xgK1iGXLPaf9qxoQAdBob6A1fkXIHKS2EFEKp1kNeOZDMcvesRyq3z4j6MP2yVX3
 xnglaL2IGW9Vuej4mAqb/8jcF23TAbO2fBwKx/ExVJ6YnKlppjFEq0DcZBYWcSO/8Len
 K3JfFxKn7BFWETUi9snqgpJ5rk+cxe1A7HLWXdcPu3PJS1nxcAWPYrcKtx3NieBHHj6A Mw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 3bbgmygx4j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 28 Sep 2021 04:24:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 28 Sep
 2021 10:24:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 28 Sep 2021 10:24:00 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 318DD11AF;
        Tue, 28 Sep 2021 09:24:00 +0000 (UTC)
Date:   Tue, 28 Sep 2021 09:24:00 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-ia64@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <20210928092400.GH9223@ediswmail.ad.cirrus.com>
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928083751.GG9223@ediswmail.ad.cirrus.com>
 <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: Pzx4P-PCvsYzz7bz1-hxMXEM9-0MDlJo
X-Proofpoint-GUID: Pzx4P-PCvsYzz7bz1-hxMXEM9-0MDlJo
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 28, 2021 at 10:51:36AM +0200, Arnd Bergmann wrote:
> On Tue, Sep 28, 2021 at 10:37 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > I guess the question might be where else would said code go?
> > drivers/firmware seemed most obvious, all the other locations
> > I can think of don't really make sense. Can't really put it a bus
> > like spi/i2c etc. because we have parts on many buses. Can't
> > really put it in a functional subsystem (audio/input etc.) since
> > the whole idea was to try and get some independence from that so
> > we don't have parts including subsystems they don't use. Could
> > maybe put it in MFD, but no hard guarantee every part using it
> > will be an MFD device and I am fairly confident Lee will feel it
> > isn't MFD code as it doesn't relate to managing multiple devices.
> > Only other option I can think of would be to make some sort of
> > drivers/dsp or maybe drivers/cs_dsp, but not clear to me that is
> > obviously better than using drivers/firmware.
> 
> Other DSPs use the drivers/remoteproc/ subsystem, but that
> is more for general-purpose DSPs that can load application
> specific firmware rather than loading a single firmware blob
> as you'd normally do with the request_firmware() style interface.
> 
> Not sure if that fits what you do. Can you point to a high-level
> description of what this DSP does besides audio, and how
> flexible it is? That might help find the right place for this.

Hm... wasn't aware of that one, we should probably investigate that
a little more at this end. From a quick look, seems a bit more like
it is designed for much larger more general purpose probably memory
mapped DSPs. I guess our code is a little more firmware parsing
and loading, and a bit less generic remote proceedure call stuff.

I am not sure there is great deal available publically on the
DSP core. It is talked about in a few of our datasheets, see
section 4.4 in [1]. But a basic description might be it is a
signal processing focused, very small DSP core. If can be loaded
with different firmwares at runtime, and indeed might be doing say
echo cancellation in one use-case, or always on voice detect in
another. Functionally it is very unlikely to be used for anything
besides signal processing inside the device it is in, since it is
typically quite integrated with that hardware and will be sitting
behind a slow bus, like I2C or SPI.

Current users are all audio, planning to upstream some haptics
parts soon, with possible other uses in the future.

[1] https://statics.cirrus.com/pubs/proDatasheet/CS48L32_DS1219F4.pdf

Thanks,
Charles
