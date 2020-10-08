Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3381D2876A0
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 17:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730762AbgJHPDU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 11:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730721AbgJHPDU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 11:03:20 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09769C061755;
        Thu,  8 Oct 2020 08:03:20 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0a9000bfab7746bad7d6a7.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:9000:bfab:7746:bad7:d6a7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D4FE71EC047E;
        Thu,  8 Oct 2020 17:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1602169398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=H7LtysFbQs7PFQq4RWrYSce3ni7L2rAYoFE4zYkyzvU=;
        b=r22/Sm/gD7Lz5A+6cEIj8Ie9aJaqNuQDC08G/jWg3szjtFh7iwQM2+BVesit/IXWwFdSYi
        8T+tIhUQtvDrANDK2N0cmi5Vuoae28DQRzdhPvgrNM7mK+2GwX49d3Y6hiavaVcw7CjhBK
        tgdC4EioZOTpVZnT0sNu5spyAIJ27Iw=
Date:   Thu, 8 Oct 2020 17:03:09 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] dt: Remove booting-without-of.rst
Message-ID: <20201008150309.GA5505@zn.tnic>
References: <20201008142420.2083861-1-robh@kernel.org>
 <20201008142420.2083861-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008142420.2083861-2-robh@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 09:24:20AM -0500, Rob Herring wrote:
> booting-without-of.rstt is an ancient document that first outlined
> Flattened DeviceTree on PowerPC initially. The DT world has evolved a
> lot in the 15 years since and booting-without-of.rst is pretty stale.
> The name of the document itself is confusing if you don't understand the
> evolution from real 'OpenFirmware'. Most of what booting-without-of.rst
> contains is now in the DT specification (which evolved out of the
> ePAPR). The few things that weren't documented in the DT specification
> are now.
> 
> All that remains is the boot entry details, so let's move these to arch
> specific documents. The exception is arm which already has the same
> details documented.
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/booting-without-of.rst         | 1585 -----------------
>  Documentation/devicetree/index.rst            |    1 -
>  Documentation/mips/booting.rst                |   28 +
>  Documentation/mips/index.rst                  |    1 +
>  Documentation/powerpc/booting.rst             |  110 ++
>  Documentation/powerpc/index.rst               |    1 +
>  Documentation/sh/booting.rst                  |   12 +
>  Documentation/sh/index.rst                    |    1 +
>  Documentation/x86/booting-dt.rst              |   21 +
>  Documentation/x86/index.rst                   |    1 +

For x86:

Acked-by: Borislav Petkov <bp@suse.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
