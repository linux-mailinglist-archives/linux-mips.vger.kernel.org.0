Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C801B2418B6
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 11:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbgHKJJe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 11 Aug 2020 05:09:34 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39503 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgHKJJe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 05:09:34 -0400
Received: by mail-ed1-f67.google.com with SMTP id c10so8497449edk.6;
        Tue, 11 Aug 2020 02:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7nAprOq2xfZCg8U+qPFrSCSPVHDN3Z4PSbLlksPqDaQ=;
        b=KZbRVuhOyyK9le2+9kicadsjCLCe942WCWBJWfgiwQcHAVQEnGTLhiWIfkh0Fz2lPo
         F1Dei75G/We1kp9Sq5QiHCOAvVCMGtRyadnlzhRP5mRhonBuCI8DlUpHYnOws8mHNDuz
         aEn0FdZ1ZSqnKwISo5upjzjid7dPyaPJhrjVdtQfObVLHXn+qWUPo9dhFaeduFcUPGfI
         gvHygsnERxeIoA3XsElWAEHDGhjitK2MOSXroKTEhat1uPtKMoQ5rZY8WinpWOUoCVwR
         mfJNWhEdq5hICUf4Ghc2xVRgneT11Zs0HOn5KPta3kazemQUum2m7FuKRd2MA+ErHfa5
         Dxvw==
X-Gm-Message-State: AOAM530NhfatOxATEaVFYTI5tMJvWTpN53FyH/ibYcNIHFLT8emGGjal
        akZaPWymLXQu7kF2HsL0AlnvKyLDnPeSZOqKT+RuQZzX
X-Google-Smtp-Source: ABdhPJwsET5r+S0OddQDzlODnuDPEC1cxBkBpR48tmVZwKKukz6tCJ53SK+KdU7nBegaksGW9TaBIk4T/gZYhQf8RXE=
X-Received: by 2002:a50:e70e:: with SMTP id a14mr9836310edn.93.1597136972345;
 Tue, 11 Aug 2020 02:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200807100411.2904279-1-noltari@gmail.com> <20200807100411.2904279-4-noltari@gmail.com>
 <CAAdtpL7+_inNrbDpq_wt1Eo=tU6+e+yYR9ox-BF7bN82HVV5_Q@mail.gmail.com> <b1210ef6-36ec-9e3f-e686-a87244ea1c33@gmail.com>
In-Reply-To: <b1210ef6-36ec-9e3f-e686-a87244ea1c33@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 11 Aug 2020 11:09:20 +0200
Message-ID: <CAAdtpL7=oA-2f0CA8-d6o44jbd7VtBOSSJSGmQjitVT3e_WLZw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

On Tue, Aug 11, 2020 at 4:33 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 8/9/2020 11:49 AM, Philippe Mathieu-Daudé wrote:
> > Hi Álvaro,
> >
> > On Fri, Aug 7, 2020 at 12:05 PM Álvaro Fernández Rojas
> > <noltari@gmail.com> wrote:
> >>
> >> EHCI and OHCI share the same USB ports. Therefore, if the board has OHCI
> >> it should also have EHCI.
> >
> > This statement isn't correct. OHCI doesn't imply EHCI...
> > (although the opposite is almost always true).
> >
> > Now per 6358-PB01-R the bcm6358 indeed has a EHCI controller.
> >
> > Do you mind rewording the commit description?
>
> Is not it that a single USB port is used and we need the EHCI controller
> active in order for the correct speed negotiation to occur?

Yes. What sounds odd is "if the board has OHCI it should also have EHCI."

This is true for this particular board because its chipset is a bcm6358,
but I'm worried it might later confuse other developers. For example the
bcm6348 has a OHCI controller, but that doesn't imply its port can be
used as EHCI.

Regards,

Phil.

> --
> Florian
