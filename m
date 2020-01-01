Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B976A12DE65
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jan 2020 10:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbgAAJsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Jan 2020 04:48:06 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:41593 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgAAJsF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Jan 2020 04:48:05 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fc75bb9;
        Wed, 1 Jan 2020 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=4nCgc7Qb9E7eYO93853bCxTMK74=; b=kTmOmH
        49DW4v6oeBQGMPvU1UhSofwORtT15Z7AoFZoynVmQ5w31kigpkKqs3Zc72IN87E+
        T42lKUZiWuxh1I7CNkssJ4QrzhAp8BuBi4yPnOOUOwEHROW8sR2ANTTBitntG3a/
        Ib/E6TaoGRfhBXbuurtMlrRtCVkiXOuCXgofX/wMdH+8E6xEQ9Xz4gVmDr67DFgm
        FJhOagghnZAqwfTHi7exefoXWhDL+LQEAVQ+nwmTAEZNpY2FEPMEmLGz1NRvQ7M0
        ++/vl6fXkyOgcwgiGWQFXdb7KHWK48oSIjZgF3YCHNzsoqlQgUIy/8+JnIttYY+d
        +c0E2nhC7O/4cupw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ed3fc7d3 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Wed, 1 Jan 2020 08:49:43 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id a15so52950499otf.1;
        Wed, 01 Jan 2020 01:48:04 -0800 (PST)
X-Gm-Message-State: APjAAAXPGtbQwHjcdWCqClv771346epw+OY6wNV0gf6SIX715dAyG8zN
        RroJ/1eajufMs8/jFK+gF5YczpJ5jhgLa4mKPSc=
X-Google-Smtp-Source: APXvYqwrDKduC7Zu3uMDHzPtb7RFYOiEYHz9UT3Ywk5GWuJ7cvUOGftCePjlEuapEGhFWIdS6jF9bRrQTaSneCjaWEA=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr87394263otn.369.1577872083283;
 Wed, 01 Jan 2020 01:48:03 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
 <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
 <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
 <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
 <CAHmME9rCCei_CL1evDYQ44Eu8erbjx_jDzbpKeXD4jTGBu8v8A@mail.gmail.com>
 <CAHmME9q0z4RBhy7AETo0sPt+SfV7=zFra0iyZ-Sm54c-WG6CVg@mail.gmail.com>
 <20200101041056.xionott76qbrffih@lantea.localdomain> <20200101042500.zmhldrthr3l45trq@lantea.localdomain>
In-Reply-To: <20200101042500.zmhldrthr3l45trq@lantea.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 1 Jan 2020 10:47:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9rgH=LmbVeq7Vs-Hxo6s0+gyeB7s5fBFt2fXvgMKw3=3g@mail.gmail.com>
Message-ID: <CAHmME9rgH=LmbVeq7Vs-Hxo6s0+gyeB7s5fBFt2fXvgMKw3=3g@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     Paul Burton <paulburton@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 1, 2020 at 5:22 AM Paul Burton <paulburton@kernel.org> wrote:
> That makes sense then. What doesn't make sense is how this ever
> worked. A question for another day...

In most other cases, calls to the vdso would be followed in the parent
function immediately by a return, restoring gp then.
