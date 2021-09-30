Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C285341D836
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 12:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350231AbhI3K65 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 06:58:57 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:43930 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350206AbhI3K6y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 06:58:54 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 70F2944A024E;
        Thu, 30 Sep 2021 12:57:09 +0200 (CEST)
MIME-Version: 1.0
Date:   Thu, 30 Sep 2021 12:57:09 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Subject: Re: [PATCH v6 19/19] auxdisplay: ht16k33: Add LED support
Reply-To: robin@protonic.nl
In-Reply-To: <20210914143835.511051-20-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-20-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4602a8e681db4d0ebc43e4dafee8c28e@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert,

On 2021-09-14 16:38, Geert Uytterhoeven wrote:
> Instantiate a single LED based on the "led" subnode in DT.
> This allows the user to control display brightness and blinking (backed
> by hardware support) through the LED class API and triggers, and exposes
> the display color.  The LED will be named
> "auxdisplay:<color>:<function>".
> 
> When running in dot-matrix mode and if no "led" subnode is found, the
> driver falls back to the traditional backlight mode, to preserve
> backwards compatibility.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Marek Behún <kabel@kernel.org>
> ---
> v6:
>   - Add Reviewed-by,
>   - Reorder operations in ht16k33_led_probe() to ease future conversion
>     to device properties,
> 
> v5:
>   - Add missing select NEW_LEDS,
> 
> v4:
>   - Add missing select LEDS_CLASS,
> 
> v3:
>   - Remove unneeded C++ comment,
>   - Use "err" instead of "error" to be consistent with existing driver
>     naming style,
>   - Make the creation of the LED device dependent on the presence of the
>     "led" subnode in DT, so it can be used in dot-matrix mode too.
>   - Use led_init_data() and devm_led_classdev_register_ext() to retrieve
>     all LED properties from DT, instead of manual LED name construction
>     based on just the "color" property,
> 
> v2:
>   - Use "auxdisplay" instead of DRIVER_NAME in LED name.
> ---
>  drivers/auxdisplay/Kconfig   |   2 +
>  drivers/auxdisplay/ht16k33.c | 124 ++++++++++++++++++++++++++++++-----
>  2 files changed, 109 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index 42fc7b155de09dbc..e32ef7f9945d49b2 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -176,6 +176,8 @@ config HT16K33
>  	select FB_SYS_IMAGEBLIT
>  	select INPUT_MATRIXKMAP
>  	select FB_BACKLIGHT
> +	select NEW_LEDS
> +	select LEDS_CLASS
>  	select LINEDISP
>  	help
>  	  Say yes here to add support for Holtek HT16K33, RAM mapping 16*8
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 3b555e119e326cec..89ee5b4b3dfccb68 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -18,6 +18,7 @@
>  #include <linux/backlight.h>
>  #include <linux/input.h>
>  #include <linux/input/matrix_keypad.h>
> +#include <linux/leds.h>
>  #include <linux/workqueue.h>
>  #include <linux/mm.h>
> 
> @@ -34,6 +35,10 @@
> 
>  #define REG_DISPLAY_SETUP		0x80
>  #define REG_DISPLAY_SETUP_ON		BIT(0)
> +#define REG_DISPLAY_SETUP_BLINK_OFF	(0 << 1)
> +#define REG_DISPLAY_SETUP_BLINK_2HZ	(1 << 1)
> +#define REG_DISPLAY_SETUP_BLINK_1HZ	(2 << 1)
> +#define REG_DISPLAY_SETUP_BLINK_0HZ5	(3 << 1)
> 
>  #define REG_ROWINT_SET			0xA0
>  #define REG_ROWINT_SET_INT_EN		BIT(0)
> @@ -94,12 +99,14 @@ struct ht16k33_seg {
>  struct ht16k33_priv {
>  	struct i2c_client *client;
>  	struct delayed_work work;
> +	struct led_classdev led;
>  	struct ht16k33_keypad keypad;
>  	union {
>  		struct ht16k33_fbdev fbdev;
>  		struct ht16k33_seg seg;
>  	};
>  	enum display_type type;
> +	uint8_t blink;
>  };
> 
>  static const struct fb_fix_screeninfo ht16k33_fb_fix = {
> @@ -158,7 +165,7 @@ static DEVICE_ATTR(map_seg14, 0644, map_seg_show, 
> map_seg_store);
> 
>  static int ht16k33_display_on(struct ht16k33_priv *priv)
>  {
> -	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
> +	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON | priv->blink;
> 
>  	return i2c_smbus_write_byte(priv->client, data);
>  }
> @@ -173,8 +180,10 @@ static int ht16k33_brightness_set(struct ht16k33_priv 
> *priv,
>  {
>  	int err;
> 
> -	if (brightness == 0)
> +	if (brightness == 0) {
> +		priv->blink = REG_DISPLAY_SETUP_BLINK_OFF;
>  		return ht16k33_display_off(priv);
> +	}
> 
>  	err = ht16k33_display_on(priv);
>  	if (err)
> @@ -184,6 +193,49 @@ static int ht16k33_brightness_set(struct ht16k33_priv 
> *priv,
>  				    REG_BRIGHTNESS | (brightness - 1));
>  }
> 
> +static int ht16k33_brightness_set_blocking(struct led_classdev *led_cdev,
> +					   enum led_brightness brightness)
> +{
> +	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
> +						 led);
> +
> +	return ht16k33_brightness_set(priv, brightness);
> +}
> +
> +static int ht16k33_blink_set(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
> +						 led);
> +	unsigned int delay;
> +	uint8_t blink;
> +	int err;
> +
> +	if (!*delay_on && !*delay_off) {
> +		blink = REG_DISPLAY_SETUP_BLINK_1HZ;
> +		delay = 1000;
> +	} else if (*delay_on <= 750) {
> +		blink = REG_DISPLAY_SETUP_BLINK_2HZ;
> +		delay = 500;
> +	} else if (*delay_on <= 1500) {
> +		blink = REG_DISPLAY_SETUP_BLINK_1HZ;
> +		delay = 1000;
> +	} else {
> +		blink = REG_DISPLAY_SETUP_BLINK_0HZ5;
> +		delay = 2000;
> +	}
> +
> +	err = i2c_smbus_write_byte(priv->client,
> +				   REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON |
> +				   blink);
> +	if (err)
> +		return err;
> +
> +	priv->blink = blink;
> +	*delay_on = *delay_off = delay;
> +	return 0;
> +}
> +
>  static void ht16k33_fb_queue(struct ht16k33_priv *priv)
>  {
>  	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> @@ -425,6 +477,35 @@ static void ht16k33_seg14_update(struct work_struct 
> *work)
>  	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
>  }
> 
> +static int ht16k33_led_probe(struct device *dev, struct led_classdev *led,
> +			     unsigned int brightness)
> +{
> +	struct led_init_data init_data = {};
> +	struct device_node *node;
> +	int err;
> +
> +	/* The LED is optional */
> +	node = of_get_child_by_name(dev->of_node, "led");
> +	if (!node)
> +		return 0;
> +
> +	init_data.fwnode = of_fwnode_handle(node);
> +	init_data.devicename = "auxdisplay";
> +	init_data.devname_mandatory = true;
> +
> +	led->brightness_set_blocking = ht16k33_brightness_set_blocking;
> +	led->blink_set = ht16k33_blink_set;
> +	led->flags = LED_CORE_SUSPENDRESUME;
> +	led->brightness = brightness;
> +	led->max_brightness = MAX_BRIGHTNESS;

What do you think about adding a default trigger and making it 'backlight'?

led->default_trigger = "blacklight";

Or as an alternative, suggesting linux,default-trigger = "backlight" in the
docs? Since the led class won't respond to blank events by just making it's
function LED_FUNCTION_BACKLIGHT.

led {
	function = LED_FUNCTION_BACKLIGHT;
	color = <LED_COLOR_ID_GREEN>;
	linux,default-trigger = "backlight";
};

I noticed blanking is broken. The backlight device (or LED device with
backlight trigger) doens't get notified when the framebuffer is blanked since
the driver doesn't implement fb_blank.

Right now:

echo 1 > /sys/class/graphics/fb0/blank                                        
                                                             |
sh: write error: Invalid argument

Due to: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/fbdev/core/fbmem.c?h=v5.15-rc3#n1078

Something like this fixes it.

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 89ee5b4b3dfc..0883d5252c81 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -346,6 +346,15 @@ static int ht16k33_mmap(struct fb_info *info, struct 
vm_area_struct *vma)
         return vm_map_pages_zero(vma, &pages, 1);
  }

+/*
+ * Blank events will be passed to the backlight device (or the LED device if
+ * it's trigger is 'backlight') when we return 0 here.
+ */
+static int ht16k33_blank(int blank, struct fb_info *info)
+{
+       return 0;
+}
+
  static const struct fb_ops ht16k33_fb_ops = {
         .owner = THIS_MODULE,
         .fb_read = fb_sys_read,
@@ -354,6 +363,7 @@ static const struct fb_ops ht16k33_fb_ops = {
         .fb_copyarea = sys_copyarea,
         .fb_imageblit = sys_imageblit,
         .fb_mmap = ht16k33_mmap,
+       .fb_blank = ht16k33_blank,
  };

  /*

Feel free to include (something like) this in the patch stack.


> +
> +	err = devm_led_classdev_register_ext(dev, led, &init_data);
> +	if (err)
> +		dev_err(dev, "Failed to register LED\n");

You might want to call ht16k33_brightness_set(priv, brightness) here to get a
know value into the display setup register (0x80).

Right now if I enable hardware blinking and (soft)reboot my board it keeps on
blinking even after a re-probe.

> +
> +	return err;
> +}
> +
>  static int ht16k33_keypad_probe(struct i2c_client *client,
>  				struct ht16k33_keypad *keypad)
>  {
> @@ -498,24 +579,28 @@ static int ht16k33_fbdev_probe(struct device *dev,
> struct ht16k33_priv *priv,
>  			       uint32_t brightness)
>  {
>  	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> -	struct backlight_properties bl_props;
> -	struct backlight_device *bl;
> +	struct backlight_device *bl = NULL;
>  	int err;
> 
> -	/* Backlight */
> -	memset(&bl_props, 0, sizeof(struct backlight_properties));
> -	bl_props.type = BACKLIGHT_RAW;
> -	bl_props.max_brightness = MAX_BRIGHTNESS;
> +	if (!priv->led.dev) {
> +		/* backwards compatibility with DT lacking an led subnode */
> +		struct backlight_properties bl_props;
> 
> -	bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev, priv,
> -					    &ht16k33_bl_ops, &bl_props);
> -	if (IS_ERR(bl)) {
> -		dev_err(dev, "failed to register backlight\n");
> -		return PTR_ERR(bl);
> -	}
> +		memset(&bl_props, 0, sizeof(struct backlight_properties));
> +		bl_props.type = BACKLIGHT_RAW;
> +		bl_props.max_brightness = MAX_BRIGHTNESS;
> +
> +		bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev,
> +						    priv, &ht16k33_bl_ops,
> +						    &bl_props);
> +		if (IS_ERR(bl)) {
> +			dev_err(dev, "failed to register backlight\n");
> +			return PTR_ERR(bl);
> +		}
> 
> -	bl->props.brightness = brightness;
> -	ht16k33_bl_update_status(bl);
> +		bl->props.brightness = brightness;
> +		ht16k33_bl_update_status(bl);
> +	}
> 
>  	/* Framebuffer (2 bytes per column) */
>  	BUILD_BUG_ON(PAGE_SIZE < HT16K33_FB_SIZE);
> @@ -575,7 +660,7 @@ static int ht16k33_seg_probe(struct device *dev, struct
> ht16k33_priv *priv,
>  	struct ht16k33_seg *seg = &priv->seg;
>  	int err;
> 
> -	err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> +	err = ht16k33_brightness_set(priv, brightness);

This looks like a bugfix for patch 17, maybe move this change there?

>  	if (err)
>  		return err;
> 
> @@ -653,6 +738,11 @@ static int ht16k33_probe(struct i2c_client *client)
>  		dft_brightness = MAX_BRIGHTNESS;
>  	}
> 
> +	/* LED */
> +	err = ht16k33_led_probe(dev, &priv->led, dft_brightness);
> +	if (err)
> +		return err;
> +
>  	/* Keypad */
>  	if (client->irq > 0) {
>  		err = ht16k33_keypad_probe(client, &priv->keypad);

Gr{oetje,eeting}s,
Robin
