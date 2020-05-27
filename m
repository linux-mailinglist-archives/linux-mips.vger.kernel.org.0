Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8D81E4B04
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 18:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731006AbgE0QwL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 12:52:11 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37340 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgE0QwK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 12:52:10 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 5D5ED8030835;
        Wed, 27 May 2020 16:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Iz9RLPWxLmJJ; Wed, 27 May 2020 19:52:06 +0300 (MSK)
Date:   Wed, 27 May 2020 19:52:05 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] hwmon: Add Baikal-T1 PVT sensor driver
Message-ID: <20200527165205.5krrdahiup3i2oq3@mobilestation>
References: <20200526133823.20466-1-Sergey.Semin@baikalelectronics.ru>
 <20200526133823.20466-4-Sergey.Semin@baikalelectronics.ru>
 <20200527162549.GA225240@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527162549.GA225240@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 09:25:49AM -0700, Guenter Roeck wrote:
> On Tue, May 26, 2020 at 04:38:23PM +0300, Serge Semin wrote:

[nip]

> > +
> > +=============================== ======= =======================================
> > +Name				Perm	Description
> > +=============================== ======= =======================================
> > +update_interval			RW	Measurements update interval per
> > +					sensor.
> > +temp1_type			RO	Sensor type (always 1 as CPU embedded
> > +					diode).
> > +temp1_label			RO	CPU Core Temperature sensor.
> > +temp1_input			RO	Measured temperature in millidegree
> > +					Celsius.
> > +temp1_min			RW	Low limit for temp input.
> > +temp1_max			RW	High limit for temp input.
> > +temp1_min_alarm			RO	Temperature input alarm. Returns 1 if
> > +					temperature input went below min limit,
> > +					0 otherwise.
> > +temp1_max_alarm			RO	Temperature input alarm. Returns 1 if
> > +					temperature input went above max limit,
> > +					0 otherwise.
> > +temp1_trim			RW	Temperature sensor trimming factor in
> > +					millidegree Celsius. It can be used to
> > +					manually adjust the temperature
> > +					measurements within 7.130 degrees
> > +					Celsius.
> 
> vs. standard ABI:
> 
> temp[1-*]_offset`
>                 Temperature offset which is added to the temperature reading
>                 by the chip.
> 
>                 Unit: millidegree Celsius
> 
> If you really think this is necessary, why not use the standard ABI ?

That would have made much more sense.) I'll replace the handwritten temp1_trim
with the standard temp1_offset attribute in v4 shortly today. Thanks for pointing
this out.

-Sergey

> 
> Guenter
