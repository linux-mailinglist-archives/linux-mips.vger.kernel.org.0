Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6112880DF
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 05:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731601AbgJIDwH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 23:52:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34179 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729195AbgJIDwG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 23:52:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6vJn0VVyz9sSG;
        Fri,  9 Oct 2020 14:51:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1602215524;
        bh=JJFHt0WKQB92kXQpvXVLk3zDAHuNVQpW9ACYB9X5JlY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=IL6myVQYQiWcr+Iv/skn0UNuXCXKrjL/lFkXJplPrupeQL5g6E4tmNcJ7QDxNh36v
         BfNhzZPKVdq55BmPZIztbw8JNGkI0X/TJbcEh4kXSiE8cmqpkbnFvHUdyWGz7Cu6pL
         wy1oD7J+6au+seC5fwUleUJC09q038qMu/eZ3uKjr+18pyvYRg6gQ+UaMxdhP65pXm
         FbIBpZ/5BY6AIUnsj57pCBjj2H3MVnlyeRvUnZABjjprmsERyEouWILv1q3tzMS4KZ
         2HFp0KJvXzwFb9/mIVXbA62GFzyYe5BFnmE5MAok5rrmbrKbhagBX2Nl1OcSFZpBH4
         omqtDTanxmmzQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] dt: Remove booting-without-of.rst
In-Reply-To: <20201008142420.2083861-2-robh@kernel.org>
References: <20201008142420.2083861-1-robh@kernel.org> <20201008142420.2083861-2-robh@kernel.org>
Date:   Fri, 09 Oct 2020 14:51:51 +1100
Message-ID: <87imbk12g8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rob Herring <robh@kernel.org> writes:
> booting-without-of.rstt is an ancient document that first outlined
                        ^
                        nit

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

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
