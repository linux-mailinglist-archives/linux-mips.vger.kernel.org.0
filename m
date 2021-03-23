Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71253345988
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 09:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCWISb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 04:18:31 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:60142 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhCWISN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 04:18:13 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 671C744A022C;
        Tue, 23 Mar 2021 09:18:11 +0100 (CET)
MIME-Version: 1.0
Date:   Tue, 23 Mar 2021 09:18:11 +0100
From:   robin <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/17] auxdisplay: Extract character line display core
 support
Reply-To: robin@protonic.nl
In-Reply-To: <20210322144848.1065067-7-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-7-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <8a5e3e480022990f0889864d0ace56a0@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> Extract the character line display core support from the simple ASCII
> LCD driver for the MIPS Boston, Malta & SEAD3 development boards into
> its own subdriver, so it can be reused for other displays.
> 
> Note that this moves the "message" device attribute in sysfs in a
> "linedisp.N" subdirectory.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Changes to img-ascii-lcd.c are untested due to lack of hardware.
> ---
>  drivers/auxdisplay/Kconfig         |   8 +
>  drivers/auxdisplay/Makefile        |   1 +
>  drivers/auxdisplay/img-ascii-lcd.c | 198 +++----------------------
>  drivers/auxdisplay/line-display.c  | 231 +++++++++++++++++++++++++++++
>  drivers/auxdisplay/line-display.h  |  43 ++++++
>  5 files changed, 304 insertions(+), 177 deletions(-)
>  create mode 100644 drivers/auxdisplay/line-display.c
>  create mode 100644 drivers/auxdisplay/line-display.h
> 
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index 1509cb74705a30ad..42fc7b155de09dbc 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -25,6 +25,12 @@ config CHARLCD
>  	  This is some character LCD core interface that multiple drivers can
>  	  use.
> 
> +config LINEDISP
> +	tristate "Character line display core support" if COMPILE_TEST
> +	help
> +	  This is the core support for single-line character displays, to be
> +	  selected by drivers that use it.
> +
>  config HD44780_COMMON
>  	tristate "Common functions for HD44780 (and compatibles) LCD
> displays" if COMPILE_TEST
>  	select CHARLCD
> @@ -155,6 +161,7 @@ config IMG_ASCII_LCD
>  	depends on HAS_IOMEM
>  	default y if MIPS_MALTA
>  	select MFD_SYSCON
> +	select LINEDISP
>  	help
>  	  Enable this to support the simple ASCII LCD displays found on
>  	  development boards such as the MIPS Boston, MIPS Malta & MIPS SEAD3
> @@ -169,6 +176,7 @@ config HT16K33
>  	select FB_SYS_IMAGEBLIT
>  	select INPUT_MATRIXKMAP
>  	select FB_BACKLIGHT
> +	select LINEDISP

At this point in your patch stack it's not used by the ht16k33 driver. I 
think it
would be nicer to add this dependency when the code actually starts 
depending on it.
So that when this patch stack gets applied partially or not in one go 
the chunks
would be independent.
