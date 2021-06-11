Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BE83A3BA9
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 08:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFKGJZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 02:09:25 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:45026 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbhFKGJY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 02:09:24 -0400
Received: by mail-wr1-f50.google.com with SMTP id f2so4683654wri.11;
        Thu, 10 Jun 2021 23:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AZMS2A4sumtCqfcNbQEYzMmO3IZvf2HY+g4HgiE7meY=;
        b=P9M+3TfkPCtOk03F/IkNnBLpwBFxJ4/6PWwtGWZdMNhGE8rwXdXLlWICW+uEEZHduq
         QajKEpOaCdLyLlW/n8t3N3AF71m5G026mEvBQAlUCs9qE1ITF5/fcdzK8dFKL6Hf0CeR
         aR2OHSlFv56rLxkNHWhR59vr7H5KJ4Nt7PhAoQvQ0Q8VGZXQhxImp5FML5HVKIOq4aBm
         eJ8xmbyfipRR2EWXtmEAJCg6f1dhKmXgCNI1O39HhZ3vYwSTyO3/lEmJwRvgcPI27x4U
         oqGvE89fREpOc9bceFgrQeCmjGuC9epERevc+uaV1OQG+8uORRtPU5rGJNp3vMgHEAkG
         3N4A==
X-Gm-Message-State: AOAM533LQC09yj+dNFhiPVx5mCnJJHTqO8EQp1A17MyDHX6G4V1dNIsu
        VQztUOVihO/OaoHODvCVwTT3/p5BDBk=
X-Google-Smtp-Source: ABdhPJxjEIF41BMJdDoto8M4WZ5XYmslV5qnXD0oaW9mXsN6wP8UKQhJLVT9lH7G+hSlHgP+5koqag==
X-Received: by 2002:adf:df02:: with SMTP id y2mr1995807wrl.120.1623391645775;
        Thu, 10 Jun 2021 23:07:25 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id q19sm11019277wmc.44.2021.06.10.23.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 23:07:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] serial: 8250: Mask out floating 16/32-bit bus bits
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk>
 <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <0cba710e-dc70-2b5c-ef48-a54cad0cae05@kernel.org>
Date:   Fri, 11 Jun 2021 08:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10. 06. 21, 20:38, Maciej W. Rozycki wrote:
> Make sure only actual 8 bits of the IIR register are used in determining
> the port type in `autoconfig'.
> 
> The `serial_in' port accessor returns the `unsigned int' type, meaning
> that with UPIO_AU, UPIO_MEM16, UPIO_MEM32, and UPIO_MEM32BE access types
> more than 8 bits of data are returned, of which the high order bits will
> often come from bus lines that are left floating in the data phase.  For
> example with the MIPS Malta board's CBUS UART, where the registers are
> aligned on 8-byte boundaries and which uses 32-bit accesses, data as
> follows is returned:
> 
> YAMON> dump -32 0xbf000900 0x40
> 
> BF000900: 1F000942 1F000942 1F000900 1F000900  ...B...B........
> BF000910: 1F000901 1F000901 1F000900 1F000900  ................
> BF000920: 1F000900 1F000900 1F000960 1F000960  ...........`...`
> BF000930: 1F000900 1F000900 1F0009FF 1F0009FF  ................
> 
> YAMON>
> 
> Evidently high-order 24 bits return values previously driven in the
> address phase (the 3 highest order address bits used with the command
> above are masked out in the simple virtual address mapping used here and
> come out at zeros on the external bus), a common scenario with bus lines
> left floating, due to bus capacitance.
> 
> Consequently when the value of IIR, mapped at 0x1f000910, is retrieved
> in `autoconfig', it comes out at 0x1f0009c1 and when it is right-shifted
> by 6 and then assigned to 8-bit `scratch' variable, the value calculated
> is 0x27, not one of 0, 1, 2, 3 expected in port type determination.
> 
> Fix the issue then, by assigning the value returned from `serial_in' to
> `scratch' first, which masks out 24 high-order bits retrieved, and only
> then right-shift the resulting 8-bit data quantity, producing the value
> of 3 in this case, as expected.  Fix the same issue in `serial_dl_read'.
> 
> The problem first appeared with Linux 2.6.9-rc3 which predates our repo
> history, but the origin could be identified with the old MIPS/Linux repo
> also at: <git://git.kernel.org/pub/scm/linux/kernel/git/ralf/linux.git>
> as commit e0d2356c0777 ("Merge with Linux 2.6.9-rc3."), where code in
> `serial_in' was updated with this case:
> 
> +	case UPIO_MEM32:
> +		return readl(up->port.membase + offset);
> +
> 
> which made it produce results outside the unsigned 8-bit range for the
> first time, though obviously it is system dependent what actual values
> appear in the high order bits retrieved and it may well have been zeros
> in the relevant positions with the system the change originally was
> intended for.  It is at that point that code in `autoconf' should have
> been updated accordingly, but clearly it was overlooked.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> ---
>   drivers/tty/serial/8250/8250_port.c |    9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> linux-serial-8250-floating-bus-mask.diff
> Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
> ===================================================================
> --- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_port.c
> +++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
> @@ -311,7 +311,10 @@ static const struct serial8250_config ua
>   /* Uart divisor latch read */
>   static int default_serial_dl_read(struct uart_8250_port *up)
>   {
> -	return serial_in(up, UART_DLL) | serial_in(up, UART_DLM) << 8;
> +	unsigned char dll = serial_in(up, UART_DLL);
> +	unsigned char dlm = serial_in(up, UART_DLM);
> +
> +	return dll | dlm << 8;
>   }
>   
>   /* Uart divisor latch write */
> @@ -1297,9 +1300,9 @@ static void autoconfig(struct uart_8250_
>   	serial_out(up, UART_LCR, 0);
>   
>   	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
> -	scratch = serial_in(up, UART_IIR) >> 6;
> +	scratch = serial_in(up, UART_IIR);
>   
> -	switch (scratch) {
> +	switch (scratch >> 6) {

COrrect, but not obvious on the first look. People could revert this 
change inadverently. So could you add a comment, or simply cast 
serial_in() output to (u8)?

>   	case 0:
>   		autoconfig_8250(up);
>   		break;
> 

thanks,
-- 
js
suse labs
