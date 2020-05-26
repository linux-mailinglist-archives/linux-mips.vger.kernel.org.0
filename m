Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66201E1E7C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 11:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgEZJ1J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 05:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgEZJ1J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 05:27:09 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3686EC03E97E;
        Tue, 26 May 2020 02:27:09 -0700 (PDT)
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:49e:d1a0::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id B206A20CF5;
        Tue, 26 May 2020 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590485229; bh=yKCTWepA+HfqwzkacLk0x6gRRWeXRutRgroPyhvK+YQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a27TZ/Oq1zBAWr4bBnTU5UuCPa2lFNvj/jMHhleVeD4qHKv1FT3wneSPEVbKXct2E
         M90tKbs262KNbz/DPD6ULimf7kOJ60C2b6Cn8ddkV2B8ibMkBvgbRu5FZHh3KQsCqg
         66Vy9G0ME+vzljAkJu25Zi+bHCWklypN+s9E/wUIM2AogE4qkVYkvKpYeUO7VV010k
         9lkMBqYkoLgKO/KiqpNa5ukoRh7Q/ZTccHxvBZq7yh9KUzuoWGIQvIkTy7VuL2kdtt
         Q5jVTcrb0PPnvhCGcMPoxBMbL1RKlHVgKddtWI3uQNOn0/zKAJttf5RafZ5Mqq3Vw2
         /vOWThzteO4GQ==
Date:   Tue, 26 May 2020 17:26:53 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: interrupt-controller: Add Loongson
 HTVEC
Message-ID: <20200526172653.0a19f375@halation.net.flygoat.com>
In-Reply-To: <87v9kkz5kl.wl-maz@kernel.org>
References: <20200427060551.1372591-1-jiaxun.yang@flygoat.com>
        <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
        <20200516082912.3673033-2-jiaxun.yang@flygoat.com>
        <87v9kkz5kl.wl-maz@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 25 May 2020 11:12:26 +0100
Marc Zyngier <maz@kernel.org> wrote:

> On Sat, 16 May 2020 09:29:02 +0100,
> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > 
> > Add binding for Loongson-3 HyperTransport Interrupt Vector
> > Controller.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > --
> > v4: Drop ref, '|', add additionalProperties, fix example  
> 
> Rob, do you have any input on this?

Oops, looks like I was in-reply into wrong patch topic for this patch,
should I resend this series into correct thread?

Thanks.

> 
> Thanks,
> 
> 	M.
> 

---
Jiaxun Yang
