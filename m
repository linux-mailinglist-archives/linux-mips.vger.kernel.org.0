Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A011EA3ED
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 14:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgFAMb3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 08:31:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgFAMb3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Jun 2020 08:31:29 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D68CF20679;
        Mon,  1 Jun 2020 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591014689;
        bh=DEEaUOEt24o9uKz0Ey7PzyuEOfgwa1FgnGsP3iqM8hA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0CjmdrqbPcjg4n3n7xmuSB+DmHeJBjq9UcdxGvTjQEnWpKeZ3MrsgddfBUnWzKJEX
         zzmb3e4pB8bSjWojsKLWXrWFmLzMj/Mfuv1pUg7fPKOMOabVdq7MnoClr2ZC5eCd8v
         9y9NdiEc4U84iYsuML66RjoGviT9y1faIlL87DX8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jfjbD-00Gtms-CX; Mon, 01 Jun 2020 13:31:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 01 Jun 2020 13:31:27 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/6] mips: Add DT bindings for MIPS CDMM and
 MIPS GIC
In-Reply-To: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <d59ef33155e2ae965e79522ab220c177@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Sergey.Semin@baikalelectronics.ru, tsbogend@alpha.franken.de, tglx@linutronix.de, gregkh@linuxfoundation.org, fancer.lancer@gmail.com, Alexey.Malahov@baikalelectronics.ru, paul.burton@imgtec.com, robh+dt@kernel.org, arnd@arndb.de, jason@lakedaemon.net, rjw@rjwysocki.net, daniel.lezcano@linaro.org, jhogan@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-06-01 13:21, Serge Semin wrote:

[...]

> Since Paul isn't looking after the MIPS arch code anymore, Ralf hasn't
> been seen maintaining MIPS for a long time, Thomas is only responsible
> for the next part of it:
> 	F:      Documentation/devicetree/bindings/mips/
> 	F:      Documentation/mips/
> 	F:      arch/mips/
> 	F:      drivers/platform/mips/
> the MIPS-specific drivers like:
> 	F:	drivers/bus/mips_cdmm.c
> 	F:	drivers/irqchip/irq-mips-cpu.c
> 	F:	drivers/irqchip/irq-mips-gic.c
> 	F:	drivers/clocksource/mips-gic-timer.c
> 	F:	drivers/cpuidle/cpuidle-cps.c
> seem to be left for the subsystems maintainers to support. So if you 
> don't
> mind or unless there is a better alternative, I can help with looking
> after them to ease the maintainers review burden and since I'll be 
> working
> on our MIPS-based SoC drivers integrating into the mainline kernel repo
> anyway. If you don't like this idea, please just decline the last
> patch in the series.

Given how deeply integrated the MIPS GIC is in the architecture, I'd
really like Thomas to co-maintain it, or at the very least give his
blessing on you being the dedicated point of contact for MIPS GIC
stuff.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
