Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6AC1E73E2
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 05:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgE2Dv4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 23:51:56 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34716 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbgE2Dvz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 23:51:55 -0400
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:496:b320::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 64D9720CFA;
        Fri, 29 May 2020 03:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590724315; bh=DDDqysOlwHgMjetn7yWcpUbRKAkNduzxV7H6RPIBrpA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=C1qhl16tWLrdKUTZ0YAOv4tgW/9TGoPUNlyyL06Kg2w/ekTL7Uz16tJb4x0Ow64oL
         YnwBR0Z6EZVeGDk6F3eVLVlz0USwLZQW2KfoNExdU0PSik/0bUDj/0DB1/07T10Oxf
         lVDgeQ7gaF1Rd3mcBb8thLB+SmGVpVSL+jSHRqBpymYHlB20NcGuXo5qQ/tp78KYjx
         HiE+tisRb+XE9hDQwUDTjiM/qZsSGldf0KSBSYJ4nvkPqNsMPpcdcRahNzYa2XTApu
         9oaH7Dtb1m6IpzvBI4lh0AiqD7BBjI+UUZXCLJLW51qlfM6O2xL0sBGl0jwIE/gW5a
         l0YDLsYvGy/2g==
Date:   Fri, 29 May 2020 11:51:40 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: interrupt-controller: Add Loongson
 HTVEC
Message-ID: <20200529115140.5eb9f964@halation.net.flygoat.com>
In-Reply-To: <98643a72747e4896b78cd4d583d2d3f9@kernel.org>
References: <20200427060551.1372591-1-jiaxun.yang@flygoat.com>
        <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
        <20200516082912.3673033-2-jiaxun.yang@flygoat.com>
        <87v9kkz5kl.wl-maz@kernel.org>
        <20200526172653.0a19f375@halation.net.flygoat.com>
        <98643a72747e4896b78cd4d583d2d3f9@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 26 May 2020 10:53:15 +0100
Marc Zyngier <maz@kernel.org> wrote:

> On 2020-05-26 10:26, Jiaxun Yang wrote:
> > On Mon, 25 May 2020 11:12:26 +0100
> > Marc Zyngier <maz@kernel.org> wrote:
> >   
> >> On Sat, 16 May 2020 09:29:02 +0100,
> >> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:  
> >> >
> >> > Add binding for Loongson-3 HyperTransport Interrupt Vector
> >> > Controller.
> >> >
> >> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> > --
> >> > v4: Drop ref, '|', add additionalProperties, fix example  
> >> 
> >> Rob, do you have any input on this?  
> > 
> > Oops, looks like I was in-reply into wrong patch topic for this
> > patch, should I resend this series into correct thread?  
> 
> No, this series is fine as it is. TBH, your practice of sending
> a series in reply to the previous version is not that useful
> (I personally find it very annoying).
> 
> It would also be a big improvement if you sent a cover letter
> with your patches (using --cover-letter when generating the patches).
> 
> I'll wait for Rob to comment on this patch as well as patch #4.

Hi Marc,

I have send out patches for DeviceTree[1] utilizing these drivers.

If this series looks fine for you could you please Ack this series
so it can all go through MIPS tree together with DeviceTree changes?

Thanks.

[1]: https://patchwork.kernel.org/project/linux-mips/list/?series=295413

> 
> Thanks,
> 
>          M.

