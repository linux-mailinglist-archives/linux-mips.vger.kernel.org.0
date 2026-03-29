Return-Path: <linux-mips+bounces-13983-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE6yJwqqyWlT0wUAu9opvQ
	(envelope-from <linux-mips+bounces-13983-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 00:39:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2413544EB
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 00:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 634313001A68
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2026 22:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF35430C632;
	Sun, 29 Mar 2026 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a85LHOyH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7392E7F25
	for <linux-mips@vger.kernel.org>; Sun, 29 Mar 2026 22:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774823939; cv=none; b=imGOuzwyyN6U+UcUt3I1mfDwTH9TNWGb7rqyf6+gna8CY8k2Va9RBbbhRsy8RUJcALDsYKbnYwLF9BAN+HRJehPKqoxwivpYVz3b4uqJu2qYSYjoBijETUgkQJ25dNwNwTzpX2hUc13tK0a7bk4G3GryWydfw94zv2MhaqM70Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774823939; c=relaxed/simple;
	bh=i29DEr+cmezm28yicchzfOLgpY1e17qMsYz+akHVLMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9JPCCEP3+YPlX8Pskuw4BPnJL1mJ5Xxhmd661tFn1C5JQjvUvVq3eaR3d+sBfSP3HIpJNePt8tGYZQd+3CtXRNf3BSdaEdzW+G9j2FPihTYQ6AQ6BmI3ZhqCyBPzs0rkDTtYYDiQdsrZTUHBksszNh0mLJu4C2qMJFSEkpkQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a85LHOyH; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-128b9b7e3edso1912465c88.0
        for <linux-mips@vger.kernel.org>; Sun, 29 Mar 2026 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774823938; x=1775428738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIaCRwsPiPLGbHW57vve74Uei7PyZwajOXtEVAjCMmE=;
        b=a85LHOyH+4K7mj7zgCILRDQ/Q4Q/mEgptLKc8va27S0sLXjfSmYkvBXujQ4Z8SyFcu
         EPpTKHaIzrAm/HJIZZT/7u/Fx4oBX1b7WXJDyhv3mQvYtdG7OkG4YzJtwOfNu6ZaUjCJ
         Srwn3Avm9v30sKjDlQ2lJZzri72n9b5NLRCyspb5pXQxx3szjwtBVEEHBsyIx91PiORl
         J4jPWuScqu/tdNHKD+ExOuROfmztCOyJIpa0nexyczDwFkRrcwOaOqXb7JZkQlhjCA1p
         DziKNlsHsBaHZCsvuBE83MqQLgjXQISpFRSOztWGIkbPmHi64FRPDHxRDRMfYN4KCPtb
         8Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823938; x=1775428738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIaCRwsPiPLGbHW57vve74Uei7PyZwajOXtEVAjCMmE=;
        b=ZmZGfMcKaF8nK8T7NwVWoztHMtXQrwDj3JnbBqfQNUAY4PZK9jMA4nj/2tTqpAPcEz
         u11t3ykdhtGDjRL/sbyVzbs0xb7zVKmSVY9snTj/SV3TUFAQRoXHbd21kisDpeT8yDxE
         JO+iAXF8vbF5CNC7L4c46y04FqP8bh8GHuSP+oGjkcSGoYG5xmQWkKTjImuItAZrtNpW
         t5qhXT39sdLgl7iHkomtFc8vqt1cL34Jt0FJgugPRgCcKhGDV9j0axOeBWGBRcEbsNO+
         IhHEVtj9oZX5u+pUas4K6PW/oQJsPym/zZdizXBipV1a4XQYME0GQhMJBA2FyXt1gpD6
         FBWg==
X-Forwarded-Encrypted: i=1; AJvYcCVFvcEl57OF3D8hoKO5wwtdHaJqPBkrHQugVXEVFFWkAdBmRozRkfQ9zkid8rCQ8PWlNUzPu1dkDhAY@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGfmobIyxwZiHqbhndYeB11zaxvl2X4vWrMIITww3xzHS/E3G
	0wLpm4yOEg2FX//z4jmthyfR4rAnvU+pXF0cNa6WqDIf3CMAcKnfAO5/
X-Gm-Gg: ATEYQzyOiJfb/oZhF9q00j6WHCPeWKsGe0QVzjt2CrnpzP05VC7Kt8H7tzc5JS1SWHo
	TnCTBiNk1lQPool0yWUo3f9fBLBZQyfiNoK6odUbNIQ7ane6bywD4WHIzpEzs+EdhAk9Yv9ff29
	uAWdaZZ1vY7eib1Buu7Yo1aTfL/76Hy/L3qxHqgQ98poms0sjVG6wbyWWE65sqKXRAUTXnZNNWr
	RmaCkVTbwdapUAGHtbLAiw2BCd9OpbKYN57joTf5lWAHZTEVBSTfVFaxa+DvUmEm39eVpsbDbHm
	3Y8dCnhfhfXB+bs6sC+odE8lH/fS3CBM+lT8KNBMavHIBb1pDdNzCNvUCo8jidyvA65w3yXNqwV
	F7vIBYDq/TI/CTpg8xtjbhur24IzA6/GRqr5Zb6h9nk3APWVNpACHyHploA8FW8oCs+WLranI82
	zr+m/kubgXwyX9uVCZu0l3vcgqoXVPyLBQXRI2gYhrgWdrUz8B4s6D3jYDXAQeJz2s
X-Received: by 2002:a05:7022:6190:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12ab2928cb4mr5161322c88.29.1774823937606;
        Sun, 29 Mar 2026 15:38:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm8212926c88.10.2026.03.29.15.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:57 -0700 (PDT)
Date: Sun, 29 Mar 2026 15:38:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mips@vger.kernel.org, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
Message-ID: <acmo7_clKRWzhyOi@google.com>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
 <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13983-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C2413544EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

On Sat, Mar 28, 2026 at 04:55:47PM +0100, Linus Walleij wrote:
> Convert the Mikrotik RouterBoard RB532 to use GPIO descriptors
> by defining a software node for the GPIO chip, then register
> the button platform device with full info passing the GPIO
> as a device property.
> 
> This can be used as a base to move more of the RB532 devices
> over to passing GPIOs using device properties.
> 
> Use the GPIO_ACTIVE_LOW flag and drop the inversion in the
> rb532_button_pressed() function.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/mips/rb532/devices.c         | 47 +++++++++++++++++++++++++++++++++------
>  drivers/input/misc/rb532_button.c | 35 ++++++++++++++++++++++++-----
>  2 files changed, 69 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 4f027efbf27b..3f56d9feb73a 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -16,8 +16,10 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
>  #include <linux/gpio_keys.h>
>  #include <linux/input.h>
> +#include <linux/property.h>
>  #include <linux/serial_8250.h>
>  
>  #include <asm/bootinfo.h>
> @@ -38,6 +40,10 @@ extern unsigned int idt_cpu_freq;
>  
>  static struct mpmc_device dev3;
>  
> +static const struct software_node rb532_gpio0_node = {
> +	.name = "gpio0",
> +};

You need to move this and registration into arch/mips/rb532/gpio.c,
export it and use it here: Bartosz is against using gpiohip label to
match with software node name and prefers identity matching.

...

> -static bool rb532_button_pressed(void)
> +static bool rb532_button_pressed(struct rb532_button *button)
>  {
>  	int val;
>  
>  	set_latch_u5(0, LO_FOFF);
> -	gpio_direction_input(GPIO_BTN_S1);
> +	gpiod_direction_input(button->gpio);
>  
> -	val = gpio_get_value(GPIO_BTN_S1);
> +	val = gpiod_get_value(button->gpio);
>  
>  	rb532_gpio_set_func(GPIO_BTN_S1);
>  	set_latch_u5(LO_FOFF, 0);
>  
> -	return !val;
> +	return val;
>  }

I suppose there is no reasonable way of making this work with
gpio-keys...

For input piece:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

