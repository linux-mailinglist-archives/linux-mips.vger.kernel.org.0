Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AB23E549D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 09:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237636AbhHJHxH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 10 Aug 2021 03:53:07 -0400
Received: from aposti.net ([89.234.176.197]:41390 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237608AbhHJHxG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Aug 2021 03:53:06 -0400
Date:   Tue, 10 Aug 2021 09:52:36 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
To:     Paul Boddie <paul@boddie.org.uk>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Message-Id: <OV5MXQ.C3JR71EBG5P51@crapouillou.net>
In-Reply-To: <2242071.3D3ZAXhqrE@jason>
References: <20210808134526.119198-1-paul@crapouillou.net>
        <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
        <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net> <2242071.3D3ZAXhqrE@jason>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Le mar., août 10 2021 at 01:17:20 +0200, Paul Boddie 
<paul@boddie.org.uk> a écrit :
> On Monday, 9 August 2021 18:22:12 CEST Paul Cercueil wrote:
>> 
>>  Le lun., août 9 2021 at 13:14:03 +0200, H. Nikolaus Schaller
> <hns@goldelico.com> a écrit :
>>  >
>>  > quick feedback: our HDMI on top compiles fine after fixing 2 merge
>>  > conflicts, but dos not yet work.
>>  > Will need some spare time with access to the CI20 board to 
>> research
>>  > the issue, i.e. can not give feedback immediately.
>> 
>>  Alright, no problem. I'll be back home in about 2 weeks and then I 
>> can
>>  test on my CI20 as well.
> 
> Just for reference, I looked into this initialisation failure. The 
> HDMI
> peripheral driver gets initialised satisfactorily...
> 
> dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a 
> with HDCP
> (DWC HDMI 3D TX PHY)
> dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI I2C bus 
> driver
> 
> But then the reported error occurs in the DRM driver:
> 
> ingenic-drm 13050000.lcdc0: Unable to init connector
> ingenic-drm: probe of 13050000.lcdc0 failed with error -22
> 
> This originates in a call to drm_bridge_connector_init from 
> ingenic_drm_bind:
> 
> connector = drm_bridge_connector_init(drm, encoder);
> 
> The invoked function iterates over the registered bridges, one of 
> which seems
> to be the HDMI peripheral (it has bridge operations defined 
> identically to
> those specified in the Synopsys driver), but the type member of the 
> drm_bridge
> structure is set to 0 (DRM_MODE_CONNECTOR_Unknown).
> 
> I might expect the bridge to expose a type acquired from its 
> connector, but I
> don't see this propagation occurring in the Synopsys driver: 
> dw_hdmi_probe
> sets the bridge operations and other members of the drm_bridge 
> structure, but
> it doesn't set the type.
> 
> Also, it might be possible that dw_hdmi_connector_detect (exposed as 
> the
> detect operation) is not getting called, and this would explain why 
> the
> bridge's connector member does not have the connector_type set, 
> either (since
> it is also set to 0).

 From what I understand the last bridge in the chained list is supposed 
to set the connector type. The HDMI driver's probe function should get 
a pointer to the next bridge in the queue and attach it (see how 
ite-it66121.c does it). The last bridge in the queue should be 
"hdmi-connector" (display-connector.c) which will effectively set the 
connector type.

Cheers,
-Paul


