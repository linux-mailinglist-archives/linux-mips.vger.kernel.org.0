Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60451715AA
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 12:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgB0LHT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 06:07:19 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36781 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728761AbgB0LHS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 06:07:18 -0500
Received: by mail-pl1-f193.google.com with SMTP id a6so1000999plm.3;
        Thu, 27 Feb 2020 03:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lmJQ36No1Gca/vcFrG4Eq9htTy7KPRzUbksdwrxz8LI=;
        b=FY89/SsX+eLNCZfl66UEb1ue7T2rDlxc39BUUNyQcUvYHLhQYmTZm8AV265dDcZriC
         n+pnoFgE+Sf8zXMbshaCCS6PUdHyFAtJ6zdH/VH1FXYuwfzu7iVLsjLF6SXNOrrDux5S
         VamD+96xP7YyeTt6xJaJYHlRfPSsbdooqEZo5JblB/xTNMzIpcuEBudbBh1o9hd+8Pp3
         VCC1Cl49y6FD+xnV0DQbsVUKowy7XWxJSXmwRChAoXpyUp1BbPkGQQ1IWMsgmCulUb0i
         idnYS7ecLxRWLTUTaFORqK3tstLgLRTwqSSk0D4o9TOL/U8ZbVv3Bk/xfDvuCNpgSmSI
         BGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lmJQ36No1Gca/vcFrG4Eq9htTy7KPRzUbksdwrxz8LI=;
        b=B7feNdwjh5TqNbMKHGaFRUmb0LEZVI3udn9LqR1WtmSU5BNehdbZhO/LCW4wWt2kY1
         Hd1M62LNST72ZMH62bJjgFdhYY2HIp5yoDZYDU3e8p/6kKQ25gQJ4xLHHrS+P7TXNO5d
         k/NHR+dO7Y5iBrR1ViLPHNwZmDmpBHIqY7jnMYNnQ8fXD3VLcqwy3gnlROLGnP8etXRo
         RfqOrOcNltSWjfMAAb6BS60kh9eH3v7oZpoStYmlEYMYScYgusAjiSw/XGsnPsG62b7+
         3zNVbGXiELxRCmpALBIb7VZzpUI0L6x4tlTrohpnKBGzqvA7nMoQzxQy+GsciFBx+FlC
         zlkw==
X-Gm-Message-State: APjAAAUOf6w8sbfVyKcn0SEoeoz1+JCCGXDTdudsgVdtGnZSJFgmIeZV
        fY0MeI1uRkSmdKBE3G+S6QI=
X-Google-Smtp-Source: APXvYqxWerA+MNtWPhmtZePrzWtN41f/X1PPHbm1Zy+BYl6m6MsiGmn5uHRszUhnUu+SXUCNhUoPbQ==
X-Received: by 2002:a17:902:8b89:: with SMTP id ay9mr3891143plb.309.1582801636613;
        Thu, 27 Feb 2020 03:07:16 -0800 (PST)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id c5sm6662799pfi.10.2020.02.27.03.07.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 03:07:15 -0800 (PST)
Date:   Thu, 27 Feb 2020 16:37:13 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, x86@kernel.org,
        linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org, linux-omap@vger.kernel.org,
        linux-alpha@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 00/18] genirq: Remove setup_irq()
Message-ID: <20200227110713.GA5708@afzalpc>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <87y2somido.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2somido.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Feb 27, 2020 at 11:31:15AM +0100, Thomas Gleixner wrote:

> Vs. merging this series, I suggest the following approach:
> 
>    - Resubmit the individual changes as single patches or small series
>      to the relevant maintainers and subsystem mailing lists. They have
>      no dependency on a core change and can be applied where they belong
>      to.
> 
>    - After 5.6-rc6, verify which parts have made their way into
>      linux-next and resubmit the ignored ones as a series to me along
>      with the removal of the core parts.
> 
> That way we can avoid conflicting changes between subsystems and the tip
> irq/core branch as much as possible.

Okay, i will do accordingly.

[ your mail crossed my v3 (only one patch) posting ]

Regards
afzal
