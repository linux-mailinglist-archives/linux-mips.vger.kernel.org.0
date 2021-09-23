Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA70415FD3
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 15:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhIWNbv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 23 Sep 2021 09:31:51 -0400
Received: from aposti.net ([89.234.176.197]:49470 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241355AbhIWNbt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Sep 2021 09:31:49 -0400
Date:   Thu, 23 Sep 2021 14:30:07 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Boddie <paul@boddie.org.uk>
Message-Id: <7U2WZQ.D8DTPCJ0ZPKO3@crapouillou.net>
In-Reply-To: <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
        <20210922205555.496871-7-paul@crapouillou.net>
        <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
        <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
        <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
        <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
        <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
        <YUxQ9k/CDYz20rYo@pendragon.ideasonboard.com>
        <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le jeu., sept. 23 2021 at 13:41:28 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a �crit :
> Hi Laurent,
> 
>>  Am 23.09.2021 um 12:03 schrieb Laurent Pinchart 
>> <laurent.pinchart@ideasonboard.com>:
>> 
>>  Hi Nikolaus,
>> 
>>  On Thu, Sep 23, 2021 at 11:55:56AM +0200, H. Nikolaus Schaller 
>> wrote:
>>>>  Am 23.09.2021 um 11:27 schrieb Laurent Pinchart:
>>>>  On Thu, Sep 23, 2021 at 11:19:23AM +0200, H. Nikolaus Schaller 
>>>> wrote:
>>>>> 
>>>>>>>>  +		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
>>>>>>>>  +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>>>> 
>>>>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally 
>>>>>>> incompatible
>>>>>>>  with synopsys/dw_hdmi.c
>>>>>>>  That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being 
>>>>>>> NOT present,
>>>>>>>  since it wants to register its own connector through 
>>>>>>> dw_hdmi_connector_create().
>>>>>>>  It does it for a reason: the dw-hdmi is a multi-function 
>>>>>>> driver which does
>>>>>>>  HDMI and DDC/EDID stuff in a single driver (because I/O 
>>>>>>> registers and power
>>>>>>>  management seem to be shared).
>>>>>> 
>>>>>>  The IT66121 driver does all of that too, and does not need
>>>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has
>>>>>>  callbacks to handle cable detection and DDC stuff.
>>>>>> 
>>>>>>>  Since I do not see who could split this into a separate bridge 
>>>>>>> and a connector driver
>>>>>>>  and test it on multiple SoC platforms (there are at least 3 or 
>>>>>>> 4), I think modifying
>>>>>>>  the fundamentals of the dw-hdmi architecture just to get CI20 
>>>>>>> HDMI working is not
>>>>>>>  our turf.
>>>>>> 
>>>>>>  You could have a field in the dw-hdmi pdata structure, that 
>>>>>> would
>>>>>>  instruct the driver whether or not it should use the new API. 
>>>>>> Ugly,
>>>>>>  I know, and would probably duplicate a lot of code, but that 
>>>>>> would
>>>>>>  allow other drivers to be updated at a later date.
>>>>> 
>>>>>  Yes, would be very ugly.
>>>>> 
>>>>>  But generally who has the knowledge (and time) to do this work?
>>>>>  And has a working platform to test (jz4780 isn't a good 
>>>>> development environment)?
>>>>> 
>>>>>  The driver seems to have a turbulent history starting 2013 in 
>>>>> staging/imx and
>>>>>  apparently it was generalized since then... Is Laurent currently 
>>>>> dw-hdmi maintainer?
>>>> 
>>>>  "Maintainer" would be an overstatement. I've worked on that 
>>>> driver in
>>>>  the past, and I still use it, but don't have time to really 
>>>> maintain it.
>>>>  I've also been told that Synopsys required all patches for that 
>>>> driver
>>>>  developed using documentation under NDA to be submitted 
>>>> internally to
>>>>  them first before being published, so I decided to stop 
>>>> contributing
>>>>  instead of agreeing with this insane process. There's public
>>>>  documentation about the IP in some NXP reference manuals though, 
>>>> so it
>>>>  should be possible to still move forward without abiding by this 
>>>> rule.
>>>> 
>>>>>>>  Therefore the code here should be able to detect if 
>>>>>>> drm_bridge_attach() already
>>>>>>>  creates and attaches a connector and then skip the code below.
>>>>>> 
>>>>>>  Not that easy, unfortunately. On one side we have dw-hdmi which
>>>>>>  checks that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on 
>>>>>> the
>>>>>>  other side we have other drivers like the IT66121 which will 
>>>>>> fail if
>>>>>>  this flag is not set.
>>>>> 
>>>>>  Ok, I see. You have to handle contradicting cases here.
>>>>> 
>>>>>  Would it be possible to run it with 
>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR first
>>>>>  and retry if it fails without?
>>>>> 
>>>>>  But IMHO the return value (in error case) is not well defined. 
>>>>> So there
>>>>>  must be a test if a connector has been created (I do not know 
>>>>> how this
>>>>>  would work).
>>>>> 
>>>>>  Another suggestion: can you check if there is a downstream 
>>>>> connector defined in
>>>>>  device tree (dw-hdmi does not need such a definition)?
>>>>>  If not we call it with 0 and if there is one we call it with
>>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one?
>>>> 
>>>>  I haven't followed the ful conversation, what the reason why
>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR can't always be use here ?
>>> 
>>>  The synopsys driver creates its own connector through 
>>> dw_hdmi_connector_create()
>>>  because the IP handles DDC/EDID directly.
>> 
>>  That doesn't require creating a connector though. The driver 
>> implements
>>  drm_bridge_funcs.get_edid(), which is used to get the EDID without 
>> the
>>  need to create a connector in the dw-hdmi driver.
> 
> Ah, ok.
> 
> But then we still have issues.
> 
> Firstly I would assume that get_edid only works properly if it is 
> initialized
> through dw_hdmi_connector_create().
> 
> Next, in the current code, passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to
> dw_hdmi_bridge_attach() indeed does not call 
> dw_hdmi_connector_create()
> but returns 0.
> 
> This patch 6/6 makes drm/ingenic unconditionally require a connector
> to be attached which is defined somewhere else (device tree e.g. 
> "connector-hdmi")
> unrelated to dw-hdmi. Current upstream code for drm/ingenic does not 
> init/attach
> such a connector on its own so it did work before.
> 
> I.e. I think we can't just use parts of dw-hdmi.

The fact that Laurent is using dw-hdmi with 
DRM_BRIDGE_ATTACH_NO_CONNECTOR on Renesas makes me think that it's 
possible here as well. There's no reason why it shouldn't work with 
ingenic-drm.

The ingenic-drm driver does not need to create any connector. The 
"connector-hdmi" is connected to dw-hdmi as the "next bridge" in the 
list.

> If drm_bridge_attach() would return some errno if 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR
> is set, initialization in ingenic_drm_bind() would fail likewise with 
> "Unable to attach bridge".
> 
> So in any case dw-hdmi is broken by this drm/ingenic patch unless 
> someone
> reworks it to make it compatible.

Where would the errno be returned? Why would drm_bridge_attach() return 
an error code?

> Another issue is that dw_hdmi_connector_create() does not only do 
> dcd/edid
> but appears to detects hot plug and does some special initialization.
> So we probably loose hotplug detect if we just use 
> drm_bridge_funcs.get_edid().

There's drm_bridge_funcs.detect().

Cheers,
-Paul

> I come to the conclusion that not creating a specific connector in 
> dw-hdmi
> and relying on a generic connector does not seem to be an option with 
> current
> code proposals.
> 
> In such a situation the question is what the least invasive surgery 
> is to
> avoid complications and lenghty regression tests on unknown platforms.
> IMHO it is leaving (mature) dw-hdmi untouched and make attachment of 
> a connector
> in ingenic_drm_bind() depend on some condition.
> 
> BR and thanks,
> Nikolaus
> 
> 


