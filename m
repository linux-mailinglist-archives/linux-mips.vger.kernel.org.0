Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B3E3EB5C6
	for <lists+linux-mips@lfdr.de>; Fri, 13 Aug 2021 14:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240279AbhHMMxb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 13 Aug 2021 08:53:31 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:34646 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbhHMMxb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Aug 2021 08:53:31 -0400
Received: by mail-vs1-f50.google.com with SMTP id l22so5928953vsi.1;
        Fri, 13 Aug 2021 05:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GUkLMwD2j+LMs+Mhg8retAXqFr+2fCyVciaZId7XXMA=;
        b=A+DzMKh4SaI8IKueMe35NE6ASnRVifB/NBYZX/KGnlJTV2kWkfMtpUDCQzWd3qjVJO
         Wy1VM4v21eEHWU1DfNhtEeV7Fy6cqj2zE6FVwmMBX4WtnbaechVx9fBRbSi2KkBHtUDM
         ja7sx7g8zMX0g4zN5vAaOLt0JchtWm4Tznc7buTYRItM/C+WTGrmJ7Rv4zD+w6Kbzm95
         IFOUpwTj1MhzlQF6RWNFRVHnsktUvnoxDOw0IC6BJOHcxUXWf3d2K9QbxK9fz7NWoATu
         7wOZEe15THA+ykF6m2QwCsZqtJJjHJkamhPFTVVu/U4vcKqVcXY2nfD94t9iLynowXRj
         LFyw==
X-Gm-Message-State: AOAM533CYkLOQ078pKB3UPE6RzN1mGLSSWnt8FkimyOtbv2I/a6HFngl
        uRAcMx2mYV8id8UPumpqQLfqhJXRHEMbImvt+To=
X-Google-Smtp-Source: ABdhPJzjK6cDtV6QbCobPoCPv+kseDVbo2qNoxZBSAFh+8+1qixu6jaaer/OLjhFttaw7VgR0TV8HigL8Np+ZSkG7+k=
X-Received: by 2002:a05:6102:e59:: with SMTP id p25mr1482758vst.26.1628859183649;
 Fri, 13 Aug 2021 05:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210811095759.1281480-1-geert@linux-m68k.org>
 <20210811095759.1281480-20-geert@linux-m68k.org> <20210811124755.37b0a0a9@thinkpad>
 <CAMuHMdUFPvJBuFByiN6pb539REYtcsNJMKML+M2NQw=GJxTYJg@mail.gmail.com> <CAHp75VeNyHUmcU7GPnP8woRcDErDNQ5M3FHQGpLnhUoL5qTnLQ@mail.gmail.com>
In-Reply-To: <CAHp75VeNyHUmcU7GPnP8woRcDErDNQ5M3FHQGpLnhUoL5qTnLQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Aug 2021 14:52:52 +0200
Message-ID: <CAMuHMdVFOu6EXKqkiLgBp3n8Oujm+uSpFn-ximtp+37TOZSp9A@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] auxdisplay: ht16k33: Add LED support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Andy,

On Thu, Aug 12, 2021 at 2:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wednesday, August 11, 2021, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Wed, Aug 11, 2021 at 12:48 PM Marek Behún <kabel@kernel.org> wrote:
>> > On Wed, 11 Aug 2021 11:57:59 +0200
>> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > > Instantiate a single LED based on the "led" subnode in DT.
>> > > This allows the user to control display brightness and blinking (backed
>> > > by hardware support) through the LED class API and triggers, and exposes
>> > > the display color.  The LED will be named
>> > > "auxdisplay:<color>:<function>".
>> > >
>> > > When running in dot-matrix mode and if no "led" subnode is found, the
>> > > driver falls back to the traditional backlight mode, to preserve
>> > > backwards compatibility.
>> > >
>> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> >
>> > Reviewed-by: Marek Behún <kabel@kernel.org>
>>
>> Thanks!
>>
>> > BTW, this driver does not need to depend on OF, methinks.
>> > The few instances of properties reading can be
>> > easily rewritten to device_* functions (from include/linux/property.h).
>> > The of_get_child_by_name() can become device_get_named_child_node().
>> >
>> > Geert, what do you think?
>>
>> Sure, that can be done later, when an ACPI user appears?
>
> Actually with PRP0001 approach any of compatible driver may be used onACPI platform. So, what you are saying can be interpreted the way “we don’t care about users on ACPI based platforms”. If it is the case, then it should be told explicitly.

I think you're interpreting too much ;-)
My point is simply:

>> The dependency on OF was pre-existing, and this series is already
>> at v5.

If any OF compatible driver can now be used on ACPI platforms, perhaps
this should be handled at the API level? I.e. the distinction between
OF and device properties should be dropped completely, and all drivers
be converted mechanically in one shot, instead of a gradual ad-hoc
conversion being sneaked in through other series like this one?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
