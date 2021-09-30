Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E70041D3C2
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 08:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348350AbhI3HAX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 03:00:23 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:41812 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhI3HAW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 03:00:22 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 6EDA744A024E;
        Thu, 30 Sep 2021 08:58:38 +0200 (CEST)
MIME-Version: 1.0
Date:   Thu, 30 Sep 2021 08:58:38 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/19] auxdisplay: ht16k33: Extract
 ht16k33_brightness_set()
Reply-To: robin@protonic.nl
In-Reply-To: <20210914143835.511051-16-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-16-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <39669058fbcac7d5612066e4f8146956@protonic.nl>
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
> Extract brightness handling into a helper function, so it can be called
> from multiple places.
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
>   - Use "err" instead of "error" to be consistent with existing driver
>     naming style,
> 
> v2:
>   - No changes.
> ---
>  drivers/auxdisplay/ht16k33.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index c7a3a0e1fbb5d03e..928ac9722c142855 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -113,6 +113,22 @@ static int ht16k33_display_off(struct ht16k33_priv 
> *priv)
>  	return i2c_smbus_write_byte(priv->client, REG_DISPLAY_SETUP);
>  }
> 
> +static int ht16k33_brightness_set(struct ht16k33_priv *priv,
> +				  unsigned int brightness)
> +{
> +	int err;
> +
> +	if (brightness == 0)
> +		return ht16k33_display_off(priv);
> +
> +	err = ht16k33_display_on(priv);
> +	if (err)
> +		return err;
> +
> +	return i2c_smbus_write_byte(priv->client,
> +				    REG_BRIGHTNESS | (brightness - 1));
> +}
> +
>  static void ht16k33_fb_queue(struct ht16k33_priv *priv)
>  {
>  	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> @@ -197,13 +213,10 @@ static int ht16k33_bl_update_status(struct 
> backlight_device *bl)
> 
>  	if (bl->props.power != FB_BLANK_UNBLANK ||
>  	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK || brightness == 0) {
> -		return ht16k33_display_off(priv);
> -	}
> +	    bl->props.state & BL_CORE_FBBLANK)
> +		brightness = 0;
> 
> -	ht16k33_display_on(priv);
> -	return i2c_smbus_write_byte(priv->client,
> -				    REG_BRIGHTNESS | (brightness - 1));
> +	return ht16k33_brightness_set(priv, brightness);
>  }
> 
>  static int ht16k33_bl_check_fb(struct backlight_device *bl, struct fb_info 
> *fi)

Met vriendelijke groet,
Robin van der Gracht

-- 
Protonic Holland
Factorij 36
1689AL Zwaag
+31 (0)229 212928
https://www.protonic.nl
