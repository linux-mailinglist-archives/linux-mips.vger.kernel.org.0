Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D50041D3F0
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 09:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348508AbhI3HKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 03:10:54 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:41908 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbhI3HKy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 03:10:54 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 0E17144A024E;
        Thu, 30 Sep 2021 09:09:10 +0200 (CEST)
MIME-Version: 1.0
Date:   Thu, 30 Sep 2021 09:09:10 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/19] auxdisplay: ht16k33: Extract frame buffer
 probing
Reply-To: robin@protonic.nl
In-Reply-To: <20210914143835.511051-17-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-17-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <50e2415e70f3c8b2afd583a42a4cf94e@protonic.nl>
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
> Extract all frame buffer (including backlight) probing into
> ht16k33_fbdev_probe().
> 
> Call ht16k33_fbdev_probe() after ht16k33_keypad_probe(), as the latter
> does not need any manual cleanup in the probe error path.
> 
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
>   - Pass "dev" instead of "client" to ht16k33_fbdev_probe(),
>   - Drop local variable "node",
> 
> v2:
>   - Rebased.
> ---
>  drivers/auxdisplay/ht16k33.c | 101 ++++++++++++++++++-----------------
>  1 file changed, 53 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 928ac9722c142855..27ac167dae74bd82 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -394,33 +394,13 @@ static int ht16k33_keypad_probe(struct i2c_client 
> *client,
>  	return input_register_device(keypad->dev);
>  }
> 
> -static int ht16k33_probe(struct i2c_client *client)
> +static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv 
> *priv,
> +			       uint32_t brightness)
>  {
> -	int err;
> -	uint32_t dft_brightness;
> -	struct backlight_device *bl;
> +	struct ht16k33_fbdev *fbdev = &priv->fbdev;
>  	struct backlight_properties bl_props;
> -	struct ht16k33_priv *priv;
> -	struct ht16k33_fbdev *fbdev;
> -	struct device *dev = &client->dev;
> -	struct device_node *node = dev->of_node;
> -
> -	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> -		dev_err(dev, "i2c_check_functionality error\n");
> -		return -EIO;
> -	}
> -
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	priv->client = client;
> -	i2c_set_clientdata(client, priv);
> -	fbdev = &priv->fbdev;
> -
> -	err = ht16k33_initialize(priv);
> -	if (err)
> -		return err;
> +	struct backlight_device *bl;
> +	int err;
> 
>  	/* Backlight */
>  	memset(&bl_props, 0, sizeof(struct backlight_properties));
> @@ -434,18 +414,7 @@ static int ht16k33_probe(struct i2c_client *client)
>  		return PTR_ERR(bl);
>  	}
> 
> -	err = of_property_read_u32(node, "default-brightness-level",
> -				   &dft_brightness);
> -	if (err) {
> -		dft_brightness = MAX_BRIGHTNESS;
> -	} else if (dft_brightness > MAX_BRIGHTNESS) {
> -		dev_warn(dev,
> -			 "invalid default brightness level: %u, using %u\n",
> -			 dft_brightness, MAX_BRIGHTNESS);
> -		dft_brightness = MAX_BRIGHTNESS;
> -	}
> -
> -	bl->props.brightness = dft_brightness;
> +	bl->props.brightness = brightness;
>  	ht16k33_bl_update_status(bl);
> 
>  	/* Framebuffer (2 bytes per column) */
> @@ -466,8 +435,8 @@ static int ht16k33_probe(struct i2c_client *client)
>  		goto err_fbdev_buffer;
>  	}
> 
> -	err = of_property_read_u32(node, "refresh-rate-hz",
> -		&fbdev->refresh_rate);
> +	err = of_property_read_u32(dev->of_node, "refresh-rate-hz",
> +				   &fbdev->refresh_rate);
>  	if (err) {
>  		dev_err(dev, "refresh rate not specified\n");
>  		goto err_fbdev_info;
> @@ -489,18 +458,9 @@ static int ht16k33_probe(struct i2c_client *client)
>  	if (err)
>  		goto err_fbdev_info;
> 
> -	/* Keypad */
> -	if (client->irq > 0) {
> -		err = ht16k33_keypad_probe(client, &priv->keypad);
> -		if (err)
> -			goto err_fbdev_unregister;
> -	}
> -
>  	ht16k33_fb_queue(priv);
>  	return 0;
> 
> -err_fbdev_unregister:
> -	unregister_framebuffer(fbdev->info);
>  err_fbdev_info:
>  	framebuffer_release(fbdev->info);
>  err_fbdev_buffer:
> @@ -509,6 +469,51 @@ static int ht16k33_probe(struct i2c_client *client)
>  	return err;
>  }
> 
> +static int ht16k33_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct ht16k33_priv *priv;
> +	uint32_t dft_brightness;
> +	int err;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "i2c_check_functionality error\n");
> +		return -EIO;
> +	}
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client = client;
> +	i2c_set_clientdata(client, priv);
> +
> +	err = ht16k33_initialize(priv);
> +	if (err)
> +		return err;
> +
> +	err = of_property_read_u32(dev->of_node, "default-brightness-level",
> +				   &dft_brightness);
> +	if (err) {
> +		dft_brightness = MAX_BRIGHTNESS;
> +	} else if (dft_brightness > MAX_BRIGHTNESS) {
> +		dev_warn(dev,
> +			 "invalid default brightness level: %u, using %u\n",
> +			 dft_brightness, MAX_BRIGHTNESS);
> +		dft_brightness = MAX_BRIGHTNESS;
> +	}
> +
> +	/* Keypad */
> +	if (client->irq > 0) {
> +		err = ht16k33_keypad_probe(client, &priv->keypad);
> +		if (err)
> +			return err;
> +	}
> +
> +	/* Frame Buffer Display */
> +	return ht16k33_fbdev_probe(dev, priv, dft_brightness);
> +}
> +
>  static int ht16k33_remove(struct i2c_client *client)
>  {
>  	struct ht16k33_priv *priv = i2c_get_clientdata(client);

Met vriendelijke groet,
Robin van der Gracht

-- 
Protonic Holland
Factorij 36
1689AL Zwaag
+31 (0)229 212928
https://www.protonic.nl
