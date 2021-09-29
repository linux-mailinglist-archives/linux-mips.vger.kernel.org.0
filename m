Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6818141C6A9
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 16:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344462AbhI2Oas (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Sep 2021 10:30:48 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:33620 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245127AbhI2Oan (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Sep 2021 10:30:43 -0400
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Sep 2021 10:30:41 EDT
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 0ED0144A024E;
        Wed, 29 Sep 2021 16:21:07 +0200 (CEST)
MIME-Version: 1.0
Date:   Wed, 29 Sep 2021 16:21:07 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/19] auxdisplay: ht16k33: Connect backlight to fbdev
Reply-To: robin@protonic.nl
In-Reply-To: <20210914143835.511051-10-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-10-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <50740100a1062b981948e1773574928a@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Robin van der Gracht <robin@protonic.nl>

On 2021-09-14 16:38, Geert Uytterhoeven wrote:
> Currently /sys/class/graphics/fb0/bl_curve is not accessible (-ENODEV),
> as the driver does not connect the backlight to the frame buffer device.
> Fix this moving backlight initialization up, and filling in
> fb_info.bl_dev.
> 
> Fixes: 8992da44c6805d53 ("auxdisplay: ht16k33: Driver for LED controller")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v6:
>   - No changes,
> 
> v5:
>   - No changes,
> 
> v4:
>   - No changes,
> 
> v3:
>   - No changes,
> 
> v2:
>   - New.
> ---
>  drivers/auxdisplay/ht16k33.c | 56 ++++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 1e69cc6d21a0dca2..2b630e194570f6e5 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -413,6 +413,33 @@ static int ht16k33_probe(struct i2c_client *client,
>  	if (err)
>  		return err;
> 
> +	/* Backlight */
> +	memset(&bl_props, 0, sizeof(struct backlight_properties));
> +	bl_props.type = BACKLIGHT_RAW;
> +	bl_props.max_brightness = MAX_BRIGHTNESS;
> +
> +	bl = devm_backlight_device_register(&client->dev, DRIVER_NAME"-bl",
> +					    &client->dev, priv,
> +					    &ht16k33_bl_ops, &bl_props);
> +	if (IS_ERR(bl)) {
> +		dev_err(&client->dev, "failed to register backlight\n");
> +		return PTR_ERR(bl);
> +	}
> +
> +	err = of_property_read_u32(node, "default-brightness-level",
> +				   &dft_brightness);
> +	if (err) {
> +		dft_brightness = MAX_BRIGHTNESS;
> +	} else if (dft_brightness > MAX_BRIGHTNESS) {
> +		dev_warn(&client->dev,
> +			 "invalid default brightness level: %u, using %u\n",
> +			 dft_brightness, MAX_BRIGHTNESS);
> +		dft_brightness = MAX_BRIGHTNESS;
> +	}
> +
> +	bl->props.brightness = dft_brightness;
> +	ht16k33_bl_update_status(bl);
> +
>  	/* Framebuffer (2 bytes per column) */
>  	BUILD_BUG_ON(PAGE_SIZE < HT16K33_FB_SIZE);
>  	fbdev->buffer = (unsigned char *) get_zeroed_page(GFP_KERNEL);
> @@ -445,6 +472,7 @@ static int ht16k33_probe(struct i2c_client *client,
>  	fbdev->info->screen_size = HT16K33_FB_SIZE;
>  	fbdev->info->fix = ht16k33_fb_fix;
>  	fbdev->info->var = ht16k33_fb_var;
> +	fbdev->info->bl_dev = bl;
>  	fbdev->info->pseudo_palette = NULL;
>  	fbdev->info->flags = FBINFO_FLAG_DEFAULT;
>  	fbdev->info->par = priv;
> @@ -460,34 +488,6 @@ static int ht16k33_probe(struct i2c_client *client,
>  			goto err_fbdev_unregister;
>  	}
> 
> -	/* Backlight */
> -	memset(&bl_props, 0, sizeof(struct backlight_properties));
> -	bl_props.type = BACKLIGHT_RAW;
> -	bl_props.max_brightness = MAX_BRIGHTNESS;
> -
> -	bl = devm_backlight_device_register(&client->dev, DRIVER_NAME"-bl",
> -					    &client->dev, priv,
> -					    &ht16k33_bl_ops, &bl_props);
> -	if (IS_ERR(bl)) {
> -		dev_err(&client->dev, "failed to register backlight\n");
> -		err = PTR_ERR(bl);
> -		goto err_fbdev_unregister;
> -	}
> -
> -	err = of_property_read_u32(node, "default-brightness-level",
> -				   &dft_brightness);
> -	if (err) {
> -		dft_brightness = MAX_BRIGHTNESS;
> -	} else if (dft_brightness > MAX_BRIGHTNESS) {
> -		dev_warn(&client->dev,
> -			 "invalid default brightness level: %u, using %u\n",
> -			 dft_brightness, MAX_BRIGHTNESS);
> -		dft_brightness = MAX_BRIGHTNESS;
> -	}
> -
> -	bl->props.brightness = dft_brightness;
> -	ht16k33_bl_update_status(bl);
> -
>  	ht16k33_fb_queue(priv);
>  	return 0;
