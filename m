Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCFA34C4F2
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 09:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhC2HaZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 03:30:25 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:46670 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbhC2HaK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Mar 2021 03:30:10 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id D864544A022C;
        Mon, 29 Mar 2021 09:30:08 +0200 (CEST)
MIME-Version: 1.0
Date:   Mon, 29 Mar 2021 09:30:08 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 16/17] auxdisplay: ht16k33: Add support for segment
 displays
Reply-To: robin@protonic.nl
In-Reply-To: <CAMuHMdXJV3duE=uhCD3XSVn35Y5=iafOOUu5_57-1TtW062ZJg@mail.gmail.com>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-17-geert@linux-m68k.org>
 <2868cd091dc6ff0cab14b5da07f89984@protonic.nl>
 <CAMuHMdXJV3duE=uhCD3XSVn35Y5=iafOOUu5_57-1TtW062ZJg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <8376c4a183971aef9631c1bc64f9222c@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-29 09:15, Geert Uytterhoeven wrote:
> Hoi Robin,
> 
> On Mon, Mar 29, 2021 at 9:09 AM Robin van der Gracht 
> <robin@protonic.nl> wrote:
>> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
>> > The Holtek HT16K33 LED controller is not only used for driving
>> > dot-matrix displays, but also for driving segment displays.
>> >
>> > Add support for 4-digit 7-segment and quad 14-segment alphanumeric
>> > displays, like the Adafruit 7-segment and 14-segment display backpack
>> > and FeatherWing expansion boards.  Use the character line display core
>> > support to display a message, which will be scrolled if it doesn't fit.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> > ---
>> > The 7-segment support is based on schematics, and untested on actual
>> > hardware.
>> > ---
>> >  drivers/auxdisplay/ht16k33.c | 198 +++++++++++++++++++++++++++++++++--
>> >  1 file changed, 191 insertions(+), 7 deletions(-)
>> >
>> ...
>> >
>> > +static int ht16k33_seg_probe(struct i2c_client *client,
>> > +                          struct ht16k33_priv *priv, uint32_t brightness)
>> > +{
>> > +     struct ht16k33_seg *seg = &priv->seg;
>> > +     struct device *dev = &client->dev;
>> > +     int err;
>> > +
>> > +     err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
>> > +     if (err)
>> > +             return err;
>> > +
>> > +     switch (priv->type) {
>> > +     case DISP_MATRIX:
>> > +             /* not handled here */
>> > +             break;
>> 
>> This 'case' shouldn't happen. Having said that, the break here will
>> still
>> cause the linedisp_register() function to be called for the 
>> DISP_MATRIX
>> type.
>> If you'd like to handle this case, a return (or setting 'err') should
>> prevent this.
> 
> This function is never called if priv->type == DISP_MATRIX, so this
> cannot happen.  However, gcc complains if not all enum values are
> handled in a switch() statement, hence the dummy case.

I see. But if it's there it should work right? :P

> Is there a better way to handle this?

How about adding the default case:

default:
     /* not handled */
     err = -EINVAL;

Groetjes/Kind regards,
Robin van der Gracht

-- 
Protonic Holland
Factorij 36
1689AL Zwaag
+31 (0)229 212928
https://www.protonic.nl
