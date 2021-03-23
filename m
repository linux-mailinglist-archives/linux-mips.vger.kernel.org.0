Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1038A3459B4
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 09:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCWIbs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 04:31:48 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:60274 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhCWIbQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 04:31:16 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 92ED044A022C;
        Tue, 23 Mar 2021 09:31:14 +0100 (CET)
MIME-Version: 1.0
Date:   Tue, 23 Mar 2021 09:31:14 +0100
From:   robin <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/17] auxdisplay: ht16k33: Convert to simple i2c probe
 function
Reply-To: robin@protonic.nl
In-Reply-To: <20210322144848.1065067-12-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-12-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <cbb4de359d041ae1b03cab4b0407822f@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> ht16k33_probe() does not use the passed i2c_device_id, so the driver 
> can
> be converted trivially to the new-style of i2c probing.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/auxdisplay/ht16k33.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c 
> b/drivers/auxdisplay/ht16k33.c
> index 13d18f218b4d196e..1b67f38109bddba8 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -381,8 +381,7 @@ static int ht16k33_keypad_probe(struct i2c_client 
> *client,
>  	return input_register_device(keypad->dev);
>  }
> 
> -static int ht16k33_probe(struct i2c_client *client,
> -				  const struct i2c_device_id *id)
> +static int ht16k33_probe(struct i2c_client *client)
>  {
>  	int err;
>  	uint32_t dft_brightness;
> @@ -523,7 +522,7 @@ static const struct of_device_id ht16k33_of_match[] 
> = {
>  MODULE_DEVICE_TABLE(of, ht16k33_of_match);
> 
>  static struct i2c_driver ht16k33_driver = {
> -	.probe		= ht16k33_probe,
> +	.probe_new	= ht16k33_probe,
>  	.remove		= ht16k33_remove,
>  	.driver		= {
>  		.name		= DRIVER_NAME,

Acked-by: Robin van der Gracht <robin@protonic.nl>
