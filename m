Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B628934594A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 09:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCWII6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 04:08:58 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:60046 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCWII4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 04:08:56 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 9B75244A022C;
        Tue, 23 Mar 2021 09:08:54 +0100 (CET)
MIME-Version: 1.0
Date:   Tue, 23 Mar 2021 09:08:54 +0100
From:   robin <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] auxdisplay: ht16k33: Remove unneeded error check in
 keypad probe()
Reply-To: robin@protonic.nl
In-Reply-To: <20210322144848.1065067-11-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-11-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <ae8bed58af4c760316a464ccb406b0a4@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> There is no need to check the return code of input_register_device(),
> just propagate it to the caller.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/auxdisplay/ht16k33.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c 
> b/drivers/auxdisplay/ht16k33.c
> index 6d39f12054618fa5..13d18f218b4d196e 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -378,11 +378,7 @@ static int ht16k33_keypad_probe(struct i2c_client 
> *client,
> 
>  	ht16k33_keypad_stop(keypad->dev);
> 
> -	err = input_register_device(keypad->dev);
> -	if (err)
> -		return err;
> -
> -	return 0;
> +	return input_register_device(keypad->dev);
>  }
> 
>  static int ht16k33_probe(struct i2c_client *client,

Acked-by: Robin van der Gracht <robin@protonic.nl>
