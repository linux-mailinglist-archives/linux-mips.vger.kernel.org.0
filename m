Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE56D418434
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 21:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhIYTlP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 25 Sep 2021 15:41:15 -0400
Received: from aposti.net ([89.234.176.197]:53590 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229777AbhIYTlP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Sep 2021 15:41:15 -0400
Date:   Sat, 25 Sep 2021 20:39:21 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-Id: <L9900R.05DOH2MOR3V93@crapouillou.net>
In-Reply-To: <96585ED9-B707-4AF1-8417-E03DE6414965@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
        <4366739.KZ8Jxz7LyS@jason> <EKJXZQ.6VJ0UDHV3T3W@crapouillou.net>
        <2094991.ScV2v2meXk@jason> <HU700R.NAHL5IU3NRE81@crapouillou.net>
        <96585ED9-B707-4AF1-8417-E03DE6414965@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le sam., sept. 25 2021 at 21:26:42 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 25.09.2021 um 21:08 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi Paul & Nikolaus,
>> 
>>  If you spent some time debugging the issue
> 
> we did ...

By saying that you didn't debug, I mean that you did not try to see why 
you had these errors - where the error codes were coming from, etc., to 
have a clear understanding of why it fails.

>>  instead of complaining that my patchset breaks things...
> 
> ... we did have a working version (without hdmi-connector)
> and bisect pointed at your patch... So we debugged that.
> 
> So the lesson is: don't trust bisect.
> 
> And failed to make it work with hdmi-connector because the
> ingenic-drm-drv reported errors.
> 
>> 
>>  The fix is a one-liner in your downstream ingenic-dw-hdmi.c:
>>  .output_port = 1
>>  in the ingenic_dw_hdmi_plat_data struct.
> 
> Cool. How did you find that?

You had this:
[    4.474346] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach 
bridge (null) to encoder DPI-34: -22

(null) means you're printing a NULL pointer. So I could see that 
hdmi->next_bridge was NULL. The place that sets it is dw_hdmi_parse_dt, 
which will return early with code 0, before next_bridge is set, if 
plat_data->output_port == 0, which was your case.

Since your hdmi-connector is wired at port #1, then .output_port should 
be 1 as well.

Cheers,
-Paul

>> 
>>  Absolutely nothing else needs to be changed for HDMI to work here.
> 
> Great and thanks.
> 
> Will test asap and if it works as well, we can clean up a v4 patch set
> for next week review.
> 
> BR and thanks,
> Nikolaus
> 
>> 
>>  Cheers,
>>  -Paul
>> 
>> 
>>  Le sam., sept. 25 2021 at 17:55:03 +0200, Paul Boddie 
>> <paul@boddie.org.uk> a écrit :
>>>  On Friday, 24 September 2021 10:29:02 CEST Paul Cercueil wrote:
>>>>  Le ven., sept. 24 2021 at 00:51:39 +0200, Paul Boddie
>>>>  >
>>>>  > 2. My approach, which just involves changing the Synopsys 
>>>> driver to
>>>>  > set the bridge type in dw_hdmi_probe like this:
>>>>  >
>>>>  >   hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>>>  >
>>>>  > Otherwise, I don't see how the bridge's (struct drm_bridge) 
>>>> type will
>>>>  > be set.
>>>>  The bridge's type is set in hdmi-connector, from DTS. The 'type = 
>>>> "a"'
>>>>  will result in the bridge's .type to be set to 
>>>> DRM_MODE_CONNECTOR_HDMIA.
>>>  Actually, I found that hdmi-connector might not have been 
>>> available because
>>>  CONFIG_DRM_DISPLAY_CONNECTOR was not enabled. Rectifying this, the 
>>> connector
>>>  does get detected and enabled. However, the Synopsys driver 
>>> remains unaware of
>>>  it, and so the bridge type in the Synopsys driver remains unset.
>>>  I do see that the connector sets the type on a bridge in its own 
>>> private
>>>  structure, so there would be a need to propagate this type to the 
>>> actual
>>>  bridge. In other words, what the connector does is distinct from 
>>> the Synopsys
>>>  driver which acts as the bridge with regard to the Ingenic driver.
>>>  Perhaps the Synopsys driver should set the connector's bridge as 
>>> the next
>>>  bridge, or maybe something is supposed to discover that the 
>>> connector may act
>>>  as (or provide) a bridge after the Synopsys driver in the chain 
>>> and then back-
>>>  propagate the bridge type along the chain.
>>>  [...]
>>>>  > And I removed any of the above hacks. What I observe, apart 
>>>> from an
>>>>  > inactive LCD controller (and ingenic-drm driver), is the 
>>>> following in
>>>>  > /sys/devices/platform/10180000.hdmi/:
>>>>  >
>>>>  > consumer:platform:13050000.lcdc0
>>>>  > consumer:platform:hdmi_connector
>>>  Interestingly, with the connector driver present, these sysfs 
>>> entries no
>>>  longer appear.
>>>  [...]
>>>>  > For me, running modetest yields plenty of information about 
>>>> encoders,
>>>>  > connectors (and the supported modes via the EDID, thanks to my 
>>>> HDMI-A
>>>>  > hack), CRTCs, and planes. But no framebuffers are reported.
>>>>  Could you paste the result of "modetest -a -c -p" somewhere maybe?
>>>  I had to specify -M ingenic-drm as well, but here you go...
>>>  ----
>>>  Connectors:
>>>  id	encoder	status		name		size (mm)	modes	encoders
>>>  35	34	connected	HDMI-A-1       	340x270		17	34
>>>   modes:
>>>  	index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>>>   #0 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 
>>> flags:
>>>  phsync, pvsync; type: preferred, driver
>>>   #1 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 
>>> flags:
>>>  phsync, pvsync; type: driver
>>>   #2 1280x960 60.00 1280 1376 1488 1800 960 961 964 1000 108000 
>>> flags: phsync,
>>>  pvsync; type: driver
>>>   #3 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 
>>> flags: phsync,
>>>  pvsync; type: driver
>>>   #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 
>>> flags: phsync,
>>>  pvsync; type: driver
>>>   #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 
>>> flags: nhsync,
>>>  nvsync; type: driver
>>>   #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 
>>> flags: nhsync,
>>>  nvsync; type: driver
>>>   #7 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: 
>>> nhsync,
>>>  nvsync; type: driver
>>>   #8 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: 
>>> phsync,
>>>  pvsync; type: driver
>>>   #9 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags: 
>>> phsync,
>>>  pvsync; type: driver
>>>   #10 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: 
>>> phsync,
>>>  pvsync; type: driver
>>>   #11 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags: 
>>> phsync,
>>>  pvsync; type: driver
>>>   #12 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: 
>>> nhsync,
>>>  nvsync; type: driver
>>>   #13 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: 
>>> nhsync,
>>>  nvsync; type: driver
>>>   #14 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: 
>>> nhsync,
>>>  nvsync; type: driver
>>>   #15 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: 
>>> nhsync,
>>>  nvsync; type: driver
>>>   #16 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: 
>>> nhsync,
>>>  pvsync; type: driver
>>>   props:
>>>  	1 EDID:
>>>  		flags: immutable blob
>>>  		blobs:
>>>  		value:
>>>  			00ffffffffffff00047232ad01010101
>>>  			2d0e010380221b782aaea5a6544c9926
>>>  			145054bfef0081808140714f01010101
>>>  			010101010101302a009851002a403070
>>>  			1300520e1100001e000000ff00343435
>>>  			3030353444454330300a000000fc0041
>>>  			4c313731350a202020202020000000fd
>>>  			00384c1e520e000a2020202020200051
>>>  	2 DPMS:
>>>  		flags: enum
>>>  		enums: On=0 Standby=1 Suspend=2 Off=3
>>>  		value: 0
>>>  	5 link-status:
>>>  		flags: enum
>>>  		enums: Good=0 Bad=1
>>>  		value: 0
>>>  	6 non-desktop:
>>>  		flags: immutable range
>>>  		values: 0 1
>>>  		value: 0
>>>  	4 TILE:
>>>  		flags: immutable blob
>>>  		blobs:
>>>  		value:
>>>  	20 CRTC_ID:
>>>  		flags: object
>>>  		value: 32
>>>  CRTCs:
>>>  id	fb	pos	size
>>>  32	39	(0,0)	(1280x1024)
>>>   #0  60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: 
>>> phsync,
>>>  pvsync; type:
>>>   props:
>>>  	22 ACTIVE:
>>>  		flags: range
>>>  		values: 0 1
>>>  		value: 1
>>>  	23 MODE_ID:
>>>  		flags: blob
>>>  		blobs:
>>>  		value:
>>>  			e0a5010000053005a005980600000004
>>>  			010404042a0400003c00000005000000
>>>  			00000000000000000000000000000000
>>>  			00000000000000000000000000000000
>>>  			00000000
>>>  	19 OUT_FENCE_PTR:
>>>  		flags: range
>>>  		values: 0 18446744073709551615
>>>  		value: 0
>>>  	24 VRR_ENABLED:
>>>  		flags: range
>>>  		values: 0 1
>>>  		value: 0
>>>  	28 GAMMA_LUT:
>>>  		flags: blob
>>>  		blobs:
>>>  		value:
>>>  	29 GAMMA_LUT_SIZE:
>>>  		flags: immutable range
>>>  		values: 0 4294967295
>>>  		value: 256
>>>  Planes:
>>>  id	crtc	fb	CRTC x,y	x,y	gamma size	possible crtcs
>>>  31	32	39	0,0		0,0	0       	0x00000001
>>>   formats: XR15 RG16 RG24 XR24 XR30
>>>   props:
>>>  	8 type:
>>>  		flags: immutable enum
>>>  		enums: Overlay=0 Primary=1 Cursor=2
>>>  		value: 1
>>>  	17 FB_ID:
>>>  		flags: object
>>>  		value: 39
>>>  	18 IN_FENCE_FD:
>>>  		flags: signed range
>>>  		values: -1 2147483647
>>>  		value: -1
>>>  	20 CRTC_ID:
>>>  		flags: object
>>>  		value: 32
>>>  	13 CRTC_X:
>>>  		flags: signed range
>>>  		values: -2147483648 2147483647
>>>  		value: 0
>>>  	14 CRTC_Y:
>>>  		flags: signed range
>>>  		values: -2147483648 2147483647
>>>  		value: 0
>>>  	15 CRTC_W:
>>>  		flags: range
>>>  		values: 0 2147483647
>>>  		value: 1280
>>>  	16 CRTC_H:
>>>  		flags: range
>>>  		values: 0 2147483647
>>>  		value: 1024
>>>  	9 SRC_X:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 0
>>>  	10 SRC_Y:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 0
>>>  	11 SRC_W:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 83886080
>>>  	12 SRC_H:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 67108864
>>>  33	0	0	0,0		0,0	0       	0x00000001
>>>   formats: C8   XR15 RG16 RG24 XR24 XR30
>>>   props:
>>>  	8 type:
>>>  		flags: immutable enum
>>>  		enums: Overlay=0 Primary=1 Cursor=2
>>>  		value: 0
>>>  	17 FB_ID:
>>>  		flags: object
>>>  		value: 0
>>>  	18 IN_FENCE_FD:
>>>  		flags: signed range
>>>  		values: -1 2147483647
>>>  		value: -1
>>>  	20 CRTC_ID:
>>>  		flags: object
>>>  		value: 0
>>>  	13 CRTC_X:
>>>  		flags: signed range
>>>  		values: -2147483648 2147483647
>>>  		value: 0
>>>  	14 CRTC_Y:
>>>  		flags: signed range
>>>  		values: -2147483648 2147483647
>>>  		value: 0
>>>  	15 CRTC_W:
>>>  		flags: range
>>>  		values: 0 2147483647
>>>  		value: 0
>>>  	16 CRTC_H:
>>>  		flags: range
>>>  		values: 0 2147483647
>>>  		value: 0
>>>  	9 SRC_X:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 0
>>>  	10 SRC_Y:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 0
>>>  	11 SRC_W:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 0
>>>  	12 SRC_H:
>>>  		flags: range
>>>  		values: 0 4294967295
>>>  		value: 0
>>>  ----
>>>>  If you have info about the CRTCs, encoders, connectors and EDID 
>>>> info,
>>>>  then I would assume it is very close to working fine.
>>>>  For your "no framebuffer" issue, keep in mind that CONFIG_FB and
>>>>  CONFIG_FRAMEBUFFER_CONSOLE are now disabled by default.
>>>  Yes, I discovered that CONFIG_FB was not enabled, so I did so.
>>>>  If that doesn't fix anything, that probably means that one
>>>>  .atomic_check() fails, so it would be a good place to start 
>>>> debugging.
>>>  There will be other things to verify in the Ingenic driver. As 
>>> noted many
>>>  months ago, colour depth information has to be set in the DMA 
>>> descriptors and
>>>  not the control register, but we are managing to do this 
>>> successfully, as far
>>>  as I can tell, although there is always the potential for error.
>>>  Paul
>> 
>> 
> 


