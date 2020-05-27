Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C161E4B62
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 19:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731119AbgE0RFa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 13:05:30 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37414 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbgE0RFa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 13:05:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2A6F58030809;
        Wed, 27 May 2020 17:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QBkDe7aTVI8O; Wed, 27 May 2020 20:05:25 +0300 (MSK)
Date:   Wed, 27 May 2020 20:05:24 +0300
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
Message-ID: <20200527170524.hbjbikp5b6e5nw5l@mobilestation>
References: <20200526133823.20466-1-Sergey.Semin@baikalelectronics.ru>
 <20200526133823.20466-4-Sergey.Semin@baikalelectronics.ru>
 <20200527162549.GA225240@roeck-us.net>
 <20200527165205.5krrdahiup3i2oq3@mobilestation>
 <14256f0f-2977-4a54-cf01-ae7e684d10c2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <14256f0f-2977-4a54-cf01-ae7e684d10c2@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 09:58:00AM -0700, Guenter Roeck wrote:
> On 5/27/20 9:52 AM, Serge Semin wrote:
> > On Wed, May 27, 2020 at 09:25:49AM -0700, Guenter Roeck wrote:
> >> On Tue, May 26, 2020 at 04:38:23PM +0300, Serge Semin wrote:
> > 
> > [nip]
> > 
> >>> +
> >>> +=============================== ======= =======================================
> >>> +Name				Perm	Description
> >>> +=============================== ======= =======================================
> >>> +update_interval			RW	Measurements update interval per
> >>> +					sensor.
> >>> +temp1_type			RO	Sensor type (always 1 as CPU embedded
> >>> +					diode).
> >>> +temp1_label			RO	CPU Core Temperature sensor.
> >>> +temp1_input			RO	Measured temperature in millidegree
> >>> +					Celsius.
> >>> +temp1_min			RW	Low limit for temp input.
> >>> +temp1_max			RW	High limit for temp input.
> >>> +temp1_min_alarm			RO	Temperature input alarm. Returns 1 if
> >>> +					temperature input went below min limit,
> >>> +					0 otherwise.
> >>> +temp1_max_alarm			RO	Temperature input alarm. Returns 1 if
> >>> +					temperature input went above max limit,
> >>> +					0 otherwise.
> >>> +temp1_trim			RW	Temperature sensor trimming factor in
> >>> +					millidegree Celsius. It can be used to
> >>> +					manually adjust the temperature
> >>> +					measurements within 7.130 degrees
> >>> +					Celsius.
> >>
> >> vs. standard ABI:
> >>
> >> temp[1-*]_offset`
> >>                 Temperature offset which is added to the temperature reading
> >>                 by the chip.
> >>
> >>                 Unit: millidegree Celsius
> >>
> >> If you really think this is necessary, why not use the standard ABI ?
> > 
> > That would have made much more sense.) I'll replace the handwritten temp1_trim
> > with the standard temp1_offset attribute in v4 shortly today. Thanks for pointing
> > this out.
> > 
> 
> Sorry for not realizing this earlier. The added explanation
> made all the difference.

No worries. I'll fix it in v4. What about the clk_get_rate() part of the code?
You had a comment regarding it in v2. I responded with justification that we can
leave it as is. If you still disagree, then I create the clock rate caching in the
private data at the probe() stage.

-Sergey

> 
> Guenter
