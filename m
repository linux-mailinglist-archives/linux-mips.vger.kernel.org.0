Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14D4D18E365
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 18:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCURnM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Mar 2020 13:43:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46899 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgCURnM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Mar 2020 13:43:12 -0400
Received: by mail-pg1-f196.google.com with SMTP id k191so3631741pgc.13;
        Sat, 21 Mar 2020 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3fStVl9rL3YRgIiAf/TzVVtMNrh3VX50fi0qgiiuA8o=;
        b=UXIHaUBhFEcnW+OMHvNaZ8x6pk7Kw7xSi1XSqUQ/ypXJwX+/0kjbU9/UcI39UYrFww
         L4SWYiuz/x5ZDo+euy1EVFm6/xEfsJuGVNtbr58w1aJIyLLbxr5Zvw2YV6+Jz2IFJLx1
         hSKDnD+ugCfCtYPbwa0qtQZzvaVCFI/U0Hh49Bh/9v4+8cPYNZpxmxPxHCL/ucL4FfPB
         t55wM9/sifQrsJ2x7qaYOUyTwSXOMqFFX7kbT5BvfLIkW8EyaBXHAHAACDZSlA65LB0e
         +oYG1mMj2pkG+negyyMWiq2E57sl6r93kYgmOlv5Tvke5FfWZ2pC2/wfVUCgtyT6TaL9
         9P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3fStVl9rL3YRgIiAf/TzVVtMNrh3VX50fi0qgiiuA8o=;
        b=Za4uAK/Rnst3X52J/G6OTQ+l4s/AZHOKh6kKpQ5ZdDLx15z4OYR19Y68wga1kyVUUG
         ee5zp6q5qTKny4UFqJGpeahJ/qbnOYjH1s7/aAjvoabkGxio6N2MmF1B0inrNYClKF9Z
         MOd0xVTsyXhNx5gGofVLaVBNvXW8pVFwDfi3J6j7y008urMcx6FX2pPbORPJ3I/qcYNr
         IUiPrlnt7xGuMXWU6edZb9U/MOBHUwNGMOwT3jQEnIOFM1lfl1EPLWcYQSrcMbwm9rXV
         eklcwN1zNrtM67GneGGnNA2PoQjkjbwMKjFMWBSJG+MQzQ9NbQcQblBL0Dv5ERnfTyFi
         MKlg==
X-Gm-Message-State: ANhLgQ2QqQUUd2GCN1Ivg6KqoHNYnAiZxGyaoY7bqL3CaSA4W3yIPBqY
        SDFD7Q2H5qPCaJxAoSHqado=
X-Google-Smtp-Source: ADFU+vtSB9sj3T3LCfhecLdyVMoQimjNCV0Ow3ys209048E+VImdKW1kqpUYGGvxT4nwaYSYvsoI7Q==
X-Received: by 2002:a63:e856:: with SMTP id a22mr1215468pgk.283.1584812590871;
        Sat, 21 Mar 2020 10:43:10 -0700 (PDT)
Received: from localhost ([49.207.51.24])
        by smtp.gmail.com with ESMTPSA id f127sm8973833pfa.9.2020.03.21.10.43.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 10:43:10 -0700 (PDT)
Date:   Sat, 21 Mar 2020 23:13:03 +0530
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
Message-ID: <20200321174303.GA7930@afzalpc>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <87y2somido.fsf@nanos.tec.linutronix.de>
 <20200227110713.GA5708@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227110713.GA5708@afzalpc>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Feb 27, 2020 at 04:37:13PM +0530, afzal mohammed wrote:
> On Thu, Feb 27, 2020 at 11:31:15AM +0100, Thomas Gleixner wrote:

> > Vs. merging this series, I suggest the following approach:
> > 
> >    - Resubmit the individual changes as single patches or small series
> >      to the relevant maintainers and subsystem mailing lists. They have
> >      no dependency on a core change and can be applied where they belong
> >      to.
> > 
> >    - After 5.6-rc6, verify which parts have made their way into
> >      linux-next and resubmit the ignored ones as a series to me along
> >      with the removal of the core parts.
> > 
> > That way we can avoid conflicting changes between subsystems and the tip
> > irq/core branch as much as possible.
> 
> Okay, i will do accordingly.

i am on it, is delayed due to the reason as mentioned at,

https://lkml.kernel.org/r/20200321172626.GA6323@afzalpc

[ not repeating contents here since other mail was sent just now,
  cc'ing you ]

Regards
afzal

