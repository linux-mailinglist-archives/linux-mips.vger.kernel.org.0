Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93777416DC3
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 10:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244755AbhIXIaq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 24 Sep 2021 04:30:46 -0400
Received: from aposti.net ([89.234.176.197]:40304 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244737AbhIXIap (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Sep 2021 04:30:45 -0400
Date:   Fri, 24 Sep 2021 09:29:02 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To:     Paul Boddie <paul@boddie.org.uk>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-Id: <EKJXZQ.6VJ0UDHV3T3W@crapouillou.net>
In-Reply-To: <4366739.KZ8Jxz7LyS@jason>
References: <20210922205555.496871-1-paul@crapouillou.net>
        <IXJWZQ.BZQ2M7FHYVJM@crapouillou.net>
        <B7B431EC-BC73-4B39-A03C-003347D8C239@goldelico.com>
        <4366739.KZ8Jxz7LyS@jason>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Le ven., sept. 24 2021 at 00:51:39 +0200, Paul Boddie 
<paul@boddie.org.uk> a écrit :
> On Thursday, 23 September 2021 22:23:28 CEST H. Nikolaus Schaller 
> wrote:
>> 
>>  > Am 23.09.2021 um 21:39 schrieb Paul Cercueil 
>> <paul@crapouillou.net>:
>>  >
>>  > Start by wiring things properly, like in my previously linked 
>> DTS, and
>>  > *test*. If it fails, tell us where it fails.
>> 
>>  Well, I tell where drm_bridge_attach fails with
>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR...
> 
> I tried to piece together this entire discussion from the mailing list
> archives, but there appear to be two approaches that "work", in that 
> they
> activate the LCD controller with the HDMI peripheral:
> 
> 1. Nikolaus's approach, which involves getting the Synopsys driver to 
> create a
> connector and then avoiding the call to drm_bridge_connector_init in 
> the
> Ingenic DRM driver.
> 
> 2. My approach, which just involves changing the Synopsys driver to 
> set the
> bridge type in dw_hdmi_probe like this:
> 
>   hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> 
> Otherwise, I don't see how the bridge's (struct drm_bridge) type will 
> be set.

The bridge's type is set in hdmi-connector, from DTS. The 'type = "a"' 
will result in the bridge's .type to be set to DRM_MODE_CONNECTOR_HDMIA.

> And this causes drm_bridge_connector_init to fail because it tests 
> the bridge
> type.
> 
> Now, I just reintroduced the HDMI connector to the device tree as 
> follows:
> 
>         hdmi_connector {
>                 compatible = "hdmi-connector";
>                 label = "hdmi";
> 
>                 type = "a";
> 
>                 port {
>                         hdmi_connector_in: endpoint {
>                                 remote-endpoint = <&dw_hdmi_out>;
>                         };
>                 };
>         };
> 
> And then I added a second port to the HDMI peripheral node as follows:
> 
>                 port@1 {
>                         reg = <1>;
>                         dw_hdmi_out: endpoint {
>                                 remote-endpoint = 
> <&hdmi_connector_in>;
>                         };
>                 };
> 
> And I removed any of the above hacks. What I observe, apart from an 
> inactive
> LCD controller (and ingenic-drm driver), is the following in 
> /sys/devices/
> platform/10180000.hdmi/:
> 
> consumer:platform:13050000.lcdc0
> consumer:platform:hdmi_connector
> 
> Maybe I don't understand the significance of "consumer" here, but the 
> LCD
> controller and the HDMI connector obviously have rather different 
> roles. Then
> again, the device tree is defining bidirectional relationships, so 
> maybe this
> is how they manifest themselves.
> 
>>  > Because your "it doesn't work" arguments have zero weight 
>> otherwise.
>> 
>>  I hope I still can find it. So I can't promise anything.
>>  We have had it complete in DTS and added code to parse it.
>>  It may have been wiped out by cleaning up patch series during 
>> rebase.
> 
> I suppose the question is whether this is actually handled already. I 
> would
> have thought that either the DRM framework would be able to identify 
> such
> relationships in a generic way or that the Synopsys driver would need 
> to do
> so. This might actually be happening, given that the sysfs entries 
> are there,
> but I might also imagine that something extra would be required to 
> set the
> bridge type.
> 
> I did start writing some code to look up a remote endpoint for the 
> second
> port, find the connector type, and then set it, but it was probably 
> after
> midnight on that occasion as well. Short-circuiting this little dance 
> and
> setting the bridge type indicated that this might ultimately be the 
> right
> approach, but it would probably also mean introducing a point of
> specialisation to the Synopsys driver so that device-specific drivers 
> can
> define a function to set the connector type.
> 
> Otherwise, I can't see the Synopsys driver working for devices like 
> the
> JZ4780, but then again, it seems that all the other devices seem to
> incorporate the Synopsys functionality in a different way and do not 
> need to
> deal with connectors at all.
> 
>>  > If I can find some time this weekend I will test it myself.
>> 
>>  You may be faster than me.
> 
> So, when I wrote about approaches that "work", I can seemingly get 
> the LCD
> controller and HDMI peripheral registers set up to match a non-Linux
> environment where I can demonstrate a functioning display, and yet I 
> don't get
> a valid signal in the Linux environment.
> 
> Nikolaus can actually get HDMI output, but there may be other factors
> introduced by the Linux environment that frustrate success for me, 
> whereas my
> non-Linux environment is much simpler and can reliably reproduce a 
> successful
> result.
> 
> For me, running modetest yields plenty of information about encoders,
> connectors (and the supported modes via the EDID, thanks to my HDMI-A 
> hack),
> CRTCs, and planes. But no framebuffers are reported.

Could you paste the result of "modetest -a -c -p" somewhere maybe?

If you have info about the CRTCs, encoders, connectors and EDID info, 
then I would assume it is very close to working fine.

For your "no framebuffer" issue, keep in mind that CONFIG_FB and 
CONFIG_FRAMEBUFFER_CONSOLE are now disabled by default.

If that doesn't fix anything, that probably means that one 
.atomic_check() fails, so it would be a good place to start debugging.

Cheers,
-Paul


