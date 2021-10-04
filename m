Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0AD42074B
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 10:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhJDI2h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 04:28:37 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:33382 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbhJDI2g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 04:28:36 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id B0A4A44A024E;
        Mon,  4 Oct 2021 10:26:45 +0200 (CEST)
MIME-Version: 1.0
Date:   Mon, 04 Oct 2021 10:26:45 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Subject: Re: [PATCH v6 19/19] auxdisplay: ht16k33: Add LED support
Reply-To: robin@protonic.nl
In-Reply-To: <CAMuHMdVOa8DAGJQpJ8AotARxfh9PvpskJJa6k48jE92-P+GLRA@mail.gmail.com>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-20-geert@linux-m68k.org>
 <4602a8e681db4d0ebc43e4dafee8c28e@protonic.nl>
 <CAMuHMdVOa8DAGJQpJ8AotARxfh9PvpskJJa6k48jE92-P+GLRA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <bc1632943ecbb7e244b87c285501f706@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert,

On 2021-10-01 17:51, Geert Uytterhoeven wrote:
> Hoi Robin,
> 
> On Thu, Sep 30, 2021 at 12:57 PM Robin van der Gracht <robin@protonic.nl> 
> wrote:
>> On 2021-09-14 16:38, Geert Uytterhoeven wrote:
>> > Instantiate a single LED based on the "led" subnode in DT.
>> > This allows the user to control display brightness and blinking (backed
>> > by hardware support) through the LED class API and triggers, and exposes
>> > the display color.  The LED will be named
>> > "auxdisplay:<color>:<function>".
>> >
>> > When running in dot-matrix mode and if no "led" subnode is found, the
>> > driver falls back to the traditional backlight mode, to preserve
>> > backwards compatibility.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> > Reviewed-by: Marek Behún <kabel@kernel.org>
>> > ---
>> > v6:
>> >   - Add Reviewed-by,
>> >   - Reorder operations in ht16k33_led_probe() to ease future conversion
>> >     to device properties,
> 
>> > --- a/drivers/auxdisplay/ht16k33.c
>> > +++ b/drivers/auxdisplay/ht16k33.c
>> > @@ -425,6 +477,35 @@ static void ht16k33_seg14_update(struct work_struct
>> > *work)
>> >       i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
>> >  }
>> >
>> > +static int ht16k33_led_probe(struct device *dev, struct led_classdev *led,
>> > +                          unsigned int brightness)
>> > +{
>> > +     struct led_init_data init_data = {};
>> > +     struct device_node *node;
>> > +     int err;
>> > +
>> > +     /* The LED is optional */
>> > +     node = of_get_child_by_name(dev->of_node, "led");
>> > +     if (!node)
>> > +             return 0;
>> > +
>> > +     init_data.fwnode = of_fwnode_handle(node);
>> > +     init_data.devicename = "auxdisplay";
>> > +     init_data.devname_mandatory = true;
>> > +
>> > +     led->brightness_set_blocking = ht16k33_brightness_set_blocking;
>> > +     led->blink_set = ht16k33_blink_set;
>> > +     led->flags = LED_CORE_SUSPENDRESUME;
>> > +     led->brightness = brightness;
>> > +     led->max_brightness = MAX_BRIGHTNESS;
>> 
>> What do you think about adding a default trigger and making it 'backlight'?
>> 
>> led->default_trigger = "blacklight";
>> 
>> Or as an alternative, suggesting linux,default-trigger = "backlight" in the
>> docs? Since the led class won't respond to blank events by just making it's
>> function LED_FUNCTION_BACKLIGHT.
>> 
>> led {
>>         function = LED_FUNCTION_BACKLIGHT;
>>         color = <LED_COLOR_ID_GREEN>;
>>         linux,default-trigger = "backlight";
>> };
> 
> The latter makes perfect sense to me.  Will do.

Ack.

> 
>> I noticed blanking is broken. The backlight device (or LED device with
>> backlight trigger) doens't get notified when the framebuffer is blanked 
>> since
>> the driver doesn't implement fb_blank.
>> 
>> Right now:
>> 
>> echo 1 > /sys/class/graphics/fb0/blank
>>                                                              |
>> sh: write error: Invalid argument
>> 
>> Due to:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/fbdev/core/fbmem.c?h=v5.15-rc3#n1078
> 
> That's a pre-existing problem, righ? ;-)

Yes it is. The fix is easy and since we're making major driver changes now...
I needed the fix to properly test the changes we're making, so I thought we
might as well include it.

> 
>> Something like this fixes it.
>> 
>> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
>> index 89ee5b4b3dfc..0883d5252c81 100644
>> --- a/drivers/auxdisplay/ht16k33.c
>> +++ b/drivers/auxdisplay/ht16k33.c
>> @@ -346,6 +346,15 @@ static int ht16k33_mmap(struct fb_info *info, struct
>> vm_area_struct *vma)
>>          return vm_map_pages_zero(vma, &pages, 1);
>>   }
>> 
>> +/*
>> + * Blank events will be passed to the backlight device (or the LED device 
>> if
>> + * it's trigger is 'backlight') when we return 0 here.
>> + */
>> +static int ht16k33_blank(int blank, struct fb_info *info)
>> +{
>> +       return 0;
>> +}
>> +
>>   static const struct fb_ops ht16k33_fb_ops = {
>>          .owner = THIS_MODULE,
>>          .fb_read = fb_sys_read,
>> @@ -354,6 +363,7 @@ static const struct fb_ops ht16k33_fb_ops = {
>>          .fb_copyarea = sys_copyarea,
>>          .fb_imageblit = sys_imageblit,
>>          .fb_mmap = ht16k33_mmap,
>> +       .fb_blank = ht16k33_blank,
>>   };
>> 
>>   /*
>> 
>> Feel free to include (something like) this in the patch stack.
> 
> Thanks, will do.

Ack.

> 
>> > +
>> > +     err = devm_led_classdev_register_ext(dev, led, &init_data);
>> > +     if (err)
>> > +             dev_err(dev, "Failed to register LED\n");
>> 
>> You might want to call ht16k33_brightness_set(priv, brightness) here to get 
>> a
>> know value into the display setup register (0x80).
>> 
>> Right now if I enable hardware blinking and (soft)reboot my board it keeps 
>> on
>> blinking even after a re-probe.
> 
> I don't have that issue.
> Aha, ht16k33_seg_probe() calls ht16k33_brightness_set(), but
> ht16k33_fbdev_probe() doesn't.  The latter should do that, too,
> when not using backwards compatibility mode.

Ack. I have hardware which uses the ht16k33 in dot matrix mode and I tested
both the backlight and led setup. I ran into this with the fbdev + led setup.

I noticed ht16k33_bl_update_status() is called in ht16k33_fbdev_probe()
before the fbdev device is registered. Which is fine right now, but in theory
the fbdev blank state can influence the backlight setting (nitpick since
the fbdev device is unblanked by default).

The point: Maybe ht16k33_brightness_set() (or ht16k33_bl_update_status() for
backlight device) should be called in one central place (i.e at the end of 
the
main probe function).

> 
>> > @@ -575,7 +660,7 @@ static int ht16k33_seg_probe(struct device *dev, struct
>> > ht16k33_priv *priv,
>> >       struct ht16k33_seg *seg = &priv->seg;
>> >       int err;
>> >
>> > -     err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
>> > +     err = ht16k33_brightness_set(priv, brightness);
>> 
>> This looks like a bugfix for patch 17, maybe move this change there?
> 
> Indeed. Bad rebase. Will move.
> 
> Thanks a lot for your comments!

:)

- Robin
