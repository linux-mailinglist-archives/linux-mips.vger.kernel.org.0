Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88DBBE643
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfD2PY5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:24:57 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36779 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbfD2PY5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 11:24:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id a8so7438048edx.3;
        Mon, 29 Apr 2019 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=zdkl15yDtUMDjcT3PhPiGxH6HbIfk+17gDQY6gRt9VY=;
        b=EU8p/LiAuWZTaBXKNZWaKq1vNaSJvDcy39qwV/Z0FHFTDHncV1Zr4ndrOk4JGQHpjX
         8+2Fp9pb74ZpblErpBwk2AHVSA0XH1TFcISRE2xKvyJ09GkPlceqdU0EpvbPyjROw/Rp
         2mjTY5DKkCICp5o8xAzP61nli8P0TVf4bfqEgZD8rzztWgastc4fusx/sOq1jUdvqMSm
         u/4ZemsXZ+LiOOOHhyR/mI0lVFDHDfej+AK9qa3aWH0ZWw6BwM+Q0zzdWbfYGenHUgTj
         mKQnWyDk7GiejXknp18q+wabn/scWwGXt9KqD4tzqHeVAqnAHml0d/6MfFfKMOSTgfl6
         uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=zdkl15yDtUMDjcT3PhPiGxH6HbIfk+17gDQY6gRt9VY=;
        b=gXz78eWbfcGVHNvs2gNe+m6z++a2K1aytbjbkyupU3w+K45GmnjU2XV+zPzKhR94mb
         nbuv/+wdqX98f7M050IoibWKuvFBaansktBsSOCx+Ex6Yapyi6yjsq3Jp3+6yVCcDjEw
         VojvRGGmC8l2myI5chYC6pvfTg+CNXogWPtm/oTi2tg3i/Y7P4AHvJ3O2TsjzhVXgWP0
         M45g6YWU1Q2So29lk7aTQHCdYUKzvwL2gxLxQbVGpoqCOu1Sf75FO1ncQYBY3qtSjGgj
         MWwrxBKA4mqi0nfsgAhnqrjnhczEW9izi1J3n88wCTIoosJ53bJdIScYz2GEsZrm6Yg1
         C6ww==
X-Gm-Message-State: APjAAAWd4pbNU/dpbFNzgJ7Hui5afaEveYRk4KN+wLm39KhdYW2et0QG
        gGevoamv8+zNV/ABLVyDJI8=
X-Google-Smtp-Source: APXvYqzd7kklmwd/rJ9mZmXiJZJarahK9hi98VCMk8C4K5NtullM8PfDIBfWq8pF0LtSyR4PuNZQ7Q==
X-Received: by 2002:a17:906:1f53:: with SMTP id d19mr10119945ejk.12.1556551494836;
        Mon, 29 Apr 2019 08:24:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id y12sm5901269ejo.85.2019.04.29.08.24.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 08:24:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
        (envelope-from <peter@korsgaard.com>)
        id 1hL89F-0000nB-4t; Mon, 29 Apr 2019 17:24:53 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     "Enrico Weigelt\, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
        linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org,
        andrew@aj.id.au, gregkh@linuxfoundation.org, sudeep.holla@arm.com,
        liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
        linux@prisktech.co.nz, sparclinux@vger.kernel.org,
        khilman@baylibre.com, macro@linux-mips.org,
        slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
        linux-amlogic@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net
Subject: Re: [PATCH 16/41] drivers: tty: serial: uartlite: fix overlong lines
References: <1556369542-13247-1-git-send-email-info@metux.net>
        <1556369542-13247-17-git-send-email-info@metux.net>
Date:   Mon, 29 Apr 2019 17:24:53 +0200
In-Reply-To: <1556369542-13247-17-git-send-email-info@metux.net> (Enrico
        Weigelt's message of "Sat, 27 Apr 2019 14:51:57 +0200")
Message-ID: <87a7g8rfzu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Fix checkpatch warnings:
 >     WARNING: line over 80 characters
 >     #283: FILE: drivers/tty/serial/uartlite.c:283:
 >     +	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,

 >     WARNING: Missing a blank line after declarations
 >     #577: FILE: drivers/tty/serial/uartlite.c:577:
 >     +	struct earlycon_device *device = console->data;
 >     +	uart_console_write(&device->port, s, n, early_uartlite_putc);

 >     WARNING: line over 80 characters
 >     #590: FILE: drivers/tty/serial/uartlite.c:590:
 >     +OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);

 >     WARNING: line over 80 characters
 >     #591: FILE: drivers/tty/serial/uartlite.c:591:
 >     +OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);

Given that these are just a few characters more than 80 I don't really
think these changes improve readability.


 > Signed-off-by: Enrico Weigelt <info@metux.net>
 > ---
 >  drivers/tty/serial/uartlite.c | 10 +++++++---
 >  1 file changed, 7 insertions(+), 3 deletions(-)

 > diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
 > index 6f79353..0140cec 100644
 > --- a/drivers/tty/serial/uartlite.c
 > +++ b/drivers/tty/serial/uartlite.c
 > @@ -280,7 +280,8 @@ static int ulite_startup(struct uart_port *port)
 >  		return ret;
 >  	}
 
 > -	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,
 > +	ret = request_irq(port->irq, ulite_isr,
 > +			  IRQF_SHARED | IRQF_TRIGGER_RISING,
 >  			  "uartlite", port);
 >  	if (ret)
 >  		return ret;
 > @@ -574,6 +575,7 @@ static void early_uartlite_write(struct console *console,
 >  				 const char *s, unsigned int n)
 >  {
 >  	struct earlycon_device *device = console->data;
 > +
 >  	uart_console_write(&device->port, s, n, early_uartlite_putc);

Unrelated change?

-- 
Bye, Peter Korsgaard
