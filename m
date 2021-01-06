Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07D02EBA6D
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 08:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbhAFH0J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 02:26:09 -0500
Received: from mout.gmx.net ([212.227.17.22]:46247 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbhAFH0J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 Jan 2021 02:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609917876;
        bh=qmv55JTidpW9XDoGGDekeDfrI3zhxboXsDWJ5aX4p2E=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=L8hP8Kqlnrs7yL5pugy11G/4gcPTmEZ/hcnhv3msOKA0JiLLrwCL9UuKh+7l/iDKZ
         JLhEjMjiLQKg+Ds5LWgrmu4SWwmesibhWWOsIDdXFyiEsr68TSGVEYRWZC9IOB1L90
         oU9ZDMzWD9mdYCztBLoPEy4asQYG95CgN+jukFjY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N95eJ-1jsHGV2B7f-016Bhn; Wed, 06
 Jan 2021 08:24:36 +0100
Date:   Wed, 6 Jan 2021 09:26:15 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 4/6] input: Add N64 controller driver
Message-Id: <20210106092615.e72e715bd3817e2f1dc6d55c@gmx.com>
In-Reply-To: <X/Tk/ZrqyPlGriiZ@google.com>
References: <20210104154811.ced3a894cddc4d309827307c@gmx.com>
        <X/Tk/ZrqyPlGriiZ@google.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NhCbZQ8m3X67A4wNfTQbid/oDanPpAoTsdF86+bpsFRGdaxzJCS
 haHq+tKc2CwlAMyHCwfBBmT/7nHa3hLM/O0InlYAVdytuQJ0DNRCusl6eNswY/YSK9oXkGF
 zDAVbVvbGllZgc8MfDMjfnvt+b5umzwJYZdyNzGdy/P8e2IR8JPEJ0S9N5p79GmLjKRI9aK
 xP4qURdEILTCP4Uc1VUYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SSoQi+2wYBo=:ME7flNZpn52wNW0anOYc4Z
 3oDlWMVCuBrya5AtBhIc6zSjkm23LYd5GOd0i6WYf2ht7QK/vom2bHc+q0qEi9GGPru/qpzEr
 MBKqQh+3wT61GwnDLeEfhMzCIJErDmJsjPVsbAzUuQd+yGoLqQjU9I20cRgpqsZr8FtmSEjV1
 XBSRf2rhlaEoRYXhvMl7mWMnSgDltN3OnwEpWpYVfmwHtG/q5SiMYKwegUxO34tavQRzDwH67
 XVPzw5Kh+lmylD3Q4edcNd6kIBUfdcu/S4FccwU/ndS+2oScOq5sdvR+CScakE1iU5lcaKJtb
 3nHVJ1AT8vjBr8RZls0FEUkh7HG6wizvXGch2W2XHivawR5laBniBla9s+X3/cQBUxzJkLeJr
 e+J9NAzx/LnZOTpzyPDSH5w1Jwt8eBXoae+kC77jeh+KXU+Nq+gx8V1fsHohMa8yJvkWWE8/h
 eUqd2lUhAn1lC9xkUutPaSux0QSJO8H2+JZds9Ql1bqBorKaF4bUa5sVaiqvr/nd+yS2vV4la
 nKTbWK5QHvtuD9wFLh4p8z1axZfn4Npl30LmnWC8lOSqfsi1Utsyh1itr4UhF1yH0zq3u7wdX
 vwsdwK2CIkLz+aF5c4JP56vD59sAJYXvhEVzfDSdbwvDpS+hzr7hGczIoDaTz2QkWAItjuJE+
 FyHguceQ7dAfdqz913HQ6EzApn9+pV8hIzlYg/C1eM7xbGObdjDaqTmHEcmfrYIt2+Em99X6i
 ylyM0RnfyjMXwF3ETI8m2xaHLzmV9diVfuHGI7yEr/uxmuD5nyBo4q1SBZmV2hW5J5p6fZNE6
 qGaDk5SbF4XW6d73MQQGw/LS5arog2JONpaA3qeLsdbmUtlUoOnWbPJmKKHwAwNWpjaXbEZfv
 DMMYDwXxzUkAXarG3Hgg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 5 Jan 2021 14:15:25 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> > +config JOYSTICK_N64
> > +	bool "N64 controller"
> > +	depends on MACH_NINTENDO64
> > +	help
> > +	  Support for the four N64 controllers.
> > +
>
> "To compile this driver as a module..."
...
> No option to unload the driver?

Yes, no option to build as a module or to unload, on purpose. The target
system has 8mb RAM, and this is the only input system. It saves RAM,
and makes no sense to unload your only input possibility.

The driver is specific to the N64. It can't be used on other systems,
mips or otherwise.

- Lauri
