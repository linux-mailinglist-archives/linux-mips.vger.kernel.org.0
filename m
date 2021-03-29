Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46F434C499
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 09:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhC2HJI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 03:09:08 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:46480 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC2HJG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Mar 2021 03:09:06 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 5B25444A022C;
        Mon, 29 Mar 2021 09:08:59 +0200 (CEST)
MIME-Version: 1.0
Date:   Mon, 29 Mar 2021 09:08:59 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/17] auxdisplay: ht16k33: Add support for segment
 displays
Reply-To: robin@protonic.nl
In-Reply-To: <20210322144848.1065067-17-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-17-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <2868cd091dc6ff0cab14b5da07f89984@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Geert,

On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> 
> Add support for 4-digit 7-segment and quad 14-segment alphanumeric
> displays, like the Adafruit 7-segment and 14-segment display backpack
> and FeatherWing expansion boards.  Use the character line display core
> support to display a message, which will be scrolled if it doesn't fit.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> The 7-segment support is based on schematics, and untested on actual
> hardware.
> ---
>  drivers/auxdisplay/ht16k33.c | 198 +++++++++++++++++++++++++++++++++--
>  1 file changed, 191 insertions(+), 7 deletions(-)
> 
...
> 
> +static int ht16k33_seg_probe(struct i2c_client *client,
> +			     struct ht16k33_priv *priv, uint32_t brightness)
> +{
> +	struct ht16k33_seg *seg = &priv->seg;
> +	struct device *dev = &client->dev;
> +	int err;
> +
> +	err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> +	if (err)
> +		return err;
> +
> +	switch (priv->type) {
> +	case DISP_MATRIX:
> +		/* not handled here */
> +		break;

This 'case' shouldn't happen. Having said that, the break here will 
still
cause the linedisp_register() function to be called for the DISP_MATRIX 
type.
If you'd like to handle this case, a return (or setting 'err') should
prevent this.

> +
> +	case DISP_QUAD_7SEG:
> +		INIT_DELAYED_WORK(&priv->work, ht16k33_seg7_update);
> +		seg->map.seg7 = initial_map_seg7;
> +		seg->map_size = sizeof(seg->map.seg7);
> +		err = device_create_file(dev, &dev_attr_map_seg7);
> +		break;
> +
> +	case DISP_QUAD_14SEG:
> +		INIT_DELAYED_WORK(&priv->work, ht16k33_seg14_update);
> +		seg->map.seg14 = initial_map_seg14;
> +		seg->map_size = sizeof(seg->map.seg14);
> +		err = device_create_file(dev, &dev_attr_map_seg14);
> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	err = linedisp_register(&seg->linedisp, dev, 4, seg->curr,
> +				ht16k33_linedisp_update);
> +	if (err)
> +		goto err_remove_map_file;
> +
> +	return 0;

Groetjes/Kind regards,
Robin van der Gracht
