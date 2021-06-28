Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA4C3B5C54
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 12:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhF1KSV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 06:18:21 -0400
Received: from lists.nic.cz ([217.31.204.67]:60428 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231935AbhF1KST (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 06:18:19 -0400
Received: from thinkpad (unknown [172.20.6.87])
        by mail.nic.cz (Postfix) with ESMTPSA id 9F04114127E;
        Mon, 28 Jun 2021 12:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1624875352; bh=AVPE3P+nI6g626e4oR2CfVzlMneudbRTcs+sdqt5ipE=;
        h=Date:From:To;
        b=pzDhtri1EBf6OwHOBdIQi95Fy/3Kb+zsij38kLZoj4AQ2YY1pCVliJQ6Qbiv9sRLA
         Q+aj2WcEkHWqXODdEaIL7Tl3dHIkoS5/E0GpAB8AI4fNmzvKJ48IHSgojYM1Wooxg9
         4lvP0/5HQcCZJHcD+NtwzWWegYJfgApljtZYytAY=
Date:   Mon, 28 Jun 2021 12:15:51 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 18/18] auxdisplay: ht16k33: Add segment display LED
 support
Message-ID: <20210628121551.185ce0f4@thinkpad>
In-Reply-To: <CAMuHMdV5fywjF63MqE_SqfumwN3EY=jBTEiMfqbjFO12c_nj0Q@mail.gmail.com>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
        <20210625125902.1162428-19-geert@linux-m68k.org>
        <20210625223916.7e00e710@thinkpad>
        <CAMuHMdV5fywjF63MqE_SqfumwN3EY=jBTEiMfqbjFO12c_nj0Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 28 Jun 2021 11:21:04 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Marek,
> 
> On Fri, Jun 25, 2021 at 10:39 PM Marek Behun <marek.behun@nic.cz> wrote:
> > On Fri, 25 Jun 2021 14:59:02 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >  
> > > Instantiate a single LED for a segment display.  This allows the user to
> > > control display brightness and blinking through the LED class API and
> > > triggers, and exposes the display color.
> > > The LED will be named "auxdisplay:<color>:backlight".  
> >
> > What if there are multiple "auxdisplay"s ?  
> 
> I understand the LED core will just add a suffix on a name collision.
> 
> > Doesn't this subsystem have IDs? So that you can use auxdisplayN for
> > device name, for example?  
> 
> Auxdisplay does not have IDs, as there is no subsystem to register
> with.  It's just a collection of drivers for auxiliary displays with
> no common API.  Some drivers use fbdev, others use a chardev, or an
> attribute file in sysfs.
> 
> BTW, I just followed Pavel's advice in naming.

Very well.

> > > +     of_property_read_u32(node, "color", &color);
> > > +     seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
> > > +                     "auxdisplay:%s:" LED_FUNCTION_BACKLIGHT,
> > > +                     color < LED_COLOR_ID_MAX ? led_colors[color] : "");  
> >
> > If you use devm_led_classdev_register_ext and pass struct
> > led_init_data, LED core will generate name of the LED itself.  
> 
> Will that make any difference, except for adding more code?

You are hardcoding the backlight function. Using the _ext() registering
function will make it so that the function and color are parsed from
fwnode by LED core. I understand that the function will always be
"backlight" in this case, but this should be specified in the
device-tree anyway, so why not use it?

> Looking at the implementation, I still have to use devm_kasprintf()
> to combine color and function for led_init_data.default_label?

AFAIK you don't have to fill in default_label. (If the needed OF
properties are not present so that default_label is tried, it means the
device-tree does not correctly specify the device. In that case I don't
think it is a problem if the default_label is not present and LED
core will use the OF node name as the LED name.)

The code could look like this

  struct led_init_data init_data = {};

  init_data.fwnode = of_fwnode_handle(node);
  init_data.devicename = "auxdisplay";
  init_data.devname_mandatory = true;

  ...register_ext();

But if you still don't want to do this then ignore me :)

Marek
