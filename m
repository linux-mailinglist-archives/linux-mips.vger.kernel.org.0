Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F7441D37E
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 08:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348210AbhI3Gi1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 02:38:27 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:41594 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348034AbhI3Gi0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 02:38:26 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 244CC44A024E;
        Thu, 30 Sep 2021 08:36:42 +0200 (CEST)
MIME-Version: 1.0
Date:   Thu, 30 Sep 2021 08:36:42 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/19] auxdisplay: ht16k33: Move delayed work
Reply-To: robin@protonic.nl
In-Reply-To: <20210914143835.511051-15-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-15-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <b30da88512b1bd91a94c033d148f4284@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Acked-by: Robin van der Gracht <robin@protonic.nl>

On 2021-09-14 16:38, Geert Uytterhoeven wrote:
> Move delayed_work from ht16k33_fbdev to ht16k33_priv, as it is not
> specific to dot-matrix displays, but common to all display types.
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
>   - No changes,
> 
> v2:
>   - No changes.
> ---
>  drivers/auxdisplay/ht16k33.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 75d326a823543898..c7a3a0e1fbb5d03e 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -65,11 +65,11 @@ struct ht16k33_fbdev {
>  	uint32_t refresh_rate;
>  	uint8_t *buffer;
>  	uint8_t *cache;
> -	struct delayed_work work;
>  };
> 
>  struct ht16k33_priv {
>  	struct i2c_client *client;
> +	struct delayed_work work;
>  	struct ht16k33_keypad keypad;
>  	struct ht16k33_fbdev fbdev;
>  };
> @@ -117,7 +117,7 @@ static void ht16k33_fb_queue(struct ht16k33_priv *priv)
>  {
>  	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> 
> -	schedule_delayed_work(&fbdev->work, HZ / fbdev->refresh_rate);
> +	schedule_delayed_work(&priv->work, HZ / fbdev->refresh_rate);
>  }
> 
>  /*
> @@ -125,10 +125,9 @@ static void ht16k33_fb_queue(struct ht16k33_priv *priv)
>   */
>  static void ht16k33_fb_update(struct work_struct *work)
>  {
> -	struct ht16k33_fbdev *fbdev =
> -		container_of(work, struct ht16k33_fbdev, work.work);
> -	struct ht16k33_priv *priv =
> -		container_of(fbdev, struct ht16k33_priv, fbdev);
> +	struct ht16k33_priv *priv = container_of(work, struct ht16k33_priv,
> +						 work.work);
> +	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> 
>  	uint8_t *p1, *p2;
>  	int len, pos = 0, first = -1;
> @@ -462,7 +461,7 @@ static int ht16k33_probe(struct i2c_client *client)
>  	}
>  	fb_bl_default_curve(fbdev->info, 0, MIN_BRIGHTNESS, MAX_BRIGHTNESS);
> 
> -	INIT_DELAYED_WORK(&fbdev->work, ht16k33_fb_update);
> +	INIT_DELAYED_WORK(&priv->work, ht16k33_fb_update);
>  	fbdev->info->fbops = &ht16k33_fb_ops;
>  	fbdev->info->screen_base = (char __iomem *) fbdev->buffer;
>  	fbdev->info->screen_size = HT16K33_FB_SIZE;
> @@ -502,7 +501,7 @@ static int ht16k33_remove(struct i2c_client *client)
>  	struct ht16k33_priv *priv = i2c_get_clientdata(client);
>  	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> 
> -	cancel_delayed_work_sync(&fbdev->work);
> +	cancel_delayed_work_sync(&priv->work);
>  	unregister_framebuffer(fbdev->info);
>  	framebuffer_release(fbdev->info);
>  	free_page((unsigned long) fbdev->buffer);
